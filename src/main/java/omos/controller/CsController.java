package omos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import omos.bean.Cs;
import omos.bean.Msg;
import omos.service.CsService;

@Controller
public class CsController {
	
	@Autowired
	private CsService csService;
	
	@RequestMapping("/sorts")
	@ResponseBody
	public Msg getSorts() {
		List<Cs> list = csService.getSorts();
		return Msg.success().add("sorts", list);
	}

}
