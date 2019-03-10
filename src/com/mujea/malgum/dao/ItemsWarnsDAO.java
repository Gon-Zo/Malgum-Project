package com.mujea.malgum.dao;

import java.util.List;

import com.mujea.malgum.vo.ItemWarn;

public interface ItemsWarnsDAO {
	public List<ItemWarn> selectItemWarnList(int no);
	public int insertItemWarn(ItemWarn itemWarn);
}
