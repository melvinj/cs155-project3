// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;

public class MyResultReceiver extends ResultReceiver
{
    public static interface Receiver
    {

        public abstract void onReceiveResult(int i, Bundle bundle);
    }


    private Receiver mReceiver;

    public MyResultReceiver(Handler handler)
    {
        super(handler);
    }

    protected void onReceiveResult(int i, Bundle bundle)
    {
        if (mReceiver != null)
        {
            mReceiver.onReceiveResult(i, bundle);
        }
    }

    public void setReceiver(Receiver receiver)
    {
        mReceiver = receiver;
    }
}
