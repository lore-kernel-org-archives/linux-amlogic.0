Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ABBC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwM7GbZJh/6TcYR3AHBQ7gk8ESYDQ5P0kMdKhdMPyqc=; b=lugrg2inMU2cJx
	ucZrpedC5r0MvdlQ3avjy4ls6OOn3j2bcZtovbuF7XYxiRkDXLVXffAiav1AApXB6wKipOJxUzSzG
	lKdaBFrxPVOYa7Tx6i0N76Gn4qZhm5C3m+zpg0qR1qxVkMPlzOGeqJBVGgvw3AElLfSKwsQEqJ1XJ
	XHL0vcVEaABQxunzsHEFUKBFGj4rlduYsN/istx1syoqKsFQ5og0v7F3TpaEkKIjKoUnN7JQZt1JS
	EDgQQ32B/aTxPDrAUckV6S73p+iMa3wR9EX0KlhdN8Q92bHH2giHKgTyCVHP8nLbKbsS/eLp0rUUo
	ynZ1xeQrNORS+GsQ5+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAqv-00000004xz1-13KB;
	Fri, 10 Jul 2026 13:01:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAqs-00000004xy9-2RcN;
	Fri, 10 Jul 2026 13:01:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9A6F1A0F41;
	Fri, 10 Jul 2026 13:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B25F860342;
	Fri, 10 Jul 2026 13:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B95911BD0DEB;
	Fri, 10 Jul 2026 15:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783688461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OpR8EpUWoLVWD1U7hF0BGvXpeDpChn5vhtnYxeMgZ/M=;
	b=wZEo0zVumBZvota9lj9ysImh10+E4+BbYYrgpWI8VBXNocIci+MYRA9CPFt7nqEwahCYw+
	WGH/gbKanRQqklTcRaZlOdZcR2vWKZucFD13TXdAx/Gpc3+UIBLDDcSpYjyXTiFDp62YdU
	/9/G1w78+Iq5ZxLNsh8doY94LRg4F6sBcLJh6gazI/BPBSS8plkEkDP90Iw3Jipm5LWHpd
	t5JPw5/FOpeSvJgrAYi5ApGSR02OuWhrI719bSjbOdQQNoma1YvCMPW0BShr4FskJBpZKn
	RT65XADHkqNtWjPe5eSMFoaw249fIMLHxmMPTQGGDMENM6BCXdXRMwQnlO+2yA==
Mime-Version: 1.0
Date: Fri, 10 Jul 2026 15:00:43 +0200
Message-Id: <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Lee Jones" <lee@kernel.org>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
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
 <neal@gompa.dev>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Luca Ceresoli"
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
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_060110_762471_454F9B0A 
X-CRM114-Status: GOOD (  10.97  )
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

T24gVGh1IEp1bCA5LCAyMDI2IGF0IDY6NTggUE0gQ0VTVCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4gVGhlc2UgYXJyYXlzIGFscmVhZHkgbW9zdGx5IG1hdGNo
IHRoZSBtb3N0IHVzZWQgYW5kIGdlbmVyYWxseQo+IHJlY29tbWVuZGVkIGNvZGluZyBzdHlsZS4g
VGhhdCBpczoKPgo+ICAtIG5vIGNvbW1hIGFmdGVyIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0g
YSBjb21tYSBhZnRlciBhbiBpbml0aWFsaXplciBpZiAoYW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5n
IH0gaXMgbm90Cj4gICAgZGlyZWN0bHkgZm9sbG93aW5nOwo+ICAtIG5vIGV4cGxpY2l0IHplcm9z
IGluIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0gYSBzcGFjZSBhZnRlciBhbiBvcGVuaW5nIHsg
YW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPiAgICB0aGUgbGlzdCB0
ZXJtaW5hdG9yOwo+Cj4gQWRhcHQgdGhlIG9mZmVuZGVycyBhY2NvcmRpbmdseS4KPgo+IFJldmll
d2VkLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPiAjIGZvciBN
YXhpbSBNQVg3Nzc1OQo+IFJldmlld2VkLWJ5OiBDaGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVu
c291cmNlLmNpcnJ1cy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCgouLi4K
Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tYXg3MzYwLmMgYi9kcml2ZXJzL21mZC9t
YXg3MzYwLmMKPiBpbmRleCA1MmZmZmVkMGMwZGQuLmRjNzQ0YjQwYmIzOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21mZC9tYXg3MzYwLmMKPiArKysgYi9kcml2ZXJzL21mZC9tYXg3MzYwLmMKPiBA
QCAtMTUyLDcgKzE1Miw3IEBAIHN0YXRpYyBpbnQgbWF4NzM2MF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50KQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWF4
NzM2MF9kdF9tYXRjaFtdID0gewo+ICAJeyAuY29tcGF0aWJsZSA9ICJtYXhpbSxtYXg3MzYwIiB9
LAo+IC0Je30KPiArCXsgfQo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtYXg3MzYw
X2R0X21hdGNoKTsKPiAgCgpSZXZpZXdlZC1ieTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRo
aWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+ICMgbWF4NzM2MAoKLS0gCk1hdGhpZXUgRHVi
b2lzLUJyaWFuZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
