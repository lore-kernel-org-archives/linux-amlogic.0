Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDB9C43458
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2026 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PDKOAkk8hqObdAlARXNZYTLMjC3DmpseDH2kGLJIFE=; b=FDLeahcfI1egGI
	aBcmmXLPY9HKE5ifE50T7UNpo8NwrkHkaFtVdf21BDqP9SJAVarqHXtUVMyplRkEuWoxi0/DoVWSZ
	IyzS44URfO4BdgS9YwrJWuK/mRqBFYIu+xcwGaUbicG6JsQDGtiZ8IRD0ZRBhI3yAJA6PsQgkeagN
	PDitw/SoppVL+b5kK/3dtM8SxO+TphOz3rKdBriXpWGY4RzjPZvwz3HmAXkvsBrxz+oihbtWcf3ic
	+WWJB0HBNf7MK2j/Lz2XXNZ5SnD1zcm5na0XM+WTMtqM6LR2cBL/80FVkoq55VA6nhl/z21HDIJof
	8FP4Pd2IayGJGO0h2zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqu-0000000H9hG-26n5;
	Wed, 08 Jul 2026 12:58:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqq-0000000H9f2-38AN
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Jul 2026 12:58:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c15b1da6b82so71112866b.1
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Jul 2026 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515487; x=1784120287; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=lAY1sUOuJqClr5wVNIZxcahi18Se0Wsv26mZ5/BwrKvr59hK5lW3uFkHbm2b7Qkgzr
         lip4RbAtvQn6rjWQDzjBTgf51ri6EUNV7oowkgyc1PH/hfhhNR2wiX0PBnPfLVraUgIq
         5Jpf25JwaQLSmPDEI6nZc8VXqf4TeeobgIWmOYkT1iWlQ1EtmQOlppl2BGUiOfdD5JGB
         tjggMY1tONhNwAMagak74VT3FggIb60ihBU0r7s6Wo06LRg9ddUquLOvy30AuhIwW6XD
         U3Pz0rC8Vq1L9fYtska/mdgLmhhKy1TOtPCdqrk7/mKOTcAA61+By0wHepUwzkTvPkjQ
         sW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515487; x=1784120287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=Lcz71WXiMAMH8yRyJ1ijA8zOTKeXpwC7eNlNM3xZ8kl0RITWTa4ZlzpkY0xNjmLWJa
         Io+uMVbADEXZYR03eAK4S2rUqSA6EnUZuIdik6COe4vYfboqQt8+KxXICZH/7xPcakgY
         +ux5Y0QGLyp8lYU6HfaCskB9WAQqomDWBGT2rCQTTYzRrjQ7a4ugg120jLScE87ZID8A
         XBCBW7PnXmTLog7oMpczpBjw5Lf6UTT5l3th4gGL1/7UJmRHFsSeNZwD2/dmu86X0Gk9
         6DVD3g/v5TkXv8SpkM63MS4eLmx6kHEqQsrO6qKmERG7BBNBx+qX3LfsrcdEw4ALkZgk
         6yiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIyW5cN+iPowISZfLrx231fhFe4wl7X6zzTv7TXOKpVDhIyB1zG4hvyuwnJbhEnncpyDJosPvkmiiaW0Lu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf2e+n+RLGfGys9dnJpbuN0X/nXPPgmkBv7jUeK1BJGLprNsqZ
	jLEMStIEP5D7abenTnK7tns4TxONra9oE449HuLsuzGA86/aKABSccSATrsO554GuIQ=
X-Gm-Gg: AfdE7ckaC7RZhjHdrJBlnBov7D24quK0fkX1u4DHbZQ/G+9BMbwHz4uTKXz2Rv6igb3
	mtEvyVKVu0E3ksYcam7mCcYfZhQkEQTkzsuzT1CVvvLsCjbFa9HDXjYzl4ZBkk8ca3QAz1WHr2h
	PISwfWeJr7iv+FT/aC1cVhfvDGnmZZSmF6OxCArmSuF2SuaEGWvo2BnjevKgxRQXXYyOn8TYLTs
	RaCl6MnkTIq4BYW/4i1u9jbZVzrsfQMoWMDFdsbnPRbCnzY+4VtbThT2uHZE0hsSJClRLwaZM6b
	FkK3mi4X9hgqcjHihKed0MXXwa+6s/I3/Gr5gyEJT053rczcVZMk7cVgzme4I1TlsnZAUOz5yE1
	w+gldFJW7aCbxX8mh9jaDnv3l8Y/11V7rVpoARZCpsCYMGBxHeyqZi6CujjA51SPG2FpuBMn70B
	kuK+S+2HBa81ljl96EQ0I=
X-Received: by 2002:a17:907:7211:b0:c12:4597:601f with SMTP id a640c23a62f3a-c15ce131902mr120160066b.53.1783515486648;
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84c636sm324005266b.22.2026.07.08.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Message-ID: <eed86cadd335597d7c7a4278a9a09706913ba6a3.camel@linaro.org>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>, Florian
 Fainelli	 <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list	 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald	 <rf@opensource.cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>,  Krzysztof Kozlowski	 <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>,  Sven Peter <sven@kernel.org>, Janne
 Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli	 <luca.ceresoli@bootlin.com>, Saravanan Sekar
 <sravanhome@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Matti
 Vaittinen	 <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang	 <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm	 <magnus.damm@gmail.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, 	linux-rpi-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, 	linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, 	linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
Date: Wed, 08 Jul 2026 13:58:20 +0100
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_055808_827373_5FCEDDAC 
X-CRM114-Status: UNSURE (   9.45  )
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

T24gV2VkLCAyMDI2LTA3LTA4IGF0IDEzOjE1ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhl
IENhcGFibGUgSHViKSB3cm90ZToKPiBUaGVzZSBhcnJheXMgYWxyZWFkeSBtb3N0bHkgbWF0Y2gg
dGhlIG1vc3QgdXNlZCBhbmQgZ2VuZXJhbGx5Cj4gcmVjb21tZW5kZWQgY29kaW5nIHN0eWxlLiBU
aGF0IGlzOgo+IAo+IMKgLSBubyBjb21tYSBhZnRlciB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+IMKg
LSBhIGNvbW1hIGFmdGVyIGFuIGluaXRpYWxpemVyIGlmIChhbmQgb25seSBpZikgdGhlIGNsb3Np
bmcgfSBpcyBub3QKPiDCoMKgIGRpcmVjdGx5IGZvbGxvd2luZzsKPiDCoC0gbm8gZXhwbGljaXQg
emVyb3MgaW4gdGhlIGxpc3QgdGVybWluYXRvcjsKPiDCoC0gYSBzcGFjZSBhZnRlciBhbiBvcGVu
aW5nIHsgYW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPiDCoMKgIHRo
ZSBsaXN0IHRlcm1pbmF0b3I7Cj4gCj4gQWRhcHQgdGhlIG9mZmVuZGVycyBhY2NvcmRpbmdseS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvbWZkL21heDc3
NzU5LmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCgpSZXZpZXdlZC1ieTogQW5kcsOpIERyYXN6
aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gIyBmb3IgTWF4aW0gTUFYNzc3NTkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
