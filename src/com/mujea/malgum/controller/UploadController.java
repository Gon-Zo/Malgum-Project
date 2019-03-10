package com.mujea.malgum.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mujea.malgum.util.FileRenameUtil;
import com.mujea.malgum.util.ResizeImageUtil;

@Controller
public class UploadController {

	private ResizeImageUtil resizeImageUtil;
	
	public void setResizeImageUtil(ResizeImageUtil resizeImageUtil) {
		this.resizeImageUtil = resizeImageUtil;
	}
	
	private FileRenameUtil fileRenameUtil;
	
	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}
	//병욱
	@RequestMapping(value="/ajax/upload/review",method=RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartFile img,//폼의 name과 같게 
			HttpServletRequest request) {
		System.out.println("사진 업로드 시작");
		//WAS경로
		String rootPath = request.getServletContext().getRealPath("/");
		
		//System.out.println(rootPath);
	    
		//업로드 경로
		String uploadPath =rootPath +"img/review"+File.separator;
		
		
		//System.out.println(uploadPath);
		
		String fileName = img.getOriginalFilename();
		
		//System.out.println(filename);
		
		//이동할 파일
		File file = new File(uploadPath+fileName);
		
		//리네임 
		String src = "/img/review/thumbnail/";
		file = fileRenameUtil.rename(file);
		
		try {
			System.out.println("사진 업로드 성공");
			img.transferTo(file);
			resizeImageUtil.resize(file.getAbsolutePath(),rootPath+"img/review/thumbnail"+File.separator+file.getName(),200,200);
			src += file.getName();
			System.out.println(src);
			return "{\"src\":\""+ src + "\"}";
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "에러";
		}//try~catch end
	
	}
	
	
	@RequestMapping(value="/ajax/upload",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String uploadImage(HttpServletRequest request, String type,
			MultipartFile uploadImg) {
		
		ServletContext sc = request.getServletContext();
		
		String uploadPath = sc.getRealPath("upload");
		String profilePath = sc.getRealPath("profile");
		
		System.out.println("업로드"+uploadPath);
		
		System.out.println("이것은"+uploadImg.getOriginalFilename());
		
		File file = new File(uploadPath+File.separator+uploadImg.getOriginalFilename()); 
		
		file = fileRenameUtil.rename(file);		
		String src = "/";
		
		try {
			
			uploadImg.transferTo(file);
			
			switch(type) {
			case "P" : 
				src+="profile/";
				   
				resizeImageUtil.resize(file.getAbsolutePath(),profilePath+File.separator+file.getName(), 200);
				
				break;
			case "B" : 
				src+="upload/";
				break;
			}//switch end
			
			src+= file.getName();
			
			return "{\"src\":\""+src+"\"}";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return "에러";
		}
	}
		
		//서원
		
		@RequestMapping(value = "/ajax/event/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String uploadImageEvent(HttpServletRequest request, String type, MultipartFile uploadImg) {

			ServletContext sc = request.getServletContext();

			String uploadPath = sc.getRealPath("img/event");
			String imgPath = sc.getRealPath("img/event/thumbnail");

			System.out.println(uploadPath);

			System.out.println(uploadImg.getOriginalFilename());

			File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());

			file = fileRenameUtil.rename(file);

			String src = "/";

			try {

				uploadImg.transferTo(file);

				resizeImageUtil.resize(file.getAbsolutePath(), imgPath + File.separator + file.getName(), 500, 200);

				src += file.getName();

				return "{\"src\":\"" + src + "\"}";

			} catch (Exception e) {
				e.printStackTrace();

				return "에러";
			}

		}
		
		@RequestMapping(value = "/ajax/item/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String uploadImageItem(HttpServletRequest request, String type, MultipartFile uploadImg) {

			ServletContext sc = request.getServletContext();

			String uploadPath = sc.getRealPath("upload");
			String imgPath = sc.getRealPath("img/item");

			System.out.println(uploadPath);

			System.out.println(uploadImg.getOriginalFilename());

			File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());

			file = fileRenameUtil.rename(file);

			String src = "/";

			try {

				uploadImg.transferTo(file);

				resizeImageUtil.resize(file.getAbsolutePath(), imgPath + File.separator + file.getName(), 280, 180);

				src += file.getName();

				return "{\"src\":\"" + src + "\"}";

			} catch (Exception e) {
				e.printStackTrace();

				return "에러";
			}

		}
		
		
	
	
}//UploadController end
