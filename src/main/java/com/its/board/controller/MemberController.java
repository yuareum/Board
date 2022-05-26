package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    public MemberService memberService;

    @GetMapping("/save-form")
    private String saveForm(){
        return "member/save";
    }
    @PostMapping("/save")
    private String saveForm(@ModelAttribute MemberDTO memberDTO) throws IOException {
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return "member/login";
        }
        else{
            return "saveFall";
        }
    }
    @GetMapping("/loginForm")
    private String loginForm(){
        return "member/login";
    }
    @PostMapping ("/duplicate-check")
    private @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }
    @PostMapping("/login")
    private String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "board/pagingList";
        }
        else{
            return "member/login";
        }
    }

}
