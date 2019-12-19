package gu.board6;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import gu.common.utiletc;

public class BoardVO {

    private String bno;
    private String btitle; 
    private String uno; 
    private String bcontent; 
    private String bwdate; 
    private String bviewcnt; 
    private String brddeleteflag; 
    private String filecnt;
    private String replycnt;
    
    
    /* 첨부파일 */
    private List<MultipartFile> uploadfile;

    /**
     * 게시물 제목을 글자수에 맞추어 자르기.
     */
    public String getShortTitle(Integer len) {
        return utiletc.getShortString(btitle, len);
    }
    
    public String getbno() {
        return bno;
    }

    public void setbno(String bno) {
        this.bno = bno;
    }

    public String getbtitle() {
        return btitle; 
    }

    public void setbtitle(String btitle) {
        this.btitle = btitle;
    }

    public String getuno() {
        return uno;
    }

    public void setuno(String uno) {
        this.uno = uno;
    }

    public String getbcontent() {
        return bcontent.replaceAll("(?i)<script", "&lt;script");
    }

    public void setbcontent(String bcontent) {
        this.bcontent = bcontent;
    }

    public String getbwdate() {
        return bwdate;
    }

    public void setbwdate(String bwdate) {
        this.bwdate = bwdate;
    }

    public String getbviewcnt() {
        return bviewcnt;
    }

    public void setbviewcnt(String bviewcnt) {
        this.bviewcnt = bviewcnt;
    }

    public String getBrddeleteflag() {
        return brddeleteflag;
    }

    public void setBrddeleteflag(String brddeleteflag) {
        this.brddeleteflag = brddeleteflag;
    }

    public List<MultipartFile> getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(List<MultipartFile> uploadfile) {
        this.uploadfile = uploadfile;
    }

    public String getFilecnt() {
        return filecnt;
    }

    public void setFilecnt(String filecnt) {
        this.filecnt = filecnt;
    }

    public String getReplycnt() {
        return replycnt;
    }

    public void setReplycnt(String replycnt) {
        this.replycnt = replycnt;
    }
    
}
