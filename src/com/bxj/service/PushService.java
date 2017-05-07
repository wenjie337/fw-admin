package com.bxj.service;

/**
 * Created by dukang on 2015/10/30.
 */
public interface PushService {

    /**
     * 查询出订单需要配送的记录数量
     * @return
     */
    public int getOrderCountNeedSend(String username);
}
