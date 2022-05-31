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

    @GetMapping("/save")
    public String saveForm(){
        return "member/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return "member/login";
        }
        else{
            return "saveFall";
        }
    }
    @GetMapping("/login")
    public String loginForm(){
        return "member/login";
    }
    @PostMapping("/duplicate-check")
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
            return "redirect:/board/findAll";
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
    public String admin(@RequestParam("memberId") String memberId, Model model,HttpSession session) {
        MemberDTO loginMember = memberService.findByMemberId(memberId);
        model.addAttribute("member", loginMember);
        if("admin".equals(loginMember.getMemberId())){
            return "member/admin";
        }
        else{
            return "redirect:/member/findAll";
        }
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
    @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        MemberDTO memberDTO = memberService.findById(id);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("member", memberDTO);
        model.addAttribute("paging", paging);
        return "member/detail";
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
        return "member/list";
    }
    @GetMapping("/myPage")
    public String myPage(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/myPage";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("updateMember", memberDTO);
        return "member/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return "redirect:/member/myPage?id=" + memberDTO.getId();
    }

}
