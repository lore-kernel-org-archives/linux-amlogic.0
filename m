Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D86C606A320
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 05:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCecBISk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yNbP9gNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uYT0KdpuDfDgy8cbkkmPskcGBAeYBtcY9XTtiNS+Hyw=; b=OCecBISk2rFr0lnu6AgTfadI2i
	QwbLumI/dHMbUR1YFLBTsahO1NVCN5k2zFb5AWkxv39YyN94uE1ZaHOYXI3UG1ukptj9Qukf0Tnl0
	iCWu0grnzJxLgRa5+rA9IlUyMOGXB7Zi5+gZm7ONMh1Q3vKBfQYw65+zpRSE4X5PiOmrYq6Ks4eUI
	O27RfSY48KvjrCYkNFlsyxbuek7lbvLxIWZI+CW8H04Yozd1rFnedoYG/yprDyQj8P6uAI5pXQ2O7
	wz/pH5O0WH66ZB2Yh6SxCSYf2ZajN7Ol9rTpvkGwyJ1tWzdfJ399s1YCvXn7UVMX8cgbssFKGY9wx
	CtotMEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1IX-00000005gaC-0sFs;
	Wed, 11 Nov 2026 05:55:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1IR-00000005gYz-2tO8;
	Wed, 11 Nov 2026 05:55:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF84A4E41563;
	Wed, 11 Nov 2026 05:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A09616017E;
	Wed, 11 Nov 2026 05:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA75111BC0758;
	Wed, 11 Nov 2026 06:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794376491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pfbacooIO8f3wisdaRiyyaGqgo+54PzHGy2pQaUsY+c=;
	b=yNbP9gNqUTcBluDPTUGVBT9Sv+/GUwXc/OVvJz1InwCOkT3SDXmol6kIyZj6kX3Yq1NzGH
	m+7vDJygTh4Aeo6ekK8CD2u9W7d6Fobhkef2pBoshtjxbvwZhaFK264cj/tLT7fgNV6x78
	ZUPWtjg+/hKGnEpqW3ry2LwfenlL1Vnpfsx+Duk2T3/ZhtgEL63TIp90jEpCcqg3mwkQte
	XvhXHpQreSW8ZhjjAEgEfPu3744zKJ6yYUnEtxerbgkrN+nhLUAP2VnK8ZqLwE40Hqa9Gw
	2IyI3JXe2VizQhauO617rdUjCPI8djrehwuV7EPN2sl1qfiuh+n75Opl2PpZow==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 06:54:25 +0100
Message-Id: <DMS5DC411M21.387583J8N08R0@bootlin.com>
Cc: "Linus Walleij" <linusw@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Chen-Yu Tsai" <wens@kernel.org>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "James Ogletree"
 <jogletre@opensource.cirrus.com>, "Fred Treven" <fred.treven@cirrus.com>,
 "Ben Bright" <ben.bright@cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Support Opensource" <support.opensource@diasemi.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Tim Harvey"
 <tharvey@gateworks.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Saravanan Sekar" <sravanhome@gmail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Liviu
 Dudau" <liviu.dudau@arm.com>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <mfd@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <patches@opensource.cirrus.com>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Lee Jones" <lee@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
X-Mailer: aerc 0.22.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_215459_915602_78C7D5E8 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlIE5vdiAxMCwgMjAyNiBhdCAxMDo1NCBQTSBDRVQsIFV3ZSBLbGVpbmUtS8O2bmlnIChU
aGUgQ2FwYWJsZSBIdWIpIHdyb3RlOgo+IFRoZXNlIGFycmF5cyBhbHJlYWR5IG1vc3RseSBtYXRj
aCB0aGUgbW9zdCB1c2VkIGFuZCBnZW5lcmFsbHkKPiByZWNvbW1lbmRlZCBjb2Rpbmcgc3R5bGUu
IFRoYXQgaXM6Cj4KPiAgLSBubyBjb21tYSBhZnRlciB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+ICAt
IGEgY29tbWEgYWZ0ZXIgYW4gaW5pdGlhbGl6ZXIgaWYgKGFuZCBvbmx5IGlmKSB0aGUgY2xvc2lu
ZyB9IGlzIG5vdAo+ICAgIGRpcmVjdGx5IGZvbGxvd2luZzsKPiAgLSBubyBleHBsaWNpdCB6ZXJv
cyBpbiB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+ICAtIGEgc3BhY2UgYWZ0ZXIgYW4gb3BlbmluZyB7
IGFuZCBiZWZvcmUgYSBjbG9zaW5nIH0sIGEgc2luZ2xlIHNwYWNlIGluCj4gICAgdGhlIGxpc3Qg
dGVybWluYXRvcjsKPgo+IEFkYXB0IHRoZSBvZmZlbmRlcnMgYWNjb3JkaW5nbHkuCj4KPiBSZXZp
ZXdlZC1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gIyBmb3Ig
TWF4aW0gTUFYNzc3NTkKPiBSZXZpZXdlZC1ieTogQ2hhcmxlcyBLZWVwYXggPGNrZWVwYXhAb3Bl
bnNvdXJjZS5jaXJydXMuY29tPgo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiAjIHJlbmVzYXMKPiBSZXZpZXdlZC1ieTogTWF0aGlldSBE
dWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+ICMgbWF4NzM2
MAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNl
cmVzb2xpQGJvb3RsaW4uY29tPiAjIG1heCoKCi0tCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
