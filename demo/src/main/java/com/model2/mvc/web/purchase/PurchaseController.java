package com.model2.mvc.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.PurchaseVO;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	// Field

	@Autowired
	@Qualifier("PurchaseService")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("ProductService")
	private ProductService productService;
	
	///Constructor
	public PurchaseController() {
		System.out.println(this.getClass()+"����");
	}

	
	// �����̷� Ŭ����
	@RequestMapping(value ="listPurchase", method=RequestMethod.GET)
	public String listPurchase( HttpSession session, Model model) throws Exception {
		
		System.out.println("/purchase/listPurchase : GET");

		User user = (User)session.getAttribute("user");
		System.out.println(user.getUserId());
		
		List<PurchaseVO> result = purchaseService.getPurchaseList(user.getUserId());
		System.out.println("��Ʈ�ѷ� DB��ȸ��� : " +result);
		
		model.addAttribute("result",result);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	// ��ǰ�󼼺��⿡�� ���Ź�ư Ŭ���� (addPurchase���ߺ���)
	@RequestMapping( value="execPurchase", method=RequestMethod.GET )
	public String purchaseProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("/purchase/execPurchase : GET "+ prodNo);
		
		ProductVO product = productService.getProduct(prodNo);
		model.addAttribute("product", product); 

		return "forward:/purchase/execPurchaseView.jsp";
	}
	
	// �������������� �������Ź�ư Ŭ����
	@RequestMapping( value="execPurchase", method=RequestMethod.POST )
	public String purchaseProduct(@ModelAttribute("addPurchase") PurchaseVO purchase, Model model) throws Exception {
		
		System.out.println("/purchase/execPurchase : POST");
		System.out.println(purchase);

		//��ǰ�� tranCode ������Ʈ
		int prodNo = purchase.getPurchaseProd().getProdNo();
		ProductVO product = productService.getProduct(prodNo);
		product.setProTranCode("�����");
		productService.updateProduct(product);
	
		//������ tranCode ������Ʈ
		purchase.getPurchaseProd().setProTranCode("�����");
		purchaseService.purchaseProduct(purchase);
		
		model.addAttribute("product", product); 
		model.addAttribute("purchase", purchase); 
		
		System.out.println("������Ʈ �Ϸ�!");
		
		return "forward:/purchase/purchaseConfirmView.jsp";
	}
	
	// ����ϱ� Ŭ����
	@RequestMapping( value="updateTranCode", method=RequestMethod.GET )
	public String updateTranCode(@RequestParam int prodNo, Model model) throws Exception {
		
		System.out.println("/purchase/updateTranCode : GET");
		System.out.println(prodNo);
		
		//product �� proTranCode �� ����߿��� ��ۿϷ�� ����
		ProductVO product = productService.getProduct(prodNo);
		System.out.println(product);
		product.setProTranCode("��ۿϷ�");
		productService.updateProduct(product);
		model.addAttribute(product);
	
		//�ش� product�� ����tranCode�� ����߿��� ��ۿϷ�� ����
		PurchaseVO purchase = new PurchaseVO();
		purchase.setPurchaseProd(product);
		System.out.println("������Ʈ�� ��� product : " + purchase.getPurchaseProd().getProdNo());
		purchase = purchaseService.findPurchase(purchase);
		purchaseService.updatePurchase(purchase);
		
		System.out.println("������Ʈ purchase ����");
		//��״� listProduct.jsp �� �ƴ϶� ��װ� ����?
		return "forward:/product/listProduct";
	}
	
	// ������ư Ŭ���� View ������
	@RequestMapping( value="payment", method=RequestMethod.GET )
	public String payment(@RequestParam String prodNo) {

		System.out.println("/purchase/payment : GET "+prodNo);
		
		return "forward:/purchase/paymentView.jsp";
	}

	// View���� �������������� ���� ó����
	@RequestMapping( value="payment", method=RequestMethod.POST )
	public String payment(@ModelAttribute() PurchaseVO purchase) {
		
		System.out.println("/purchase/payment : POST");
		
		// �ش� product �� ��������� ����
		
		return "forward:/purchase/paymentConfirmView.jsp";
	}
	
	// ����߽� admin�� ��ǰ��ũ������ ��ۿϷ�ó���ϵ���
	@RequestMapping( value="process")
	public String process() {
		
		System.out.println("/purchase/process");
		
		return "forward:/purchase/process.jsp";
	}
}//CLASS
