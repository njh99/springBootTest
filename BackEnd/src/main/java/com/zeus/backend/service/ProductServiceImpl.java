package com.zeus.backend.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeus.backend.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public List<Map<String, Object>> list(String product_name) throws Exception {
		return mapper.list("%" + product_name + "%");
	}

	@Override
	public Map<String, Object> detail(int product_code) throws Exception {
		return mapper.detail(product_code);
	}

	@Override
	public String filename(int product_code) throws Exception {
		return mapper.filename(product_code);
	}

	@Override
	public void update(Map<String, Object> map) throws Exception {
		mapper.update(map);
	}

	@Override
	public void delete(int product_code) throws Exception {
		mapper.delete(product_code);
	}

	@Override
	public void insert(Map<String, Object> map) throws Exception {
		mapper.insert(map);
	}

}
