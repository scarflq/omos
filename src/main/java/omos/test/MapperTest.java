package omos.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import omos.bean.*;
import omos.dao.*;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	OrderrMapper orderrMapper;
	
//	@Autowired
//	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	

	@Test
	public void testCRUD(){

/*		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");

		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);*/
/*		System.out.println(departmentMapper);*/
		


//		employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@atguigu.com", 1));
	

		OrderrMapper mapper = sqlSession.getMapper(OrderrMapper.class);
		for(int i = 1;i<21;i++){
			int total =(int)(Math.random()*10+20);
		    Date date = new Date();
		    long times = date.getTime();
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String orderTime = formatter.format(date);
			System.out.println(total);
			mapper.insertSelective(new Orderr(i, 1, 1, orderTime, null, total) );
		}
		System.out.println("完成");
/*		for(int i = 1;i<100;i++){
			Orderr o=orderrMapper.selectByPrimaryKey(i);
			System.out.println(o.getoId()+"   "+o.getStatus()+"   "+o.getuId()+"   "+o.getOrderTime()+"   "+o.getGetTime()+"   "+o.getTotal());
(i, 1, i%4+1, orderTime,"", total)
		}
		System.out.println("完成");*/
//		orderrMapper.deleteByPrimaryKey(31);
	}

}
