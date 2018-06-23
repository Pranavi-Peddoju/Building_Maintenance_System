package com.ts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ts.dbutility.DBConnection;
import com.ts.dto.Resident;
import com.ts.dto.Visitor;

public class VisitorDAO {

	public int add(Visitor visitor){
		final String QUERY="insert into Visitors (flatNo, visitorName, noOfVisitors, approval) values (?,?,?,?)";
		PreparedStatement pst = null;
		
		int status=0;
		
		try(Connection con=DBConnection.getConnection();) {
			pst=con.prepareStatement(QUERY);
			pst.setInt(1, visitor.getFlatNo());
			pst.setString(2, visitor.getVisitorName());
			pst.setInt(3, visitor.getNoOfVisitors());
			pst.setString(4, visitor.getApproval());			
			status=pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	
}
	public List<Visitor> getVisitorDetails(int flatNo) {
		List<Visitor> list=new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rst = null;
	final String SELECT_QUERY = "select * from Visitors where flatNo = ?";
	try(Connection con = DBConnection.getConnection();){
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setInt(1, flatNo);
		rst = pst.executeQuery();
		while(rst.next()){
			Visitor visitor=new Visitor();
			visitor.setFlatNo(rst.getInt(1));
			visitor.setVisitorName(rst.getString(2));
			visitor.setNoOfVisitors(rst.getInt(3));
			visitor.setVisitTime(rst.getTimestamp(4));
			visitor.setApproval(rst.getString(5));
			list.add(visitor);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	}
}