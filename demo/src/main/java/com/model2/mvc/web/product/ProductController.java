package com.model2.mvc.web.product;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.image.ImageService;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.user.UserService;


@Controller

@RequestMapping("/product/*")
public class ProductController {
	////////////Business logic UserService DI/////////////////////
	///Field

	@Autowired
	@Qualifier("ProductService")
	private ProductService productService;
	
	//AutoWired �߰��� �������
	@Autowired
	@Qualifier("imageService")
	private ImageService imageService;
	
	///Constructor
	public ProductController() {
		System.out.println(this.getClass()+"����");
	}
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageSize}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//������ �Ѿ�� ����Ʈ�� �� �پ��?
	@RequestMapping( value="listProduct" )
	public String listProduct(@ModelAttribute("search") Search search, @RequestParam String menu, Model model) throws Exception {

		System.out.println("/product/listProduct");
		
		System.out.println("param : "+menu);
		
		if(search == null) {
			search = new Search();
		}
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(search);
		
		Map<String , Object> map = productService.getProductList(search);
		System.out.println("listProduct ��ȸ��� : "+map);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("param", menu);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("/product/getProduct");
		
		//Product No���� DB��ȸ
		ProductVO product= productService.getProduct(prodNo);
		
		ImagesVO image = new ImagesVO();
		image.setImagesProd(product); // ��ȸ�� ���� ���� �����ΰ�ü
		
		List<ImagesVO> images = imageService.getImagesList(image); // ���ϰ�� image

		for(int i=0; i<images.size(); i++) {
			System.out.println(i+"��°"+" images ��ȸ���" +images.get(i).getImage());
		}
		
		//��ȸ�� ��� 'vo' �� �̸����� �� �ֱ�
		model.addAttribute("vo",product);
		model.addAttribute("images",images);
		
		return "forward:/product/readProduct.jsp";
	}

	// @RequestBody ��ôµ� �ٷ� �����ΰ�ü ���ε� �ȵ�
	// @ModelAttribute �� query �� �޾ƿ��� �ֵ�.. �����ΰ�ü ���ε� ������?
	// pjt ���� �����ѰŰ����� �� product �� null �� ���?
	// ModelAttribute("<-���->") ������Ÿ�� ��� // �̷��� �ΰ���������ϳ�? ���� �ǹ̸� ���°��� 
	// -> enctype �ƹ��ų��ᵵ requestbody�� ��. ���������� (text/plain �б⽱�� �⺻�� param)����
	// �ٵ� modelAttribute ������ �⺻Ÿ�Խ��
	
	@RequestMapping( value="addProduct", method=RequestMethod.GET )
	public String addProductView() {
		
		return "forward:/product/addProductView.jsp";
	}
	
	//�׽�Ʈ���� json formŸ�� ���
	@RequestMapping( value="addProductTest", method=RequestMethod.POST )
	public String addProductTest(
			@ModelAttribute ProductVO product
			//@RequestParam("singleFile") MultipartFile inputFileSingle,
			//@RequestParam("multipleFile") MultipartFile[] inputFileMultiple) 
			)throws Exception{
		
		System.out.println(" <---------- �׽�Ʈ���Դϴ� -------->");
		System.out.println(" product/addProductTest : POST" );
		System.out.println(product);
		//System.out.println(inputFileSingle);
		//System.out.println(inputFileMultiple);
		
		return "�Ϸ�";
	}
			
	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct(
			@ModelAttribute ProductVO product, 
			@RequestParam("singleFile") MultipartFile inputFileSingle,
			@RequestParam("multipleFile") MultipartFile[] inputFileMultiple) throws Exception {
		
		System.out.println("\n /product/addProduct : POST" );
		//Business Logic
		
		product.setProTranCode("�Ǹ���");
		//Date result = product.getManuDate();
		
		String rawManuDate = product.getManuDate().replaceAll("-", "");
		product.setManuDate(rawManuDate);
		
		//////////////////////////////
		// multipart �̹��� ���� ��Ͻõ��� (single, multiple)
		//////////////////////////////
		System.out.println("inputFileSingle => " + inputFileSingle);
		System.out.println("inputFileMultiple => " + inputFileMultiple);
		
		productService.addProduct(product); // query �����ؼ� Product �����Ҷ� prodNo ������������ �ڹٰ�ü�� ��ȯ��Ű��������
		
		// 1. RequestParam ���� input �� name�� singleFile �̶�� �ָ� �����ͼ� MultipartFile[] �������� ����
		// @RequestParam("singleFile") MultipartFile[] singleFile 
		// ���ϵ��� inputFile �Ű�����(?)�� ���޵ȴٰ���
		
		// MultipartFile �� ��������, MultipartFile �� �������Ͽ� ���� ������ Ÿ��
	
		
//�������Ϸ� ������ ���� (imageFile ���̺� �ϳ� ���� join ���ѾߵǴµ�)
		if(inputFileMultiple != null && inputFileMultiple.length > 0) {

			for(int i=0; i<inputFileMultiple.length; i++) {
				
				MultipartFile multipartMultiple = inputFileMultiple[i];
				System.out.println("multi �� �̸�ŭ �� =>" + inputFileMultiple.length);
				System.out.println("\n" +i+ "��° multi�� �������� => " + multipartMultiple);
				
				//2. ���̳ʸ� ���·�(?)inputStream �� �а� file �� ��ȯ�ؼ� ���� ���ÿ� ������
				String fileName2 = UUID.randomUUID().toString(); //������ ���� �̸� ���� 
				String filePath2 = "C:\\Users\\bitcamp\\Desktop\\Spring\\workspace\\mini-project-240404\\src\\main\\webapp\\images\\" + File.separatorChar + "fileInputStorage"; //���ϰ�� ����
						
				// ���1
				multipartMultiple.transferTo(new File(filePath2, fileName2));
	
				// ���2
				// �浵 : multipart.getBytes(); �̰� IO �Ἥ ���Ϸ� ��������
			
				// ���3
				// FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
				// Apache Commons IO ���̺귯���� FileUtils Ŭ������ �ִ� �޼���
				// InputStream���� ���Ϸ��� ���縦 �ܼ�ȭ�ϰ� �����ϰ� ó��
				// spring commons-io �־����� 2�̻�������� �����ִ��Լ����ؼ� �³� �������� �켱���� �����־ �׳� �Ⱦ�
	
				System.out.println("multipartMultiple ���� �����̸� =>"+multipartMultiple.getOriginalFilename());//�����̸� Ȯ���غ���
				System.out.println("multipart form �� �Ķ���͸� ��ȯ�ϴ� getName ����ٰ� ��ŷ���ָ� ���������� ����Ͽ� =>" + multipartMultiple.getName());
				System.out.println("multipart api �� getResource �� �־ �� =>" + multipartMultiple.getResource());
				//3. product DB ����, image DB ����

				ImagesVO imagesMultiple = new ImagesVO();
				imagesMultiple.setImage(fileName2); // images ���̺� IMAGE �� ����
				imagesMultiple.setImagesProd(product); // images ���̺� PROD_NO �� ����
				imagesMultiple.setIsThumbnail(0); // images ���̺� IS_THUMBNAIL �� ����
				
				System.out.println(imagesMultiple.toString());
				imageService.addImage(imagesMultiple);
			}
		
		}		
		
		
		//�������Ϸ� ������ image ���̺� prodNo �������
		if(inputFileSingle != null && !inputFileSingle.isEmpty()) {
			MultipartFile multipartSingle = inputFileSingle;
			System.out.println("\n single �� ������" + multipartSingle);
			
			String fileName = UUID.randomUUID().toString(); //������ ���� �̸� ���� 
			String filePath = "C:\\Users\\bitcamp\\Desktop\\Spring\\workspace\\mini-project-240404\\src\\main\\webapp\\images\\" + File.separatorChar + "fileInputStorage"; //���ϰ�� ����
			multipartSingle.transferTo(new File(filePath, fileName));
			
			System.out.println("multipartSingle ���� �����̸� =>"+multipartSingle.getOriginalFilename());//���� �����̸� Ȯ���غ���	
			System.out.println("multipartSingle ����� ���� ��� �� ���� �̸� " +  filePath + File.separatorChar + fileName);
			//product.addImageFile(multipartSingle.getOriginalFilename()); // ���Ϸ� ����������
			
			ImagesVO images = new ImagesVO();
			images.setImage(fileName); // images ���̺� IMAGE �� ����
			images.setImagesProd(product); // images ���̺� PROD_NO �� ����
			images.setIsThumbnail(0); // images ���̺� IS_THUMBNAIL �� ����
			System.out.println(images.toString());
			
			imageService.addImage(images);
			}
		//4. ��ȸ�� �����̸��� �´� �ֵ��� �ҷ��� ���
		
		// ��	
		
		return "forward:/product/addProductConfirm.jsp";
	}
	
	//���� ȭ�� ����
	@RequestMapping( value="updateProduct", method=RequestMethod.GET )
	public ModelAndView updateProduct(@RequestParam("prodNo") int prodNo) throws Exception {
		
		
		System.out.println("/product/updateProduct : GET");
		System.out.println(prodNo);
		
		ProductVO product = productService.getProduct(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("ProductVO", product);
		
		ImagesVO image = new ImagesVO();
		image.setImagesProd(product); // ��ȸ�� ���� ���� �����ΰ�ü
		
		List<ImagesVO> images = imageService.getImagesList(image); // ���ϰ�� image

		for(int i=0; i<images.size(); i++) {
			System.out.println(i+"��°"+" images ��ȸ���" +images.get(i).getImage());
		}
	
		modelAndView.addObject("images", images);
		
		//modelAndView.addObject("userId", user.getUserId()); //������
		modelAndView.setViewName("forward:/product/updateProduct.jsp");
		
		
		return modelAndView;
	}
	
	//���� ȭ�鿡�� �����ϴ�
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public ModelAndView updateProduct(@ModelAttribute("product") ProductVO productVO) throws Exception {
		
		System.out.println("/product/updateProduct : POST");
		System.out.println(productVO);

		// ���� ��ư�� �������� DB�� �����ϰ� �ֽ� user���� ����
		productService.updateProduct(productVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("productVO", productVO); //������
		modelAndView.setViewName("redirect:/product/getProduct?prodNo="+productVO.getProdNo()); //VIEW����
		return modelAndView;
	}
	
}//CLASS
