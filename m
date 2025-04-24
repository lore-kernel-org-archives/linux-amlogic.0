Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D023C369D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Apr 2025 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MZjFJ1nx3n8jMfEOx5OBNmC5kK/iFKjfV9vCQvwZfY=; b=BB0zMVjb+0WLyY
	QrhcN4X2E8r4mbl8PZuoWHrieU1ywbHAv2bDzSp5C1RjYM9WI6lZc1SBk82DYy2QaXFuxbiHT8mih
	if2XGhtY4n4Dw1ZHUPl8zD17ELv8CrzXk38LOJjjRJLsvVTe1eNuic6xU9f7gLjaAkyAb/acMLcxB
	kID/YBEnEGGafFhqsV9VYYt+ep3LgMwseX/PO+GeK8gNi/ho1FwWSpvtSc2R+D2dw0T5bbDP7SvoR
	46/Y+BaQteZ/RYgyWkf8dHr10oi0Jtu7su+mS4WcQNhlHt+6aRtNHD7UTwr5Ooq6f1xQL6/fSqB9Z
	ocrGg3NcM98zpOBWDB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u835X-0000000FKFn-3m4A;
	Thu, 24 Apr 2025 20:22:27 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81nO-0000000F629-2h1T;
	Thu, 24 Apr 2025 18:59:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1A8443AC;
	Thu, 24 Apr 2025 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe9TGbQbkCe+ORWPYOnOFjy2xEDFN3D1DRO+A6gr8d8=;
	b=ENSDT7HqsiyuBMtm9ZWgHDJIwA6rNydfQT3vUAEvINHE3ZilXsEUTxfnJCNzj4K5iyBMeh
	xI5N3QaLx9xdrG+Yi9IP51QPwTzZ6Ev1UA7pUop84y/qoj+OYAHoVq3VaUJu5LF06pLXw4
	tZqMthi2H4aTZGfuoKb3H58kvW2AXXf64vUgps/1fKOPLZ1f6kQ1e4a8I6JNGmz38AOf1d
	eH55cPq+zuOxWvyWyCNGrKg9MjW7cYS6IJP4g/5uc+NJCP8+JjD32U6QSTI7Kw2oF8+hxN
	roVhDODBTmQmSMxk3a9UjodmSmBDv0WJsFRCIKBYAaLgw+6d8deMFipWIUrp0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:09 +0200
Subject: [PATCH v2 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-2-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrg
 hgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115938_870079_D899F79E 
X-CRM114-Status: UNSURE (   9.40  )
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KCkFja2VkLWJ5
OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Ci0tLQoKQ2M6
ICJCcnlhbiBPJ0Rvbm9naHVlIiA8YnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc+CkNjOiAiSWxw
byBKw6RydmluZW4iIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9h
Y2VyLWFzcGlyZTEtZWMuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2FybTY0
L2FjZXItYXNwaXJlMS1lYy5jIGIvZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9hY2VyLWFzcGlyZTEt
ZWMuYwppbmRleCA5NThmZTFiZjVmODViYjY5YWM3OTYyZjIxN2RlOWYwYjQwY2RlOWExLi40Mzg1
MzJhMDQ3ZTY4Nzk5YWM1M2ExNmE0YzgxM2ZjMTZiZTk5N2I5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
YXJtNjQvYWNlci1hc3BpcmUxLWVjLmMKQEAgLTQ1Miw5ICs0NTIsOSBAQCBzdGF0aWMgaW50IGFz
cGlyZV9lY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWludCByZXQ7CiAJdTgg
dG1wOwogCi0JZWMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmVjKSwgR0ZQX0tFUk5FTCk7
Ci0JaWYgKCFlYykKLQkJcmV0dXJuIC1FTk9NRU07CisJZWMgPSBkZXZtX2RybV9icmlkZ2VfYWxs
b2MoZGV2LCBzdHJ1Y3QgYXNwaXJlX2VjLCBicmlkZ2UsICZhc3BpcmVfZWNfYnJpZGdlX2Z1bmNz
KTsKKwlpZiAoSVNfRVJSKGVjKSkKKwkJcmV0dXJuIFBUUl9FUlIoZWMpOwogCiAJZWMtPmNsaWVu
dCA9IGNsaWVudDsKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBlYyk7CkBAIC00OTcsNyAr
NDk3LDYgQEAgc3RhdGljIGludCBhc3BpcmVfZWNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCkKIAlmd25vZGUgPSBkZXZpY2VfZ2V0X25hbWVkX2NoaWxkX25vZGUoZGV2LCAiY29ubmVj
dG9yIik7CiAJaWYgKGZ3bm9kZSkgewogCQlJTklUX1dPUksoJmVjLT53b3JrLCBhc3BpcmVfZWNf
YnJpZGdlX3VwZGF0ZV9ocGRfd29yayk7Ci0JCWVjLT5icmlkZ2UuZnVuY3MgPSAmYXNwaXJlX2Vj
X2JyaWRnZV9mdW5jczsKIAkJZWMtPmJyaWRnZS5vZl9ub2RlID0gdG9fb2Zfbm9kZShmd25vZGUp
OwogCQllYy0+YnJpZGdlLm9wcyA9IERSTV9CUklER0VfT1BfSFBEOwogCQllYy0+YnJpZGdlLnR5
cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfVVNCOwoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
