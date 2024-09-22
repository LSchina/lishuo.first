package com.second.hand.trading.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.second.hand.trading.server.model.ShCarousel;
import com.second.hand.trading.server.service.ShCarouselService;
import com.second.hand.trading.server.dao.ShCarouselMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 86151
 * @description 针对表【sh_carousel】的数据库操作Service实现
 * @createDate 2024-09-18 15:47:03
 */
@Service
@RequiredArgsConstructor
public class ShCarouselServiceImpl extends ServiceImpl<ShCarouselMapper, ShCarousel>
        implements ShCarouselService {

    private final ShCarouselMapper carouselMapper;

    @Override
    public List<ShCarousel> getList() {
        return carouselMapper.getList();
    }

    @Override
    public List<ShCarousel> loginList() {
        return carouselMapper.loginList();
    }

    @Override
    public List<ShCarousel> indexList() {
        return carouselMapper.indexList();
    }
}




