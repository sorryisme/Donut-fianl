package com.donut.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.service.CompanyAPIService;

@Controller
public class CompanyAPIController {

   @Autowired
   CompanyAPIService companyAPIService;
       @RequestMapping("/companyAPI")
       @ResponseBody
          public Object ac(String keyword,HttpSession session,Model model) {
              System.out.println("단체api 시도");
              Map result =null;
              
              try {
            	   result = companyAPIService.me(keyword, Map.class);
            	   System.out.println(result.toString());
              } catch (Exception e) {
            	  e.printStackTrace();
              }
              return result;
          }


}