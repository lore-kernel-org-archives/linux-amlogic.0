Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCE606A33B
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 06:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rgg2a8XE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n91ujeKu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R39/tad7+YH8P2GSsXzyoV5GVOuEy1m8dTmmaM/3diQ=; b=Rgg2a8XEtvqEpwWMh/vR7IiTQ+
	9KIbnZB60umW33jHhS35pfuMqeDV3lhX+3j127Z4PGy6xD6wXD2k4NiV3bYdI0DXRJ4M83H4CmH2r
	dkQOaCFrKRJYGXAOQ14B4PHTGWinkpQgNmMtDnvG/zAjAR0B8C7/J+G17Kg7G06mJBo9ppYRYlnFS
	0Iz30y+0s2NKwoqGcMX3ko654LoL9UuZltGiccY0Q+/mOZWxBkOjaaqGO3DxoPvnR3sgl0BvVub8t
	UQB85NdG+WE1J2mPgmAyaGMLAk4FM/SO4SLDdN/C+73QT/L7OokK7ed036bFh329r/bN0NqR9y+2E
	Vbyswqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1rL-00000005n4Q-1e1j;
	Wed, 11 Nov 2026 06:31:03 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1rG-00000005n2I-2xru
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 06:31:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso3483388e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=n91ujeKuOVG2t1rHGIaKttV0m1us3TtaywJSAci0wM3T6Dt9DvTD3QPTRbi8jo55xs
         U4fX4eG7PFSXl+hJrGUI2bPUDIvGR71qAH7QsDyPyy6DFXU26lI095ocrWW+DSn4FgDS
         v+6OVxYB87wlHytGLnAXT5ayd4xzyzCVkbUP0XIHIGNc/S/Lxq7ttxZojSS2CZruXHWm
         kZY8HOEA/tG7qvSv9Lnp7IOn2owiCOw9tpSMTH5V4uHM9Sh5jTrKiFjyA5JVjQFfO80p
         vpPknWn74OpsGKAUJhuzvCdHr4iShaeGtEYCcHRW7bNsOgfz6BnqF7n608iNAbW7bQfo
         wrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=yeqrwYl/6VhK4ZvLSsMn0JtWTM7TkTQOQ3OisM0RTYosbl1a3IF3T/sv5CmC87ipaY
         gmQy50FsexksfPE6HYuK38aWrWd6Kc9psApea7u+OfWUDOoq+zDINLfIL6gGsXnzfyug
         k0VhLvzYRUSURVw20TWrYQqOJX/eIeag7+M7QQnDaq2/l/BUSw7FVBcaAi5P/yAJlleQ
         pAwqO3OVZ7koJ5JpVHMPQxK+hYo0EZKwMi/LP5OD/6xXfOGwIGbr8M7TwJxj7m3EvYqK
         qAuagn2q9lKPHWCmxSw9vjttfVEP0fqp2BR9pTHzXk04AEbPkf2N3sll7rIpYiDwgf6q
         7Bsw==
X-Forwarded-Encrypted: i=1; AL+hErFYaneoGrgF4egY3/w9n5fVwZPjtJQSQhfFOLL6FsrBaf3QwLTufEG+mGk7/D2x5J+++7m6siGjreXhTnJT@lists.infradead.org
X-Gm-Message-State: APuU4Z/XxU1jLBPlQ2AeEAUUsBspSoycAJM9psWU9bYjciS13zuZZ/BN
	MtIFcDCBBohL8lhvtafyFbF9Rep8pM8N2gXuapFZaY3Xh3RAWpGCFa8k
X-Gm-Gg: AYBFou2E8hvm7NQnuJ6tiI6F6Se4xrLMkBVOJ+PCQZUWoCYBRm+AMpSk65hPfqUQtU3
	ro/GDQW8xbVshPquSo3lG+yxD12S616ZHZU448enea7zrRdvOqvMOcBCnp0g01ZzzcnO2ea3GTO
	LJ/Ar+N/G3dxOifpDnjTDJh7Iit4aqf/r/8Dopqx5AVC7Qq6lp5UwCZKyxbtZZt5HUFn7Q4nWjl
	3jEF+dRM1niRmPt1I9PkaC0QssfHi7GmxAXZmno8u0gQnjJ1IGEc9BPhlcXFNSvvg7XoinElVuH
	U+VC2kiUvEav01KmMWdm0laIWvg4zIfE31LrWOU0c/S3j9W6+RsGxPseyrXyHxJF4ch3lrkWdDi
	kRdZp80QBK+U0J9vIW+VVHfNty2j5hgIzSy5vBMt6LwwNMK1CaBqHhE8wYrpPLq/2/aAqksFpAp
	ru8IzxDgr+DgfxEwRe16GqWI1g6/IFtYVz0tUqvAaMbZn6CAlnn41V4MctJp+t1ju/GDyF2CL2d
	T/y8aKxkA1AOdaK8veS0ujnQOGI0xzBZhj5YHRzk9UnyPjoMWonc6LjnJKOlALuB4gS69yaq9VJ
	Sbhnzc/SkeQgv1N/lmM2+uklEk1FGPjtQdUTSbhXJXFamyMR4YDzzKIFDQQn4MImSP3QO48lNp/
	6yOGRJeWY4g==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
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
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
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
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_223058_766724_A26E0B79 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTEvMjAyNiAyMzo1NCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikg
d3JvdGU6Cj4gVGhlc2UgYXJyYXlzIGFscmVhZHkgbW9zdGx5IG1hdGNoIHRoZSBtb3N0IHVzZWQg
YW5kIGdlbmVyYWxseQo+IHJlY29tbWVuZGVkIGNvZGluZyBzdHlsZS4gVGhhdCBpczoKPiAKPiAg
IC0gbm8gY29tbWEgYWZ0ZXIgdGhlIGxpc3QgdGVybWluYXRvcjsKPiAgIC0gYSBjb21tYSBhZnRl
ciBhbiBpbml0aWFsaXplciBpZiAoYW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5nIH0gaXMgbm90Cj4g
ICAgIGRpcmVjdGx5IGZvbGxvd2luZzsKPiAgIC0gbm8gZXhwbGljaXQgemVyb3MgaW4gdGhlIGxp
c3QgdGVybWluYXRvcjsKPiAgIC0gYSBzcGFjZSBhZnRlciBhbiBvcGVuaW5nIHsgYW5kIGJlZm9y
ZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPiAgICAgdGhlIGxpc3QgdGVybWluYXRv
cjsKPiAKPiBBZGFwdCB0aGUgb2ZmZW5kZXJzIGFjY29yZGluZ2x5Lgo+IAo+IFJldmlld2VkLWJ5
OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPiAjIGZvciBNYXhpbSBN
QVg3Nzc1OQo+IFJldmlld2VkLWJ5OiBDaGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291cmNl
LmNpcnJ1cy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+ICMgcmVuZXNhcwo+IFJldmlld2VkLWJ5OiBNYXRoaWV1IER1Ym9pcy1C
cmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gIyBtYXg3MzYwCj4gUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdA
YmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF6emllc2FjY291
bnRAZ21haWwuY29tPgoKCi0tIApNYXR0aSBWYWl0dGluZW4KTGludXgga2VybmVsIGRldmVsb3Bl
ciBhdCBST0hNIFNlbWljb25kdWN0b3JzCk91bHUgRmlubGFuZAoKfn4gV2hlbiB0aGluZ3MgZ28g
dXR0ZXJseSB3cm9uZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+fgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
