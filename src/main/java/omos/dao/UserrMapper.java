package omos.dao;

import java.util.List;
import omos.bean.Userr;
import omos.bean.UserrExample;
import org.apache.ibatis.annotations.Param;

public interface UserrMapper {
    long countByExample(UserrExample example);

    int deleteByExample(UserrExample example);

    int deleteByPrimaryKey(Integer uId);

    int insert(Userr record);

    int insertSelective(Userr record);

    List<Userr> selectByExample(UserrExample example);

    Userr selectByPrimaryKey(Integer uId);

    int updateByExampleSelective(@Param("record") Userr record, @Param("example") UserrExample example);

    int updateByExample(@Param("record") Userr record, @Param("example") UserrExample example);

    int updateByPrimaryKeySelective(Userr record);

    int updateByPrimaryKey(Userr record);

	List<Userr> selectUser(UserrExample example);

	int deleteUserr(Integer uId);

	int deleteManyUserr(@Param("example")UserrExample example);
	
    Userr login(String uName);
    
}