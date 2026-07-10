Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94052C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZ6xbd7TEso4g28IAX0foJoQHwIXTkYmPrPYMvkzM9c=; b=1stmE7JWvCAtU2
	7NzDY78TRqS14h3C+xM0wNhtPWk63mmuDI3+HbhAtuVf53asUk0Reg3Yd7SRba/IlhtDhcsbkNpNr
	OL1baeSxHsab+s5rV2b7kFMWMUL7x9SwiO82I9zl12QIuGVlx278vSXz9a8/PSezD1cYxYhcNwtkT
	8b9tajdNIKg7i1iILQuKeSKLx0GaR70JOC63PACJcBNldigYLI/kndwwKLxR7s2lDcluVqT2IZDC9
	VEG7qWvpmaQLcSZAj3dAoWqaeyI4kzO86K8DNmBIUfnDAZIZOpWJQ4B4bNdEMJ+m7zZhrLCVqvUpf
	60TPsqywido4nEzRb8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiB51-00000004zEF-2IMo;
	Fri, 10 Jul 2026 13:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiB4z-00000004zDn-1Ygr;
	Fri, 10 Jul 2026 13:15:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BE66600C3;
	Fri, 10 Jul 2026 13:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40E71F00A3A;
	Fri, 10 Jul 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783689344;
	bh=rx/8gALKK6VAdXbfpPjC1MKZl9eeecWweGFPH/OHuEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VPtbpUbVXMNlg61BFX59iMclPIF2ufhARVU4gF7cciYo7oFsSJjeZqGdCISGilehe
	 WU/w+xWLMIuQYHeTQrJRwRa2eW1M3FoYdAuaiTdCA8pXmNLh8UjfAX2phL2fKDaCvu
	 M5tu7Nccs/F5aGlwq/jeaa42Ulo6+GIvC0d5YVrVse66qQJ/kal1gFqISRRNGeX+3Y
	 7sxsINL5JJXTYdB1In94vI1AyrEL578RL+LQPivCi619HeEO9DJHYMyCNCAjKSKxpx
	 jo3JNXoAyk/LtVEfCWAwyPsJHVhxGang2+obiAHvYodGhinFLsT8m2unpqYdA+tb4z
	 K6GFaBKZQEM7A==
Message-ID: <315a0aec-99e8-4d03-a04b-613acfae1f52@kernel.org>
Date: Fri, 10 Jul 2026 15:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
 <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
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

T24gMTAvMDcvMjAyNiAxNTowMCwgTWF0aGlldSBEdWJvaXMtQnJpYW5kIHdyb3RlOgo+IE9uIFRo
dSBKdWwgOSwgMjAyNiBhdCA2OjU4IFBNIENFU1QsIFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2Fw
YWJsZSBIdWIpIHdyb3RlOgo+PiBUaGVzZSBhcnJheXMgYWxyZWFkeSBtb3N0bHkgbWF0Y2ggdGhl
IG1vc3QgdXNlZCBhbmQgZ2VuZXJhbGx5Cj4+IHJlY29tbWVuZGVkIGNvZGluZyBzdHlsZS4gVGhh
dCBpczoKPj4KPj4gIC0gbm8gY29tbWEgYWZ0ZXIgdGhlIGxpc3QgdGVybWluYXRvcjsKPj4gIC0g
YSBjb21tYSBhZnRlciBhbiBpbml0aWFsaXplciBpZiAoYW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5n
IH0gaXMgbm90Cj4+ICAgIGRpcmVjdGx5IGZvbGxvd2luZzsKPj4gIC0gbm8gZXhwbGljaXQgemVy
b3MgaW4gdGhlIGxpc3QgdGVybWluYXRvcjsKPj4gIC0gYSBzcGFjZSBhZnRlciBhbiBvcGVuaW5n
IHsgYW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPj4gICAgdGhlIGxp
c3QgdGVybWluYXRvcjsKPj4KPj4gQWRhcHQgdGhlIG9mZmVuZGVycyBhY2NvcmRpbmdseS4KPj4K
Pj4gUmV2aWV3ZWQtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+
ICMgZm9yIE1heGltIE1BWDc3NzU5Cj4+IFJldmlld2VkLWJ5OiBDaGFybGVzIEtlZXBheCA8Y2tl
ZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+CgpIZXJlLi4uCgo+PiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxp
YnJlLmNvbT4KPj4gLS0tCj4gCj4gLi4uCj4gCj4+ICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWZkL21heDczNjAuYyBiL2RyaXZlcnMvbWZkL21heDczNjAuYwo+PiBpbmRleCA1MmZmZmVkMGMw
ZGQuLmRjNzQ0YjQwYmIzOCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZmQvbWF4NzM2MC5jCj4+
ICsrKyBiL2RyaXZlcnMvbWZkL21heDczNjAuYwo+PiBAQCAtMTUyLDcgKzE1Miw3IEBAIHN0YXRp
YyBpbnQgbWF4NzM2MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+PiAgCj4+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtYXg3MzYwX2R0X21hdGNoW10gPSB7Cj4+
ICAJeyAuY29tcGF0aWJsZSA9ICJtYXhpbSxtYXg3MzYwIiB9LAo+PiAtCXt9Cj4+ICsJeyB9Cj4+
ICB9Owo+PiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWF4NzM2MF9kdF9tYXRjaCk7Cj4+ICAK
PiAKPiBSZXZpZXdlZC1ieTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1i
cmlhbmRAYm9vdGxpbi5jb20+ICMgbWF4NzM2MAoKYW5kIGhlcmUKClRoZXNyIGFyZSBhbGwgQWNr
cywgbm90IHJldmlld3MuIEVudGlyZSBjb21taXQgd2lsbCBub3cgY2FycnkgbXVsdGlwbGUKcmV2
aWV3IHRhZ3MsIGltcGx5aW5nIGl0IHdhcyByZXZpZXdlZCBieSAzIG9yIG1vcmUgcGVvcGxlIGJ1
dCBub25lIG9mCnRoZXNlIHBlb3BsZSBhY3R1YWxseSByZXZpZXdlZCB0aGUgY29tbWl0LiBOb25l
IQoKVGhleSBsb29rZWQgYXQgb25lIGxpbmUgb3V0IG9mIDEwMC4KClRoaXMgaXMgcmlkaWN1bG91
cy4KClF1b3Rpbmc6CiJSZXZpZXdlZC1ieTosIGluc3RlYWQsIGluZGljYXRlcyB0aGF0IHRoZSBw
YXRjaCBoYXMgYmVlbiByZXZpZXdlZCBhbmQKZm91bmQgYWNjZXB0YWJsZSBhY2NvcmRpbmcgdG8g
dGhlIFJldmlld2VyJ3MgU3RhdGVtZW50OiIKCk5vdCBwaWVjZSBvZiBhIHBhdGNoLiBUSEUgUEFU
Q0guCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
