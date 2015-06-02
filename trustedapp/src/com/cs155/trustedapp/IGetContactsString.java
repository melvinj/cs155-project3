// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.cs155.trustedapp;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface IGetContactsString
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IGetContactsString
    {

        private static final String DESCRIPTOR = "com.cs155.trustedapp.IGetContactsString";
        static final int TRANSACTION_GetContacts = 1;

        public static IGetContactsString asInterface(IBinder ibinder)
        {
            if (ibinder == null)
            {
                return null;
            }
            IInterface iinterface = ibinder.queryLocalInterface("com.cs155.trustedapp.IGetContactsString");
            if (iinterface != null && (iinterface instanceof IGetContactsString))
            {
                return (IGetContactsString)iinterface;
            } else
            {
                return new Proxy(ibinder);
            }
        }

        public IBinder asBinder()
        {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel1, int j)
            throws RemoteException
        {
            switch (i)
            {
            default:
                return super.onTransact(i, parcel, parcel1, j);

            case 1598968902: 
                parcel1.writeString("com.cs155.trustedapp.IGetContactsString");
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.cs155.trustedapp.IGetContactsString");
                parcel = GetContacts(parcel.readString());
                parcel1.writeNoException();
                parcel1.writeString(parcel);
                return true;
            }
        }

        public Stub()
        {
            attachInterface(this, "com.cs155.trustedapp.IGetContactsString");
        }
    }

    private static class Stub.Proxy
        implements IGetContactsString
    {

        private IBinder mRemote;

        public String GetContacts(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.cs155.trustedapp.IGetContactsString");
            parcel.writeString(s);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            s = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s;
            s;
            parcel1.recycle();
            parcel.recycle();
            throw s;
        }

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.cs155.trustedapp.IGetContactsString";
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract String GetContacts(String s)
        throws RemoteException;
}
