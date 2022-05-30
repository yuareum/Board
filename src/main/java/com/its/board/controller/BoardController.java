package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String saveForm(){
        return "board/save";
    }

    @PostMapping("/save")
    public String save(BoardDTO boardDTO) throws IOException {
        boolean saveResult = boardService.save(boardDTO);
        if(saveResult){
            return "redirect:/board/findAll";
        }
        else{
            return "saveFail";
        }
    }
    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){
        List<BoardDTO> boardList = boardService.findAll(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/list";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "board/detail";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
//        PageDTO paging = boardService.paging(page);
//        model.addAttribute("paging", paging);
        return "board/searchList";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO= boardService.findById(id);
        model.addAttribute("updateBoard", boardDTO);
        return "board/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id=" + boardDTO.getId();
    }
    @GetMapping("/boardWriterCheck")
    public String boardWriterCheck(@RequestParam("id") Long id, Model model){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "board/boardWriterCheck";
    }

    @GetMapping ("/delete")
    public String delete(@RequestParam("id") Long id){
         boardService.delete(id);
         return "redirect:/board/findAll";
    }
}
