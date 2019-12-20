package com.ex.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardVO {

		   private int bno;
		   private int uno;
		   private String unick;
		   private String btitle;
		   private String bingredient;
		   private String bcontent;
		   private String bcategory;
		   @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
		   private Date bwdate;
		   private int blike;
		   private int bmark;
		   private int bviewcnt;
		   private char bdelete;
		   public int getBno() {
		      return bno;
		   }
		   public void setBno(int bno) {
		      this.bno = bno;
		   }
		   public int getUno() {
		      return uno;
		   }
		   public void setUno(int uno) {
		      this.uno = uno;
		   }
		   public String getUnick() {
		      return unick;
		   }
		   public void setUnick(String unick) {
		      this.unick = unick;
		   }
		   public String getBtitle() {
		      return btitle;
		   }
		   public void setBtitle(String btitle) {
		      this.btitle = btitle;
		   }
		   public String getBingredient() {
		      return bingredient;
		   }
		   public void setBingredient(String bingredient) {
		      this.bingredient = bingredient;
		   }
		   public String getBcontent() {
		      return bcontent;
		   }
		   public void setBcontent(String bcontent) {
		      this.bcontent = bcontent;
		   }
		   public String getBcategory() {
		      return bcategory;
		   }
		   public void setBcategory(String bcategory) {
		      this.bcategory = bcategory;
		   }
		   public Date getBwdate() {
		      return bwdate;
		   }
		   public void setBwdate(Date bwdate) {
		      this.bwdate = bwdate;
		   }
		   public int getBlike() {
		      return blike;
		   }
		   public void setBlike(int blike) {
		      this.blike = blike;
		   }
		   public int getBmark() {
		      return bmark;
		   }
		   public void setBmark(int bmark) {
		      this.bmark = bmark;
		   }
		   public int getBviewcnt() {
		      return bviewcnt;
		   }
		   public void setBviewcnt(int bviewcnt) {
		      this.bviewcnt = bviewcnt;
		   }
		   public char getBdelete() {
		      return bdelete;
		   }
		   public void setBdelete(char bdelete) {
		      this.bdelete = bdelete;
		   }
		   
		   @Override
		   public String toString() {
		      return "BoardVO [bno=" + bno + ", uno=" + uno + ", unick=" + unick + ", btitle=" + btitle + ", bingredient="
		            + bingredient + ", bcontent=" + bcontent + ", bcategory=" + bcategory + ", bwdate=" + bwdate
		            + ", blike=" + blike + ", bmark=" + bmark + ", bviewcnt=" + bviewcnt + ", bdelete=" + bdelete + "]";
		   }

}
