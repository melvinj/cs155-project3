.class public interface abstract Lcom/cs155/trustedapp/IGetContactsString;
.super Ljava/lang/Object;
.source "IGetContactsString.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cs155/trustedapp/IGetContactsString$Stub;
    }
.end annotation


# virtual methods
.method public abstract GetContacts(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
