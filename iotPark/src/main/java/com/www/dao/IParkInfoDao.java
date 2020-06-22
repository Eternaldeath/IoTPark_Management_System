package com.www.dao;

import com.www.domain.ParkAllInfo;
import com.www.domain.ParkOneInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository("iParkInfoDao")
public interface IParkInfoDao {

    // 查询该停车场所有停车信息
    // 查询的一号停车场
    @Select("SELECT * FROM parkoneinfo")
    List<ParkOneInfo> parkOneInfo();

    // 查询所有停车场信息
    @Select("SELECT * FROM parkAllInfo")
    List<ParkAllInfo> parkAllInfo();

    // 更新一号停车场信息
    @Update("update parkoneinfo set license = #{license}, isOrder = #{isOrder},orderDate = #{orderDate} where id = #{parkLotNum}")
    void updateParkOneInfo(@Param("license")String license,@Param("isOrder")int isOrder, @Param("orderDate") Date orderDate, @Param("parkLotNum")int parkLotNum);

    // 更新停车场 flag 标志位
    // 此时 id 对应车位号
    @Update("update parkoneinfo set flag = 1,license = #{license} where id = #{id}")
    void updateParkLog(@Param("id") int id,@Param("license") String license);

    // 只修改 id 的情况
    @Update("update parkoneinfo set flag = 1where id = #{id}")
    void updateParkLot(@Param("id") int id);

    // 车主离开后修改 flag 标志位
    @Update("update parkoneinfo set flag = 0,license = null,isOrder=0 where id = #{id}")
    void removeParkLog(@Param("id") int id);

    // 车主离开后修改 flag 标志位(根据车牌号来完成)
    @Update("update parkoneinfo set flag = 0,license = null,isOrder=0 where license = #{license}")
    void removeParkLotByLisence(@Param("license") String license);
}
