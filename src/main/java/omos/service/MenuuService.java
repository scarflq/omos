package omos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import omos.bean.Cs;
import omos.bean.Menuu;
import omos.bean.MenuuExample;
import omos.bean.MenuuExample.Criteria;
import omos.dao.CsMapper;
import omos.dao.MenuuMapper;
import omos.bean.Menuu;
import omos.dao.MenuuMapper;

@Service
public class MenuuService {
	@Autowired
	MenuuMapper menuuMapper;
	public List<Menuu> getAll() {
		// TODO Auto-generated method stub
		return menuuMapper.selectByExampleWithSort(null);
	}
	public void saveCai(Menuu menuu) {
		menuuMapper.insertSelective(menuu);
	}
	
	public Menuu getMe(Integer id)
	{
		Menuu me=menuuMapper.selectByPrimaryKey(id);
		return me;
	}
	public void updateMe(Menuu menuu) {
		// TODO Auto-generated method stub
		menuuMapper.updateByPrimaryKeySelective(menuu);	
	}
	public void deleteBatch(List<Integer> del_ids) {
		// TODO Auto-generated method stub
		MenuuExample example = new MenuuExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andCIdIn(del_ids);
		menuuMapper.deleteManyMenuu(example);
		
	}
	public void deleteMe(Integer id) {
		// TODO Auto-generated method stub
		menuuMapper.deleteMenuu(id);
	}
	public List<Menuu> getSort1All() {
		// TODO Auto-generated method stub
		return menuuMapper.selectSort1(null);
	}
	public List<Menuu> getSort2All() {
		// TODO Auto-generated method stub
		return menuuMapper.selectSort2(null);
	}
	public List<Menuu> getSort3All() {
		// TODO Auto-generated method stub
		return menuuMapper.selectSort3(null);
	}
	public List<Menuu> searchName(String cName) {
		// TODO Auto-generated method stub
		return menuuMapper.selectByExample(cName);
	}
	public int getGood(int cId) {
		// TODO Auto-generated method stub
		Menuu menuu=menuuMapper.selectByPrimaryKey(cId);
		int zan=menuu.getGood();
		return zan;
	}
	public void setGood(int cId, int zan) {
		// TODO Auto-generated method stub
		Menuu menuu = new Menuu();
		menuu.setcId(cId);
		menuu.setGood(zan);
		menuuMapper.updateByPrimaryKeySelective(menuu);
	}
	public Menuu getCai(Integer cid) {
		// TODO Auto-generated method stub
		return menuuMapper.selectByPrimaryKey(cid);
	}

}
