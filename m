Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19EFC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 09:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC15020721
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 09:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHU7xcHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC15020721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IxrG6w6oJ+W3N4C4R/k4icdC+GJhBl94Viy+QOGsrwE=; b=qHU7xcHH+sV/hx
	XguWVbjsZiFSs/JSfoHPf8Xo8ogzakmKjZBL2qg/11T8+PGCOO54fEOQ4PS0N8sMpFKq8xRDtrsVU
	NZVo4SCP3F52+DtqbY2QVVFA09AueYDWs7f9PCOPTaW76lSo8w+G8RDZs8xaQ4rfNANfJAy6TTbi7
	EQLMinvYhqVNuHTM7fWxaVd/nu4YdSZd4mYOnKnPXKnbjigzcURzqTCcVbxeEsV4aXyGyKyve4DLK
	L9x1tNacwYa4CUmZDbzSfAgeg5CWWktxXcn8aNDP2ClNYoDuFWP9i/GA8rWxIXxeToi5MVG5HjgtP
	ivQhlrlxlq4HkJwuhuDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKIEJ-0006eh-PN; Fri, 03 Apr 2020 09:03:11 +0000
Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKIDg-00060r-IK
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 09:02:39 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25e86fb905c2-7473b;
 Fri, 03 Apr 2020 17:02:09 +0800 (CST)
X-RM-TRANSID: 2ee25e86fb905c2-7473b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5e86fb8e2e1-42d70;
 Fri, 03 Apr 2020 17:02:08 +0800 (CST)
X-RM-TRANSID: 2eea5e86fb8e2e1-42d70
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: narmstrong@baylibre.com, clabbe@baylibre.com, herbert@gondor.apana.org.au,
 davem@davemloft.net
Subject: [PATCH] [PATCH v3]crypto: amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
Date: Fri,  3 Apr 2020 17:03:36 +0800
Message-Id: <20200403090336.13796-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_020233_154833_99877953 
X-CRM114-Status: UNSURE (   9.47  )
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
b20gdjI6CiAtIG1vZGlmeSB0aGUgdGhlbWUgZm9ybWF0IGFuZCBjb250ZW50IGRlc2NyaXB0aW9u
LgogLSByZWZvcm1hdCB0aGUgcGF0Y2gsIGl0J3MgdGhlIHdyb25nIHdheSB0byByZXN1Ym1pdCBh
IG5ldyBwYXRjaCB0aGF0CiAgIHNob3VsZCBiZSBtb2RpZmllZCBvbiB0b3Agb2YgdGhlIG9yaWdp
bmFsLiBUaGUgb3JpZ2luYWwgcGllY2UgaXM6CiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Bh
dGNod29yay9wYXRjaC8xMjE5NjExLwoKQ2hhbmdlcyBmcm9tIHYxOgogLSB0aGUgdGl0bGUgaGFz
IGNoYW5nZWQsIGJlY2F1c2UgdGhlIGRlc2NyaXB0aW9uIGlzIG5vdCB2ZXJ5IGRldGFpbGVkLgog
LSB0aGUgY29kZSBoYXMgYmVlbiBtb2RpZmllZCwgYmVjYXVzZSBpdCBuZWVkcyB0byBtYXRjaCB0
aGUgdGhlbWUuCgpTaWduZWQtb2ZmLWJ5OiBUYW5nIEJpbiA8dGFuZ2JpbkBjbXNzLmNoaW5hbW9i
aWxlLmNvbT4KLS0tCiBkcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyB8
IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIGIv
ZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKaW5kZXggMzc5MDFiZDgx
Li5jMmZhNDQyYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1n
eGwtY29yZS5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5j
CkBAIC0yNTMsMTAgKzI1Myw4IEBAIHN0YXRpYyBpbnQgbWVzb25fY3J5cHRvX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbWMtPmlycXMgPSBkZXZtX2tjYWxsb2MobWMtPmRl
diwgTUFYRkxPVywgc2l6ZW9mKGludCksIEdGUF9LRVJORUwpOwogCWZvciAoaSA9IDA7IGkgPCBN
QVhGTE9XOyBpKyspIHsKIAkJbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFs
KHBkZXYsIGkpOwotCQlpZiAobWMtPmlycXNbaV0gPCAwKSB7Ci0JCQlkZXZfZXJyKG1jLT5kZXYs
ICJDYW5ub3QgZ2V0IElSUSBmb3IgZmxvdyAlZFxuIiwgaSk7CisJCWlmIChtYy0+aXJxc1tpXSA8
IDApCiAJCQlyZXR1cm4gbWMtPmlycXNbaV07Ci0JCX0KIAogCQllcnIgPSBkZXZtX3JlcXVlc3Rf
aXJxKCZwZGV2LT5kZXYsIG1jLT5pcnFzW2ldLCBtZXNvbl9pcnFfaGFuZGxlciwgMCwKIAkJCQkg
ICAgICAgImd4bC1jcnlwdG8iLCBtYyk7Ci0tIAoyLjIwLjEud2luZG93cy4xCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
