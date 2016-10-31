package com.project.h72.ProductEnroll.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.project.h72.ProductEnroll.dao.ProductEnrollDao;
import com.project.h72.ProductEnroll.vo.Product;
import com.project.h72.ProductEnroll.vo.ProductItem;
import com.project.h72.ProductEnroll.vo.ProductProvider;



@Service
public class ProductEnrollServiceImp implements ProductEnrollService{
	
	@Autowired
	private ProductEnrollDao dao;
	
	@Override
	public int productEnrollCount(String categoryCode) {
		return dao.productEnrollCount(categoryCode);
	}
	
	@Override
	public int productEnrollInsert(Product product, HttpServletRequest request)throws ServletException, IOException {
		int result = 0;
		/**** 이미지 처리를 위한 로직 ****/
		String fsl = File.separator; // 파일 구분자  =  '/'
		int sizeLimit = 1024 * 1024 * 10; 
		
		/*저장될 파일 경로 얻기*/
		String savePath = request.getServletContext().getRealPath("resources\\image");
		/*String savePath = "C:\\h72\\workspace\\h72\\src\\main\\webapp\\resources\\image";*/
		/*C:\h72\workspace\h72\src\main\webapp\resources\image*/
		/*String savePath = request.getServletContext().getRealPath("resources//image");*/
		System.out.println("savePath : "+savePath );
		
		// 파일경로를 인자값을 받아 변경하게 싶을땐 : MultipartParser
				MultipartParser mp = new MultipartParser(request,sizeLimit); 
				mp.setEncoding("UTF-8");
				ArrayList<String> fileNames = new ArrayList<String>();

				/*String itemDetailId = null;*/
				String categoryCode = "";
				/*String itemStatus= null;*/
				String itemName = "";
				int minPrice = 0; 
				int min_sailPrice = 0;
				String providerCode = "";
				String etc="";
				String[] itemOptionName = new String[40];
				String[] itemOptionId = new String[40];
				int[] cost= new int[40];
				int[] price =new int[40];
				int[] sailPrice= new int[40];
				int[] stock = new int[40];
				
			
				product = new Product();
				
				 Part part;
					int j = 0;
			        while ((part = mp.readNextPart()) != null) {
			        		String name = part.getName();
			        		  //파일이 아닐때
			        	
			    		    if (part.isParam()) {
			    		        ParamPart paramPart = (ParamPart) part;
			    		        String value = paramPart.getStringValue();
			    		      /*  System.out.println("param; name=" + name + ", value=" + value);*/
			    		        if (name.equals("itemName")){
			    		        	itemName = value; 
			    		        	product.setItemName(itemName);
			    		        	//System.out.println("itemName : "+itemName);
			    		        }
			    		        if (name.equals("providerCode")){
			    		        	providerCode = value; 
			    		        	product.setProviderCode(providerCode);
			    		        	//System.out.println("providerCode : "+providerCode);
			    		        }
			    		        if (name.equals("categoryCode")){
			    		        	categoryCode = value; 
			    		        	product.setCategoryCode(categoryCode);		
			    		        	//System.out.println("categoryCode : "+categoryCode);
			    		        }
			    		        if (name.equals("etc")){
			    		        	etc = value; 
			    		        	product.setEtc(etc);		
			    		        	//System.out.println("etc : "+etc);
			    		        }
			    		        if (name.equals("providerCode")){
			    		        	providerCode = value; 
			    		        	product.setProviderCode(providerCode);		
			    		        	//System.out.println("providerCode : "+providerCode);
			    		        }
			    		        if (name.equals("itemOptionName")){
			    		        	itemOptionName[j] = value; 
			    		        	product.setItemOptionName(itemOptionName);
			    		        	//System.out.println("itemOptionName : "+itemOptionName[j]);
			    		        }
			    		        if (name.equals("itemOptionId")){
			    		        	itemOptionId[j] = value; 
			    		        	//System.out.println("itemOptionId : "+itemOptionId[j]);
			    		        	
			    		        }
			    		        if (name.equals("cost")){
			    		        	cost[j] = Integer.parseInt(value.replaceAll(",", "")); 
			    		        	product.setCost(cost);
			    		        	//System.out.println("cost : "+cost[j]);
			    		        }
			    		        if (name.equals("price")){
			    		        	price[j] = Integer.parseInt(value.replaceAll(",", "")); 
			    		        	product.setPrice(price);
			    		        	//System.out.println("price : "+price[j]);
			    		        }
			    		        if (name.equals("sailPrice")){
			    		        	sailPrice[j] = Integer.parseInt(value.replaceAll(",", "")); 
			    		        	product.setSailPrice(sailPrice);
			    		        	//System.out.println("sailPrice : "+sailPrice[j]);
			    		        
			    		        }
			    		        if (name.equals("stock")){
			    		        	stock[j] = Integer.parseInt(value); 
			    		        	product.setStock(stock);
			    		        	//System.out.println("stock : "+stock[j]);
			    		        	j++;
			    		        }
			    		    	
			    		    }
			    		    
			            // 파일일때
			            if (part.isFile()) {
			                FilePart filePart = (FilePart) part;
			                filePart.setRenamePolicy(new DefaultFileRenamePolicy()); //중복파일
			                System.out.println("filePart.getFileName() :" +filePart.getFileName());
			                fileNames.add(filePart.getFileName());
			                
			                if (fileNames != null) {
			                    File dir = new File(savePath + fsl + product.getCategoryCode().toLowerCase());
			                    System.out.println("파일 경로 : " +dir);
			                    if (!dir.isDirectory()){     //디렉토리인지 체크 후 없으면 생성
			                        dir.mkdir();
			                    }
			                    long size = filePart.writeTo(dir);
			                }
			                else {
			                    //form type 이 file 이지만 비어있는 파라메터
			                    System.out.println("file; name=" + name + "; EMPTY");
			                }
			            }
			            
			        }
			        /*item_detail_id primary key 만들기*/
			        int count = productEnrollCount(product.getCategoryCode());
			        String numformat = String.format("%04d", count+1);		
			        String itemDetailId = product.getCategoryCode()+numformat;
			        product.setItemDetailId(itemDetailId);
    		        
			        /*배송 상태는 기본값으로 저장*/
			        product.setItemStatus("SELL");
			        
			        /*item_id primary key 생성*/
			        String[] itemId = new String[40];
			        for (int i = 0; i < j; i++) {
			        	System.out.println("itemOptionId"+i+"]: "+itemOptionId[i]);
			        	itemId[i] = product.getItemDetailId() + itemOptionId[i];
			        	System.out.println("itemId : "+ itemId[i]);
					}
			        product.setItemId(itemId);
			        /*최소 판매가격*/
			        int temp=999999999;
			        for (int i = 0; i < j; i++) {
						if(price[i] < temp ){
							minPrice = price[i];
						}
					}
			        product.setMinPrice(minPrice);
			        
			        /*최소 할인가격*/
			        for (int i = 0; i < j; i++) {
						if(sailPrice[i] < temp ){
							min_sailPrice = sailPrice[i];
						}
					}
			        product.setMinSailPrice(min_sailPrice);
			      /*  storeInsert = new DetailService().insertNewStore(nstore);
				    storeId = new DetailService().selectStoreId(localCode);*/
			        
				    // ----------  filename  change ---------------
				    String[] renameFiles = new String[3];
				    byte[] buf = new byte[1024];
				    FileInputStream fin = null;
				    FileOutputStream fout = null;
					for (int i = 0; i < fileNames.size(); i++) {
						String name = fileNames.get(i);
						if(name != null){
							// 확장자 얻기
							int extensionStartNum = name.indexOf(".");
							String extension = name.substring(extensionStartNum);
						
							File orginFile =null;							
							File renameFile =null;	
							if(i==0){
								orginFile = new File(savePath + fsl + product.getCategoryCode().toLowerCase() +fsl + name);
								System.out.println("본래 파일 이름" + orginFile);
								renameFile = new File(savePath +fsl + product.getCategoryCode().toLowerCase()+"/"+product.getItemDetailId()+"MAIN"+extension);
								System.out.println("변경 파일 이름 " + renameFile);
							}else{
								orginFile = new File(savePath + fsl + product.getCategoryCode().toLowerCase() +fsl + name);
								System.out.println("본래 파일 이름" + orginFile);
								renameFile = new File(savePath +fsl + product.getCategoryCode().toLowerCase()+"/"+product.getItemDetailId()+"_0"+i+extension);
								System.out.println("변경 파일 이름 " + renameFile);
							}
								
							// renameTo 함수가 잘 안먹었을 때를 위해
							if(!orginFile.renameTo(renameFile)){
							    buf = new byte[1024];
							    fin = new FileInputStream(orginFile);
							    fout = new FileOutputStream(renameFile);
							 
							    int read = 0;
							    while((read=fin.read(buf,0,buf.length))!=-1){
							        fout.write(buf, 0, read);
							    }
							     
							    fin.close();
							    fout.close();
							    orginFile.delete(); //기존 파일 삭제
							}		
							renameFiles[i]= "/image/"+product.getCategoryCode().toLowerCase()+"/"+renameFile.getName();
						
						}
					}
					/*이미지정보 product set 하기*/
					if(renameFiles[0] !=null){ 
						product.setMainImg(renameFiles[0]);
					}else{
						product.setMainImg(" ");
					}
					if(renameFiles[1] !=null){
						product.setDetailImg01(renameFiles[1]);
					}else{
						product.setDetailImg01(" ");
					}
					if(renameFiles[2] !=null){
						product.setDetailImg02(renameFiles[2]);
					}else{
						product.setDetailImg02(" ");
					}
					
					/*ITEM_DETAIL_카테고리 테이블 Insert */
					int itemDetailResult = dao.productEnrollDetailInsert(product);
					int itemResult = 0;
				
					/*ITEM_DETAIL_카테고리 테이블 Insert 성공시*/
					if(itemDetailResult == 1){
						/*ITEM_카테고리 테이블 Insert*/
						for (int k = 0; k < j; k++) {
							ProductItem item = new ProductItem(
									itemId[k],providerCode,itemDetailId,itemOptionName[k],
									cost[k],price[k],sailPrice[k],stock[k]);
							itemResult = dao.productEnrollInsert(item);
						}
					}else{
						System.out.println("ITEM_DETAIL 테이블 Insert 실패");
					}
					
					if(itemResult == 1){
						result = itemResult;
					}else{
						System.out.println("ITEM 테이블 Insert 실패");
					}
					
					
		return result;
	}

	@Override
	public List<ProductProvider> productProviderSelect() {
		List<ProductProvider> provider = dao.productProviderSelect();
		return provider;
	}

}
