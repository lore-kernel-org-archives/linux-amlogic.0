Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A856C35274
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDb7gu3O8kKed1hwFWRudk/WqdvEg3izHYxb07yGOVI=; b=awj7/I6fBtkZF5
	J5H+A9r2DJji6bW/PO00XxUk7gFIjrsd1SPSRKXJtUPXMCVE+8I4Xd2dtlEY2ev96pzYzcGiga8ky
	7YAznqebW8WM/xfF4CK8VxqS5PP5CdIMzMvwuSM9svrGLKJt0ofTby4KVvvhHOY5H9hrvXcSNf+4Y
	37r0c5FHysnIzpO2n/87RxaIJ9kKXAVvQLGfDqNp7WbeEXfxfGgJF+E8Vvxl4TEHzc+r41vY1Vgek
	GhmrQCKp/TlElghlhDEbFaBjmThrdSoPYXH7QLZu3OaYgBxaL/3kLZvx6Xb+CaAPAq0F2wZny4R0E
	YGPO+Gld8o149oopEvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XR-00CNt9-32;
	Tue, 12 Dec 2023 17:27:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XL-00CNpm-09
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 17:27:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6X1-0001uR-3P; Tue, 12 Dec 2023 18:26:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-00FOPS-AU; Tue, 12 Dec 2023 18:26:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-001nbp-0U; Tue, 12 Dec 2023 18:26:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	kernel@pengutronix.de
Subject: [PATCH 5/5] clk: Make clk_rate_exclusive_get() return void
Date: Tue, 12 Dec 2023 18:26:42 +0100
Message-ID: <3f556647c09162be61edba6b50e76d235aace590.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=qJe1s9wVwLl8m/pFpVrdi1+PKSyFn6KyEhyiKlqeWWk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtSK6Zf0mliZ79remRRaoTdVj3sjX5Z43dTfXEr7MubN7 cv5Yz2jk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJuD3nYNgg+PrYSkuD2Eki L1U4HRwVOm/VLGkPWWUoV1WYwxBfEWYmlb5vdk5eXETUxLjPjnuM9m124lwrkvHnX3X3TrfzUWd XtRVfrdwx53zY0iitL8q7iiOm/RSY41yVxy7Q3SF+Yf3DO/PK2hbZC6n2+hisPicuvTMhrsv85J +QOu6/GZ3CmxdfOB8buHp9dNSn+ZszIi1YT3amxbtM0I1SV/vT2/G2XCwjeaJz5bNzS+UOnBYu3 8VyICqoSHNi9dnMPxmiJx7qHy3ZySo1tTiDY5NraL5Po03Y7PjDOWnuQoe36p20d9SY6BYbPV8/ xLjJxNLi0Z73rq0//xkv+LSD59R1XatNPzx3tk47vXM3AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_092715_081715_58B4EA3D 
X-CRM114-Status: GOOD (  13.17  )
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

