package com.ezen.carCamping.socket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ezen.carCamping.dto.MemberDTO;

public class EchoHandler extends TextWebSocketHandler{
	
	//Key: session.getId() & Value: WebSocketSession 
	Map<String, WebSocketSession> map = new HashMap<String,WebSocketSession>();
	//Key: session.getId() & Value: mem_num
	Map<String, Integer> users = new HashMap<String,Integer>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		map.put(session.getId(), session);
		users.put(session.getId(), ((MemberDTO)session.getAttributes().get("mbdto")).getMem_num());
		System.out.println("Connect..."); //회원 ID출력

	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트에 전달
		String msg = message.getPayload();
		TextMessage msg1 = new TextMessage(users.get(session.getId())+">>>"+ message.getPayload());
		Set<String> keys1 = map.keySet();
		Iterator<String> ite1 = keys1.iterator();
		while(ite1.hasNext()) {
			map.get(ite1.next()).sendMessage(msg1);
		}
		if (msg != null) {
			String[] strs =  msg.split("/");
			if (msg != null && strs.length == 6) {
				int mem_num = Integer.parseInt(strs[0]);
				String not_sysdate = strs[1];
				int not_type = Integer.parseInt(strs[2]);
				String not_content = strs[3];
				String not_url = strs[4];
				int not_fk = Integer.parseInt(strs[5]);
				
				switch (not_type) {
				//리뷰승인 알림
				case 2 :
					String id = null;
					Set<String> keys = users.keySet();
					Iterator<String> ite = keys.iterator();
					while (ite.hasNext()) {
						if (users.get(ite.next())==mem_num) {
							id = ite.next();
							break;
						}
					}
					WebSocketSession targetSession = map.get(id);
					
					if (targetSession != null) {
						TextMessage tmpMsg = new TextMessage(not_sysdate);
						targetSession.sendMessage(tmpMsg);
					}
				}
			}
		}
//		Set<String> keys = map.keySet();
//		Iterator<String> ite = keys.iterator();
//		while(ite.hasNext()) {
//			map.get(ite.next()).sendMessage(msg); //session.send
//		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("Close");
		map.remove(session.getId());
		users.remove(session.getId());
	}

}
