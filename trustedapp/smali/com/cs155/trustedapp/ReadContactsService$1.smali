.class Lcom/cs155/trustedapp/ReadContactsService$1;
.super Lcom/cs155/trustedapp/IGetContactsString$Stub;
.source "ReadContactsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cs155/trustedapp/ReadContactsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cs155/trustedapp/ReadContactsService;


# direct methods
.method constructor <init>(Lcom/cs155/trustedapp/ReadContactsService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cs155/trustedapp/ReadContactsService$1;->this$0:Lcom/cs155/trustedapp/ReadContactsService;

    .line 77
    invoke-direct {p0}, Lcom/cs155/trustedapp/IGetContactsString$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public GetContacts(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "secret_key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService$1;->this$0:Lcom/cs155/trustedapp/ReadContactsService;

    # invokes: Lcom/cs155/trustedapp/ReadContactsService;->safeRetrieveContacts(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/cs155/trustedapp/ReadContactsService;->access$0(Lcom/cs155/trustedapp/ReadContactsService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
