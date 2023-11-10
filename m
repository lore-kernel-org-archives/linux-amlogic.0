Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5178C4167D
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOOt1r6ZxliFGFkju7K1M28EZj9iKA7F3KQHYQZ3Wvo=; b=3AeK8+7Vx54cPw
	6C5ORCXE1kI/DqgpK2HDiy+fODfvfnnyW4pGu6aL5Oxk4rKEogRM3TFzHgGNkrBUYLicevIuQNBPi
	U1VE3rBIwZgDfLgGbFA2Ka3DGQf6/rpkv/V9gzh2v3cX0GPxa3ofXFwD9Qm9iryRJq5OJZKdFh2zg
	qsmcRPeOdInJPyfjpMm/POv2fGey6E5H9tVbY4wBy+NuvDqT69R9FqFuW3ocCsrH0861+f0FeAlJW
	1rTiejoucNsr+/8cg+pfyI4EleZOqlfKe1U4yIW6naL5iUqaf31QR73D+m5hlKPKxBl9YFgR7gL5Z
	9J4+EPioXQSRqgz1CHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TTc-0090yb-2S;
	Fri, 10 Nov 2023 15:31:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TTJ-0090k2-1q
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Nov 2023 15:31:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT4-0006If-Uq; Fri, 10 Nov 2023 16:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT2-0083K5-Js; Fri, 10 Nov 2023 16:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT2-00GnwI-AJ; Fri, 10 Nov 2023 16:30:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Lucas Tanure <tanure@linux.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pavel Krasavin <pkrasavin@imaqliq.com>,
	kernel@pengutronix.de,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 23/52] serial: meson: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:29:51 +0100
Message-ID: <20231110152927.70601-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FYolZrFOFgUo4prnGFbVvGWakGEu6coU7k3q8Li2/Fk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTkxyX0bjsRruDSjLNjkWf3vtgo37pge57d2zv axzBIKV9IWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU5McgAKCRCPgPtYfRL+ TjrQB/986Mot5WK/tLMUZb9GRdNnimXXlpB72WYieVtWZUIsilKqDbr4K+RLiSJP+GW0Z6Fdegx RXbbIFvPg/qxvn16C3FN0duoGFMCto3p7kC+Sg7lO1jN+8lSP2xJez7hpCSlVsX3UppXbdQgif5 O9AoVDIIP5M5t9D5XJGohdqmtXraYauESWOpSZNxtcc0yJqCwfeJBLytLz//jkj/8oOlIVSOLSL trfENEbqIdQp2bJTw7uLZX69kM5UTMAZTDUh8Cm7IDBI4u1EwN+vapw3Rj0VMBrmVuahDjR4Vq6 tzIPLDeh5Wjx+X2xRh00eDKQdYenUPf4Ywk0A9xlNUKnSA/E
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_073101_627880_FAC7CE44 
X-CRM114-Status: GOOD (  16.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0
eS9zZXJpYWwvbWVzb25fdWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwpp
bmRleCA4ZGQ4NDYxN2U3MTUuLjgzOTU2ODhmNWVlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkv
c2VyaWFsL21lc29uX3VhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5j
CkBAIC03OTUsNyArNzk1LDcgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBtZXNv
bl91YXJ0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQg
bWVzb25fdWFydF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3QgdWFydF9kcml2ZXIgKnVhcnRfZHJpdmVyOwogCXN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQ7CkBA
IC04MDcsMTIgKzgwNywxMCBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlmb3IgKGludCBpZCA9IDA7IGlkIDwgQU1MX1VBUlRf
UE9SVF9OVU07IGlkKyspCiAJCWlmIChtZXNvbl9wb3J0c1tpZF0pCi0JCQlyZXR1cm4gMDsKKwkJ
CXJldHVybjsKIAogCS8qIE5vIG1vcmUgYXZhaWxhYmxlIHVhcnQgcG9ydHMsIHVucmVnaXN0ZXIg
dWFydCBkcml2ZXIgKi8KIAl1YXJ0X3VucmVnaXN0ZXJfZHJpdmVyKHVhcnRfZHJpdmVyKTsKLQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IG1lc29uX3VhcnRfZGF0YSBtZXNvbl9nMTJh
X3VhcnRfZGF0YSA9IHsKQEAgLTg1Miw3ICs4NTAsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCBtZXNvbl91YXJ0X2R0X21hdGNoKTsKIAogc3RhdGljICBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG1lc29uX3VhcnRfcGxhdGZvcm1fZHJpdmVyID0gewogCS5wcm9iZQkJPSBtZXNvbl91YXJ0X3By
b2JlLAotCS5yZW1vdmUJCT0gbWVzb25fdWFydF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBtZXNv
bl91YXJ0X3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJCT0gIm1lc29uX3VhcnQiLAog
CQkub2ZfbWF0Y2hfdGFibGUJPSBtZXNvbl91YXJ0X2R0X21hdGNoLAotLSAKMi40Mi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
