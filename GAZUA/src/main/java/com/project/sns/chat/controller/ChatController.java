package com.project.sns.chat.controller;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.sns.board.service.BoardService;
import com.project.sns.board.vo.BoardVO;
import com.project.sns.chat.service.ChatService;
import com.project.sns.chat.vo.ChatVO;
import com.project.sns.user.vo.UserVO;

import A.algorithm.AES;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RestController
@RequestMapping(value = "/chat")
public class ChatController {

   @Autowired
   private ChatService service;

   @RequestMapping(value = "", method = RequestMethod.POST)
   public ResponseEntity<String> register(@RequestBody ChatVO vo) {
      ResponseEntity<String> entity = null;
      try {
         service.submit(vo);
         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      System.out.println("entity : " + entity);
      return entity;
   }

   @RequestMapping(value = "/list", method = RequestMethod.POST)
   public ResponseEntity<List<ChatVO>> getList(@RequestBody ChatVO vo) {
      ResponseEntity<List<ChatVO>> entity = null;
      try {
         entity = new ResponseEntity<>(service.getChatListById(vo), HttpStatus.OK);
         service.readChat(vo);

      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   //chat.jsp side-one�뿉 異붽��븷 ���솕湲곕줉
   @RequestMapping("/getNewFollower")
   public List<ChatVO> getNewFollower(HttpSession session){
      String id = (String) session.getAttribute("id");
       AES aes = new AES();
       id = aes.setDecrypting(id);
       
      List<ChatVO> resultList = new ArrayList<ChatVO>();
      List<ChatVO> list = (List<ChatVO>)service.getFollowerList(id);
      List<String> namecheck = new ArrayList<String>();
      if(list!=null) {
         for(ChatVO vo : list) {
            String name = "";
            UserVO uvo = null;
            if(id.equals(vo.getFromID())) {
               name = vo.getToID();
            }else {
               name = vo.getFromID();
            }
            if(namecheck.indexOf(name)==-1) {
               namecheck.add(name);
               uvo = service.getUser(name);
               vo.setName(uvo.getName());
               vo.setPicture(uvo.getProfile_img());
               resultList.add(vo);
            }
         }
      }
      return resultList;
      
   }

}