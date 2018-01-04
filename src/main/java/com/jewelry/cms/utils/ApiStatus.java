package com.jewelry.cms.utils;

import java.util.HashMap;
import java.util.Map;

public class ApiStatus {
    public final static int ok = 0;
    public final static int err = 50000;
    public static Map<Integer, String> msg = new HashMap<Integer, String>();

    static {
        msg.put(ok, "OK");
        msg.put(err, "interal error");
    }
}
