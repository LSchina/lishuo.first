package com.second.hand.trading.server.controller;


import cn.hutool.core.collection.CollUtil;
import com.second.hand.trading.server.enums.ErrorMsg;
import com.second.hand.trading.server.model.ShCarousel;
import com.second.hand.trading.server.service.ShCarouselService;
import com.second.hand.trading.server.vo.ResultVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.weaver.patterns.HasThisTypePatternTriedToSneakInSomeGenericOrParameterizedTypePatternMatchingStuffAnywhereVisitor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/carousel")
@RequiredArgsConstructor
@Slf4j
public class CarouselController {

    private final ShCarouselService carouselService;

    @GetMapping("/loginList")
    public ResultVo getList(HttpSession session) {
        if(session.getAttribute("admin")==null){
            return ResultVo.fail(ErrorMsg.COOKIE_ERROR);
        }
        List<ShCarousel> list = carouselService.loginList();
        if (CollUtil.isEmpty(list)) {
            return null;
        }
        return ResultVo.success(carouselService.list());
    }

    @GetMapping("/indexList")
    public ResultVo getIndexList(HttpSession session) {
        if(session.getAttribute("admin")==null){
            return ResultVo.fail(ErrorMsg.COOKIE_ERROR);
        }
        List<ShCarousel> list = carouselService.indexList();
        if (CollUtil.isEmpty(list)) {
            return null;
        }
        return ResultVo.success(carouselService.list());
    }

    @GetMapping("/loginCaousel")
    public ResultVo getLoginCaousel() {
        List<ShCarousel> list = carouselService.indexList();
        if (CollUtil.isEmpty(list)) {
            return null;
        }
        return ResultVo.success(carouselService.list());
    }


    @PostMapping("/update")
    public ResultVo updateCarousel(HttpSession session, ShCarousel shCarousel) {
        if(session.getAttribute("admin")==null){
            return ResultVo.fail(ErrorMsg.COOKIE_ERROR);
        }
        shCarousel.setValue(shCarousel.getValue().replace("\"", ""));
        boolean update = carouselService.lambdaUpdate()
                .eq(ShCarousel::getId, shCarousel.getId())
                .set(StringUtils.isNotEmpty(shCarousel.getUrl()), ShCarousel::getUrl, shCarousel.getUrl())
                .set(StringUtils.isNotEmpty(shCarousel.getValue()), ShCarousel::getValue, shCarousel.getValue())
                .set(ShCarousel::getCreateTime, new Date())
                .update();
        if (!update){
            return ResultVo.fail(ErrorMsg.SYSTEM_ERROR);
        }
        return ResultVo.success();
    }



}
