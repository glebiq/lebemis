package com.glib.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "typez")
@NoArgsConstructor
@Data
@RequiredArgsConstructor
public class Type {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @NonNull
    private String name;
    @NonNull
    @Column(name = "avg_watt")
    private Integer avgWatt;
    @NonNull
    @Column(name = "avg_hours_per_month")
    private Integer avgHoursPerMonth;

}

