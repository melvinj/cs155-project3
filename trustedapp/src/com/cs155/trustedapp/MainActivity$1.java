// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.content.Intent;
import android.view.View;

// Referenced classes of package com.cs155.trustedapp:
//            MainActivity, ReadContactsService

class this._cls0
    implements android.view.tener
{

    final MainActivity this$0;

    public void onClick(View view)
    {
        view = new Intent();
        view.setClass(getApplicationContext(), com/cs155/trustedapp/ReadContactsService);
        view.putExtra("SECRET_KEY", "youllnevergetmeluckycharms");
        view.putExtra("REQUEST_CONTACTS_STRING", mReceiver);
        startService(view);
    }

    vice()
    {
        this$0 = MainActivity.this;
        super();
    }
}
