package com.bxj.service.impl;

import com.bxj.service.PushService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dukang on 2015/10/30.
 */
@Service
@Transactional
public class PushServiceImpl implements PushService {

    @Override
    public int getOrderCountNeedSend(String username) {
    	/*
        Map<String, Object> map = new HashMap<String, Object>();

        
        SysUser sysUser = sysMapper.findSysUserByName(username);
        if( sysUser != null ){
            int userId = sysUser.getId();
            List<Store> list = sysMapper.findSysStoreUser(userId);
            if( list != null && list.size() > 0 ){
                Integer[] ids = new Integer[list.size()];
                for (int i = 0; i < list.size(); i++) {
                    ids[i]= list.get(i).getId();
                }
                Map<String, Object> tempMap = new HashMap<String, Object>();
                tempMap.put("ids", ids);
                List<String> noList = new ArrayList<String>();
                List<Store> idsList = storeMapper.getStoreList(tempMap);
                for (int i = 0; i < idsList.size(); i++) {
                    noList.add(idsList.get(i).getStoreNo());
                }
                map.put("noList",noList);
            }else {
                //这里如果用户没设置门店权限，数据库就不要去in了，提高效率，默认有所有的门店订单权限
                map.put("noList", null);
            }
        }else{
            map.put("noList", null);
        }
        return orderMapper.getOrderCountNeedSend(map);
        */
        
        return 0;
    }
}
