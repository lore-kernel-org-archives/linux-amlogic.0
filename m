Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C8BC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyNt1/sQF3Ln3uPA2z2w5QAkvQIwnw9XDpDMn4MrGQE=; b=vyFPcgqcdMOG/6
	KoEtGWDfSd2rDZmnSG4xcyNI0H9CUgk4P8ME17YaQHiTsj2eHqoPD3eo8zXmsso+GkyofdhNKOXKN
	hc/9FEC/dHcLGIoYfcnj9YbWzDJebmfsQi6Slsu+eQqWbG0EHh+h/CyCbFROyzuCnikrrOIFLj72+
	4KR9jhubFvnVzh2SeIIHRbbkl48yZpnVa/fn0rgwyWCHZRfGTY4XowfFsxl9u9xcsJQqqR9dYYju1
	P4w+XMdgntS/+4rvhfWEdK8KaffQNwdVthD/pS8IgztHqkyOwVc7/rcLP2h3TX44enC6PFNxLNRz2
	fM8N+tc2y61SogE4NMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rreVE-0000000BQS4-2ALG;
	Tue, 02 Apr 2024 13:48:40 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdMQ-0000000B4Hd-0N5T
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 12:35:33 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so4749681276.2
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061329; x=1712666129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=ZKOGy2G3MScom2a/mpirow/XoYv4vu+WHmdUR8SJmGc5amWx19wlDj942Zk68kr7yk
         +63U3GEar0wJme/22bXCaYALGPuBIg9eo6Vepcf+06io1uDfckhG7+2eCiF+jHKV3yjb
         5xJQID9oc+Op9sT3ntC8oNKfqG7Q+5L6W3WNcMbKS3IEQPxqO1XtAsuYvjitM/EtB79i
         +OSp1VKxVs5K2oENcGqkvmtHXPw906rawqPbcqRGmNrFxotvQiBaKsMj8H7973ZaqWss
         kCyc5GVNswEsoTxr7W+7dG6nUDVEWutiJyW8+8j0jk+g5NXFiEWm4HKUDagNvUiMmU6Y
         0pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061329; x=1712666129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=GprWLL9hj38gjHh/2/qplu5749rR2mgY207c9PEmSyf/+3Qv2S/2rlRQIl9Jnij4j5
         5dO9sQFaHQu4JfeC0izrP7kIODWB60rJezbc0wF6k864qQwuV+q0l2+Q5XfdjSJwtOX1
         3v4GQR292UtmUQFCPVWNLy/gxEY0ShdQpxAyWyPmjSYt8ffyzFZuWADf7HCtNGQxmUYj
         EyAVL3xW4U71DsA5ajkj/dpJEEUYO3nUR38mCPb0EeE7/3TQZ6oZgIwOJiUYMCbk64wb
         Iis/BIjHULe2CfWiB7YziShzQxy9okxr+/ZC6DYBtqwkHQneD3Lzh9gfo71lutH4aE1r
         MHkg==
X-Forwarded-Encrypted: i=1; AJvYcCUsYPtCH8qMiJdMzIr/l9G1i3McchflKHxU7N2q1J54bSqpg/Oe28gxr/nM6ulHa7OJl0hkK5ou2LD8RAYAGwmkqPl64F321ApWpQ5PZm4EeYs=
X-Gm-Message-State: AOJu0YypR1y9j1+o85AO4t/zkmOQRxR14ahZLKVPZcmf4N6RgemUQpXe
	SK0Fb+qb7l96eeTT+pfWVz+RnfhagAJjWyP5AUIx3yqbcDWLJwTO8iF/Z7IN8+bOqGpCC8dTqTB
	ujZe7BPQ4l8C6bwZm3cnH3+4tDsJak5EKsIo9Yg==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Richter <rric@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_053530_999863_27045FD2 
X-CRM114-Status: UNSURE (   9.89  )
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgMjoyN+KAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgoKPiBNYXRjaCB0aGUgd29yZGluZyBpbiBp
MmNfYWxnb3JpdGhtIGluIEkyQyBkcml2ZXJzIHdydC4gdGhlIG5ld2VzdCBJMkMKPiB2NywgU01C
dXMgMy4yLCBJM0Mgc3BlY2lmaWNhdGlvbnMgYW5kIHJlcGxhY2UgIm1hc3Rlci9zbGF2ZSIgd2l0
aCBtb3JlCj4gYXBwcm9wcmlhdGUgdGVybXMuIEZvciBzb21lIGRyaXZlcnMsIHRoaXMgbWVhbnMg
bm8gbW9yZSBjb252ZXJzaW9ucyBhcmUKPiBuZWVkZWQuIEZvciB0aGUgb3RoZXJzIG1vcmUgd29y
ayBuZWVkcyB0byBiZSBkb25lIGJ1dCB0aGlzIHdpbGwgYmUKPiBwZXJmb3JtZWQgaW5jcmVtZW50
YWxseSBhbG9uZyB3aXRoIEFQSSBjaGFuZ2VzL2ltcHJvdmVtZW50cy4gQWxsIHRoZXNlCj4gY2hh
bmdlcyBoZXJlIGFyZSBzaW1wbGUgc2VhcmNoL3JlcGxhY2UgcmVzdWx0cy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+CgpB
Y2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
