package springboot.hungs_project.service;

import org.springframework.beans.factory.annotation.Autowired;
import springboot.hungs_project.entity.product;
import springboot.hungs_project.repo.productRepository;

import java.util.List;
import java.util.Optional;


public interface productService {
    product saveProduct(product product);
    List<product> getAllProducts();
    Optional<product> getProductById(String id);
    product updateProduct(String id, product product);
    void deleteProduct(String id);
}
