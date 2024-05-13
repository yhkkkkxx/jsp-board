package com.hana.app.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CompanyService<K, V> {
    @Transactional
    int add(V v) throws Exception;
    @Transactional
    int del(K k) throws Exception;
    @Transactional
    int modify(V v) throws Exception;
    @Transactional(readOnly = true)
    V get(K k) throws Exception;
    @Transactional(readOnly = true)
    List<V> get() throws Exception;
}
