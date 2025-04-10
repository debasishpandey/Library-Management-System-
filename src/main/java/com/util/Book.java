package com.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Book {

    @Override
    public String toString() {
        return this.Name;
    }

    String id;
    String Name;
    String Author;
    int Quantity;




}
