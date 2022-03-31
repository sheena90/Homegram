package com.sheena.homegram.post.model;

import java.util.List;

import com.sheena.homegram.post.comment.model.CommentModel;

public class PostDetailModel {

	private PostModel post;
	private int likeCount;
	private List<CommentModel> commentList;
	private boolean isLike;
	
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
	
	public List<CommentModel> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentModel> commentList) {
		this.commentList = commentList;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	
	
	
}
