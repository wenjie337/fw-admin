package com.bxj.shiro.security.dao;


import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bxj.model.SysMenu;
import com.bxj.model.SysUser;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@SuppressWarnings({"unchecked","rawtypes"})
public class UserDAO {
	
	private Logger logger = Logger.getLogger(UserDAO.class);

    private JdbcTemplate jdbcTemplate;
    

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

  
	public Set<String> getUserRoles(String loginName) {
        String sql = "select role_name from t_sys_user u, t_sys_role r,t_sys_user_role ur"
        		+ " where u.username=? and u.id=ur.user_id and r.id=ur.role_id";
        
        return new HashSet(jdbcTemplate.queryForList(sql, String.class, loginName));
    }

    public Set<String> findPermissions(String loginName) {
        String sql = "select menu_url from t_sys_user u, t_sys_role r, t_sys_menu p, t_sys_user_role ur, t_sys_role_menu rp"
        		+ " where u.username=? and u.id=ur.user_id and r.id=ur.role_id and r.id=rp.role_id and p.id=rp.menu_id";
        
        return new HashSet(jdbcTemplate.queryForList(sql, String.class, loginName));
    }

	public Set<String> findPermissionRoles(String loginName){
		String sql = "SELECT method FROM t_sys_permission_roles p, t_sys_role r, t_sys_user u, t_sys_user_role ur"
				+ " where u.username=? AND u.id=ur.user_id AND r.id=ur.role_id AND p.role_id=r.id";
		return new HashSet(jdbcTemplate.queryForList(sql, String.class, loginName));
	}

    public SysUser findByUsername(String loginName) {
    	
    	String sql = "select id,username,password from t_sys_user where user_status=0 and username=? limit 1";
    	
    	List<SysUser> userList = jdbcTemplate.query(sql,new BeanPropertyRowMapper(SysUser.class), loginName);
    	if(userList!=null && userList.size()>0){
    		return userList.get(0);
    	}
    	
    	return null;
    	
    }
    
    
    public List<SysMenu> findUserSysMenu(String loginName){
    	
    	String sql = "select a.id,menu_name menuName,menu_url menuUrl,menu_type menuType,menu_index menuIndex,expand,menu_icon menuIcon"
    			+ ",menu_class menuClass,parent_id parentId,tree_code treeCode"
    			+ " from t_sys_menu a,t_sys_role_menu b,t_sys_user_role c,t_sys_user d"
    			+ " where a.id = b.menu_id and b.role_id = c.role_id and c.user_id = d.id and a.menu_type>0 and d.username=?";
    	Object[] args = {loginName};
    	
    	List ret = null;
    	try{
    		ret = jdbcTemplate.query(sql, args, new RowMapper() {   
				public Object mapRow(ResultSet rs, int index)   
		        throws SQLException {   
			      SysMenu sm = new SysMenu();
			      sm.setId(rs.getInt("id"));
			      sm.setMenuName(rs.getString("menuName"));
			      sm.setMenuUrl(rs.getString("menuUrl"));
			      sm.setMenuType(rs.getInt("menuType"));
			      sm.setMenuIndex(rs.getInt("menuIndex"));
			      sm.setExpand(rs.getInt("expand"));
			      sm.setMenuIcon(rs.getString("menuIcon"));
			      sm.setMenuClass(rs.getString("menuClass"));
			      sm.setParentId(rs.getInt("parentId"));
			      sm.setTreeCode(rs.getString("treeCode"));
			      return sm;   
			    }   
		    });
    	}catch(Exception ex){
    		logger.error(ex.getMessage(), ex);
    	}
    	
    	return ret;
    	
    }
}
