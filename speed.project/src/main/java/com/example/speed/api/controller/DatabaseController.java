package com.example.speed.api.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.speed.api.model.Food;
import com.example.speed.api.model.FoodOrder;
import com.example.speed.api.model.Location;
import com.example.speed.api.model.Order;
import com.example.speed.api.model.Restaurant;
import com.example.speed.api.model.ShopCart;
import com.example.speed.api.model.User;


@RestController
public class DatabaseController {

	@Autowired
	private DataSource dataSource;

	@RequestMapping("/hello")
	public String hello() throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT COUNT(*) FROM sp_user";

		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return "Hello! The table contains " + count + " rows.";
	}

	@RequestMapping("/register")
	public Integer register(String firstName, String lastName, String mobileNum, String password, String city,
			String district, String street, String addr_desc) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String getId = "select max(id) + 1 from sp_user";

		List<Integer> res = jdbcTemplate.queryForList(getId, Integer.class);

		Integer id = res.get(0);
		

		String sql = "INSERT INTO sp_user (firstname, lastname, mobile_num, password, id) VALUES (?, ?, ?, ?, ?)";
		String sql2 = "INSERT INTO sp_user_location (city, district, street, addr_desc, user_id) VALUES (?, ?, ?, ?, ?)";

		jdbcTemplate.update(sql, firstName, lastName, mobileNum, password, id);
		jdbcTemplate.update(sql2, city, district, street, addr_desc, id);
		return id;
	}

	@RequestMapping("/login")
	public Integer login(@RequestParam(required = true) String mobileNum,
			@RequestParam(required = true) String password) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT id FROM sp_user WHERE mobile_num = ? AND password = ?";
		List<Integer> id = jdbcTemplate.queryForList(sql, Integer.class, mobileNum, password);
		if (id.size() != 0) {
			return id.get(0);
		} else {
			return null;
		}

	}

	@RequestMapping("/getLocation")
	public List<Location> getLocation(@RequestParam(required = true) int userId) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT * FROM sp_user_location WHERE user_id = ?";

		List<Location> ret = jdbcTemplate.query(sql, new RowMapper<Location>() {
			public Location mapRow(ResultSet rs, int rowNum) throws SQLException {
				Location location = new Location();
				location.setCity(rs.getString("city"));
				location.setDistrict(rs.getString("district"));
				location.setStreet(rs.getString("street"));
				location.setAddrDesc(rs.getString("addr_desc"));
				location.setId(rs.getInt("id"));
				location.setUserId(rs.getInt("user_id"));
				return location;

			}
		}, userId);
		return ret;

	}

	@RequestMapping("/selectFood")
	public List<Food> selectFood() throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM sp_food";
		List<Food> ret = jdbcTemplate.query(sql, new RowMapper<Food>() {
			public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
				Food food = new Food();
				food.setId(rs.getInt("id"));
				food.setName(rs.getString("name"));
				food.setImage(rs.getString("image"));
				food.setType(rs.getString("type"));
				food.setIngredient(rs.getString("ingredient"));
				food.setPrice(rs.getString("price"));
				food.setPortion(rs.getString("portion"));
				food.setDuration(rs.getString("duration"));
				food.setRestaurantId(rs.getInt("restaurant_id"));
				return food;
			}
		});
		return ret;
	}

	@RequestMapping("/selectOrder")
	public List<Order> selectOrder(@RequestParam(required = true) int userId) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM sp_order where user_id = ? ";
		List<Order> ret = jdbcTemplate.query(sql, new RowMapper<Order>() {
			public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setDmStaffId(rs.getInt("dm_staff_id"));
				order.setTotalPrice(rs.getBigDecimal("total_price"));
				order.setUserId(rs.getInt("user_id"));
				order.setStatus(rs.getString("status"));
				order.setCreatedDatetime(rs.getDate("created_datetime"));
				return order;
			}
		}, userId);

		for (Order i : ret) {
			String sql2 = "SELECT *, (select name from sp_food where id = food_id) as name FROM sp_food_order where order_id = ?  ";
			List<FoodOrder> detail = jdbcTemplate.query(sql2, new RowMapper<FoodOrder>() {
				public FoodOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
					FoodOrder item = new FoodOrder();
					item.setOrderId(rs.getInt("order_id"));
					item.setFoodId(rs.getInt("food_id"));
					item.setBranchId(rs.getInt("branch_id"));
					item.setQty(rs.getInt("qty"));
					item.setPrice(rs.getBigDecimal("price"));
					item.setTotalPrice(rs.getBigDecimal("total_price"));
					item.setName(rs.getString("name"));

					return item;
				}
			}, i.getId());
			i.setItems(detail);
		}
		return ret;
	}

	@RequestMapping("/addShopCart")
	public void addShopCart(int userId, int foodId, double price, String qty, double totalPrice) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String checkQuery = "Select food_id from sp_order_cart where user_id = ? and food_id = ?";
		List<Integer> id = jdbcTemplate.queryForList(checkQuery, Integer.class, userId, foodId);
		if (id.size() == 0) {
			String sql = "INSERT INTO sp_order_cart (user_id, food_id, price, qty, total_price) VALUES (?, ?, ?, ?, ?)";
			jdbcTemplate.update(sql, userId, foodId, price, qty, totalPrice);
		} else {

			String sql = "Update sp_order_cart set qty = qty + ?, total_price = total_price + ? where user_id = ? and food_id = ?";
			jdbcTemplate.update(sql, qty, totalPrice, userId, foodId);
		}

	}

	@RequestMapping("/selectShopCart")
	public List<ShopCart> selectShopCart(int userId) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = " SELECT c.*, (select image from sp_food where id = c.food_id ) as image, (select name from sp_food where id = c.food_id ) as name FROM sp_order_cart c WHERE c.user_id = ? ";
		List<ShopCart> ret = jdbcTemplate.query(sql, new RowMapper<ShopCart>() {
			public ShopCart mapRow(ResultSet rs, int rowNum) throws SQLException {
				ShopCart item = new ShopCart();
				item.setId(rs.getInt("id"));
				item.setUserId(rs.getInt("user_id"));
				item.setFoodId(rs.getInt("food_id"));
				item.setPrice(rs.getDouble("price"));
				item.setQty(rs.getInt("qty"));
				item.setTotalPrice(rs.getDouble("total_price"));
				item.setImage(rs.getString("image"));
				item.setName(rs.getString("name"));
				return item;
			}
		}, userId);
		return ret;
	}

	@RequestMapping("/createOrder")
	public void createOrder(int userId) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "Select * from sp_order_cart where user_id = ? ";
		List<ShopCart> ret = jdbcTemplate.query(sql, new RowMapper<ShopCart>() {
			public ShopCart mapRow(ResultSet rs, int rowNum) throws SQLException {
				ShopCart item = new ShopCart();
				item.setId(rs.getInt("id"));
				item.setUserId(rs.getInt("user_id"));
				item.setFoodId(rs.getInt("food_id"));
				item.setPrice(rs.getDouble("price"));
				item.setQty(rs.getInt("qty"));
				item.setTotalPrice(rs.getDouble("total_price"));
				return item;
			}
		}, userId);

		String sql2 = "select count(*) + 1 from sp_order ";

		List<Integer> res = jdbcTemplate.queryForList(sql2, Integer.class);

		Integer id = res.get(0);
		double totalPrice = 0;

		for (ShopCart i : ret) {
			totalPrice += i.getTotalPrice();
		}

		String sql3 = "insert into sp_order(id, total_price, created_datetime, user_id, status) values(?, ?, ?, ?, ?);";
		jdbcTemplate.update(sql3, id, totalPrice, new Date(), userId, "NEW");

		for (ShopCart i : ret) {
			String sql4 = "insert into sp_food_order (order_id, food_id, qty, price, total_price) values(?, ?, ?, ?, ?);";
			jdbcTemplate.update(sql4, id, i.getFoodId(), i.getQty(), i.getPrice(), i.getTotalPrice());

			String sql5 = "delete from sp_order_cart where id = ?";
			jdbcTemplate.update(sql5, i.getId());
		}

	}
	
	
	@RequestMapping("/removeCartProd")
	public void removeCartProd(Integer userId, int foodId) throws Exception {
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    
	    String sql = "DELETE FROM sp_order_cart WHERE user_id = ? AND food_id = ? ";
	    
	    jdbcTemplate.update(sql, userId, foodId);
	 
	}
	
	
	@RequestMapping("selectRestaurant")
	public List<Restaurant> selectRestaurant() throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from sp_restaurant";
		List<Restaurant> ret = jdbcTemplate.query(sql, new RowMapper<Restaurant>() {
			public Restaurant mapRow(ResultSet rs, int rowNum) throws SQLException {
				Restaurant res = new Restaurant();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setLogo(rs.getString("logo"));
				res.setServiceType(rs.getString("service_type"));
				res.setOpentime(rs.getString("opentime"));
				res.setCloseTime(rs.getString("closetime"));
				return res;
			}
		});
		return ret;
	}
	
	
	@RequestMapping("/selectUser")
	public List<User> selectUser(int userId) throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from sp_user where id = ? ";
		
		List<User> ret = jdbcTemplate.query(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User item = new User();
				item.setId(rs.getInt("id"));
				item.setFirstname(rs.getString("firstname"));
				item.setLastname(rs.getString("lastname"));
				item.setMobile(rs.getInt("mobile_num"));
				item.setPassword(rs.getString("password"));
				return item;
			}
		}, userId);
		return ret;
	}


	@RequestMapping("/updateOrderStatus")
	public void updateOrderStatus(int orderId) throws Exception {
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    
	    String sql = "update sp_order set status = 'success' WHERE id = ? ";
	    
	    jdbcTemplate.update(sql, orderId);
	 
	}
	
	
	@RequestMapping("/addUserLocation")
	public void addUserLocation(int userId, String city, String district, String street, String addr_desc) throws Exception {
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    
		String sql = "INSERT INTO sp_user_location (city, district, street, addr_desc, user_id) VALUES (?, ?, ?, ?, ?)";
	    
		jdbcTemplate.update(sql, city, district, street, addr_desc, userId);
	 
	}
	
}
