// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

// Referenced classes of package com.cs155.trustedapp:
//            MyResultReceiver, ReadContactsService

public class MainActivity extends Activity
    implements MyResultReceiver.Receiver
{

    public MyResultReceiver mReceiver;

    public MainActivity()
    {
    }

    public void onActivityResult(int i)
    {
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030000);
        bundle = (Button)findViewById(0x7f080001);
        mReceiver = new MyResultReceiver(new Handler());
        mReceiver.setReceiver(this);
        bundle.setOnClickListener(new android.view.View.OnClickListener() {

            final MainActivity this$0;

            public void onClick(View view)
            {
                view = new Intent();
                view.setClass(getApplicationContext(), com/cs155/trustedapp/ReadContactsService);
                view.putExtra("SECRET_KEY", "youllnevergetmeluckycharms");
                view.putExtra("REQUEST_CONTACTS_STRING", mReceiver);
                startService(view);
            }

            
            {
                this$0 = MainActivity.this;
                super();
            }
        });
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(0x7f070000, menu);
        return true;
    }

    public void onReceiveResult(int i, Bundle bundle)
    {
        TextView textview;
label0:
        {
            if (i == 1)
            {
                textview = (TextView)findViewById(0x7f080002);
                bundle = bundle.getString("CONTACTS_STRING_KEY");
                if (bundle != "")
                {
                    break label0;
                }
                textview.setText("Blank string returned!");
            }
            return;
        }
        textview.setText((new StringBuilder("Contacts:\n")).append(bundle).toString());
    }
}
