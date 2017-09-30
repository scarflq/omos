package omos.dao;

import java.util.List;
import omos.bean.Menuu;
import omos.bean.MenuuExample;
import org.apache.ibatis.annotations.Param;

public interface MenuuMapper {
    long countByExample(MenuuExample example);

    int deleteByExample(MenuuExample example);

    int deleteByPrimaryKey(Integer cId);
    
    int deleteManyMenuu(@Param("example") MenuuExample example);

    int deleteMenuu(Integer cId);

    int insert(Menuu record);

    int insertSelective(Menuu record);

    List<Menuu> selectByExample(Object object);

    Menuu selectByPrimaryKey(Integer cId);
    
    List<Menuu> selectByExampleWithSort(MenuuExample example);

    Menuu selectByPrimaryKeyWithSort(Integer cId);

    int updateByExampleSelective(@Param("record") Menuu record, @Param("example") MenuuExample example);

    int updateByExample(@Param("record") Menuu record, @Param("example") MenuuExample example);

    int updateByPrimaryKeySelective(Menuu record);

    int updateByPrimaryKey(Menuu record);

	List<Menuu> selectSort1(Object object);

	List<Menuu> selectSort2(Object object);

	List<Menuu> selectSort3(Object object);
}