package com.hana.app.frame;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyRepository<K, V> {
    int insert(V v) throws Exception;
    int delete(K k) throws Exception;
    int update(V v) throws Exception;
    V selectOne(K k) throws Exception;
    List<V> select() throws Exception;
}
