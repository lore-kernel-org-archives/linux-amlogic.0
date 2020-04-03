Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5815FC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 01:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADD1206F6
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 01:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ohJmnsnR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ADD1206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZXSPkYFPoF2shgyAN9twdZBF94f4CL7gnT/25Z56Zg0=; b=ohJmnsnRpssSmL
	1wqKkbRK7qUz29m3RqYShojhjYkRw/lHDaTbXeOPyH1hYdvZEfTZBTFB+hmJNmW0o+rDkE5c5F3w8
	NN2M992VjOviyEgi8fx9EC00JZuK/1MfInG0hCjG+bmCWGbkqA0ZKjGPXvBULD7i+3/0ttaudhgBh
	Ct1E9L/CVqXk1FaCv4IIpna8NOEmee/6MPGuE+BT/1m2+TkrwAvoXw3OToX6KZ199m8SylXEnQnEK
	PWjRBjhUoCtcXgkeRobIN4c9c0RvUwibG6zGQK1m/fpfC7giTQe3Jo1CtG6eKsTN8/d2YF5gkbNIg
	cS3JV3mHghEQvBWZ3xxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKBZ4-0003ma-Rh; Fri, 03 Apr 2020 01:56:10 +0000
Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKBZ1-0003mA-Rm
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 01:56:09 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e86979f200-6732c;
 Fri, 03 Apr 2020 09:55:43 +0800 (CST)
X-RM-TRANSID: 2eea5e86979f200-6732c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85e86979cea6-12f6b;
 Fri, 03 Apr 2020 09:55:42 +0800 (CST)
X-RM-TRANSID: 2ee85e86979cea6-12f6b
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 narmstrong@baylibre.com
Subject: [PATCH] crypto:amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
Date: Fri,  3 Apr 2020 09:57:10 +0800
Message-Id: <20200403015710.2764-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_185608_495265_BF267B1B 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SW4gdGhpcyBwbGFjZSwgd2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZywgcGxhdGZvcm1fZ2V0X2ly
cSgpIHdpbGwKcHJpbnQgYW4gZXJyb3IgbWVzc2FnZSwgc28gaW4gb3JkZXIgdG8gYXZvaWQgdGhl
IHNpdHVhdGlvbiBvZiByZXBlYXQKb3V0cHV077yMd2Ugc2hvdWxkIHJlbW92ZSBkZXZfZXJyIGhl
cmUuCgpTaWduZWQtb2ZmLWJ5OiBUYW5nIEJpbiA8dGFuZ2JpbkBjbXNzLmNoaW5hbW9iaWxlLmNv
bT4KLS0tCiBkcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyB8IDQgKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIGIvZHJpdmVy
cy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKaW5kZXggOWQ0ZWFkMmY3Li40MTE4
NTdmYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29y
ZS5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCkBAIC0y
NTMsMTAgKzI1Myw4IEBAIHN0YXRpYyBpbnQgbWVzb25fY3J5cHRvX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbWMtPmlycXMgPSBkZXZtX2tjYWxsb2MobWMtPmRldiwgTUFY
RkxPVywgc2l6ZW9mKGludCksIEdGUF9LRVJORUwpOwogCWZvciAoaSA9IDA7IGkgPCBNQVhGTE9X
OyBpKyspIHsKIAkJbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOwotCQlp
ZiAobWMtPmlycXNbaV0gPCAwKSB7Ci0JCQlkZXZfZXJyKG1jLT5kZXYsICJDYW5ub3QgZ2V0IElS
USBmb3IgZmxvdyAlZFxuIiwgaSk7CisJCWlmIChtYy0+aXJxc1tpXSA8IDApCiAJCQlyZXR1cm4g
bWMtPmlycXNbaV07Ci0JCX0KIAogCQllcnIgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYs
IG1jLT5pcnFzW2ldLCBtZXNvbl9pcnFfaGFuZGxlciwgMCwKIAkJCQkgICAgICAgImd4bC1jcnlw
dG8iLCBtYyk7Ci0tIAoyLjIwLjEud2luZG93cy4xCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
