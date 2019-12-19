package gu.board6;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gu.common.FileUtil;
import gu.common.FileVO;
import gu.common.SearchVO;

@Controller 
public class Board6Ctr {

    @Autowired
    private Board6Svc boardSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/board6List")
    public String boardList(SearchVO searchVO, ModelMap modelMap) {

        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

        List<?> listview  = boardSvc.selectBoardList(searchVO);
        
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        
        return "board6/BoardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/board6Form")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String bno = request.getParameter("bno");
        if (bno != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(bno);
            List<?> listview = boardSvc.selectBoard6FileList(bno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "board6/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/board6Save")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String[] fileno = request.getParameterValues("fileno");
        
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/board6List";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/board6Read")
    public String board6Read(HttpServletRequest request, ModelMap modelMap) {
        
        String bno = request.getParameter("bno");
        
        boardSvc.updateBoard6Read(bno);
        BoardVO boardInfo = boardSvc.selectBoardOne(bno);
        List<?> listview = boardSvc.selectBoard6FileList(bno);
        List<?> replylist = boardSvc.selectBoard6ReplyList(bno);
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        
        return "board6/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/board6Delete")
    public String boardDelete(HttpServletRequest request) {
        
        String bno = request.getParameter("bno");
        
        boardSvc.deleteBoardOne(bno);
        
        return "redirect:/board6List";
    }

    /* ===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/board6ReplySave")
    public String board6ReplySave(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        boardSvc.insertBoardReply(boardReplyInfo);

        return "redirect:/board6Read?bno=" + boardReplyInfo.getbno();
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/board6ReplyDelete")
    public String board6ReplyDelete(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        if (!boardSvc.deleteBoard6Reply(boardReplyInfo.getrno()) ) {
            return "board6/BoardFailure";
        }

        return "redirect:/board6Read?bno=" + boardReplyInfo.getbno();
    }      
}
