package omos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import omos.bean.Userr;
import omos.bean.UserrExample;
import omos.bean.UserrExample.Criteria;
import omos.dao.UserrMapper;

@Service
public class UserrService {
	
	@Autowired
	UserrMapper userrMapper;

	public List<Userr> getAll() {
		// TODO Auto-generated method stub
		return userrMapper.selectUser(null);
	}
	
	public void deleteBatch(List<Integer> del_ids) {
		// TODO Auto-generated method stub
		UserrExample example = new UserrExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andUIdIn(del_ids);
		userrMapper.deleteManyUserr(example);
		
	}
	public void deleteUserr(Integer id) {
		// TODO Auto-generated method stub
		userrMapper.deleteUserr(id);
	}
	public Userr login(String uName) {
		// TODO Auto-generated method stub
		
		return userrMapper.login(uName);
	}
	
	public void save(Userr man) {
		// TODO Auto-generated method stub
		userrMapper.insertSelective(man);
	}

	public boolean check(String uname) {
		// TODO Auto-generated method stub
		UserrExample example = new UserrExample();
		Criteria criteria = example.createCriteria();
		criteria.andUNameEqualTo(uname);
		long count = userrMapper.countByExample(example);
		return count == 0;

	}
}
