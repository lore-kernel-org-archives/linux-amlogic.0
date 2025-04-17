Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D88C369B2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Apr 2025 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdwW3GOvkzw+VjheXNCU+stdcPKGOeTIFP5oCgztwGE=; b=irehd+vEFsBGnW
	x1pSZ3klbl5zZJ2RbOuh5qnTOcj0TIXlOOsZJ+CMXebM+ODmIFgleoGT6CZkKNpFFDlc60gVGxQII
	bI9u2F2vT/pc29mGNhRAHw2oV/hhL/qbOXkvEM3x71a9olExBuytKNl9fX9Qk9mrsjZW0sdHEAPnt
	bSA6gMDbx6acpEFNbfICEhJmzcMgtglZOSQn287XXlymvW4KFJwgQhLjOIj8vuld4DoeFhXxyCvd7
	H7Jb50eDbKfdIycBFpSFKxBNnUhrP1Ze9A20e3rSF/uY6DMU8X450oTdNuNJBJpLRY4Euy6IaBJWU
	p1m2vgVVSElrRJZdit3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jv5-0000000C9Nb-2eVN;
	Thu, 17 Apr 2025 07:44:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JtE-0000000C9AA-0ITA
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Apr 2025 07:42:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso4278801fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Apr 2025 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875746; x=1745480546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=gNp9ipHUsWot6aFeTtt032914AYndjs1S2Ve1bXu/kafY/+0lkzRYbAEUoEJ+A5ceY
         u8qCSjYUtRJjzcsWcBQdrePXwZmxEvepuOKeBbCP8Hx64ARAC5sQKenMheRpRtkmgGyj
         ak1Fh47mF3e8f2L23EowxvzaN5PTWmjtqrAj1sGXRNtNbcHX2Qkuv2pzDjYatc/roFgE
         iY1Zb0oG8+YAX+fcxAo9xyKP/3j8tBb6hpO+qWofHnchdARWMOPl8ka8BkmIhyX3QWot
         FfmPjOGfJjpkyQ3hEEybTX4OdD6Ncw6rayfXzx+E+dj/gQVy4/OJuSOGgmoyoP0KFJFs
         7wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875746; x=1745480546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=nwjuLc9NYsODZ6fMwv0kdzyIg8dV29ce32r48VwFN93qFVJC82WV/LQPr00hf45Pzc
         cilxhWh4yJsDilrIYi1m4wRl96bwc44hHKaHZ5rtUE4Y+X1G5EwSm/aDjTTfRSKTRsBb
         EWxwL1Td4x5jamk8uf+HL9viNXTKf/76fCDz2iobBT+FOa8LS+Mm2aooyCXIwJ1GfXV6
         UevurXF619lq0kG3Q+zgadMtbDwXp0wW/IgUVK8WCBtUBE57n9Ozqs3Yz54w1NeyY1Ld
         NFrcqccDknE/+9X7FvHKAL6VlvRf3Xoyt9d1biszWwz6oPruVwEY9lbPLI8azR7OuLue
         cdhw==
X-Forwarded-Encrypted: i=1; AJvYcCW4TClunzBsYpxhqpUqICfIDh/9lrIZh3v4jZ1H9HU1EHb40ym/T7H5l7nM4/xCErjemFh8ByaX1Qxg2OV7@lists.infradead.org
X-Gm-Message-State: AOJu0YzRiNfRB2PbENqsv/lqDxY5k+FDjo/BhYk6EyW/3ncH3A5OqRCZ
	l0NMTXdTunZ6JrvDYyU2SJA+zEhguPJ/x6T4o2PKL3ghvoVZKyCyccJFSHotj8339W8eUBsZSiy
	v4aNHJGSyV9Xea6cY1AUUeTT/4IFBRyr726OUOQ==
X-Gm-Gg: ASbGncvB+WeMwyUQGj3kv7e8Nr3qDOs8L+zbvyI/4bf2JkymvYUx5sDRpgyGC9W2/Va
	QuppCDpFgOicdOggH9095MzX3HpIJnTVOXI9sfvaZtJAP9EJZ7TrAM2mXTQxJJJAM2O9QGygrUr
	inH8+vVTZyh3Xivs5Ph+TaHA==
X-Google-Smtp-Source: AGHT+IGS1IRdJZGaZOGBt2o7TAzE4ajC3kXe2lrY8hS5Zx1+HVIOORQPGpXWTLFIUHBjt1Qe5pOZPC9xWwoJZ+1T0rQ=
X-Received: by 2002:a2e:ab19:0:b0:30b:a20b:eccc with SMTP id
 38308e7fff4ca-3107f6bde0emr19717881fa.11.1744875746101; Thu, 17 Apr 2025
 00:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
 <20250416223706.GA3230303@ax162> <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
In-Reply-To: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:42:14 +0200
X-Gm-Features: ATxdqUEL04h0FlK145WkXx_Q9dTs068nZ1YOBn95bqrfuRW3dCGJeGM7IpJjU74
Message-ID: <CACRpkdY5KJzCk1sfznG6DFMmX9T=pu=im_a6jTeAT68pO9SBAQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004228_108611_02895E59 
X-CRM114-Status: UNSURE (   6.63  )
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgODo0MuKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kKPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE1ha2VzIHNlbnNlLiBMaW51
czogQ2FuIHlvdSBqdXN0IGRyb3AgdGhpcyBvciBkbyB5b3UgcHJlZmVyIGEgZm9ybWFsIHJldmVy
dD8KCkkganVzdCBkcm9wcGVkIGl0LCBubyBwcm9ibGVtLgoKSSdtIGFtYXplZCB0aGVyZSB3YXMg
bm90IG1vcmUgZmFsbG91dCBmcm9tIHRoZSBwYXRjaGVzCnNvIGFsbCBpcyBnb29kIQoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
