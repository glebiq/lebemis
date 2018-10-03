package com.glib.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "users_device")
@NoArgsConstructor
@Data
public class UsersDevice {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "device_id")
    private Device device;
    private Integer activeTimeUsage;
    private Integer passiveTimeUsage;

    public UsersDevice(User user, Device device, Integer activeTimeUsage, Integer passiveTimeUsage) {
        this.user = user;
        this.device = device;
        this.activeTimeUsage = activeTimeUsage;
        this.passiveTimeUsage = passiveTimeUsage;
    }

}
