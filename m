Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FFDC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 11:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C96312082F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 11:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XbUh/v59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C96312082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rx/rqv1d9zvc1AKXunOnKrt9M0GtB1VDlp8miAJTUeM=; b=XbUh/v59GzY+9r
	kR5KC042PRGHg9VXqR1QAYSIj11kLzuSACwUFVqB0imHA/bG9vjHjG1J0W5y2ukGzQPMIsCUs0R2s
	DxbLYtiRb2Tls9Qllidy2t7g/95Gjh4ri/4X21PCWFXdJ1MaZG4zR+rfGJsmF05iUedfxN9YYGh2I
	wB+0r6YtLPY9dpjYCEj3gyrFqSGZRZI9TD8/NhY1ZodOIJwfzf+0cy4jFdZ9M+aEPLnYOPb/U160D
	r4uLzMnSrPextoKiJyQmkyHMcKl4DzVJFzwq2vwEnNjSeOF4/lQRJNTfnWIcZ2ZK28I2H/yDuNVxa
	V1or9lONGEv5cArJnHiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKKGr-0004aP-OP; Fri, 03 Apr 2020 11:13:57 +0000
Received: from cmccmta2.chinamobile.com ([221.176.66.80])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKKGn-0004Zl-4Z
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 11:13:55 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee55e871a3c030-780ff;
 Fri, 03 Apr 2020 19:13:01 +0800 (CST)
X-RM-TRANSID: 2ee55e871a3c030-780ff
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.208.73])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e871a3afd0-e407c;
 Fri, 03 Apr 2020 19:13:01 +0800 (CST)
X-RM-TRANSID: 2ee65e871a3afd0-e407c
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: narmstrong@baylibre.com, clabbe@baylibre.com, herbert@gondor.apana.org.au,
 davem@davemloft.net
Subject: [PATCH v5]crypto: amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
Date: Fri,  3 Apr 2020 19:14:29 +0800
Message-Id: <20200403111429.11876-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_041353_661243_21785589 
X-CRM114-Status: UNSURE (   9.99  )
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

V2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZywgcGxhdGZvcm1fZ2V0X2lycSgpIHdpbGwgcHJpbnQg
YW4gZXJyb3IgbWVzc2FnZSwKc28gaW4gb3JkZXIgdG8gYXZvaWQgdGhlIHNpdHVhdGlvbiBvZiBy
ZXBlYXQgb3V0cHV077yMd2Ugc2hvdWxkIHJlbW92ZQpkZXZfZXJyIGhlcmUuCgpDaGFuZ2VzIGZy
b20gdjQ6CiAtIHJld3JpdGUgdGhlIGNvZGUsIGJlY2F1c2UgdGhlIGNvZGUgaW4gdjQgaXMgd3Jv
bmcsIHNvcnJ5LgoKQ2hhbmdlcyBmb3JtIHYzOgogLSBmaXggdGhlIHRoZW1lIHdyaXRpbmcgZXJy
b3IuCgpDaGFuZ2VzIGZyb20gdjI6CiAtIG1vZGlmeSB0aGUgdGhlbWUgZm9ybWF0IGFuZCBjb250
ZW50IGRlc2NyaXB0aW9uLgogLSByZWZvcm1hdCB0aGUgcGF0Y2gsIGl0J3MgdGhlIHdyb25nIHdh
eSB0byByZXN1Ym1pdCBhIG5ldyBwYXRjaCB0aGF0CiAgIHNob3VsZCBiZSBtb2RpZmllZCBvbiB0
b3Agb2YgdGhlIG9yaWdpbmFsLiBUaGUgb3JpZ2luYWwgcGllY2UgaXM6CiAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMjE5NjExLwoKQ2hhbmdlcyBmcm9tIHYxOgog
LSB0aGUgdGl0bGUgaGFzIGNoYW5nZWQsIGJlY2F1c2UgdGhlIGRlc2NyaXB0aW9uIGlzIG5vdCB2
ZXJ5IGRldGFpbGVkLgogLSB0aGUgY29kZSBoYXMgYmVlbiBtb2RpZmllZCwgYmVjYXVzZSBpdCBu
ZWVkcyB0byBtYXRjaCB0aGUgdGhlbWUuCgpTaWduZWQtb2ZmLWJ5OiBUYW5nIEJpbiA8dGFuZ2Jp
bkBjbXNzLmNoaW5hbW9iaWxlLmNvbT4KLS0tCiBkcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9n
aWMtZ3hsLWNvcmUuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dp
Yy1neGwtY29yZS5jIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMK
aW5kZXggOWQ0ZWFkMmY3Li40MTE4NTdmYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2Ft
bG9naWMvYW1sb2dpYy1neGwtY29yZS5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1s
b2dpYy1neGwtY29yZS5jCkBAIC0yNTMsMTAgKzI1Myw4IEBAIHN0YXRpYyBpbnQgbWVzb25fY3J5
cHRvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbWMtPmlycXMgPSBkZXZt
X2tjYWxsb2MobWMtPmRldiwgTUFYRkxPVywgc2l6ZW9mKGludCksIEdGUF9LRVJORUwpOwogCWZv
ciAoaSA9IDA7IGkgPCBNQVhGTE9XOyBpKyspIHsKIAkJbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIGkpOwotCQlpZiAobWMtPmlycXNbaV0gPCAwKSB7Ci0JCQlkZXZfZXJyKG1j
LT5kZXYsICJDYW5ub3QgZ2V0IElSUSBmb3IgZmxvdyAlZFxuIiwgaSk7CisJCWlmIChtYy0+aXJx
c1tpXSA8IDApCiAJCQlyZXR1cm4gbWMtPmlycXNbaV07Ci0JCX0KIAogCQllcnIgPSBkZXZtX3Jl
cXVlc3RfaXJxKCZwZGV2LT5kZXYsIG1jLT5pcnFzW2ldLCBtZXNvbl9pcnFfaGFuZGxlciwgMCwK
IAkJCQkgICAgICAgImd4bC1jcnlwdG8iLCBtYyk7Ci0tIAoyLjIwLjEud2luZG93cy4xCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
