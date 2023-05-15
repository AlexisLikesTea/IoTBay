/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.beans;

/**
 *
 * @author kyler
 */
public class Device {
    private String deviceID;
    private String deviceName;
    private String deviceDescription;
    private String deviceBrand;
    private String deviceSupplier;
    private String deviceSpecifications;
    private String deviceWRPolicy;
    private float deviceStandardPrice;
    private float deviceCurrentPrice;
    private String deviceType;
    private int deviceSOH;
    private String deviceImage;

    public Device() {
    }

    public Device(String deviceID, String deviceName, String deviceDescription, String deviceBrand, String deviceSupplier, String deviceSpecifications, String deviceWRPolicy, float deviceStandardPrice, float deviceCurrentPrice, String deviceType, int deviceSOH, String deviceImage) {
        this.deviceID = deviceID;
        this.deviceName = deviceName;
        this.deviceDescription = deviceDescription;
        this.deviceBrand = deviceBrand;
        this.deviceSupplier = deviceSupplier;
        this.deviceSpecifications = deviceSpecifications;
        this.deviceWRPolicy = deviceWRPolicy;
        this.deviceStandardPrice = deviceStandardPrice;
        this.deviceCurrentPrice = deviceCurrentPrice;
        this.deviceType = deviceType;
        this.deviceSOH = deviceSOH;
        this.deviceImage = deviceImage;
    }

    public String getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(String deviceID) {
        this.deviceID = deviceID;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceDescription() {
        return deviceDescription;
    }

    public void setDeviceDescription(String deviceDescription) {
        this.deviceDescription = deviceDescription;
    }

    public String getDeviceBrand() {
        return deviceBrand;
    }

    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand;
    }

    public String getDeviceSupplier() {
        return deviceSupplier;
    }

    public void setDeviceSupplier(String deviceSupplier) {
        this.deviceSupplier = deviceSupplier;
    }

    public String getDeviceSpecifications() {
        return deviceSpecifications;
    }

    public void setDeviceSpecifications(String deviceSpecifications) {
        this.deviceSpecifications = deviceSpecifications;
    }

    public String getDeviceWRPolicy() {
        return deviceWRPolicy;
    }

    public void setDeviceWRPolicy(String deviceWRPolicy) {
        this.deviceWRPolicy = deviceWRPolicy;
    }

    public float getDeviceStandardPrice() {
        return deviceStandardPrice;
    }

    public void setDeviceStandardPrice(float deviceStandardPrice) {
        this.deviceStandardPrice = deviceStandardPrice;
    }

    public float getDeviceCurrentPrice() {
        return deviceCurrentPrice;
    }

    public void setDeviceCurrentPrice(float deviceCurrentPrice) {
        this.deviceCurrentPrice = deviceCurrentPrice;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public int getDeviceSOH() {
        return deviceSOH;
    }

    public void setDeviceSOH(int deviceSOH) {
        this.deviceSOH = deviceSOH;
    }

    public String getDeviceImage() {
        return deviceImage;
    }

    public void setDeviceImage(String deviceImage) {
        this.deviceImage = deviceImage;
    }
}

