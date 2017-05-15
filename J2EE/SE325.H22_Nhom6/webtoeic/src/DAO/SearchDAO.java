package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Grammartopic;

public class SearchDAO 
{
	public static List<Grammartopic> Displayresult (HttpServletRequest request,Connection conn, String name1)
	{
		List<Grammartopic> list = new ArrayList<Grammartopic>();
		
		String sql = "select * from grammartopic where name like '%"+name1+"%'";
		try 
		{
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if (!rs.isBeforeFirst())
			{
				request.setAttribute("ketqua","Không có kết quả");
			}
			else 
			{
				while (rs.next())
				{
					Grammartopic grammartopic = new Grammartopic();
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String image = rs.getString("image");
					
					grammartopic.setId(id);
					grammartopic.setName(name);
					grammartopic.setImage(image);
					
					list.add(grammartopic);
				}
			}
			
		} 
		catch (SQLException e) 
		{
			request.setAttribute("ketqua",e.getMessage());
		}
		
		return list;
	}
}
