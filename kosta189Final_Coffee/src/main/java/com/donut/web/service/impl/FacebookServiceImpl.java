package com.donut.web.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.donut.web.service.FacebookService;


@Service
public class FacebookServiceImpl implements FacebookService {

    @Override
    public <T> T me(String accessToken, Class<T> type) {
        // 클라이언트가 보낸 액세스 토큰을 가지고 
        // 페이스북 서버에 로그인 사용자 정보를 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        
        try {
            return restTemplate.getForObject(
                    // 요청할 URL 
                    // => URL에 들어갈 값이 있다면 중괄호{} 를 사용하여 지정하라.
                    // => {변수명} 
                    "https://graph.facebook.com/v2.12/me?access_token={v1}&fields={v2}",
                    
                    // 서버에서 받은 값을 어떤 타입의 값으로 리턴할 지 지정하라.
                    type,
                    
                    // URL에 들어갈 값 
                    // => 객체에 값을 담아서 전달하거나, 값을 순서대로 나열한다.
                    // => 객체를 전달한다면 프로퍼티명으로 값을 찾아 삽입한다.
                    // => 값을 나열한다면, 값이 나온 순서대로 삽입한다.
                    accessToken, "id,name,email");
            
        } catch (Exception e) {
            throw new RuntimeException(
                    "페이스북 Graph API 실행 오류!", 
                    e);
        }
    }
    
}








