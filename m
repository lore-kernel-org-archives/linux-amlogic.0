Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC06C25B72
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7k5cFn/cVSTk6TXiyrKbgJ3nhPABnBRYZl2eF3mef3A=; b=1Jbw2+3uDI/U3v
	5Nf0kE5yEMYb/mleQhbHCYv5mHPcsgLXdYgdM8TnbKtGRWg/rapTSNN7W+r+4X/YV24IZ8BdZecsS
	Wg2gyYJpXaDeAIBbAy6Nb39Meut3/ekVOk7braZ0r5Dtr6lDELw/x2XKd6qMvHSqbB+GAsWo6D8IU
	UYx6w+0Ld0lE22lqKeRVstOhLFz5f57mXN/d/RjiukCDoFekfmPcA5vu4X0y4GasgSjlpmjpdLWLh
	wJZcy1ArXIkeezEczfZ1HYoGK7AnZlSZ+57disdu33T/WA9YgRbMI0vc7SbG+lo7K55qWDyWyonTt
	q1ojPDkNYknv2A2fMxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRt-00E9be-2p;
	Thu, 26 Oct 2023 10:18:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRp-00E9XN-0R
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 10:18:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-0002ne-A9; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-004O1r-MA; Thu, 26 Oct 2023 12:18:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-006XTv-CZ; Thu, 26 Oct 2023 12:18:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/3] media: meson-ir-tx: Some cleanups and simplifications and a bug report
Date: Thu, 26 Oct 2023 12:18:17 +0200
Message-ID: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9f95QupmDD1wCm7me2TiK83K9AHR9two7YFf8SXT3Lk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzppXk2Qm28MOi8I8DIbnpCyB0ZQI6nNu1X6 En+p/8ahWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86QAKCRCPgPtYfRL+ TgbDCACp6GwotsK5vjw8THZ109ikr4W8XvR9oyGGiiwISHzYpCWo+fg6QYTUw5jS9tCsTgMVPW9 LVWFj1dBvnEfSclJpBv1x1/uVkhn/B7aCHChSghEXTSDrDIvbr27pc4Eseeqm3T4qn+x8Qx1uha icJv0cBWx4Mj7TmFmif+Q2kTiMD0yQNFVSFjOxlSMUmfIHtr9yCsbWKs3mzn0pMhAJ+meRog9Ji Kdv8shj4rIW0wlaaRArqfmofgKsq9LqKElPtUhKeyKYhA4GEPSAPZ/meSKQtxpK5vB6u6JEZyCI 09E3Bi2/StZTqxx7MV4KOPTP9IoxmpfPTe1uj3Gyo6gPsvtT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_031841_175295_A339C12D 
X-CRM114-Status: GOOD (  11.89  )
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

SGVsbG8sCgp3aGlsZSBsb29raW5nIGFyb3VuZCBmb3IgZHJpdmVycyBzdGlsbCB1c2luZyBwbGF0
Zm9ybV9kcml2ZXJfcHJvYmUoKSBJCmZvdW5kIHRoZSBtZXNvbi1pci10eCBkcml2ZXIuIFdoaWxl
IGxvb2tpbmcgYXQgaXQgSSBpZGVudGlmaWVkIGEgZmV3CnBhdGNoIG9wcG9ydHVuaXRpZXMuCgpJ
IHRoaW5rIHRoZSBkcml2ZXIgbWlnaHQgYmUgdXNlZCB0byB0cmlnZ2VyIGEgdXNlIGFmdGVyIGZy
ZWUgcHJvYmxlbQp0aGF0IGlzIGNhdXNlZCBieSB0aGUgaXIgY29yZS4gV2l0aCBteSBjdXJyZW50
IHVuZGVyc3RhbmRpbmcgdGhlCmZvbGxvd2luZyBpcyBwb3NzaWJsZToKCgkxKSBvcGVuIHRoZSBp
ciBkZXZpY2UgYW5kIGtlZXAgaXQgb3BlbgoJMikgdW5iaW5kIHRoZSBtZXNvbi1pci10eCBkZXZp
Y2UKCTMpIHRyaWdnZXIgY2FsbGluZyAudHhfaXIgPSBtZXNvbl9pcnR4X3RyYW5zbWl0IHVzaW5n
IHRoZSBvcGVuZWQKCSAgIGRldmljZSB1c2luZyB3cml0ZSgpCgoyKSBjYW4gYmUgZG9uZSB1c2lu
ZyBzeXNmcyBvciAobWF5YmUpIGJ5IG1vZHVsZSB1bmxvYWRpbmcuIFRoZSByZXN1bHQgaXMKdGhh
dCB0aGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkgaXIgaXMgZnJlZWQgYW5kIHRoZSByZWdpc3RlciBt
YXBwaW5nIGdvZXMKYXdheS4gRXZlbiBtZXNvbl9pcnR4X3RyYW5zbWl0KCkgbWlnaHQgZGlzYXBw
ZWFyIHRoZW4uIENhbGxpbmcKbWVzb25faXJ0eF90cmFuc21pdCgpIHRoZW4geWllbGRzIGFsbCBr
aW5kIG9mIGZ1bi4KCkkgZGlkbid0IGRlYnVnIGluIGRldGFpbCBzbyBJIG1pZ2h0IG1pc3Mgc29t
ZXRoaW5nLiBUbyBmaXggdGhhdCB5b3UgaGF2ZQp0byBtYWtlIHN1cmUgdGhhdCB0aGUgY2FsbGJh
Y2tzIGRvbid0IGdldCBjYWxsZWQgYW55IG1vcmUgb25jZSB0aGUgcmMKZGV2aWNlIGlzIHVucmVn
aXN0ZXJlZCAoYW5kIHRyYWNrIHRoYXQgaW5mb3JtYXRpb24gaW4gbWVtb3J5IHRoYXQKZG9lc24n
dCBnbyBhd2F5IHdpdGggdGhlIHBhcmVudCBkZXZpY2UncyByZW1vdmUgY2FsbGJhY2sgY29tcGxl
dGluZykuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAoMyk6CiAgbWVkaWE6
IG1lc29uLWlyLXR4OiBDb252ZXJ0IHRvIHVzZSBkZXZtX3JjX3JlZ2lzdGVyX2RldmljZSgpCiAg
bWVkaWE6IG1lc29uLWlyLXR4OiBTaW1wbGlmeSBhbmQgaW1wcm92ZSB1c2luZyBkZXZfZXJyX3By
b2JlKCkKICBtZWRpYTogbWVzb24taXItdHg6IERyb3AgdXNhZ2Ugb2YgcGxhdGZvcm1fZHJpdmVy
X3Byb2JlKCkKCiBkcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLXR4LmMgfCAzNCArKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMjQgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDBiYjgwZWNjMzNhOGZiNWE2ODIyMzY0
NDNjMWU3NDBkNWM5MTdkMWQKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
