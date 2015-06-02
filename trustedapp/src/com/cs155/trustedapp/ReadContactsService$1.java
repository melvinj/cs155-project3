// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.os.RemoteException;

// Referenced classes of package com.cs155.trustedapp:
//            ReadContactsService

class b extends b
{

    final ReadContactsService this$0;

    public String GetContacts(String s)
        throws RemoteException
    {
        return ReadContactsService.access$0(ReadContactsService.this, s);
    }

    b()
    {
        this$0 = ReadContactsService.this;
        super();
    }
}
