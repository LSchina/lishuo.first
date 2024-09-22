package com.second.hand.trading.server.dao;

import com.second.hand.trading.server.model.ShCarousel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 86151
* @description 针对表【sh_carousel】的数据库操作Mapper
* @createDate 2024-09-18 15:47:03
* @Entity com.second.hand.trading.server.model.ShCarousel
*/
public interface ShCarouselMapper extends BaseMapper<ShCarousel> {

    List<ShCarousel> getList();

    List<ShCarousel> loginList();

    List<ShCarousel> indexList();
}




