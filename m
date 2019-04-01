Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E46C10F05
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159AF2133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gkDJKqf7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pNusP/cK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159AF2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ch/xrypHN2owZP61pWHeFR+iYtt4uX2WHBjWHrih3I=; b=gkDJKqf7sgMuBW
	ObxY1mllbnNqcgrT19lywPXkqpaUy8Ku1H/auMzPHMqGZVymuI9ZATsUgXEWCeYZ9z0Bvg2Xp87xn
	PiWdKybEMRFpiuyBoHSy+zlg9u2vfvFATm71OGoU+lmSEUiKAu5/GiEfqJYgtS6xrdQhtljE303vZ
	iv220Iv6jMf437VDZ9Ax5hOeWPCj/wsN+JgaxySktSCfnlPBG7qhV6DD1dtvtpuRP8ZQKou4cl+KV
	Rmj847YDrIxNv0Gss3pn4SV/vif8mGEeP7fxPezOgFHpjvowgEb2GMXw76RmNZuL7OUt2CpFe+Fz/
	rlV8CpLBdNELrLeTsuuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1CT-0007ZB-Jz; Mon, 01 Apr 2019 17:58:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1CJ-0007O2-Qr; Mon, 01 Apr 2019 17:58:17 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so349495wmj.3;
 Mon, 01 Apr 2019 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPeKlSug6FmM3MV9fECsotZs7maoQ1cummrLUWibeCY=;
 b=pNusP/cKIaeO5Q/DtT644uMd+FpsNyGf/fm0rpTltdyxvSieh5878fQ9dYOBUQHAE8
 Q7QZ3jFd0DLuCpmv0T9x3j7ie+JqoV74QwERzySM6SazHHu8etV7fdTNmOqBsGDoWNoG
 WXj/9ol9eTsbyMFJr4Usy913VQzbuxUSqT7kaYE7Qr3yz+CuDDjczOltqvpXfBAvFSr2
 Xh4wl/ayUnFK7EA0fpHqEiKcQUtSNPSt5aB/lQGpQlxpqNaIqDlK0Iak0I6rSvS4goOA
 r8rOgrTEwjqHUPHDfu7PV8ZLw0Xw1qWyY91k/rHfyAnd/cZ+Q1WYsZFzpLkqHmOOeof+
 KRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPeKlSug6FmM3MV9fECsotZs7maoQ1cummrLUWibeCY=;
 b=MKjILCEVWzfmTqtcC24ggjQuAxD0NiYT/t5gEgjBqwqcRU+RSKpkLot18WQvstKoxl
 +Gvv79XjyK5JMt08zj/VPRwNeqz6Otgiif9NqwYuTuPfmwfFXP2wsaThUg4lnNrZgd2d
 Q0FJFqe3Pz6izmkuEzIcRdYSAqBHgMkb6oNxkiJEOSXPUw2PxHyXCAoDJRvtSPiethVe
 c0yCgVZ1WIxmZZDF9QV+HeO6clx/gu1ez8rOq4KlEql1XFb3cajnR8TlhGNUAkZDmMUt
 sauyWY8UtOXGIeGIVm6MBgilJb09EeZkMnYUr3US47CyhmgIzeftT0NrErsbo6BaJGU9
 a5Zg==
X-Gm-Message-State: APjAAAUrm421+TMJj7LDKVcAgaTkUrWA4VPcSisswnFPYVN+8G+0U/Qy
 mpdYUOUItPABngJSSXnRQxw=
X-Google-Smtp-Source: APXvYqwLD5cDnTfGVwaZOk5rR/snoJXyBwTXzaf8duMpIx+mp+J4/KQTC0IfGkqsNurwSL6B747Klw==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr563202wmj.121.1554141493613; 
 Mon, 01 Apr 2019 10:58:13 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73A0800C9C8A7BE25478D36.dip0.t-ipconnect.de.
 [2003:dc:d73a:800:c9c8:a7be:2547:8d36])
 by smtp.googlemail.com with ESMTPSA id
 s189sm16655340wmf.45.2019.04.01.10.58.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 10:58:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/1] pwm: meson: use the spin-lock only to protect register
 modifications
