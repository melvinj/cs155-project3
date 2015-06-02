.class public Lcom/cs155/trustedapp/MyResultReceiver;
.super Landroid/os/ResultReceiver;
.source "MyResultReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cs155/trustedapp/MyResultReceiver$Receiver;
    }
.end annotation


# instance fields
.field private mReceiver:Lcom/cs155/trustedapp/MyResultReceiver$Receiver;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 15
    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/cs155/trustedapp/MyResultReceiver;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver$Receiver;

    if-eqz v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/cs155/trustedapp/MyResultReceiver;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver$Receiver;

    invoke-interface {v0, p1, p2}, Lcom/cs155/trustedapp/MyResultReceiver$Receiver;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 32
    :cond_0
    return-void
.end method

.method public setReceiver(Lcom/cs155/trustedapp/MyResultReceiver$Receiver;)V
    .locals 0
    .param p1, "receiver"    # Lcom/cs155/trustedapp/MyResultReceiver$Receiver;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/cs155/trustedapp/MyResultReceiver;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver$Receiver;

    .line 24
    return-void
.end method
