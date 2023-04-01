package com.com.com.controller.Blue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardMapDTO;
import com.com.com.dto.ResponseDTO;
import com.com.com.service.IBlueDocService;
import com.com.com.service.IBoardMapService;


@Controller
@RequestMapping(value="/blue")
public class InsertController {
	private static final Logger logger = LoggerFactory.getLogger(InsertController.class);
	
	@Autowired private IBlueDocService iBlueDocService = null;
	@Autowired private IBoardMapService iBoardMapService = null;
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void goWrite(Model model, Integer mapId){
		logger.info("mapid=========>{}",mapId);
		BoardMapDTO boardMapDTO = iBoardMapService.getData(mapId);
		logger.info("=========>{}", boardMapDTO);
		
		model.addAttribute("map", boardMapDTO);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	@ResponseBody public ResponseDTO doWrite(BlueDTO blueDTO){
		ResponseDTO responseDTO = new ResponseDTO();
		logger.info("=========>{}",blueDTO.getMapId());
		logger.info("=========>{}",blueDTO.getBoardContents());
		logger.info("=========>{}",blueDTO.getTitle());
		
		try{
			iBlueDocService.saveData(blueDTO);
			responseDTO.setResult(9);
		}catch(Exception e){
			e.printStackTrace();
			logger.error("[ERROR]==>", e);
			responseDTO.setResult(-1);
			responseDTO.setErrorMsg("에러가 발생하였습니다. 관리자에게 문의하세요.");
			return responseDTO;
		}
		
		
		return responseDTO;
	}
}
