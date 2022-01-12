package com.koreait.matjip.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Review {
	
	private int review_id;
	private Restrt restrt;
	private Member member;
	private String review_title;
	private String review_content;
	private String review_regdate;
	private String filename;
	
	private MultipartFile myFile;

}
