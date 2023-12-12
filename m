Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA073C4167D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YjL37zC36j1rGCs/wbvpPtG2z/bPbb7dJdl50tK/GYA=; b=k29nWyQKabte2Q
	ABHoJ9A5pHD31vJNJvOmROcXEurFtOVndNyykZ1t8V4TnuTm9SNFxOF0y2PElQuD8tgwMzLUNOTzp
	sPBB4+WCEKwBBIT35c0dsJoddfbzjkfPQZ+z/ReK/if99mEgmfsj/502AlaZRJGmr1PdGJ0G/XKoM
	Khmm5SFc1BJOyQL6WMVevqGZlI33oZUFjQ9d0PXn1BGZ+fUegYGi29dA5uBgVeLOBrpeIQdTi33xu
	l5dn/p/AXjhjdxhQHmyGXLmZ67WwJ4z7oyptSl+ngzP5M9EEKQS97sd9SP87zGrkp1+/ZjMHe9HyN
	Mn/oeYVd7JaLVZeEAaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XS-00CNtW-1H;
	Tue, 12 Dec 2023 17:27:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XL-00CNpu-0n
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 17:27:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6X1-0001uM-3O; Tue, 12 Dec 2023 18:26:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-00FOPD-7r; Tue, 12 Dec 2023 18:26:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wv-001nbR-TA; Tue, 12 Dec 2023 18:26:49 +0100
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
Subject: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Tue, 12 Dec 2023 18:26:37 +0100
Message-ID: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=fuoORCWhYYOP5RXKuGpiS7lr3Z2yTHsOYZlk6CpCKEA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtSK6WeM9Jn7Sit136VzF7/4ma2nGmm+cYH0TcGD7l/qr yVKuzt0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjAR9kYOhtn5K8o/uh43Cy40 8V1Z6qUks+9F+Hz+mPwpC8x2/X3J+dPhJue5kGwr0UQRoQir41eF5Cbfly35tGQV0xdVe61lmYf 6XCb6C8mqch9lc3PV01l46mG7/OMdX49+Kvm5uNTA6t3Ds9cnWj/a7eNx9WW4ioOO8pXgbRkJ+R 5N0UsOt7geZzFR/ODedeTL+/PyEcIv06YKmi+K2anHpJjy1vyL47PCSWLsM+I7p1aG/D1/nXlex t+VibUmv/X6lnxq7OGKm9Z6s/3Qv+6Dd+yPSipG7rLPVq4xS13pJC17v5Ezzp/f7srJGKUwncIl fyLuqUhe4O2/kbC0OFf5kX7ugovH10Ud+5H3oq872CsBAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_092715_280113_68E3EDF6 
X-CRM114-Status: GOOD (  10.14  )
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

SGVsbG8sCgpjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgcmV0dXJucyB6ZXJvIHVuY29uZGl0aW9u
YWxseS4gTW9zdCB1c2VycyAia25vdyIKdGhhdCBhbmQgZG9uJ3QgY2hlY2sgdGhlIHJldHVybiB2
YWx1ZS4gVGhpcyBzZXJpZXMgZml4ZXMgdGhlIGZvdXIgdXNlcnMKdGhhdCBkbyBlcnJvciBjaGVj
a2luZyBvbiB0aGUgcmV0dXJuZWQgdmFsdWUgYW5kIHRoZW4gbWFrZXMgZnVuY3Rpb24KcmV0dXJu
IHZvaWQuCgpHaXZlbiB0aGF0IHRoZSBjaGFuZ2VzIHRvIHRoZSBkcml2ZXJzIGFyZSBzaW1wbGUg
YW5kIHNvIG1lcmdlIGNvbmZsaWN0cwooaWYgYW55KSBzaG91bGQgYmUgZWFzeSB0byBoYW5kbGUs
IEkgc3VnZ2VzdCB0byBtZXJnZSB0aGlzIGNvbXBsZXRlCnNlcmllcyB2aWEgdGhlIGNsayB0cmVl
LgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDUpOgogIFBNIC8gZGV2ZnJl
cTogc3VuOGktYTMzLW1idXM6IFNpbXBsaWZ5IHVzYWdlIG9mCiAgICBjbGtfcmF0ZV9leGNsdXNp
dmVfZ2V0KCkKICBkcm0vbWVzb246IFNpbXBsaWZ5IHVzYWdlIG9mIGNsa19yYXRlX2V4Y2x1c2l2
ZV9nZXQoKQogIG1lbW9yeTogdGVncmEyMTAtZW1jOiBTaW1wbGlmeSB1c2FnZSBvZiBjbGtfcmF0
ZV9leGNsdXNpdmVfZ2V0KCkKICBtZW1vcnk6IHRlZ3JhMzAtZW1jOiBTaW1wbGlmeSB1c2FnZSBv
ZiBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkKICBjbGs6IE1ha2UgY2xrX3JhdGVfZXhjbHVzaXZl
X2dldCgpIHJldHVybiB2b2lkCgogZHJpdmVycy9jbGsvY2xrLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvZGV2ZnJlcS9zdW44aS1hMzMtbWJ1cy5jICAgICAg
ICAgIHwgMTQgKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19t
aXBpX2RzaS5jIHwgIDggKy0tLS0tLS0KIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjEwLWVt
Yy1jb3JlLmMgIHwgIDYgKy0tLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5j
ICAgICAgICB8ICA2ICstLS0tLQogaW5jbHVkZS9saW51eC9jbGsuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgOCArKystLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAz
OCBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogYmJkMjIwY2U0ZTI5ZWQ1NWFiMDc5MDA3Y2Zm
MGI1NTA4OTUyNThlYgotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
