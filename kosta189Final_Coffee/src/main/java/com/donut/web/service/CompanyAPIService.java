package com.donut.web.service;

public interface CompanyAPIService {
    <T> T me(String accessToken, Class<T> type);
}
