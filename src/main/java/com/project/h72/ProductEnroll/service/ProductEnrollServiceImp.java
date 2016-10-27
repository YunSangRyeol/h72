package com.project.h72.ProductEnroll.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;
import com.project.h72.ProductEnroll.vo.Product;



@Service
public class ProductEnrollServiceImp implements ProductEnrollService{

	@Override
	public int productEnrollInsert(Product product, HttpServletRequest request)throws ServletException, IOException {
		int result = 0;
		/**** 이미지 처리를 위한 로직 ****/
		String fsl = File.separator; // 파일 구분자  =  '/'
		int sizeLimit = 1024 * 1024 * 10; 
		
		/*저장될 파일 경로 얻기*/
		String savePath = request.getServletContext().getRealPath("images");
		System.out.println("savePath : "+savePath );
		
		String storeId= null;
		
		// 파일경로를 인자값을 받아 변경하게 싶을땐 : MultipartParser
				MultipartParser mp = new MultipartParser(request,sizeLimit); 
				mp.setEncoding("UTF-8");
								
				ArrayList<String> fileNames = new ArrayList<String>();
				
				 Part part;
			        while ((part = mp.readNextPart()) != null) {
			        		String name = part.getName();
			 
			            // 파일일때
			            if (part.isFile()) {
			                FilePart filePart = (FilePart) part;
			                filePart.setRenamePolicy(new DefaultFileRenamePolicy()); //중복파일

			                fileNames.add(filePart.getFileName());
			                
			                if (fileNames != null) {
			                    File dir = new File(savePath + fsl + product.getCategoryCode());
			                    System.out.println("파일 경로 : " +dir);
			                    if (!dir.isDirectory()){     //디렉토리인지 체크 후 없으면 생성
			                        dir.mkdir();
			                    }
//			                    long size = filePart.writeTo(dir);
			                }
			                else {
			                    //form type 이 file 이지만 비어있는 파라메터
			                    System.out.println("file; name=" + name + "; EMPTY");
			                }
			            }
			        }
			        
			      /*  storeInsert = new DetailService().insertNewStore(nstore);
				    storeId = new DetailService().selectStoreId(localCode);*/
			        
				    // ----------  filename  change ---------------
				    String[] renameFiles = new String[5];
				    byte[] buf = new byte[1024];
				    FileInputStream fin = null;
				    FileOutputStream fout = null;
					for (int i = 0; i < fileNames.size(); i++) {
						String name = fileNames.get(i);
						if(name != null){
							// 확장자 얻기
							int extensionStartNum = name.indexOf(".");
							String extension = name.substring(extensionStartNum);
							
							File orginFile = new File(savePath + fsl + product.getCategoryCode() +fsl + name);
							System.out.println(orginFile);
							File renameFile = new File(savePath +fsl + product.getCategoryCode()+"/"+storeId+"_0"+(i+1)+extension);
							System.out.println(renameFile);
							
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
							renameFiles[i]= product.getCategoryCode()+"/"+renameFile.getName();
						}
					}
					
					if(renameFiles[0] !=null) product.setMainImg(renameFiles[0]);
					if(renameFiles[1] !=null) product.setMainImg(renameFiles[1]);
					if(renameFiles[2] !=null) product.setMainImg(renameFiles[2]);
					
		return result;
	}


}
