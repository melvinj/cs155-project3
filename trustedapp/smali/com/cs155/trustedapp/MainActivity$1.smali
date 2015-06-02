.class Lcom/cs155/trustedapp/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cs155/trustedapp/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cs155/trustedapp/MainActivity;


# direct methods
.method constructor <init>(Lcom/cs155/trustedapp/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cs155/trustedapp/MainActivity$1;->this$0:Lcom/cs155/trustedapp/MainActivity;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 37
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 38
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/cs155/trustedapp/MainActivity$1;->this$0:Lcom/cs155/trustedapp/MainActivity;

    invoke-virtual {v1}, Lcom/cs155/trustedapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/cs155/trustedapp/ReadContactsService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 40
    const-string v1, "SECRET_KEY"

    const-string v2, "youllnevergetmeluckycharms"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    const-string v1, "REQUEST_CONTACTS_STRING"

    iget-object v2, p0, Lcom/cs155/trustedapp/MainActivity$1;->this$0:Lcom/cs155/trustedapp/MainActivity;

    iget-object v2, v2, Lcom/cs155/trustedapp/MainActivity;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 42
    iget-object v1, p0, Lcom/cs155/trustedapp/MainActivity$1;->this$0:Lcom/cs155/trustedapp/MainActivity;

    invoke-virtual {v1, v0}, Lcom/cs155/trustedapp/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 43
    return-void
.end method
