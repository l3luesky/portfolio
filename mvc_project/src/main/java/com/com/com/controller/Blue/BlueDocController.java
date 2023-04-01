package com.com.com.controller.Blue;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardMapDTO;
import com.com.com.dto.BoardSearch;
import com.com.com.dto.ResponseDTO;
import com.com.com.service.IBlueDocService;
import com.com.com.service.IBoardMapService;




@Controller
@RequestMapping(value = "/blue")
public class BlueDocController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BlueDocController.class);
	
	@Autowired private IBlueDocService iBlueDocService = null;
	@Autowired private IBoardMapService iBlueMapService = null;
		
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(){
		
	}
		
	@RequestMapping(value="/gong", method=RequestMethod.GET)
	public void goGong(Model model, BoardSearch search){
		List<BlueDTO> list = iBlueDocService.getList(search);
		BoardMapDTO boardMapDTO = iBlueMapService.getData(search.getMapId());
		logger.info("inin=========>{}",boardMapDTO.getMapId());
		model.addAttribute("list", list);
		model.addAttribute("map", boardMapDTO);
		
	}
		
	@RequestMapping(value="/gong", method=RequestMethod.POST)
	public void doGong(Model model, BlueDTO blueDTO){
		BlueDTO docDTO = iBlueDocService.getData(blueDTO);
		model.addAttribute("doc",docDTO);
	}
	
	@RequestMapping(value="/portlet/list", method=RequestMethod.POST)
	public void portletList(Model model, BlueDTO blueDTO){
		List<BlueDTO> port = iBlueDocService.getRecent(blueDTO);
//		BoardMapDTO boardMapDTO = boardMapServiceImpl.getData(search.getMapId());
		model.addAttribute("port", port);
//		model.addAttribute("map", boardMapDTO);
	}
	
	/*
	 * view
	 */
	/*@RequestMapping(value="/view", method=RequestMethod.POST)
	public void view(Model model, BlueDTO blueDTO){
		
		logger.info("in=========>{}",blueDTO.getDocId());
		// 2. 게시물 정보 가져오기
		BlueDTO docDTO = iBlueDocService.getData(blueDTO);
		model.addAttribute("doc", docDTO);
		
		// 3. 맵 정보 가져오기
		BoardMapDTO boardMapDTO = iBlueMapService.getData(docDTO.getMapId());
		model.addAttribute("map", boardMapDTO);
	}*/
	
	@ResponseBody
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public ResponseDTO remove(Model model, Integer docId){
		ResponseDTO responseDTO = new ResponseDTO();
		try{
			logger.debug("sese=========>{}",docId);
			iBlueDocService.remove(docId);
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
