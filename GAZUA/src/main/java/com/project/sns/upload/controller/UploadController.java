package com.project.sns.upload.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.sns.board.service.BoardService;
import com.project.sns.board.vo.ImageVO;
import com.project.sns.util.MediaUtils;
import com.project.sns.util.UploadFileUtils;


@Controller
public class UploadController {

  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Autowired
  private BoardService service;  
  
  private InputStream inputStream;
  private OutputStream outputStream;
  private byte[] img;
  
  
  //private String uploadPath="C:\\zzz\\upload";

//  @RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
//  public void uploadForm() {
//  }

//  @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//  public String uploadForm(MultipartFile file, Model model) throws Exception {
//
//    logger.info("originalName: " + file.getOriginalFilename());
//    logger.info("size: " + file.getSize());
//    logger.info("contentType: " + file.getContentType());
//
//    String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//
//    model.addAttribute("savedName", savedName);
//
//    return "uploadResult";
//  }

  @RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
  public void uploadAjax() {
  }

//  private String uploadFile(String originalName, byte[] fileData) throws Exception {
//
//    UUID uid = UUID.randomUUID();
//
//    String savedName = uid.toString() + "_" + originalName;
//
//    File target = new File(uploadPath, savedName);
//
//    FileCopyUtils.copy(fileData, target);
//
//    return savedName;
//
//  }
  
  @ResponseBody
  @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST)
//                  produces = "text/plain;charset=UTF-8")
              
  //public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
  public int uploadAjax(MultipartFile file)throws Exception{
    
//    logger.info("originalName: " + file.getOriginalFilename());
    
    inputStream = file.getInputStream();
    outputStream = new FileOutputStream(file.getOriginalFilename());
    
    img = IOUtils.toByteArray(inputStream);
    
    outputStream.write(img);
    outputStream.close();
    inputStream.close();
    
 
    System.out.println("img : " + img);
    System.out.println("file_name: " + file.getOriginalFilename());
    ImageVO vo = new ImageVO();
    vo.setImg_name(file.getOriginalFilename());
    System.out.println("vo.getFile_name : " + vo.getImg_name());
    vo.setImage(img);
    vo.setBoard_seq(1);
    service.saveImage(vo);
    
    
//    return 
//      new ResponseEntity<>(
//          UploadFileUtils.uploadFile(uploadPath, 
//                file.getOriginalFilename(), 
//                file.getBytes()), 
//          HttpStatus.CREATED);
//    return vo.getImg_seq();
    return vo.getImg_seq();
  }
  
  
  @ResponseBody
  @RequestMapping("/displayFile")
  //public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
   public ResponseEntity<byte[]>  displayFile(int img_seq)throws Exception{
    
//    InputStream in = null; 
    ResponseEntity<byte[]> entity = null;
    
//    logger.info("FILE NAME: " + fileName);
    
    try{
      
//      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
//      MediaType mType = MediaUtils.getMediaType(formatName);
      
//      HttpHeaders headers = new HttpHeaders();
      
//      in = new FileInputStream(uploadPath+fileName);
      
//      if(mType != null){
//        headers.setContentType(mType);
//      }else{
        
//        fileName = fileName.substring(fileName.indexOf("_")+1);       
//        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//        headers.add("Content-Disposition", "attachment; filename=\""+ 
//          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
//      }
       byte[] fi = (byte[])service.getImage(img_seq).getImage(); 
       entity = new ResponseEntity<byte[]>(fi,HttpStatus.CREATED);
       
       
//        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
//          headers, 
//          HttpStatus.CREATED);
    }catch(Exception e){
      e.printStackTrace();
      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//    }finally{
 //     in.close();
    }
      return entity;    
  }
    
//  @ResponseBody
//  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
//  public ResponseEntity<String> deleteFile(String fileName){
//    
//    logger.info("delete file: "+ fileName);
//    
//    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
//    
//    MediaType mType = MediaUtils.getMediaType(formatName);
//    
//    if(mType != null){      
//      
//      String front = fileName.substring(0,12);
//      String end = fileName.substring(14);
//      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
//    }
//    
//    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
//    
//    
//    return new ResponseEntity<String>("deleted", HttpStatus.OK);
//  }  
  
//  @ResponseBody
//  @RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
//  public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
//    
//    logger.info("delete all files: "+ files);
//    
//    if(files == null || files.length == 0) {
//      return new ResponseEntity<String>("deleted", HttpStatus.OK);
//    }
//    
//    for (String fileName : files) {
//      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
//      
//      MediaType mType = MediaUtils.getMediaType(formatName);
//      
//      if(mType != null){      
//        
//        String front = fileName.substring(0,12);
//        String end = fileName.substring(14);
//        new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
//      }
//      
//      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
//      
//    }
//    return new ResponseEntity<String>("deleted", HttpStatus.OK);
//  }  

}
