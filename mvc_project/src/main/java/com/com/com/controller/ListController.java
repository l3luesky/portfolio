package com.com.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/main")
public class ListController {

	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public void list(){
		
	}
}
