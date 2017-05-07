package com.bxj.service;

import java.util.List;
import java.util.Map;

/**
 * Created by dukang on 2015/11/12.
 */
public interface MongoBase<T> {

    /**
     * 添加
     * @param object
     * @param collectionName
     */
    public void insert(T object,String collectionName);

    /**
     * 按条件查询
     * @param params
     * @param collectionName
     * @return
     */
    public T findOne(Map<String,Object> params,String collectionName);

    /**
     * 查询所有的记录
     * @param params
     * @param collectionName
     * @return
     */
    public List<T> findAll(Map<String,Object> params,String collectionName);

    /**
     * 修改
     * @param params
     * @param collectionName
     */
    public void update(Map<String,Object> params,String collectionName);

    /**
     * 创建集合
     * @param collectionName
     */
    public void createCollection(String collectionName);

    /**
     * 按条件删除
     * @param params
     * @param collectionName
     */
    public void remove(Map<String,Object> params,String collectionName);

}
