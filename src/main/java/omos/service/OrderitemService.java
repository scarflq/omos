package omos.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import omos.bean.Orderitem;
import omos.dao.OrderitemMapper;

@Service
public class OrderitemService {

	@Autowired
	OrderitemMapper orderitemMapper;

	public List<Orderitem> getOI(Integer oId) {
		// TODO Auto-generated method stub
		List<Orderitem> orderitem=orderitemMapper.getOI(oId);
		return orderitem;
	}

	public Orderitem getpl(int oiId) {
		// TODO Auto-generated method stub
		Orderitem orderitem=orderitemMapper.selectByPrimaryKey(oiId);
		return orderitem;
	}

	public void setPL(Orderitem oi) {
		// TODO Auto-generated method stub
		orderitemMapper.updateByPrimaryKeySelective(oi);		
	}

	public void add(Orderitem orderitem) {
		// TODO Auto-generated method stub
		orderitemMapper.insertSelective(orderitem);
	}

}
