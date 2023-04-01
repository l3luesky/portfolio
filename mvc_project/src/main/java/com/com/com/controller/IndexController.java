package com.com.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.com.com.dto.BoardMapDTO;
import com.com.com.service.IBoardMapService;

@Controller
@RequestMapping(value = "/main")
public class IndexController {

	@Autowired IBoardMapService iBoardMapService = null;
	
	@RequestMapping(value = "/index" , method = RequestMethod.GET)
	public void index(Model model, Integer mapId){
		BoardMapDTO menuList = iBoardMapService.getData(mapId);
		model.addAttribute("menuList", menuList);
	}
}
