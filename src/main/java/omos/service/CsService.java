package omos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import omos.bean.Cs;
import omos.dao.CsMapper;

@Service
public class CsService {
	
	@Autowired
	private CsMapper csMapper;
	
	public List<Cs> getSorts(){
		List<Cs> list= csMapper.selectByExample(null);
		return list;
	}

}
