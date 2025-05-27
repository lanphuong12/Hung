package springboot.hungs_project.repo;

import springboot.hungs_project.entity.product;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface productRepository extends MongoRepository<product,String> {

}
