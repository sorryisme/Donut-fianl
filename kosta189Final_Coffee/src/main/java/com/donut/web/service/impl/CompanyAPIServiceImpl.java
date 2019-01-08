package com.donut.web.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.donut.web.service.CompanyAPIService;


@Service
public class CompanyAPIServiceImpl implements CompanyAPIService {

    @Override
    public <T> T me(String keyword, Class<T> type) {
        // Ŭ���̾�Ʈ�� ���� �׼��� ��ū�� ������ 
        // ���̽��� ������ �α��� ����� ������ ��û�Ѵ�.
        RestTemplate restTemplate = new RestTemplate();
        
        String serviceKey = "OJk75NZg%2BE3aFbc6c2ixOwuCPW8XJSFgLqeZoN4DH913e67c9WGJ%2FFRoo8ylywjch6gmPCoIBz4CKVl2eP2I%2FQ%3D%3D";
        try {
            return restTemplate.getForObject(
                    // ��û�� URL
                    "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrSearchWordGrpList?ServiceKey={v1}&keyword={v2}",type,serviceKey, keyword);
            		// �������� ���� ���� � Ÿ���� ������ ������ �� �����϶�.
        } catch (Exception e) {
            throw new RuntimeException(
                    "company API ���� ����!",e);
        }
    }
    
}








