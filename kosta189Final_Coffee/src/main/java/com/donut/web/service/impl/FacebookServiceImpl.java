package com.donut.web.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.donut.web.service.FacebookService;


@Service
public class FacebookServiceImpl implements FacebookService {

    @Override
    public <T> T me(String accessToken, Class<T> type) {
        // Ŭ���̾�Ʈ�� ���� �׼��� ��ū�� ������ 
        // ���̽��� ������ �α��� ����� ������ ��û�Ѵ�.
        RestTemplate restTemplate = new RestTemplate();
        
        try {
            return restTemplate.getForObject(
                    // ��û�� URL 
                    // => URL�� �� ���� �ִٸ� �߰�ȣ{} �� ����Ͽ� �����϶�.
                    // => {������} 
                    "https://graph.facebook.com/v2.12/me?access_token={v1}&fields={v2}",
                    
                    // �������� ���� ���� � Ÿ���� ������ ������ �� �����϶�.
                    type,
                    
                    // URL�� �� �� 
                    // => ��ü�� ���� ��Ƽ� �����ϰų�, ���� ������� �����Ѵ�.
                    // => ��ü�� �����Ѵٸ� ������Ƽ������ ���� ã�� �����Ѵ�.
                    // => ���� �����Ѵٸ�, ���� ���� ������� �����Ѵ�.
                    accessToken, "id,name,email");
            
        } catch (Exception e) {
            throw new RuntimeException(
                    "���̽��� Graph API ���� ����!", 
                    e);
        }
    }
    
}








