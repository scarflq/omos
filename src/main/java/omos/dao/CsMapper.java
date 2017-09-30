package omos.dao;

import java.util.List;
import omos.bean.Cs;
import omos.bean.CsExample;
import org.apache.ibatis.annotations.Param;

public interface CsMapper {
    long countByExample(CsExample example);

    int deleteByExample(CsExample example);

    int deleteByPrimaryKey(Integer csId);

    int insert(Cs record);

    int insertSelective(Cs record);

    List<Cs> selectByExample(CsExample example);

    Cs selectByPrimaryKey(Integer csId);

    int updateByExampleSelective(@Param("record") Cs record, @Param("example") CsExample example);

    int updateByExample(@Param("record") Cs record, @Param("example") CsExample example);

    int updateByPrimaryKeySelective(Cs record);

    int updateByPrimaryKey(Cs record);
}