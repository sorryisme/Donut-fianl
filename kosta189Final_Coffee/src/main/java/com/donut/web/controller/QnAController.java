package com.donut.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.service.QnAService;

@Controller
@RequestMapping("/qna")
public class QnAController {

   
   QnADTO qnaUpdateResult;
   
   @Autowired
   private QnAService qnaService;

   //기부자 QnA 등록
   @RequestMapping("qnaInsert")
   public String qnaInsert(QnADTO qnaDTO) {
      try {
         if(qnaService.qnaInsert(qnaDTO)==1) {
            return "redirect:/project/projectRead?projectNo="+qnaDTO.getProjectNo()+"#qna";
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "qna/qnaInsert";
   }

   //기부단체 QnA 답글 등록 
   @RequestMapping("qnaReplyInsert")
   public String qnaReplyInsert(QnADTO qnaDTO) {
      qnaDTO.setQnaParentNo(qnaDTO.getQnaNo());
      
      try {
         if(qnaService.qnaReplyInsert(qnaDTO)==1)
            return "redirect:/project/projectRead?projectNo="+qnaDTO.getProjectNo()+"#qna";
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "qna/qnaReplyInsert";
   }

   //댓글 수정하기 위해 번호 찾아옴
   @RequestMapping("/qnaUpdateForm")
   @ResponseBody
   public QnADTO qnaUpdateForm(@RequestParam("qnaNo") int qnaNo) {
      try {
         qnaUpdateResult = qnaService.qnaSelectByNo(qnaNo);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return qnaUpdateResult;
   }
   
   //QnA 수정
   @RequestMapping("qnaUpdate")
   @ResponseBody
   public Object qnaUpdate(@RequestParam("qnaContent") String qnaContent, QnADTO qnaDTO) {
      
      qnaDTO = qnaUpdateResult;
      qnaDTO.setQnaContent(qnaContent);

      Map<String,Object> qnaUpdateResult = new HashMap<>();
      try {
         qnaService.qnaUpdate(qnaDTO);
      } catch (Exception e) {
         e.printStackTrace();
      }
      qnaUpdateResult.put("message", "수정되었습니다.");
      return qnaUpdateResult;
   }

   //QnA 삭제
   @RequestMapping("qnaDelete")
   @ResponseBody
   public Object qnaDelete(HttpSession session, @RequestParam("qnaNo") int qnaNo,  @RequestParam("qnaParentNo") int qnaParentNo,@RequestParam("projectNo") int projectNo) {
      Map <String, Object> deleteResult = new HashMap<>();
      MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
      String id=memberDTO.getId(); 
      int delete_success=0;
      try {
         delete_success = qnaService.qnaDelete(id, qnaNo, qnaParentNo);
         
            if(delete_success != 0) {
               deleteResult.put("message", "삭제되었습니다.");
            } else {
               deleteResult.put("message", "본인 댓글만 삭제할 수 있습니다.");
            }
         } catch (Exception e) {
         e.printStackTrace();
      }
      return deleteResult; 
            
   }   
}