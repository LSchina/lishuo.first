package com.second.hand.trading.server.service;

import com.second.hand.trading.server.model.ShCarousel;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author 86151
* @description 针对表【sh_carousel】的数据库操作Service
* @createDate 2024-09-18 15:47:03
*/
public interface ShCarouselService extends IService<ShCarousel> {

    List<ShCarousel> getList();

    List<ShCarousel> loginList();

    List<ShCarousel> indexList();
}
