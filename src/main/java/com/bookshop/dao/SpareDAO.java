package com.bookshop.dao;

import com.bookshop.pojo.Spare;

import java.util.List;

public interface SpareDAO {
    List<Spare> getAllSpare();

    void insertSpare(Spare s);
}
