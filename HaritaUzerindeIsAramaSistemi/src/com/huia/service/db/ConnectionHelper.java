package com.huia.service.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.jdbc.Statement;

public class ConnectionHelper {

	public Connection getConnection() {
		Connection con = null;

		try {

			InitialContext cxt;

			cxt = new InitialContext();

			DataSource ds = (DataSource) cxt
					.lookup("java:comp/env/jdbc/isburada");

			con = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return con;
	}

	public PreparedStatement getStatement(Connection con, String query) {

		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return stmt;
	}

	public ResultSet getResultSet(PreparedStatement stmt) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	public void closeConnection(Connection con) {

		try {
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void closeStatement(PreparedStatement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void closeResultSet(ResultSet rs) {

		try {
			rs.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
