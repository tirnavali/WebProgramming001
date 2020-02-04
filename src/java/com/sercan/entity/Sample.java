/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sercan.entity;

/**
 *
 * @author 62542
 */
public class Sample {
    private long sampleId;
    private String sampleName;
    private double sampleValue;

    public Sample() {
    }

    public Sample(long sampleId, String sampleName, double sampleValue) {
        this.sampleId = sampleId;
        this.sampleName = sampleName;
        this.sampleValue = sampleValue;
    }
    
    
    public long getSampleId() {
        return sampleId;
    }

    public void setSampleId(long sampleId) {
        this.sampleId = sampleId;
    }

    public String getSampleName() {
        return sampleName;
    }

    public void setSampleName(String sampleName) {
        this.sampleName = sampleName;
    }

    public double getSampleValue() {
        return sampleValue;
    }

    public void setSampleValue(double sampleValue) {
        this.sampleValue = sampleValue;
    }
    
    
    
}