VGhlIGZ1bmN0aW9uIGN1cnJlbnRseSByZXR1cm5zIDAgdW5jb25kaXRpb25hbGx5LiBUaGlzIGlz
bid0IHZlcnkgdXNlZnVsCmFuZCBtYWtlcyB1c2VycyBjcmVhdGUgZGVhZCBjb2RlIGVycm9yIHBh
dGhzLiBTbyBsZXQgdGhpcyBmdW5jdGlvbgpyZXR1cm4gbm8gdmFsdWUuIEFsbCB1c2VycyB3ZXJl
IGFkYXB0ZWQgYmVmb3JlIHRvIGlnbm9yZSB0aGUgcmV0dXJuZWQKdmFsdWUuCgpBbHNvIGZpeCBh
IGZldyB0eXBvcyBpbiB0aGUga2VybmVsIGRvYyBjb21tZW50IGZvcgpjbGtfcmF0ZV9leGNsdXNp
dmVfZ2V0KCkuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xrL2Nsay5jICAgfCA2ICsrLS0tLQog
aW5jbHVkZS9saW51eC9jbGsuaCB8IDggKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay5j
IGIvZHJpdmVycy9jbGsvY2xrLmMKaW5kZXggMjI1M2MxNTRhODI0Li5hZjIwMTFjMmE5M2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL2Nsay5jCisrKyBiL2RyaXZlcnMvY2xrL2Nsay5jCkBAIC05
MjUsMTcgKzkyNSwxNSBAQCBzdGF0aWMgdm9pZCBjbGtfY29yZV9yYXRlX3Jlc3RvcmVfcHJvdGVj
dChzdHJ1Y3QgY2xrX2NvcmUgKmNvcmUsIGludCBjb3VudCkKICAqIGNsa19yYXRlX2V4Y2x1c2l2
ZV9wdXQoKS4gQ2FsbHMgdG8gdGhpcyBmdW5jdGlvbiBtYXkgc2xlZXAuCiAgKiBSZXR1cm5zIDAg
b24gc3VjY2VzcywgLUVFUlJPUiBvdGhlcndpc2UKICAqLwotaW50IGNsa19yYXRlX2V4Y2x1c2l2
ZV9nZXQoc3RydWN0IGNsayAqY2xrKQordm9pZCBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KHN0cnVj
dCBjbGsgKmNsaykKIHsKIAlpZiAoIWNsaykKLQkJcmV0dXJuIDA7CisJCXJldHVybjsKIAogCWNs
a19wcmVwYXJlX2xvY2soKTsKIAljbGtfY29yZV9yYXRlX3Byb3RlY3QoY2xrLT5jb3JlKTsKIAlj
bGstPmV4Y2x1c2l2ZV9jb3VudCsrOwogCWNsa19wcmVwYXJlX3VubG9jaygpOwotCi0JcmV0dXJu
IDA7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KTsKIApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbGsuaCBiL2luY2x1ZGUvbGludXgvY2xrLmgKaW5kZXgg
MDZmMWIyOTJmOGEwLi5mODhjNDA3OTI1ZjggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvY2xr
LmgKKysrIGIvaW5jbHVkZS9saW51eC9jbGsuaApAQCAtMTkwLDE2ICsxOTAsMTQgQEAgYm9vbCBj
bGtfaXNfbWF0Y2goY29uc3Qgc3RydWN0IGNsayAqcCwgY29uc3Qgc3RydWN0IGNsayAqcSk7CiAg
KgogICogVGhpcyBmdW5jdGlvbiBhbGxvd3MgZHJpdmVycyB0byBnZXQgZXhjbHVzaXZlIGNvbnRy
b2wgb3ZlciB0aGUgcmF0ZSBvZiBhCiAgKiBwcm92aWRlci4gSXQgcHJldmVudHMgYW55IG90aGVy
IGNvbnN1bWVyIHRvIGV4ZWN1dGUsIGV2ZW4gaW5kaXJlY3RseSwKLSAqIG9wZXJlYXRpb24gd2hp
Y2ggY291bGQgYWx0ZXIgdGhlIHJhdGUgb2YgdGhlIHByb3ZpZGVyIG9yIGNhdXNlIGdsaXRjaGVz
CisgKiBvcGVyYXRpb24gd2hpY2ggY291bGQgYWx0ZXIgdGhlIHJhdGUgb2YgdGhlIHByb3ZpZGVy
IG9yIGNhdXNlIGdsaXRjaGVzCiAgKgotICogSWYgZXhsdXNpdml0eSBpcyBjbGFpbWVkIG1vcmUg
dGhhbiBvbmNlIG9uIGNsb2NrLCBldmVuIGJ5IHRoZSBzYW1lIGRyaXZlciwKKyAqIElmIGV4Y2x1
c2l2aXR5IGlzIGNsYWltZWQgbW9yZSB0aGFuIG9uY2Ugb24gY2xvY2ssIGV2ZW4gYnkgdGhlIHNh
bWUgZHJpdmVyLAogICogdGhlIHJhdGUgZWZmZWN0aXZlbHkgZ2V0cyBsb2NrZWQgYXMgZXhjbHVz
aXZpdHkgY2FuJ3QgYmUgcHJlZW1wdGVkLgogICoKICAqIE11c3Qgbm90IGJlIGNhbGxlZCBmcm9t
IHdpdGhpbiBhdG9taWMgY29udGV4dC4KLSAqCi0gKiBSZXR1cm5zIHN1Y2Nlc3MgKDApIG9yIG5l
Z2F0aXZlIGVycm5vLgogICovCi1pbnQgY2xrX3JhdGVfZXhjbHVzaXZlX2dldChzdHJ1Y3QgY2xr
ICpjbGspOwordm9pZCBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KHN0cnVjdCBjbGsgKmNsayk7CiAK
IC8qKgogICogY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCAtIHJlbGVhc2UgZXhjbHVzaXZpdHkgb3Zl
ciB0aGUgcmF0ZSBjb250cm9sIG9mIGEKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
