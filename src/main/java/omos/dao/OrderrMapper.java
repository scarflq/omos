package omos.dao;

import java.util.List;
import omos.bean.Orderr;
import omos.bean.OrderrExample;
import org.apache.ibatis.annotations.Param;

public interface OrderrMapper {
    long countByExample(OrderrExample example);

    int deleteByExample(OrderrExample example);

    int deleteByPrimaryKey(Integer oId);

    int insert(Orderr record);

    int insertSelective(Orderr record);
    
    int add(Orderr orderr);
    
    List<Orderr> selectByExample(OrderrExample example);

    Orderr selectByPrimaryKey(Integer oId);

    int updateByExampleSelective(@Param("record") Orderr record, @Param("example") OrderrExample example);

    int updateByExample(@Param("record") Orderr record, @Param("example") OrderrExample example);

    int updateByPrimaryKeySelective(Orderr record);

    int updateByPrimaryKey(Orderr record);

	List<Orderr> selectByUid(int uId);

	Orderr selectOidByTime(String time);
}