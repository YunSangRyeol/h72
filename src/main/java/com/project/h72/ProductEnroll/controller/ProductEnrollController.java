package com.project.h72.ProductEnroll.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.ProductEnroll.service.ProductEnrollService;
import com.project.h72.ProductEnroll.vo.Product;
import com.project.h72.ProductEnroll.vo.ProductItem;
import com.project.h72.ProductEnroll.vo.ProductProvider;

@Controller
@RequestMapping("/productEnroll")
public class ProductEnrollController {
   @Autowired private ProductEnrollService service;
   
   @RequestMapping(value = "/productEnroll", method = RequestMethod.GET)
   public String productEnroll(Locale locale, Model model, HttpServletRequest request) {
      
      /*상점정보 가져오기*/
      List<ProductProvider> provider  = service.productProviderSelect();
      System.out.println(provider.get(0));
      if (provider != null) {
         model.addAttribute("provider",provider);
      }
      
      return "admin/productEnroll";
   }
   
   @RequestMapping(value = "/productEnrollView", method = RequestMethod.POST)
   public String productEnrollView(Locale locale, Model model, HttpServletRequest request) {
      
      /*상품정보 가져오기*/
      String itemId[] = request.getParameterValues("itemId");
      if(itemId != null){
         List<ProductItem> item  = new ArrayList<ProductItem>();
         for (int i = 0; i < itemId.length; i++) {
            item.add(service.itemSelect(itemId[i]));
         }
         if(item != null){
            model.addAttribute("item",item);
         }
      }
      
      /*상점정보 가져오기*/
      List<ProductProvider> provider  = service.productProviderSelect();
      System.out.println(provider.get(0));
      if (provider != null) {
         model.addAttribute("provider",provider);
      }
      
      return "admin/productEnroll";
   }
   
   @RequestMapping(value = "/productEnrollInsert", method = RequestMethod.POST)
   public String productEnrollInsert(@ModelAttribute @Valid Product product, HttpServletRequest request
                           )throws ServletException, IOException {

      int result = service.productEnrollInsert(product, request);
      if(result > 0) {
         return "admin/productEnroll";
      } else {
         return "home";
      }
   }
   @RequestMapping(value = "/productEnrollUpdate", method = RequestMethod.POST)
   public String productEnrollUpdate(@ModelAttribute @Valid Product product, HttpServletRequest request
		   )throws ServletException, IOException {
	   
	   int result = service.productEnrollUpdate(product, request);
	   if(result > 0) {
		   return "admin/productEnroll";
	   } else {
		   return "home";
	   }
   }


   
   

}