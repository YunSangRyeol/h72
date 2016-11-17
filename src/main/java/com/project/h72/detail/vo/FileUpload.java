package com.project.h72.detail.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public static void fileUpload(MultipartFile fileData, String path, String fileName) throws IOException {
		String originalFileName = fileData.getOriginalFilename();
		String contentType = fileData.getContentType();
		long fileSize = fileData.getSize();
		
		InputStream fin = null;
		OutputStream fout = null;
		try {
			if (fileSize > 0) {
				fin = fileData.getInputStream();
				
				/*File realUploadDir = new File(path);
				if (!realUploadDir.exists()) { // 경로에 폴더가 존재하지 않으면 생성합니다.
					realUploadDir.mkdirs();
				}
				fout = new FileOutputStream(path + "/" + fileName);*/
				
				fout = new FileOutputStream(path + "\\" + fileName);
				FileCopyUtils.copy(fin, fout); // InputStream에서 온 파일을
												// outputStream으로 복사
			} else {
				new IOException("잘못된 파일을 업로드 하셨습니다.");
			}
		} catch (IOException e) {
			e.printStackTrace();
			new IOException("파일 업로드에 실패하였습니다.");
		} finally {
			if (fout != null) {
				fout.close();
			}
			if (fin != null) {
				fin.close();
			}
		}
	}

}
