// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.app.IntentService;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ResultReceiver;

public class ReadContactsService extends IntentService
{

    protected static final String CONTACTS_STRING_KEY = "CONTACTS_STRING_KEY";
    protected static final String REQUEST_CONTACTS_STRING = "REQUEST_CONTACTS_STRING";
    public static final int RESULT_ID_CONTACTS = 1;
    private final String ACTUAL_SECRET_KEY;
    private IGetContactsString.Stub icontacts_sub = new IGetContactsString.Stub() {

        final ReadContactsService this$0;

        public String GetContacts(String s)
            throws RemoteException
        {
            return safeRetrieveContacts(s);
        }

            
            {
                this$0 = ReadContactsService.this;
                super();
            }
    };

    public ReadContactsService()
    {
        super("BLANK_CONSTRUCTOR_CALLED");
        ACTUAL_SECRET_KEY = "youllnevergetmeluckycharms";
    }

    public ReadContactsService(String s)
    {
        super(s);
        ACTUAL_SECRET_KEY = "youllnevergetmeluckycharms";
    }

    private Cursor getContacts()
    {
        android.net.Uri uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
        return getContentResolver().query(uri, new String[] {
            "_id", "display_name"
        }, "in_visible_group = '1'", null, "display_name COLLATE LOCALIZED ASC");
    }

    private String safeRetrieveContacts(String s)
    {
        if (s == null || s.length() == 0)
        {
            return "";
        }
        if (strcmp(s, "youllnevergetmeluckycharms"))
        {
            return retrieveContacts();
        } else
        {
            return "";
        }
    }

    private boolean strcmp(String s, String s1)
    {
        int i = 0;
        do
        {
            if (i >= s.length() || i >= s1.length())
            {
                return true;
            }
            if (s.charAt(i) != s1.charAt(i))
            {
                return false;
            }
            i++;
        } while (true);
    }

    public IBinder onBind(Intent intent)
    {
        return icontacts_sub;
    }

    protected void onHandleIntent(Intent intent)
    {
        String s = safeRetrieveContacts(intent.getStringExtra("SECRET_KEY"));
        intent = (ResultReceiver)intent.getParcelableExtra("REQUEST_CONTACTS_STRING");
        Bundle bundle = new Bundle();
        bundle.putString("CONTACTS_STRING_KEY", s);
        intent.send(1, bundle);
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        return super.onStartCommand(intent, i, j);
    }

    public String retrieveContacts()
    {
        String s = new String();
        Cursor cursor = getContacts();
        do
        {
            if (!cursor.moveToNext())
            {
                return s;
            }
            String s1 = cursor.getString(cursor.getColumnIndex("display_name"));
            s = (new StringBuilder(String.valueOf(s))).append("Name: ").append(s1).append("\n").toString();
        } while (true);
    }

}
