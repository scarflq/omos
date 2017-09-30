package omos.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.xml.ws.spi.http.HttpContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import omos.bean.Menuu;
import omos.bean.Msg;
import omos.service.MenuuService;

import com.fasterxml.jackson.annotation.JacksonInject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Controller
public class MenuuController {

	@Autowired
	MenuuService menuuService;
	

	@ResponseBody
	@RequestMapping(value="/cai/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMe(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			menuuService.deleteBatch(del_ids);
		}else{
			Integer id = Integer.parseInt(ids);
		    menuuService.deleteMe(id);
		}
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/search/{cName}",method=RequestMethod.GET)
	public Msg searchCai(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@PathVariable("cName")String cName) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 5);
		String te =new String(cName.getBytes("ISO-8859-1"),"UTF-8");
		List<Menuu> men=menuuService.searchName(te);
		PageInfo page = new PageInfo(men, 5);
		return Msg.success().add("pageInfo", page);
	}
	@ResponseBody
	@RequestMapping(value="/me/{cId}",method=RequestMethod.PUT)
	public Msg saveMe(Menuu menuu,HttpServletRequest request){
		menuuService.updateMe(menuu);
		return Msg.success()	;
	}
	
	@RequestMapping(value="/me/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getMe(@PathVariable("id")Integer id){
		
		Menuu men = menuuService.getMe(id);
		return Msg.success().add("menu", men);
	}

	@RequestMapping(value="/cai",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCai(@Valid Menuu menuu,BindingResult result){	
		menuuService.saveCai(menuu);
			return Msg.success();
	} 

	@RequestMapping("/cai")
	@ResponseBody
	public Msg getMenusWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Menuu> cai = menuuService.getAll();
		PageInfo page = new PageInfo(cai, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/xian")
	@ResponseBody
	public Msg getMenus(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 10);
		List<Menuu> cai = menuuService.getAll();
		PageInfo page = new PageInfo(cai, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	@RequestMapping("/sort1_sel")
	@ResponseBody
	public Msg getSort1_sel(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Menuu> cai = menuuService.getSort1All();
		PageInfo page = new PageInfo(cai, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/sort2_sel")
	@ResponseBody
	public Msg getSort2_sel(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Menuu> cai = menuuService.getSort2All();
		PageInfo page = new PageInfo(cai, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/sort3_sel")
	@ResponseBody
	public Msg getSort3_sel(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Menuu> cai = menuuService.getSort3All();
		PageInfo page = new PageInfo(cai, 5);
		return Msg.success().add("pageInfo", page);
	}
	
}
