package omos.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import omos.bean.Menuu;
import omos.bean.Msg;
import omos.bean.Orderitem;
import omos.bean.Orderr;
import omos.service.MenuuService;
import omos.service.OrderitemService;
import omos.service.OrderrService;

@Controller
public class OrderitmeController {
	@Autowired
	OrderitemService orderitemService;
	@Autowired
	MenuuService menuuService;
	@Autowired
	OrderrService orderrService;

	@RequestMapping(value="/adord/xiangqing/{oId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getOI(@PathVariable("oId")Integer oId){
		List<Orderitem> oi = orderitemService.getOI(oId); 
		return Msg.success().add("OI", oi);
	}

	@RequestMapping("/toshopping")
	public String toshopping(@RequestParam(value = "cid") String cid,Model model) {
		model.addAttribute("cid", cid);
		return "ShoppingCart";
	}
	
	@RequestMapping("/shopping")
	@ResponseBody
	public Msg getShopping(@RequestParam(value = "cid") String cid) {
//		System.out.println(cid);
		
		List<Menuu> cai=new ArrayList<Menuu>();
		String[] str_ids = cid.split(",");
			//组装id的集合
		for (String string : str_ids) {
			cai.add(menuuService.getCai(Integer.parseInt(string)));
		}
		return Msg.success().add("cai",cai);


	}
	@RequestMapping("/xiadan")
	public String xiadan(@RequestParam(value = "msg") String msg,HttpSession session) {
//		System.out.println(msg);
		String[] ssb = msg.split("\\.");
		int total=0;
		for(int i=0;i<ssb.length;i++)
		{
			String[] oi = ssb[i].split(",");
			int cid=Integer.parseInt(oi[0]);
			int cnum=Integer.parseInt(oi[1]);
			int cprice=Integer.parseInt(oi[2]);
			total +=cnum*cprice;
		}
		Date date = new Date();
//		long times = date.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(date);
		int uid=1;
		String tString=session.getAttribute("User").toString();
		uid= Integer.parseInt(tString);
		Orderr orderr=new Orderr();
		orderr.setuId(uid);
		orderr.setOrderTime(time);
		orderr.setTotal(total);
		int o1=orderrService.add(orderr);
		int oid=orderr.getoId();
		for(int i=0;i<ssb.length;i++)
		{
			String[] oi = ssb[i].split(",");
			int cid=Integer.parseInt(oi[0]);
			int cnum=Integer.parseInt(oi[1]);
			int cprice=Integer.parseInt(oi[2]);
			Orderitem orderitem=new Orderitem();
			orderitem.setoId(oid);
			orderitem.setcId(cid);
			orderitem.setNum(cnum);
			orderitem.setPrice(cprice);
//			System.out.println(orderitem.getoId());
//			System.out.println(orderitem.getcId());
//			System.out.println(orderitem.getNum());
//			System.out.println(orderitem.getPrice());
			orderitemService.add(orderitem);
		}
		return "index";
	}
	

	@RequestMapping("/jxpl")
	public String topl(@RequestParam(value = "pl") String pl,@RequestParam(value = "good") boolean good,
			@RequestParam(value = "oiId") int oiId,@RequestParam(value = "cId") int cId) throws UnsupportedEncodingException {
		String test= new String(pl.getBytes("ISO-8859-1"), "UTF-8");
		Orderitem oi=new Orderitem();
		oi.setOiId(oiId);
		oi.setComment(test);
		orderitemService.setPL(oi);
		Menuu menu=new Menuu();
		menu.setcId(cId);
		int zan=menuuService.getGood(cId);
		if(good){zan++;}
		menuuService.setGood(cId,zan);
		return "order_";
	}
	
	@RequestMapping("/pl")
	@ResponseBody
	public Msg getPl(@RequestParam(value = "id") Integer id) {
		int oiId=id;
		Orderitem orderitem=orderitemService.getpl(oiId);
		return Msg.success().add("oi", orderitem);
	}
	
	
	
}
