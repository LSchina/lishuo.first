package com.second.hand.trading.server.vo;


import lombok.Data;

import java.util.Date;

@Data
public class MessageVo {

    /**
     * id
     */
    private Long id;
    /**
     * 留言内容
     */
    private String content;

    /**
     * 名称
     */
    private String name;

    /**
     * 物品名称
     */
    private String idleName;

    /**
     * 目标人物名称
     */
    private String toName;

    /**
     * 时间
     */
    private Date createTime;

}
