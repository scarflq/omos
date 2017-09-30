package omos.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import omos.bean.Orderr;
import omos.bean.Userr;
import omos.bean.Msg;
import omos.bean.Orderitem;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.fabric.xmlrpc.base.Data;

import omos.service.OrderitemService;
import omos.service.OrderrService;

@Controller
public class OrderrController {

	@Autowired
	OrderrService orderrService;
	
	@ResponseBody
	@RequestMapping(value = "/adord/jieshou/{oId}", method = RequestMethod.PUT)
	public Msg changeStatus1(Orderr o, HttpServletRequest request) {
		o.setStatus(2);
		orderrService.changeStatus(o);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/adord/jushou/{oId}", method = RequestMethod.PUT)
	public Msg changeStatus2(Orderr o, HttpServletRequest request) {
		o.setStatus(0);
		orderrService.changeStatus(o);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/adord/songhuo/{oId}", method = RequestMethod.PUT)
	public Msg changeStatus3(Orderr o, HttpServletRequest request) {
		o.setStatus(3);
		orderrService.changeStatus(o);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/adord/quxiao/{oId}", method = RequestMethod.PUT)
	public Msg changeStatus4(Orderr o, HttpServletRequest request) {
		o.setStatus(0);
		orderrService.changeStatus(o);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/adord/songda/{oId}", method = RequestMethod.PUT)
	public Msg changeStatus5(Orderr o, HttpServletRequest request) {
		o.setStatus(4);
		Date date = new Date();
		long times = date.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(date);
		o.setGetTime(time);
		orderrService.changeStatus(o);
		return Msg.success();
	}

	@RequestMapping("/topl")
	public String topl(@RequestParam(value = "id") Integer id, Model model) {
		model.addAttribute("id", id);
		return "pinglun";
	}
	
	@RequestMapping("/toad")
	public String toadmin() {
		return "ad_menu";
	}
	@RequestMapping("/toad2")
	public String toad2() {
		return "ad_user";
	}
	@RequestMapping("/toad3")
	public String toad3() {
		return "ad_order";
	}
	@RequestMapping("/toindex")
	public String toin() {
		return "index";
	}
	@RequestMapping("/toad_order")
	public String toAd_order() {
		return "ad_order";
	}
	
	@RequestMapping("/toadmin")
	public String toAdmin() {
		return "admin";
	}

	@RequestMapping("/toord")
	public String toOrd() {
		return "order_";
	}
	

	@RequestMapping("/ord")
	@ResponseBody
	public Msg getOrd(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpSession session) {
		PageHelper.startPage(pn, 10);
		// startPage后面紧跟的这个查询就是一个分页查询
		int uId=1;
		String tString=session.getAttribute("User").toString();
//		System.out.println(tString);
		uId= Integer.parseInt(tString);
		List<Orderr> o = orderrService.getAllByUid(uId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo pageord = new PageInfo(o, 5);
		return Msg.success().add("page", pageord).add("mark", "!!!!!!!!!!");
	}

	@RequestMapping("/adord")
	@ResponseBody
	public Msg getAdord(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 10);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Orderr> o = orderrService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo pageadord = new PageInfo(o, 5);
		return Msg.success().add("page", pageadord);
	}

}
