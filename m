Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167A9C54E66
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUJsDncEBoVFJVyJ7RJDxI1XEdbscwAv/BoVQW8DgQQ=; b=A2Z+/nlpf2v1rG
	WGllwOoSpO1YlGQX8MlzaNjefB9aVPbk4njWL6toz2PC4OJvH9PlCzDgCUjFQGw78A1bcIBg9G282
	ipVGUBD1g3JWMyssb5xETEhEYJGC/0sdRBbQCKD8zy+yT1vShc8AvCe75UMN9pXDBB2Q1z8LCGYTl
	i0csZ0BSAqwypX2A2QYX+Bck0pYc14kDqThnLzYFmWKhSLBoQXQ13naNljUhfUsW0X6vcFMEIGM7x
	kcSj/ylCLAHGJRGz67JzYT5D2kUXU4ZuVoa6lPQuoA9qJHPnwBImKSaDC1AiN3OSrbLkxMwLIkYe8
	/BmVz1hyI0QVDGTplBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxnR-00000004wxN-3ech;
	Tue, 12 Mar 2024 08:47:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxnG-00000004wuX-3qv2
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Mar 2024 08:47:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rjxnC-0001Io-F9; Tue, 12 Mar 2024 09:47:26 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rjxnB-005scx-3M; Tue, 12 Mar 2024 09:47:25 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rjxnB-0003LK-0A;
	Tue, 12 Mar 2024 09:47:25 +0100
Message-ID: <f35398925846addb282df9c8a6f09d24ecc5c6fc.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] reset: Convert to platform remove callback
 returning void
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 kernel@pengutronix.de
Date: Tue, 12 Mar 2024 09:47:24 +0100
In-Reply-To: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_014730_963481_B054EDF9 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

T24gRGksIDIwMjQtMDMtMDUgYXQgMjI6MzIgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3Rl
Ogo+IEhlbGxvLAo+IAo+IHRoaXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBwbGF0Zm9ybSBkcml2ZXJz
IGJlbG93IGRyaXZlcnMvcmVzZXQgdG8gc3RydWN0Cj4gcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVf
bmV3KCkuIFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06Cj4gUHJvdmlkZSBhIHJl
bW92ZSBjYWxsYmFjayB0aGF0IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQKPiBl
eHBsYW5hdGlvbiBhbmQgdGhlIGV2ZW50dWFsIGdvYWwuCj4gCj4gQWxsIGNvbnZlcnNhdGlvbnMg
YXJlIHRyaXZpYWwsIGJlY2F1c2UgdGhlaXIgLnJlbW92ZSgpIGNhbGxiYWNrcwo+IHJldHVybmVk
IHplcm8gdW5jb25kaXRpb25hbGx5Lgo+IAo+IFRoZXJlIGFyZSBubyBpbnRlcmRlcGVuZGVuY2ll
cyBiZXR3ZWVuIHRoZXNlIHBhdGNoZXMsIHNvIHRoZXkgY291bGQgYmUKPiBwaWNrZWQgdXAgaW5k
aXZpZHVhbGx5LiBCdXQgSSdkIGhvcGUgdGhhdCB0aGV5IGdldCBwaWNrZWQgdXAgYWxsCj4gdG9n
ZXRoZXIgYnkgUGhpbGlwcC4KClRoYW5rIHlvdSwgSSdsbCBwaWNrIHRoZW0gdXAuCgpSZXZpZXdl
ZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCnJlZ2FyZHMKUGhp
bGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
