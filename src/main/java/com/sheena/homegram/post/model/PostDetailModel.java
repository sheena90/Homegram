package com.sheena.homegram.post.model;

public class PostDetailModel {

	private PostModel post;
	private int likeCount;
	public PostModel getPost() {
		return post;
	}
	public void setPost(PostModel post) {
		this.post = post;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	//private List<comment> commentList;
	
	
}
