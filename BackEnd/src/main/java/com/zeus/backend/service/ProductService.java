package com.zeus.backend.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
	public List<Map<String, Object>> list(String product_name) throws Exception;

	public Map<String, Object> detail(int product_code) throws Exception;

	public void insert(Map<String, Object> map) throws Exception;

	public String filename(int product_code) throws Exception;

	public void update(Map<String, Object> map) throws Exception;

	public void delete(int product_code) throws Exception;
}
