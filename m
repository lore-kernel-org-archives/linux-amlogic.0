Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF4C624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jj8xz0PrGq6mQxBYBbV8+kSPEJxzG0Mpv8IXlqdg/V0=; b=GuP6iTC5mRAh1U
	9ysyD4DjYRjUot17WMENgjHmfOwi8XnxecTz99Kwq6kb5tDvquexsK3idW94R+G2CauF8jsoGeGJb
	YWkB+DdG7BCuizeqBsimp+jWDqIsHVPavZeuemVg4Dk44eNfGKpy5bw6QdVlJl8YcqG1pYqrIHIH9
	aHDEnP1Pk2gPqPHtBuf4qRjebXI61igNC3ofTTAf2/C5tKQakBKtserLbEMgy/OYLCRLpQ3NtLCkq
	TCC4jaxeiym4yEAgureTxRQsmJlIaoUjfBAjrWwdfHdPS1CFVrnt7P1L8CDJJ9e2EPEp+dWxLh2P9
	JvnNkgwdOhxBJWujBCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JW-0000000GsOF-2GGC;
	Thu, 03 Sep 2026 09:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JV-0000000GsN7-0MVE;
	Thu, 03 Sep 2026 09:00:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D336C407A0;
	Thu,  3 Sep 2026 09:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D221F00A3A;
	Thu,  3 Sep 2026 09:00:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH net-next v2 1/3] net: macb: Make sure clk_init_data is fully initialized
Date: Thu,  3 Sep 2026 11:00:39 +0200
Message-ID: <62cfa62a8f39e0014d2fe9b30a668df20ace4a0c.1788425654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788425654.git.geert+renesas@glider.be>
References: <cover.1788425654.git.geert+renesas@glider.be>
MIME-Version: 1.0
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

VGhlIGNsa19pbml0X2RhdGEgc3RydWN0dXJlIGNvbnRhaW5zIHNldmVyYWwgbXV0dWFsbHktZXhj
bHVzaXZlIG1lbWJlcnMKZm9yIGRpZmZlcmVudCBtZXRob2RzIHRvIHNwZWNpZnkgdGhlIHBvc3Np
YmxlIHBhcmVudHMgb2YgYSBjbG9jaywKcHJvbXB0aW5nIGRyaXZlcnMgdG8gaW5pdGlhbGl6ZSBv
bmx5IHRoZSBtZW1iZXJzIHRoZXkgbmVlZC4gIEhvd2V2ZXIsCm5vdCBpbml0aWFsaXppbmcgYWxs
IG1lbWJlcnMgbWF5IGNhdXNlIHN1YnRsZSBpc3N1ZXMsIHdoaWNoIGFyZSBvbmx5CmV4cG9zZWQg
d2hlbiBDT05GSUdfSU5JVF9TVEFDS19BTExfUEFUVEVSTiBvciBDT05GSUdfSU5JVF9TVEFDS19O
T05FIGlzCmVuYWJsZWQuCgpNYWtlIHN1cmUgYWxsIG1lbWJlcnMgYXJlIGZ1bGx5IGluaXRpYWxp
emVkLCB0byBhdm9pZCBzdWNoIGJ1Z3MsIGFuZCB0bwpwcmV2ZW50IGZ1dHVyZSBicmVha2FnZSB3
aGVuIGNvbnZlcnRpbmcgZHJpdmVycyB0byBhIGRpZmZlcmVudCBtZXRob2QKZm9yIHNwZWNpZnlp
bmcgdGhlIHBhcmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPgpSZXZpZXdlZC1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4u
Y29tPgotLS0KQ29tcGlsZS10ZXN0ZWQgb25seS4KCnYyOgogIC0gQWRkIFJldmlld2VkLWJ5Lgot
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwppbmRleCA3NmVlNGY1MDYwMzM1YzRlLi4yZTZhNWU5
M2QwY2RkNWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAg
LTUzNzUsNyArNTM3NSw3IEBAIHN0YXRpYyBpbnQgZnU1NDBfYzAwMF9jbGtfaW5pdChzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgY2xrICoqcGNsaywKIAkJCSAgICAgICBzdHJ1
Y3QgY2xrICoqaGNsaywgc3RydWN0IGNsayAqKnR4X2NsaywKIAkJCSAgICAgICBzdHJ1Y3QgY2xr
ICoqcnhfY2xrLCBzdHJ1Y3QgY2xrICoqdHN1X2NsaykKIHsKLQlzdHJ1Y3QgY2xrX2luaXRfZGF0
YSBpbml0OworCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKIAlpbnQgZXJyID0gMDsK
IAogCWVyciA9IG1hY2JfY2xrX2luaXRfZGZsdChwZGV2LCBwY2xrLCBoY2xrLCB0eF9jbGssIHJ4
X2NsaywgdHN1X2Nsayk7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
