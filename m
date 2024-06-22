Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D00EC27C53
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXTHM7MEmsVICqYIcFoIlTCHdgW8IvdrbliZTqP+sHQ=; b=Yf4IV2JF8A+ofj
	2CZoT/CQKu7szXBgeifibqyMxYiLpXrZaS7oyQkRB9cKCA9QzNOcgxVDTmEndlMKZwBQYbypcQi0t
	jgOMda+2pieJMie3LA39GTTQpnbDhW0lKokv7+2DZ320FU4yCGnGicgQFnB9cqvpeKP0TuZBgxY8G
	MN11w3WBwM6n4qcrWq3JnFswhmndIc9XGccUHqUkkp+LG/R0JK1IWrYENlc0YLoIGAhyRNJAyiYfu
	oF7Q1J3TPsBdXgkVpuhnlhf04VZJmPhuZcmq+mvXhxW5BnBASO+bnBaBlObbCjBcR3AmIGXd8L+gm
	wNcnDeRg9TFC9mh9xFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKxHZ-0000000Bnxi-3RGC;
	Sat, 22 Jun 2024 09:43:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKxHX-0000000Bnx0-12rZ;
	Sat, 22 Jun 2024 09:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC7AACE0946;
	Sat, 22 Jun 2024 09:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3103FC3277B;
	Sat, 22 Jun 2024 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719049414;
	bh=uECyP60yqfaB0U3mswQAJu4fxkYx/BeROCYGGUgcZH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ztm1Gbkr6/gXKWLMPIDWdWu0OlZT4twgLMrMtVhmNo/xuaR9xRMwlzq1ltInAx19f
	 8lXVoA+r/lbsgv/Rk1PmKxysQIYkzmnut6C1fXtf8I2P2QkFZbOG5JwFNsQVewHU/g
	 OHXe9lP8VHPidyZ+mAudzf/eHGI8D1NdH51f7z8HouohNGaQyvYeJRutLr6vsQm5py
	 LwlazDqAz85cdtfQOtvp4H2f+354NJ9/1dKYhXCysf5+v3xISprRmhJc66fu44re5Y
	 DsKBK3HvQBZHDf+hMVfv3g3yzVhp48oZ0zGADxqK/mbijTndbUDv/EG70MWlQUEymB
	 ZRevAamIdbsfA==
Date: Sat, 22 Jun 2024 10:43:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jean-Baptiste Maneyrol
 <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 02/41] iio: accel: kxsd9: Make use of
 regmap_clear_bits()
Message-ID: <20240622104319.60b0f0d5@jic23-huawei>
In-Reply-To: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	<20240617-review-v3-2-88d1338c4cca@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_024339_680181_EC03F67E 
X-CRM114-Status: GOOD (  13.20  )
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

T24gTW9uLCAxNyBKdW4gMjAyNCAwOTo0OTo0MiAtMDQwMApUcmV2b3IgR2FtYmxpbiA8dGdhbWJs
aW5AYmF5bGlicmUuY29tPiB3cm90ZToKCj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRl
X2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKPiByZWdtYXBfY2xlYXJfYml0cygpLgo+
IAo+IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxp
YnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vYWNjZWwva3hzZDkuYyB8IDYgKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5LmMgYi9kcml2ZXJzL2lpby9hY2NlbC9r
eHNkOS5jCj4gaW5kZXggYmE5OTY0OWZlMTk1Li4wM2NlMDMyZTA2ZmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9paW8vYWNjZWwva3hzZDkuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5
LmMKPiBAQCAtMzcwLDEwICszNzAsOCBAQCBzdGF0aWMgaW50IGt4c2Q5X3Bvd2VyX2Rvd24oc3Ry
dWN0IGt4c2Q5X3N0YXRlICpzdCkKPiAgCSAqIG1ha2Ugc3VyZSB3ZSBjb25zZXJ2ZSBwb3dlciBl
dmVuIGlmIHRoZXJlIGFyZSBvdGhlcnMgdXNlcnMgb24gdGhlCj4gIAkgKiByZWd1bGF0b3JzLgo+
ICAJICovCj4gLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwKPiAtCQkJCSBLWFNE
OV9SRUdfQ1RSTF9CLAo+IC0JCQkJIEtYU0Q5X0NUUkxfQl9FTkFCTEUsCj4gLQkJCQkgMCk7Cj4g
KwlyZXQgPSByZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBLWFNEOV9SRUdfQ1RSTF9CLAo+ICsJ
CQkJS1hTRDlfQ1RSTF9CX0VOQUJMRSk7Ck5vdyBmaXRzIG5lYXRseSBvbiBvbmUgbGluZSBhdCBw
cmVjaXNlbHkgODAgY2hhcnMuCkkgcmV3cmFwcGVkIHdoaWxzdCBhcHBseWluZy4KCkpvbmF0aGFu
Cgo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
