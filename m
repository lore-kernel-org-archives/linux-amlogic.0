Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F2C43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYlojgmJdzKU5D9tWPF11Z+hJpzSod02U6EfgJ1MfiM=; b=OnWmerbAOYuJ+0
	hulqWuHT0NdmoRPJPeLgU3UPzUUE8HyZ2CZJviKSPge/PQE6+5Ur0yVMRSKu6bRghLHhN28Iflw8h
	ZA8yARoBoWC1ULCr/euml1PtwR4VQgsaw/3btJcgGvTMegLnrSVeaKc7jTBQj8GPXNP75iveej2eN
	v7OUbm9/pa+FhE97Ywkk/vzOr3rS3I8XvCIFYhF9PYUax3JjO0JUnNdQqHFkRQ5ylx8Jp4bzkx2oX
	X3W7PTrJnWbVeRHyJPx1t/06njpJtXAUhYlkhYrGyJn1g5P4df3P3Y9FJDdvXvYZ5mDeAybMzzGNb
	b3bnMzcUH6bFDrOua1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeLs-0000000BmJ6-3oBo;
	Mon, 06 Jul 2026 08:06:52 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeLq-0000000BmIk-2V3W
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 08:06:51 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59c9b666822so2321564e0c.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 01:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325209; x=1783930009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=k1lx/8jeF0LZ81RnmMriLaO7LSu5R5te12sZTEggl3HpiJr2y3AW2VNb13TVRlC5Zl
         CyWwUv8hGfR9f2Fh42l9HMvpXa5PcVUTBvkaESG9C9PaS/zXn2JtBRdXiLSWjlPMdAvk
         E43Lt5yz64SKGz3Eq0bnFZM9nu2WmlNkklHLrSy0Wo33VWU9MHE5BUUOBeR5pjwm4oZl
         WCNWjcxR74jDmWReZDam7MkN1Q/lJQrOxX2D+mGPcodT0L5mii+HDu1UFNyN3v01cJKr
         4mbNdDNXhI9bMWUzDWx9Lx0L5QCcKnxuB2sp31MFgiWYhzFpKMQnAbpFQBrHomYxpF0I
         GStA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5kh2IMz1Qz68m3U/sVr7TEkYhjtCO8vt1Iqxh8on69SxYXZRihdqwt1/zfOg1wFCl38ykosl2JK0zgyjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYKcoW52kAVQ+TjCNJgpU0KiNw0lJ0861IvYD91TYxJT521xyd
	EzofptfGBLshFfrbB0c1CtYjYuD8PjCTTOj/bGwcIGA5/NtAub6UnZ1dZ/aP+ayj
X-Gm-Gg: AfdE7clm7fm1B+JaqGNi+H5ZnURuMfDjDEYmRApx7qtvIYCCaSOFTEFLFY2ZhpsmT+V
	tHvTvLb1taXYjsRSDI7CrgWcP4Vl22HCNisjJaLp6yOu2uXPlBJzitjKlMIc5Cbyrmsy7x/iH3c
	KqnhPVP4CkG/9l6uyKN3sJ4nhLs0mV/w4z+4BuBog/g0953Wn0bYHceiDzhV/XI/ZYdxdWo/aPL
	BiCrxGbZMA2q1azc4oLpoRTvLFQeaa0+ae1kOfwiFLgLgjO1Lvnz+vO2nnsDk76tshxIqIlbqOr
	L/T2qanHe8qjkzgyDjS7TSPrR+PPNCyEM6j3BAjBpui+86+2KkF29ZVbBMORlxToWlddJ3hoNKn
	/h4a0Ure9op8rdA/eyJLGOnxRcIXQwaJqACq1TeTCaM6yEmwFhsiDfuj2Tx4aEqFmb5e0w7TvZA
	agXz+T3oAJn1+OSvldr6EEBZ+358tGSg+XXvEURh6ssXnIgLxIrg==
X-Received: by 2002:a05:6122:8b14:b0:5bd:9d27:1ded with SMTP id 71dfb90a1353d-5be10121472mr963029e0c.3.1783325209256;
        Mon, 06 Jul 2026 01:06:49 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02c75ed0sm4373133e0c.16.2026.07.06.01.06.49
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:06:49 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-738bd0b7960so2277988137.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 01:06:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrS3ZpgADJyWEhzrxghsXFcDJ62syanbwHhVjEn/eyzyXOnK71uXr1buc0x/jrYWZatqCDZu42qRXN2jULg@lists.infradead.org
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_010650_643217_94225584 
X-CRM114-Status: GOOD (  16.49  )
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

T24gU3VuLCA1IEp1bCAyMDI2IGF0IDE3OjE0LCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFi
bGUgSHViKQo8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gIC0gVXNlIGEg
c2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5IHRlcm1pbmF0b3I7IEEgc2luZ2xl
IHNwYWNlCj4gICAgYWZ0ZXIgdGhlIG9wZW5pbmcgeyBhbmQgYmVmb3JlIHRoZSBjbG9zaW5nIH0g
aW4gbm9uLWVtcHR5Cj4gICAgaW5pdGlhbGl6ZXJzOwo+ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFy
cmF5IHRlcm1pbmF0b3I7Cj4gIC0gQWxzbyBubyB0cmFpbGluZyBjb21tYSBhZnRlciBhIG5hbWVk
IGluaXRpYWxpemVyIGlmZiB0aGUKPiAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsK
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKPiAgZHJpdmVycy9wd20vcHdtLXJjYXIuYyAg
ICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3B3bS9wd20tcmVuZXNhcy10cHUuYyAgICAg
fCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1yemcybC1ncHQuYyAgICAgICB8ICAy
ICstCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4gIyByZW5lc2FzCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
