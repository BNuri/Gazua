package com.project.sns.user.service;

public interface Mailservice {
	   
	   public boolean send(String subject, String text, String from, String to);
	   
}
