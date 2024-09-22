package com.second.hand.trading.server.service;

import com.second.hand.trading.server.model.MessageModel;
import com.second.hand.trading.server.vo.MessageVo;
import com.second.hand.trading.server.vo.PageVo;

import java.util.List;

public interface MessageService {

    /**
     * 发送留言
     * @param messageModel
     * @return
     */
    boolean addMessage(MessageModel messageModel);

    /**
     * 删除留言
     * @param id
     * @return
     */
    boolean deleteMessage(Long id);

    /**
     * 获取某个留言
     * @param id
     * @return
     */
    MessageModel getMessage(Long id);

    /**
     * 获取某个用户收到的所有留言
     * @param userId
     * @return
     */
    List<MessageModel> getAllMyMessage(Long userId);

    /**
     * 获取某个闲置的所有留言
     * @param idleId
     * @return
     */
    List<MessageModel> getAllIdleMessage(Long idleId);

    /**
     * 获取所有留言
     * @param p
     * @param n
     * @return
     */
    PageVo<MessageVo> getAllMessage(int p, int n);

    boolean deleteAdminMessage(Long id);
}
