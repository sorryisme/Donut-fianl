package com.donut.web.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.donut.web.service.CompanyAPIService;


@Service
public class CompanyAPIServiceImpl implements CompanyAPIService {

    @Override
    public <T> T me(String keyword, Class<T> type) {
        // 클라이언트가 보낸 액세스 토큰을 가지고 
        // 페이스북 서버에 로그인 사용자 정보를 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        
        String serviceKey = "OJk75NZg%2BE3aFbc6c2ixOwuCPW8XJSFgLqeZoN4DH913e67c9WGJ%2FFRoo8ylywjch6gmPCoIBz4CKVl2eP2I%2FQ%3D%3D";
        try {
            return restTemplate.getForObject(
                    // 요청할 URL
                    "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrSearchWordGrpList?ServiceKey={v1}&keyword={v2}",type,serviceKey, keyword);
            		// 서버에서 받은 값을 어떤 타입의 값으로 리턴할 지 지정하라.
        } catch (Exception e) {
            throw new RuntimeException(
                    "company API 실행 오류!",e);
        }
    }
    
}