Date: Mon,  1 Apr 2019 19:57:48 +0200
Message-Id: <20190401175748.5376-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401175748.5376-1-martin.blumenstingl@googlemail.com>
References: <20190401175748.5376-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_105815_864642_1E2F866E 
X-CRM114-Status: GOOD (  19.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SG9sZGluZyB0aGUgc3Bpbi1sb2NrIGZvciBhbGwgb2YgdGhlIGNvZGUgaW4gbWVzb25fcHdtX2Fw
cGx5KCkgY2FuCnJlc3VsdCBpbiBhICJCVUc6IHNjaGVkdWxpbmcgd2hpbGUgYXRvbWljIi4gVGhp
cyBjYW4gaGFwcGVuIGJlY2F1c2UKY2xrX2dldF9yYXRlKCkgKHdoaWNoIGlzIGNhbGxlZCBmcm9t
IG1lc29uX3B3bV9jYWxjKCkpIG1heSBzbGVlcC4KT25seSBob2xkIHRoZSBzcGluLWxvY2sgd2hl
biBtb2RpZnlpbmcgcmVnaXN0ZXJzIHRvIHNvbHZlIHRoaXMuCgpUaGUgcmVhc29uIHdoeSB3ZSBu
ZWVkIGEgc3Bpbi1sb2NrIGluIHRoZSBkcml2ZXIgaXMgYmVjYXVzZSB0aGUKUkVHX01JU0NfQUIg
cmVnaXN0ZXIgaXMgc2hhcmVkIGJldHdlZW4gdGhlIHR3byBjaGFubmVscyBwcm92aWRlZCBieSBv
bmUKUFdNIGNvbnRyb2xsZXIuIFRoZSBvbmx5IGZ1bmN0aW9ucyB3aGVyZSBSRUdfTUlTQ19BQiBp
cyBtb2RpZmllZCBhcmUKbWVzb25fcHdtX2VuYWJsZSgpIGFuZCBtZXNvbl9wd21fZGlzYWJsZSgp
IHNvIHRoZSByZWdpc3RlciByZWFkcy93cml0ZXMKaW4gdGhlcmUgbmVlZCB0byBiZSBwcm90ZWN0
ZWQgYnkgdGhlIHNwaW4tbG9jay4KClRoZSBvcmlnaW5hbCBjb2RlIGFsc28gdXNlZCB0aGUgc3Bp
bi1sb2NrIHRvIHByb3RlY3QgdGhlIHZhbHVlcyBpbgpzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwu
IFRoaXMgY291bGQgYmUgbmVjZXNzYXJ5IGlmIHR3byBjb25zdW1lcnMgY2FuCnVzZSB0aGUgc2Ft
ZSBQV00gY2hhbm5lbC4gSG93ZXZlciwgUFdNIGNvcmUgZG9lc24ndCBhbGxvdyB0aGlzIHNvIHdl
CmRvbid0IG5lZWQgdG8gcHJvdGVjdCB0aGUgdmFsdWVzIGluIHN0cnVjdCBtZXNvbl9wd21fY2hh
bm5lbCB3aXRoIGEKbG9jay4KCkZpeGVzOiAyMTFlZDYzMDc1M2QyZiAoInB3bTogQWRkIHN1cHBv
cnQgZm9yIE1lc29uIFBXTSBDb250cm9sbGVyIikKU2lnbmVkLW9mZi1ieTogTWFydGluIEJsdW1l
bnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQog
ZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCmlu
ZGV4IGMxZWQ2NDFiM2UyNi4uZjZlNzM4YWQ3YmQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9w
d20tbWVzb24uYworKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwpAQCAtMTExLDYgKzExMSwx
MCBAQCBzdHJ1Y3QgbWVzb25fcHdtIHsKIAljb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEgKmRh
dGE7CiAJdm9pZCBfX2lvbWVtICpiYXNlOwogCXU4IGludmVydGVyX21hc2s7CisJLyoKKwkgKiBQ
cm90ZWN0cyByZWdpc3RlciAod3JpdGUpIGFjY2VzcyB0byB0aGUgUkVHX01JU0NfQUIgcmVnaXN0
ZXIKKwkgKiB0aGF0IGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSB0d28gUFdNcy4KKwkgKi8KIAlzcGlu
bG9ja190IGxvY2s7CiB9OwogCkBAIC0yMzUsNiArMjM5LDcgQEAgc3RhdGljIHZvaWQgbWVzb25f
cHdtX2VuYWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwKIHsKIAl1MzIgdmFsdWUsIGNsa19z
aGlmdCwgY2xrX2VuYWJsZSwgZW5hYmxlOwogCXVuc2lnbmVkIGludCBvZmZzZXQ7CisJdW5zaWdu
ZWQgbG9uZyBmbGFnczsKIAogCXN3aXRjaCAoaWQpIHsKIAljYXNlIDA6CkBAIC0yNTUsNiArMjYw
LDggQEAgc3RhdGljIHZvaWQgbWVzb25fcHdtX2VuYWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNv
biwKIAkJcmV0dXJuOwogCX0KIAorCXNwaW5fbG9ja19pcnFzYXZlKCZtZXNvbi0+bG9jaywgZmxh
Z3MpOworCiAJdmFsdWUgPSByZWFkbChtZXNvbi0+YmFzZSArIFJFR19NSVNDX0FCKTsKIAl2YWx1
ZSAmPSB+KE1JU0NfQ0xLX0RJVl9NQVNLIDw8IGNsa19zaGlmdCk7CiAJdmFsdWUgfD0gY2hhbm5l
bC0+cHJlX2RpdiA8PCBjbGtfc2hpZnQ7CkBAIC0yNjcsMTEgKzI3NCwxNCBAQCBzdGF0aWMgdm9p
ZCBtZXNvbl9wd21fZW5hYmxlKHN0cnVjdCBtZXNvbl9wd20gKm1lc29uLAogCXZhbHVlID0gcmVh
ZGwobWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQik7CiAJdmFsdWUgfD0gZW5hYmxlOwogCXdyaXRl
bCh2YWx1ZSwgbWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQik7CisKKwlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZtZXNvbi0+bG9jaywgZmxhZ3MpOwogfQogCiBzdGF0aWMgdm9pZCBtZXNvbl9wd21f
ZGlzYWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgdW5zaWduZWQgaW50IGlkKQogewogCXUz
MiB2YWx1ZSwgZW5hYmxlOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlzd2l0Y2ggKGlkKSB7
CiAJY2FzZSAwOgpAQCAtMjg2LDkgKzI5NiwxMyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wd21fZGlz
YWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgdW5zaWduZWQgaW50IGlkKQogCQlyZXR1cm47
CiAJfQogCisJc3Bpbl9sb2NrX2lycXNhdmUoJm1lc29uLT5sb2NrLCBmbGFncyk7CisKIAl2YWx1
ZSA9IHJlYWRsKG1lc29uLT5iYXNlICsgUkVHX01JU0NfQUIpOwogCXZhbHVlICY9IH5lbmFibGU7
CiAJd3JpdGVsKHZhbHVlLCBtZXNvbi0+YmFzZSArIFJFR19NSVNDX0FCKTsKKworCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJm1lc29uLT5sb2NrLCBmbGFncyk7CiB9CiAKIHN0YXRpYyBpbnQgbWVz
b25fcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwKQEAgLTI5NiwxOSArMzEwLDE2IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2FwcGx5KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIHsKIAlzdHJ1Y3QgbWVz
b25fcHdtX2NoYW5uZWwgKmNoYW5uZWwgPSBwd21fZ2V0X2NoaXBfZGF0YShwd20pOwogCXN0cnVj
dCBtZXNvbl9wd20gKm1lc29uID0gdG9fbWVzb25fcHdtKGNoaXApOwotCXVuc2lnbmVkIGxvbmcg
ZmxhZ3M7CiAJaW50IGVyciA9IDA7CiAKIAlpZiAoIXN0YXRlKQogCQlyZXR1cm4gLUVJTlZBTDsK
IAotCXNwaW5fbG9ja19pcnFzYXZlKCZtZXNvbi0+bG9jaywgZmxhZ3MpOwotCiAJaWYgKCFzdGF0
ZS0+ZW5hYmxlZCkgewogCQltZXNvbl9wd21fZGlzYWJsZShtZXNvbiwgcHdtLT5od3B3bSk7CiAJ
CWNoYW5uZWwtPnN0YXRlLmVuYWJsZWQgPSBmYWxzZTsKIAotCQlnb3RvIHVubG9jazsKKwkJcmV0
dXJuIDA7CiAJfQogCiAJaWYgKHN0YXRlLT5wZXJpb2QgIT0gY2hhbm5lbC0+c3RhdGUucGVyaW9k
IHx8CkBAIC0zMjksNyArMzQwLDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21fYXBwbHkoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQllcnIgPSBtZXNvbl9w
d21fY2FsYyhtZXNvbiwgY2hhbm5lbCwgcHdtLT5od3B3bSwKIAkJCQkgICAgIHN0YXRlLT5kdXR5
X2N5Y2xlLCBzdGF0ZS0+cGVyaW9kKTsKIAkJaWYgKGVyciA8IDApCi0JCQlnb3RvIHVubG9jazsK
KwkJCXJldHVybiBlcnI7CiAKIAkJY2hhbm5lbC0+c3RhdGUucG9sYXJpdHkgPSBzdGF0ZS0+cG9s
YXJpdHk7CiAJCWNoYW5uZWwtPnN0YXRlLnBlcmlvZCA9IHN0YXRlLT5wZXJpb2Q7CkBAIC0zNDEs
OSArMzUyLDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21fYXBwbHkoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQljaGFubmVsLT5zdGF0ZS5lbmFibGVkID0g
dHJ1ZTsKIAl9CiAKLXVubG9jazoKLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtZXNvbi0+bG9j
aywgZmxhZ3MpOwotCXJldHVybiBlcnI7CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyB2b2lkIG1l
c29uX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtLAotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
