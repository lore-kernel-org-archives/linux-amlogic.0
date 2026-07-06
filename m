Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68428C43602
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 00:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4HZEv1wMp1+faA0jnPiv78GbEJmBVNrEiJOUQf2JMw=; b=hiwroahrLbFmyD
	Xf1wm8mlz4R4KNLxuHflStslyCN6c/sbxRm7qiToYEB9slBeBiF/x3chtSBMbA51J6XWZ28PTbK7B
	2QoOmzu6Wtw4UXpn3sug8+L0Der1oPnoCf2brysS6nRSfyfPljmlTMt9zr+ih31EkGBvIQV8FuhxX
	NECjEQ4HBWi1Lc3RKpK8y1AmXCDfQysd2HGt1KM+IyRO9v4Wy4RWTReHt28n0bAuBNAwuTTlXypFE
	PxkQAXCTaLLkvnetiPCmtM08HQr19KlgOqazzIDBWAMQiLeJHwMg2d5N6PIK9oTD88otcwvv0gUec
	DKUcpIOgrHBsCDspphQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXID-0000000AuQ9-2hDL;
	Mon, 06 Jul 2026 00:34:38 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXI9-0000000AuM0-2IXj;
	Mon, 06 Jul 2026 00:34:35 +0000
Message-ID: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783298059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wYrjdzAhnc0P88BFwUH/b6uj52WFQfIRb2R1u4QFCds=;
	b=mLsuUED9ENIp3ed3h8bdKFYcEwFgoRzOELLNc1jLIXF6taZ+WEztXLwd9/BAKQWvUz2Hs3
	3EKLIatmB5Z+Df3dgdlCr8bmpTJQbWFj3Jp6WCvzaQnW40BXVB4LUsJRj7jQdhncagFIYu
	oCbFYryMjDBm1fu5il4d+x3rl9gBRyM=
Date: Mon, 6 Jul 2026 08:33:47 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, linux-pwm@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Michael Walle
 <mwalle@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Alexey Charkov <alchark@gmail.com>, Sean Anderson <sean.anderson@linux.dev>,
 Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_173433_753824_96A0E062 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIDcvNS8yMDI2IDExOjE0IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHVi
KSB3cm90ZToKPiAgIC0gVXNlIGEgc2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5
IHRlcm1pbmF0b3I7IEEgc2luZ2xlIHNwYWNlCj4gICAgIGFmdGVyIHRoZSBvcGVuaW5nIHsgYW5k
IGJlZm9yZSB0aGUgY2xvc2luZyB9IGluIG5vbi1lbXB0eQo+ICAgICBpbml0aWFsaXplcnM7Cj4g
ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFycmF5IHRlcm1pbmF0b3I7Cj4gICAtIEFsc28gbm8gdHJh
aWxpbmcgY29tbWEgYWZ0ZXIgYSBuYW1lZCBpbml0aWFsaXplciBpZmYgdGhlCmlmZiAtPiBpZgo+
ICAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsKPgo+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgoKWy4uLi4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28t
c2cyMDQyLmMgYi9kcml2ZXJzL3B3bS9wd20tc29waGdvLXNnMjA0Mi5jCj4gaW5kZXggN2QwN2Iw
Y2E3ZDI5Li4wYjY0NjExNzJlNmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNvcGhn
by1zZzIwNDIuYwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKPiBAQCAt
MjI1LDExICsyMjUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZzIwNDJfY2hpcF9kYXRhIHNn
MjA0NF9jaGlwX2RhdGEgPSB7Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
ZzIwNDJfcHdtX2lkc1tdID0gewo+ICAgCXsKPiAgIAkJLmNvbXBhdGlibGUgPSAic29waGdvLHNn
MjA0Mi1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0Ml9jaGlwX2RhdGEKPiAtCX0sCj4gLQl7Cj4g
KwkJLmRhdGEgPSAmc2cyMDQyX2NoaXBfZGF0YSwKPiArCX0sIHsKPiAgIAkJLmNvbXBhdGlibGUg
PSAic29waGdvLHNnMjA0NC1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0NF9jaGlwX2RhdGEKPiAr
CQkuZGF0YSA9ICZzZzIwNDRfY2hpcF9kYXRhLAo+ICAgCX0sCj4gICAJeyB9Cj4gICB9OwoKQ2hh
bmdlcyB0byBzb3BoZ28gcmVsYXRlZCBmaWxlc++8mgoKUmV2aWV3ZWQtYnk6IENoZW4gV2FuZyA8
Y2hlbi53YW5nQGxpbnV4LmRldj4KClRoYW5rcywKCkNoZW4KClsuLi4uLi5dCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
