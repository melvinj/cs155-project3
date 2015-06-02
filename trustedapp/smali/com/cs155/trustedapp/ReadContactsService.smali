.class public Lcom/cs155/trustedapp/ReadContactsService;
.super Landroid/app/IntentService;
.source "ReadContactsService.java"


# static fields
.field protected static final CONTACTS_STRING_KEY:Ljava/lang/String; = "CONTACTS_STRING_KEY"

.field protected static final REQUEST_CONTACTS_STRING:Ljava/lang/String; = "REQUEST_CONTACTS_STRING"

.field public static final RESULT_ID_CONTACTS:I = 0x1


# instance fields
.field private final ACTUAL_SECRET_KEY:Ljava/lang/String;

.field private icontacts_sub:Lcom/cs155/trustedapp/IGetContactsString$Stub;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "BLANK_CONSTRUCTOR_CALLED"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 19
    const-string v0, "youllnevergetmeluckycharms"

    iput-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService;->ACTUAL_SECRET_KEY:Ljava/lang/String;

    .line 77
    new-instance v0, Lcom/cs155/trustedapp/ReadContactsService$1;

    invoke-direct {v0, p0}, Lcom/cs155/trustedapp/ReadContactsService$1;-><init>(Lcom/cs155/trustedapp/ReadContactsService;)V

    iput-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService;->icontacts_sub:Lcom/cs155/trustedapp/IGetContactsString$Stub;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 19
    const-string v0, "youllnevergetmeluckycharms"

    iput-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService;->ACTUAL_SECRET_KEY:Ljava/lang/String;

    .line 77
    new-instance v0, Lcom/cs155/trustedapp/ReadContactsService$1;

    invoke-direct {v0, p0}, Lcom/cs155/trustedapp/ReadContactsService$1;-><init>(Lcom/cs155/trustedapp/ReadContactsService;)V

    iput-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService;->icontacts_sub:Lcom/cs155/trustedapp/IGetContactsString$Stub;

    .line 27
    return-void
.end method

.method static synthetic access$0(Lcom/cs155/trustedapp/ReadContactsService;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/cs155/trustedapp/ReadContactsService;->safeRetrieveContacts(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getContacts()Landroid/database/Cursor;
    .locals 7

    .prologue
    .line 67
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 68
    .local v1, "uri":Landroid/net/Uri;
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v6, "_id"

    aput-object v6, v2, v0

    const/4 v0, 0x1

    const-string v6, "display_name"

    aput-object v6, v2, v0

    .line 69
    .local v2, "projection":[Ljava/lang/String;
    const-string v3, "in_visible_group = \'1\'"

    .line 70
    .local v3, "selection":Ljava/lang/String;
    const/4 v4, 0x0

    .line 71
    .local v4, "selectionArgs":[Ljava/lang/String;
    const-string v5, "display_name COLLATE LOCALIZED ASC"

    .line 73
    .local v5, "sortOrder":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/cs155/trustedapp/ReadContactsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private safeRetrieveContacts(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "secret_key"    # Ljava/lang/String;

    .prologue
    .line 86
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const-string v0, ""

    .line 91
    :goto_0
    return-object v0

    .line 88
    :cond_1
    const-string v0, "youllnevergetmeluckycharms"

    invoke-direct {p0, p1, v0}, Lcom/cs155/trustedapp/ReadContactsService;->strcmp(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 89
    invoke-virtual {p0}, Lcom/cs155/trustedapp/ReadContactsService;->retrieveContacts()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 91
    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method private strcmp(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "s1"    # Ljava/lang/String;
    .param p2, "s2"    # Ljava/lang/String;

    .prologue
    .line 96
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 101
    :cond_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 97
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_2

    .line 98
    const/4 v1, 0x0

    goto :goto_1

    .line 96
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/cs155/trustedapp/ReadContactsService;->icontacts_sub:Lcom/cs155/trustedapp/IGetContactsString$Stub;

    return-object v0
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 4
    .param p1, "workIntent"    # Landroid/content/Intent;

    .prologue
    .line 41
    const-string v3, "SECRET_KEY"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/cs155/trustedapp/ReadContactsService;->safeRetrieveContacts(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "contacts_string":Ljava/lang/String;
    const-string v3, "REQUEST_CONTACTS_STRING"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/ResultReceiver;

    .line 44
    .local v2, "rec":Landroid/os/ResultReceiver;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 45
    .local v0, "b":Landroid/os/Bundle;
    const-string v3, "CONTACTS_STRING_KEY"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const/4 v3, 0x1

    invoke-virtual {v2, v3, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 48
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 35
    invoke-super {p0, p1, p2, p3}, Landroid/app/IntentService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public retrieveContacts()Ljava/lang/String;
    .locals 5

    .prologue
    .line 51
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 53
    .local v2, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/cs155/trustedapp/ReadContactsService;->getContacts()Landroid/database/Cursor;

    move-result-object v0

    .line 55
    .local v0, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 62
    return-object v2

    .line 57
    :cond_0
    const-string v3, "display_name"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 56
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "displayName":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "Name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
