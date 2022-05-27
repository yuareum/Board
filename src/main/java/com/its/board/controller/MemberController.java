package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save-form")
    public String saveForm(){
        return "member/memberSave";
    }
    @PostMapping("/save")
    public String saveForm(@ModelAttribute MemberDTO memberDTO) throws IOException {
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return "member/login";
        }
        else{
            return "saveFall";
        }
    }
    @GetMapping("/login-form")
    public String loginForm(){
        return "member/login";
    }
    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "redirect:/board/boardList";
        }
        else{
            return "member/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }
    @GetMapping("/admin")
    public String admin(){
        return "member/admin";
    }

    @GetMapping("/detail-ajax")
    public @ResponseBody MemberDTO findByIdlAjax(@RequestParam("id") Long id){
        MemberDTO memberDTO = memberService.findById(id);
        return memberDTO;
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        boolean deleteResult = memberService.delete(id);
        if(deleteResult){
            return "redirect:/member/findAll";
        }
        else{
            return "deleteFail";
        }
    }
    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<MemberDTO> memberList = memberService.pagingList(page);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("memberList", memberList);
        model.addAttribute("paging", paging);
        return "member/memberList";
    }

}
