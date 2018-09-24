package com.glib.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Device {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String model;
    private Double wattPlay;
    private Integer since;
    private String country;
    private Double wattWait;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "company_id")
    private Company company;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_id")
    private Type type;

    public Device(String model, Double wattPlay, Integer since, String country, Double wattWait, Company company, Type type) {
        this.model = model;
        this.wattPlay = wattPlay;
        this.since = since;
        this.country = country;
        this.wattWait = wattWait;
        this.company = company;
        this.type = type;
    }
}
