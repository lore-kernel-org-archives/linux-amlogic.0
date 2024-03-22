Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06ADC54E71
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2024 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cnnOoyYBNK2Srqs20zRPYaiDVsyQ+1EKJjDAEeLzyog=; b=gzNtF48T7+X65JJCiajVQ6JYhY
	eBBnuHk3Ttdd8rqPV3jBRnMkdL3Ru7vO3K5UwUi8VzZyQOjJBwhbCTs7rhyggILH7kajI3QNhDYhx
	93OldD9YQ+5M6K4SzG+SqIQ4ORs4f8c7B+lrGi4xFhUy2G14CTRNoCpTQD1fzg5OsMfATLmJSmO/w
	abDsUgGE9hMipb7jSxpTC69YsrnIh0t7XfMHHGLhDtODeldjD2ezlMIAXdai62/IVgIHgjT5XZS+w
	klv8IgqpJePVdX1xQ0pVIBkquiYKj0WndmeYXndjU3+HYR4AKzL1uwf/k3fpx9paEaFjaFFcZsUP1
	6WjVvpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniKU-000000084wV-3Qzv;
	Fri, 22 Mar 2024 17:05:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniKR-000000084uc-1OnB
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Mar 2024 17:05:16 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-431347c6c99so11901cf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Mar 2024 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711127111; x=1711731911; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=wr9OEvps2H1wZdHChxrlODQ3OtH7CTndLNLtD6KKok+X6krnmHHeW/l6IF1VfkUdEt
         Iz8ul49cH+oyZkcY2UW2TXphKE5XkHAdE7WvMZ20n2L31f1iUjMN05G4rh5bTNXMR/ga
         dVb25a9RcPMO8867Cido7gvAPaarWxJjonUviRh0r0NQpXFYLmUjzX2z8849fzk2WChp
         /AMBp+WfR0C8NfHtTco8au5SKiW6Ts6EApnvB4p4OonQ87/KzXkqMIi1uo23xep4kFa5
         +QMf6upBiseQilMypnm7gEx/pRWWFlSWOJTnh1W0zKUDWxyyATf8voLC56MQ4r2H6pTu
         TAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711127111; x=1711731911;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=AbKMqmLY+oW70+BxlUu4VIGV0nNDERt6vlqH0jiLA3OrCwGjb5wi58h4U3h/yECP6z
         fdq3dFt/8a2vHoJezZ0umB3Fd2pljsNEsvNOM+mFOY95QYn8w7rfKggdrFsvxx9Wh4zU
         4Ph6pniEHUfWh6FNqCmK8W9YLZx4jIboDokIOe13hEnlFRsmh6SqH25XBbETlxgNyzWP
         nh64n957Xh5VdoKxr9047FSg5zFNTY5jfacRb06+uwxI7X7giGi/FO/ZCCdmmjQm5aXR
         dznjhEIkdwdmyc5pWl+IAU3iVDeiPGigY/F9fSYQkZN4iNG8j6BHSxjOV3YOHV/qLUy7
         Hlzw==
X-Forwarded-Encrypted: i=1; AJvYcCWdYZjy1gxnr6aw5F1GG+GZupiAABrs0WsRYCwedHSPNimKXzuC7DZKRO4hgkKNcGuV2eIlAvwlZOkng5XB1by4MWBHXcstMxhFIN/R/K+ER6o=
X-Gm-Message-State: AOJu0YwsYoerzpp3GY0zqnQxbrh7UOrK49Vvqo4k1FX5kp9a7cGOTPnw
	0+kQ2/WwfnYtdaNL3xSdllWnMlE5VaOz/DgvhZvWULBZTT8ZSAeP8/J0ijn3482FgTskVG/6VTX
	IH22dfbGTX+lvoB+KFi7Y0lDQGk7L5Rn0mYa+
X-Google-Smtp-Source: AGHT+IEMXRAiaxzgPudCV28IsnfTo93KghidIO1NcmkDbiSOepYGnBba5CPcjtadamz0IWr8XSq/M+NvnzVf5opCbEA=
X-Received: by 2002:a05:622a:2486:b0:431:3c48:a65b with SMTP id
 cn6-20020a05622a248600b004313c48a65bmr12492qtb.11.1711127111085; Fri, 22 Mar
 2024 10:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com> <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
 <Zf22G4jC2gIlzhi_@shikoro>
In-Reply-To: <Zf22G4jC2gIlzhi_@shikoro>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 22 Mar 2024 10:05:00 -0700
Message-ID: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org, 
	Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
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
	Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
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
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Ryan Wanner <Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_100515_408876_CD7D2825 
X-CRM114-Status: UNSURE (   8.58  )
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgOTo0N+KAr0FNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4KPiA+IEFja2VkLWJ5OiBOaWNvbGFz
IEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+ICMgZm9yIGF0OTEKPiA+IFByb2Jh
Ymx5IGZpbGUgbmFtZXMgdGhlbXNlbHZlcyB3aWxsIG5lZWQgc29tZSBjYXJlLCBpbiBhIHNlY29u
ZCB0aW1lLgo+Cj4gVG90YWxseSB0cnVlLiBJIGFtIGF3YXJlIG9mIHRoYXQuIEJ1dCBvbmUgc3Rl
cCBhZnRlciB0aGUgb3RoZXIuLi4KPgoKS2luZCBvZiBvZGQgdGhvdWdoIHRvIGNoYW5nZSBmdW5j
dGlvbiBuYW1lcyBidXQgbm90IHBhcmFtZXRlciBuYW1lcyBvZgp0aG9zZSB2ZXJ5IHNhbWUgZnVu
Y3Rpb25zLgoKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
