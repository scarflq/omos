package omos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import omos.bean.Orderr;
import omos.dao.OrderrMapper;

@Service
public class OrderrService {

	@Autowired
	OrderrMapper orderrMapper;
	public List<Orderr> getAll() {
		// TODO Auto-generated method stub
		return orderrMapper.selectByExample(null);
	}

	public void changeStatus(Orderr o) {
		// TODO Auto-generated method stub
		orderrMapper.updateByPrimaryKeySelective(o);
	}

	public List<Orderr> getAllByUid(int uid) {
		// TODO Auto-generated method stub
		return orderrMapper.selectByUid(uid);
	}

	public int add(Orderr orderr) {
		// TODO Auto-generated method stub
		return orderrMapper.add(orderr);
	}

	public Orderr getoId(String time) {
		// TODO Auto-generated method stub
		return orderrMapper.selectOidByTime(time);
	}

}
