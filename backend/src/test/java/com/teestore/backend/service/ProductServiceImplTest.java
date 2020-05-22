package com.teestore.backend.service;

import com.teestore.backend.dao.ProductDAO;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductServiceImplTest {

    @Mock
    private ProductDAO productDAO;

    @InjectMocks
    private final ProductService productService= new ProductServiceImpl();
}
