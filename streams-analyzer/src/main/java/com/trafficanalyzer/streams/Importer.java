package com.trafficanalyzer.streams;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Importer {

    public static void main(String[] args) {
        System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(new Date()));
        System.out.println(new DecimalFormat("http://host-00/path").format(1));
    }
}
