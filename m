Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE728C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 09:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C064920737
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 09:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOZ0ggcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C064920737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRgkQJxEabavn38aV/mwSmj8a0KvwdGlKfK159/gXVc=; b=JOZ0ggcC0Sdx7L
	h+48AwEspXCVfuQJ5twsXuxglxSnsH5/lM+BeZ8JlmhZYbz+5kXqro6oxtRpofh8uhtIPmlJFxWdd
	jAHmG5dykCgDfPryWN/AfvVULTJnTXy74mSwuUsFQH9ICqqHs0Do9JMqQSzf40Y71jo/4Jck5eKiP
	aYOKN1+TfuVm/CezrDXqYkuKMaBjTNes6bjk47Fw971JpV3DhlfziN8il/yv8WLIihwucU4zyKD14
	yuRESAETLzhx9yhMgBxfZtbI+X66fVazAU4H9YUZUazMeJisnO6nqDST949cbdPmjVSJ5s+vq0A5O
	mpB4H6BQxg7EzBxyIWag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKINN-0004XG-AR; Fri, 03 Apr 2020 09:12:33 +0000
Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKINK-0004W7-LW
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 09:12:32 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e86fde4b05-74c43;
 Fri, 03 Apr 2020 17:12:04 +0800 (CST)
X-RM-TRANSID: 2eea5e86fde4b05-74c43
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45e86fde287d-479a0;
 Fri, 03 Apr 2020 17:12:04 +0800 (CST)
X-RM-TRANSID: 2ee45e86fde287d-479a0
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: narmstrong@baylibre.com, clabbe@baylibre.com, herbert@gondor.apana.org.au,
 davem@davemloft.net
Subject: [PATCH v4]crypto: amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
Date: Fri,  3 Apr 2020 17:13:32 +0800
Message-Id: <20200403091332.12100-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_021231_188146_A0FE50A2 
X-CRM114-Status: UNSURE (   9.88  )
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
ZXBlYXQgb3V0cHV077yMd2Ugc2hvdWxkIHJlbW92ZQpkZXZfZXJyIGhlcmUuCgpDaGFuZ2VzIGZv
cm0gdjM6CiAtIGZpeCB0aGUgdGhlbWUgd3JpdGluZyBlcnJvci4KCkNoYW5nZXMgZnJvbSB2MjoK
IC0gbW9kaWZ5IHRoZSB0aGVtZSBmb3JtYXQgYW5kIGNvbnRlbnQgZGVzY3JpcHRpb24uCiAtIHJl
Zm9ybWF0IHRoZSBwYXRjaCwgaXQncyB0aGUgd3Jvbmcgd2F5IHRvIHJlc3VibWl0IGEgbmV3IHBh
dGNoIHRoYXQKICAgc2hvdWxkIGJlIG1vZGlmaWVkIG9uIHRvcCBvZiB0aGUgb3JpZ2luYWwuIFRo
ZSBvcmlnaW5hbCBwaWVjZSBpczoKICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3Jr
L3BhdGNoLzEyMTk2MTEvCgpDaGFuZ2VzIGZyb20gdjE6CiAtIHRoZSB0aXRsZSBoYXMgY2hhbmdl
ZCwgYmVjYXVzZSB0aGUgZGVzY3JpcHRpb24gaXMgbm90IHZlcnkgZGV0YWlsZWQuCiAtIHRoZSBj
b2RlIGhhcyBiZWVuIG1vZGlmaWVkLCBiZWNhdXNlIGl0IG5lZWRzIHRvIG1hdGNoIHRoZSB0aGVt
ZS4KClNpZ25lZC1vZmYtYnk6IFRhbmcgQmluIDx0YW5nYmluQGNtc3MuY2hpbmFtb2JpbGUuY29t
PgotLS0KIGRyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIHwgNCArLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgYi9kcml2ZXJz
L2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwppbmRleCAzNzkwMWJkODEuLmMyZmE0
NDJjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3Jl
LmMKKysrIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKQEAgLTI1
MywxMCArMjUzLDggQEAgc3RhdGljIGludCBtZXNvbl9jcnlwdG9fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAltYy0+aXJxcyA9IGRldm1fa2NhbGxvYyhtYy0+ZGV2LCBNQVhG
TE9XLCBzaXplb2YoaW50KSwgR0ZQX0tFUk5FTCk7CiAJZm9yIChpID0gMDsgaSA8IE1BWEZMT1c7
IGkrKykgewogCQltYy0+aXJxc1tpXSA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwg
aSk7Ci0JCWlmIChtYy0+aXJxc1tpXSA8IDApIHsKLQkJCWRldl9lcnIobWMtPmRldiwgIkNhbm5v
dCBnZXQgSVJRIGZvciBmbG93ICVkXG4iLCBpKTsKKwkJaWYgKG1jLT5pcnFzW2ldIDwgMCkKIAkJ
CXJldHVybiBtYy0+aXJxc1tpXTsKLQkJfQogCiAJCWVyciA9IGRldm1fcmVxdWVzdF9pcnEoJnBk
ZXYtPmRldiwgbWMtPmlycXNbaV0sIG1lc29uX2lycV9oYW5kbGVyLCAwLAogCQkJCSAgICAgICAi
Z3hsLWNyeXB0byIsIG1jKTsKLS0gCjIuMjAuMS53aW5kb3dzLjEKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
