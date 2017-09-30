package omos.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import omos.bean.Menuu;
import omos.bean.Msg;
import omos.bean.Userr;
import omos.service.UserrService;

@Controller
public class UserrController {
	
	@Autowired
	UserrService userrService;

	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public Msg login(@Valid Userr user,BindingResult result,HttpSession session){
		String uname=user.getuName();
//		System.out.println(user.getuName());
//		System.out.println(user.getPwd());
		Userr u = userrService.login(uname);
		
		if(u!=null){

			if (user.getPwd().equals(u.getPwd())){
				if(u.getStatus()!=0){
					session.setAttribute("username",u.getuName());
					session.setAttribute("User",u.getuId());
					return Msg.success().add("re", "1");
				}
				else{
					return Msg.success().add("re", "4");
				}
			}
			else{
				return Msg.fail().add("re", "2");
			}
		}
		else{
			return Msg.fail().add("re", "3");
		}
//		System.out.println(pwd1);

	}
	
	
	@ResponseBody
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public Msg save(@Valid Userr man,BindingResult result){
		String name = man.getuName();
		boolean b =userrService.check(name);
				
		if(b){
					userrService.save(man);
//			System.out.println(man.getAdd());
					return Msg.success().add("va_msg", "1");
				}else{
					return Msg.fail().add("va_msg", "2");
				}
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/clear",method=RequestMethod.POST)
	public Msg clear( HttpSession session){
		 session.invalidate();
		return Msg.success().add("aaa", "1");
	}
	
	@RequestMapping("/getus")
	@ResponseBody
	public Msg getUserr(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Userr> us = userrService.getAll();
//		System.out.println(us.get(0).getAdd());
		PageInfo page = new PageInfo(us, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@ResponseBody
	@RequestMapping(value="/deuser/{ids}",method=RequestMethod.DELETE)
	public Msg deleteUs(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			userrService.deleteBatch(del_ids);
		}else{
			Integer id = Integer.parseInt(ids);
		    userrService.deleteUserr(id);
		}
		
		return Msg.success();
	}

}
