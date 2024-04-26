package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.image.ImageService;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("ProductService")
	private ProductService productService;
	//setter Method 구현 않음

	//AutoWired 추가로 해줘야함
	@Autowired
	@Qualifier("imageService")
	private ImageService imageService;

	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageSize}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;	
	
	
	//상품진열할때
	@RequestMapping( value="/json/listProduct" )
	public Map<String , Object> listProduct(@ModelAttribute("search") Search search, @RequestParam String menu) throws Exception {

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
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("listProduct 조회결과 : "+map);
		System.out.println(resultPage); // 이것도 보내야하나?
		
		// Model 과 View 연결
		// model.addAttribute("list", map.get("list"));
		// model.addAttribute("resultPage", resultPage);
		// model.addAttribute("search", search);
		// model.addAttribute("param", menu);
		map.put("resultPage", resultPage);
		
		return map;
	}
	
	@RequestMapping( value="/json/getProduct", method=RequestMethod.GET )
	public ProductVO getProduct(@RequestParam("prodNo") int prodNo) throws Exception {
		
		System.out.println("/product/getProduct");
		
		//Product No으로 DB조회
		ProductVO product= productService.getProduct(prodNo);
		//조회한 결과 'vo' 란 이름으로 얹어서 주기

		return product;
	}
	
	//테스트용임 json form타입 등등
	@RequestMapping( value="/json/addProductTest", method=RequestMethod.POST )
	public String addProductTest(
			@ModelAttribute("product") ProductVO product
			//@RequestParam("singleFile") MultipartFile inputFileSingle,
			//@RequestParam("multipleFile") MultipartFile[] inputFileMultiple) 
			)throws Exception{
		
		System.out.println(" <---------- 테스트중입니다 -------->");
		System.out.println(" product/addProductTest : POST" );
		System.out.println(product);
		//System.out.println(inputFileSingle);
		//System.out.println(inputFileMultiple);
		
		return "완료";
	}
	
	//수정 화면 들어가는 (리액트에서 처리)
	@RequestMapping( value="/json/updateProduct", method=RequestMethod.GET )
	public Map<String , Object> updateProduct(@RequestParam("prodNo") int prodNo) throws Exception {
		
		
		System.out.println("/product/updateProduct : GET");
		System.out.println(prodNo);
		
		//상품정보 product 에 담음
		ProductVO product = productService.getProduct(prodNo);
		
		//이미지는 따로 images 에 담음
		ImagesVO image = new ImagesVO();
		image.setImagesProd(product); // 조회를 위해 만든 도메인객체
		
		List<ImagesVO> images = imageService.getImagesList(image); // 리턴결과 image

		for(int i=0; i<images.size(); i++) {
			System.out.println(i+"번째"+" images 조회결과" +images.get(i).getImage());
		}
		
		Map<String , Object> productInfo = new HashMap<>();
		productInfo.put("product", product);
		productInfo.put("image", image);
		
		return productInfo;
	}
	
	//수정 화면에서 컨펌하는 
	@RequestMapping( value="/json/updateProduct", method=RequestMethod.POST )
	public int updateProduct(@ModelAttribute ProductVO productVO) throws Exception {
		
		System.out.println("/product/updateProduct : POST");
		System.out.println(productVO);

		// 수정 버튼을 눌렀을때 DB에 컨펌하고 최신 user정보 띄우는
		productService.updateProduct(productVO);
		
		return productVO.getProdNo();
	}
	
	//전체 상품조히
	@PostMapping("/json/getProductList")
	public List<String> getProductList(@RequestParam("value") String value) throws Exception {
		
		System.out.println("/product/getProductList");
		
		System.out.println(value);
		
		List<String> productList = productService.getProductAll(value);
		
		return productList;
	}

}