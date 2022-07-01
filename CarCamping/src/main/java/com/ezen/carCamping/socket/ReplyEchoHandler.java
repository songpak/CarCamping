package com.ezen.carCamping.socket;


import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	
		// 클라이언트가 서버로 연결시
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("afterConnectionEstablisthed:" + session);
			
		}
		// 클라이언트가 Data 전송 시
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
		}
		// 연결 해제될 때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
		}
}