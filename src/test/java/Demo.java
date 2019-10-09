import com.aishang.po.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IOrderService;
import com.aishang.service.IProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-applicationContext.xml"})
public class Demo {

    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;
    @Resource
    private IOrderService orderService;

    @Test
    public void fun(){
        ProductForPageBean productForPageBean = new ProductForPageBean();
        ProductForPageBean productForPageBean1 = productService.searchProducts(productForPageBean);
        List<CategoryExt> allCategory = categoryService.getAllCategory();

        System.out.println(allCategory);
        System.out.println(productForPageBean1);
    }

    @Test
    public void fun1(){
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        Map<Integer,List<Product>> map = productService.getHotProducts(allCategory);

        System.out.println(map);
    }

    @Test
    public void fun2(){
        ProductForPageBean productForPageBean = new ProductForPageBean();
        productForPageBean.setCid(1);
        productForPageBean.setCsid(1);
        productForPageBean.setPageNow(1);
        ProductForPageBean products = productService.searchProducts(productForPageBean);
        System.out.println(products);
    }

    @Test
    public void fun3(){
        ProductForPageBean productForPageBean = new ProductForPageBean();
        List<Product> list = productService.theHot(productForPageBean);
        Product list1 = productService.productDetail(2);
        System.out.println(list1);
        System.out.println(list);
    }

    @Test
    public void fun4(){
        List<OrderExt> list = orderService.getOrderDetail(9019);
        System.out.println(list);
    }

    @Test
    public void fun5(){
        OrderForPageBean order = new OrderForPageBean();
        order.setUid(35);
        order.setPageNow(1);

        OrderForPageBean orderForPageBean = orderService.myOrders(order);
        System.out.println(orderForPageBean);
    }
}
