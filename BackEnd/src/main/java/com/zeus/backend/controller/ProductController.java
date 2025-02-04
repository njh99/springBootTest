package com.zeus.backend.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zeus.backend.service.ProductService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ProductController {
	@Autowired
	private ProductService service;

	@RequestMapping("/product/list")
	public List<Map<String, Object>> list(@RequestParam(name = "product_name", defaultValue = "") String product_name)
			throws Exception {
		return service.list(product_name);
	}

	@RequestMapping("/product/insert")
	public void insert(@RequestParam Map<String, Object> map,
			@RequestParam(name = "img", required = false) MultipartFile img, HttpServletRequest request)
			throws Exception {
		String filename = "-";
		if (img != null && !img.isEmpty()) {
			filename = img.getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/static/images/");
				img.transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		map.put("filename", filename);
		service.insert(map);
	}

	@RequestMapping("/product/detail/{product_code}")
	public Map<String, Object> detail(@PathVariable(name = "product_code") String product_code)
			throws NumberFormatException, Exception {
		return service.detail(Integer.parseInt(product_code));
	}

	@RequestMapping("/product/update")
	public void update(@RequestParam Map<String, Object> map,
			@RequestParam(name = "img", required = false) MultipartFile img, HttpServletRequest request)
			throws Exception {
		if (img != null) {
			log.info("update img =" + img.getOriginalFilename());
			log.info("update map.toString()=" + map.toString());
		}
		String filename = "-";
		if (img != null && !img.isEmpty()) {
			filename = img.getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/static/images/");
				img.transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String product_code = map.get("product_code").toString();
			Map<String, Object> product = service.detail(Integer.parseInt(product_code));
			if (product.get("filename") != null) {
				filename = product.get("filename").toString();
			}
		}
		map.put("filename", filename);
		service.update(map);
	}

	@RequestMapping("/product/delete/{product_code}")
	public void delete(@PathVariable(name = "product_code") String product_code, HttpServletRequest request)
			throws NumberFormatException, Exception {
		String filename = service.filename(Integer.parseInt(product_code));
		if (filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/static/images/");
			File file = new File(path + filename);
			if (file.exists()) {
				file.delete();
			}
		}
		service.delete(Integer.parseInt(product_code));
	}
}
