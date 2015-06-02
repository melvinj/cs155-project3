.class public Lcom/cs155/trustedapp/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Lcom/cs155/trustedapp/MyResultReceiver$Receiver;


# instance fields
.field public mReceiver:Lcom/cs155/trustedapp/MyResultReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(I)V
    .locals 0
    .param p1, "code"    # I

    .prologue
    .line 67
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const/high16 v2, 0x7f030000

    invoke-virtual {p0, v2}, Lcom/cs155/trustedapp/MainActivity;->setContentView(I)V

    .line 27
    const v2, 0x7f080001

    invoke-virtual {p0, v2}, Lcom/cs155/trustedapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 30
    .local v0, "button":Landroid/widget/Button;
    new-instance v2, Lcom/cs155/trustedapp/MyResultReceiver;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    invoke-direct {v2, v3}, Lcom/cs155/trustedapp/MyResultReceiver;-><init>(Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/cs155/trustedapp/MainActivity;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver;

    .line 31
    iget-object v2, p0, Lcom/cs155/trustedapp/MainActivity;->mReceiver:Lcom/cs155/trustedapp/MyResultReceiver;

    invoke-virtual {v2, p0}, Lcom/cs155/trustedapp/MyResultReceiver;->setReceiver(Lcom/cs155/trustedapp/MyResultReceiver$Receiver;)V

    .line 33
    new-instance v1, Lcom/cs155/trustedapp/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/cs155/trustedapp/MainActivity$1;-><init>(Lcom/cs155/trustedapp/MainActivity;)V

    .line 46
    .local v1, "listen":Landroid/view/View$OnClickListener;
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/cs155/trustedapp/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 73
    const/4 v0, 0x1

    return v0
.end method

.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 4
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .prologue
    .line 52
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    .line 53
    const v2, 0x7f080002

    invoke-virtual {p0, v2}, Lcom/cs155/trustedapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 55
    .local v0, "contactView":Landroid/widget/TextView;
    const-string v2, "CONTACTS_STRING_KEY"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "contacts":Ljava/lang/String;
    const-string v2, ""

    if-ne v1, v2, :cond_1

    .line 57
    const-string v2, "Blank string returned!"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .end local v0    # "contactView":Landroid/widget/TextView;
    .end local v1    # "contacts":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 59
    .restart local v0    # "contactView":Landroid/widget/TextView;
    .restart local v1    # "contacts":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Contacts:\n"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
