package com.com.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com.com.dto.BoardMapDTO;
import com.com.com.service.IBoardMapService;


@Controller
@RequestMapping(value="/main/inc")
public class BoardMapController {
	
	@Autowired private IBoardMapService boardMapServiceImpl = null;

	@ResponseBody
	@RequestMapping(value="/tree", method=RequestMethod.POST)
	public List<BoardMapDTO> tree(){
		return boardMapServiceImpl.getList();
	}
}
