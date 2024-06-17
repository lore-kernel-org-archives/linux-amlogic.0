Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D0CC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVOFa9CoB4BVtI2co11Vm8tJJSCQt4IlfBEChqjf44Y=; b=WxUOV7KUdANpay
	TP7mn9XysdBDFJagNaIL+TdlBIjtA0wb/1ToN4H1lmdNICukTCOigJ5gus0TdI8qmoO/LxdcjsSUk
	ymZuqzpTSYbnbeNQEaS1FNnlYHwM1Oq0s5kE6pSMhf8ReaQymvqoGJbSsyCr1FwGbNPB+o5VDwXkf
	ub2Ys6A5w6+Ujj8jNDC9SlPrpFXigjCBAodXNsfWafagEIdeMG3LDmWQA632fHN7aWvYrl2N9eG0n
	4o9vQQjYsMuP06PBJhCHxxtol3i5eFPrpEKQGUnQUacWPigS4/pgJwZF/IUx7BXcE0UCAKLPxGBCA
	E8tmD0QGWNXp6wDm9T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrR-0000000BKa8-3ptW;
	Mon, 17 Jun 2024 15:01:33 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClF-0000000Axnb-3NPF
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:14 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-254aec5a084so2101326fac.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632264; x=1719237064; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=zR8DSh2FKFTPPZt6rehf2AgFByGKGrBv1pG8uJEZTBSdfHGnObpry5sW0/mI2jB2q8
         2W3ecplnTLFYf6LCrkJxArno6PIMUe23SjbibSIKNnHbbGaTkmIiHEGn08lImu9DSyk8
         t/BC4IMNbYuurJ9/vRWffGo3adj+GpNAPh8uJPef5GAFqwu82E38/Is6fhcRuS43M784
         KZ6BSRODVssg3tsFj6bsR7/u4kiYviCr7FDk/UfUuvYRuD16ysHh/S6TVfdJPsn496vy
         9faAMv67zmYGjxMkmtwf49uvLPhxLDgD/ZyxlJzv0rqBLhxwNB00bn0rzQtUs8YgQWvP
         ryAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632264; x=1719237064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=FJN6/LY9ZZ7LE//2oRaNr2JiA/tafh6UwQu7s1SBNu3F6xa7GdBUMbT3H0mGh5Pv30
         rgofrUeAoQOxpHqUTnZ1cEN9656aEyk3RvuHm7QmbUPJfaiwLDwX02uUgQ6Ca9Wi5bSa
         9v/5AnV+YDO2Is2WhRiRnZx4xuWCxUoSEO5kRPdbsgborLp0HmKFRqGM1YKSGZn7Z+Yj
         wSkNIH1bbJAIf+pB3u0hXHwcHQy5fkAYUZqgAQfRa+7mVwtP4dBM9argI/nal/DELJyP
         qxv5qpXX5XMTVe++771W+OFk8ggXz21KMJYQfAswBJcWkY4s0ifqkgB3rziWmDpRdgLS
         irnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz6IxfXTSF2RqySERt11E7JEVuO74l1pbz5e7qzKqjBlGlrvEFPMgJmdqm6QwMSA/VarvUVDFWnVnw7f84C+JWu+p/pTw8NeaF/ZHyBEpEVlE=
X-Gm-Message-State: AOJu0Yznx9T7xlRP6lMcTYV0hhFT6/ST+9FtM0v9qefRn0CJXRqM324A
	OvZ0LlJd5R8MoWvA1K3LCa2Ih2QDxZJeXKBzX+2MpFlXJ1d6BXzEen2XoB5tAtE=
X-Google-Smtp-Source: AGHT+IH8uTWV+X4VQg+Hvv7+Ss0V04PvnK1VdmrqhUaV/+VFOL4UdwUlA2xHiJMwUxJKiw4xuPCudA==
X-Received: by 2002:a05:6870:15d5:b0:254:8bb9:d0bf with SMTP id 586e51a60fabf-2584298505cmr11157462fac.32.1718632264185;
        Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:17 -0400
Subject: [PATCH v3 37/41] iio: proximity: sx9360: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-37-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_065106_391382_6F6E1F8E 
X-CRM114-Status: GOOD (  10.12  )
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9wcm94
aW1pdHkvc3g5MzYwLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkz
NjAuYyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzNjAuYwppbmRleCA3NWExYzI5ZjE0ZWIu
LjJiOTBiZjQ1YTIwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTM2MC5j
CisrKyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzNjAuYwpAQCAtNjcyLDkgKzY3Miw4IEBA
IHN0YXRpYyBpbnQgc3g5MzYwX2luaXRfY29tcGVuc2F0aW9uKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYpCiAJaW50IHJldDsKIAogCS8qIHJ1biB0aGUgY29tcGVuc2F0aW9uIHBoYXNlIG9uIGFs
bCBjaGFubmVscyAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNY
OTM2MF9SRUdfU1RBVCwKLQkJCQkgU1g5MzYwX1JFR19TVEFUX0NPTVBTVEFUX01BU0ssCi0JCQkJ
IFNYOTM2MF9SRUdfU1RBVF9DT01QU1RBVF9NQVNLKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMo
ZGF0YS0+cmVnbWFwLCBTWDkzNjBfUkVHX1NUQVQsCisJCQkgICAgICBTWDkzNjBfUkVHX1NUQVRf
Q09NUFNUQVRfTUFTSyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
