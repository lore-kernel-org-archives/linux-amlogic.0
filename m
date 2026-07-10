Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27E8C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUc94/ZcMmCkPiqsaTDL7VLqpFUwdHxlQVFDb01Bws8=; b=BNNDy5hyCRono5
	+4pJZYbGXiyr+J6jnlxVWQ2bghm8wIwyYBCso4FU9d61XBoNicjEMTaoETlRfOAq8OtCFRlcXPUU0
	4+wwcCR4rEQWo4zYl9Wo2vKCkDNvvahGEhaYYgkc/6kxhXHFl3CQPEEndN5cmhOoBTCtXA2WKssHK
	vSe5oBe755tQp2XZO8wVftW2haqstBUk36HTA3XN2qjLO31oizhAUCeuP5kDh9A55+Ztc1+e50gaX
	8FtSFVVIBAYn1W8LOUZvRmK7rntfskcWut/RjsWsGwuA0h5jirXoFZCadBCJ5mKwcTfUlcVn2dT1y
	rKBF9jOd3XYakWKmH5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Tb-00000004i8y-18wi;
	Fri, 10 Jul 2026 10:28:59 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8TY-00000004i7Q-0sPA
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 10:28:57 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80dc4a68e4aso9189537b3.0
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 03:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679335; x=1784284135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
        b=kYggUI67dsihJSjwc45BFZso9UvdEh6p4HFyXg0m1A/qnoKAD6m9zfc6DcX497Zv5u
         z2VTN0s9Yb+gRJP7Qhvq8vQptifN4N8LMo3OCISItN5qfPqohR1bwJGsoN4si2sYMeqw
         aVAZ+C7Q9dw6SkZuj3AtSpMNfhgtSN3vYKNYVu5CnFB2xFknByojwtSizZX3qRa+j9we
         /pW5hDem9R298hWGrV68NQ2VfxtLGNhD1t6qTFByQZ8oOPKbdi5bdenesfkX2P3a5Xdg
         2CKgR1/R2DbZGRD0+Bfs6s6m/BmA497WqQtEWZ8JjIMXoLLUgW1SD7S3L4+U8ZGmvlGs
         WUJw==
X-Forwarded-Encrypted: i=1; AHgh+RpAHhHzIkDGPL1nD34fcKMLysuvF+1BjUqzOqF6qZx+hjf+tqsQbwajCKebPjrqebwLLp3mg9Vg2elj9dA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxph+QxV46B7QX20f2eqWYvFetdzxSUeZf5T0ntMtiGKOqcpWsK
	M2XKauCKe0YZ/DKCR2716PhBS+JNj1P9Q0QwC/gjuiyEcmnn0VxuE+MeWY24HfMAuf0=
X-Gm-Gg: AfdE7ckOz3kDb9m2EJAR2d+TRgxn4OucfTgfJqbCbrZxy+om6fuuynSeE+UCQ/uc/Z0
	e6KiGP8q2RAT9yBwMImuPfBu0itY8jSqm88uHbe0GsombpDPgRlQ0+JzdmWCSdIahjm/m4qqgth
	qys74JCld2NKm19rZyXiio0+XwRvuqkrCF0KSEj/kmcWl4bf3qCGYOHObMpHEudgJ6QUtwe3RDq
	yhawIK8lkCL5O7edKEeBljmaa1fRs0lJvO0ivHwJlvBHSfqD9Y+KXGg3fk+5U2BIgyIFEBLAolD
	Y6M9K4TWhRMcfkfdve8xLtMF4GIQ/kzBX0DCc9YL0qKLqe23VjKANLSJJyTNziuFbQAKxZvrSAN
	azZ5OsbdHht/G8n6hBbcSplZWuZdInfvvxKlYLYmBghgMFkEHspCs067KxYzRFjj/GQL6nYLcOC
	9ucEQiX1IDLw23VfkG/hu6OiId2vMeIv7sNx2UjFHwhXBXn3qrpg==
X-Received: by 2002:a05:690c:e0b:b0:80e:5236:b930 with SMTP id 00721157ae682-81dbe33d7a3mr79088097b3.36.1783679334871;
        Fri, 10 Jul 2026 03:28:54 -0700 (PDT)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com. [74.125.224.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm26615627b3.26.2026.07.10.03.28.54
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:28:54 -0700 (PDT)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66493875766so1312074d50.0
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 03:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNMRXlaFMNxwQPk7kHLUJ3ikLtppn0un6b3CHxcMH6UU2RaXH+/kXMPhhtux9f1omVQS1CHL+W9qsdxs8G@lists.infradead.org
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com> <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032856_249189_7173FE1D 
X-CRM114-Status: GOOD (  17.08  )
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

T24gVGh1LCA5IEp1bCAyMDI2IGF0IDE5OjAwLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFi
bGUgSHViKQo8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gVGhlc2UgYXJy
YXlzIGFscmVhZHkgbW9zdGx5IG1hdGNoIHRoZSBtb3N0IHVzZWQgYW5kIGdlbmVyYWxseQo+IHJl
Y29tbWVuZGVkIGNvZGluZyBzdHlsZS4gVGhhdCBpczoKPgo+ICAtIG5vIGNvbW1hIGFmdGVyIHRo
ZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0gYSBjb21tYSBhZnRlciBhbiBpbml0aWFsaXplciBpZiAo
YW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5nIH0gaXMgbm90Cj4gICAgZGlyZWN0bHkgZm9sbG93aW5n
Owo+ICAtIG5vIGV4cGxpY2l0IHplcm9zIGluIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0gYSBz
cGFjZSBhZnRlciBhbiBvcGVuaW5nIHsgYW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUg
c3BhY2UgaW4KPiAgICB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+Cj4gQWRhcHQgdGhlIG9mZmVuZGVy
cyBhY2NvcmRpbmdseS4KPgo+IFJldmlld2VkLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJh
c3ppa0BsaW5hcm8ub3JnPiAjIGZvciBNYXhpbSBNQVg3Nzc1OQo+IFJldmlld2VkLWJ5OiBDaGFy
bGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cgo+ICBkcml2ZXJzL21mZC9yei1tdHUzLmMgICAgICAgICAgfCAgMiArLQoK
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
ICMgcmVuZXNhcwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
