package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Planet;

public class PlanetDAO {
	
	
	public Planet findById(int id) {
	    Planet p = null;
	    String sql = "SELECT * FROM planets WHERE id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, id);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                p = new Planet();
	                p.setId(rs.getInt("id"));
	                p.setName(rs.getString("name"));
	                p.setImage(rs.getString("image"));
	                p.setDescription(rs.getString("description"));
	                p.setDistance(rs.getString("distance"));
	                p.setSatellites(rs.getString("satellites")); 
	                p.setOrbitalPeriod(rs.getString("orbital_period"));
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return p;
	}

	

    public List<Planet> findAll() {
        List<Planet> list = new ArrayList<>();

        String sql = "SELECT * FROM planets";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Planet p = new Planet();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setDistance(rs.getString("distance"));
                p.setSatellites(rs.getString("satellites")); 
                p.setOrbitalPeriod(rs.getString("orbital_period"));
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
