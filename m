Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9500CC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 22:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E17206B7
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 22:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSvzul72";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rHNG0HbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E17206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvKHjejwQldr+plv6TBaWmO+9bOoQXlRwlox+67jllM=; b=QSvzul72q9pxpe
	pY9oc+rOBwLPUfBQTTxH3bcesuQFop1T4wCiXj2uv191IJdlMBymQf7fypSQnQw7v6uasM9oyWZ7k
	StdF0qKOkhEFTFvNJkSM2GzhVAGw7kM6zjgRYBWcrwx5WzGLEsWgYZ0f2/DFFWCV1kuECkSA2SMiH
	r0Dcc1PewWPVCErqEDTx82Ypm8431r5gOc+/c0qFnuTD+/rl4CZZ4r0r5R6QPgU+erRQ12LfReCx2
	5iJKLBLq4GKAyRV+ZAXgBnj2Kw5Bhrwd0ItFu1znoSozIue+F0IxA4dGqCfmgROA/NqxBNrRMaeg2
	jaWhsPi6RloQPmD5mK4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUJIp-0000d6-1O; Tue, 04 Dec 2018 22:36:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUJIl-0000bq-4G
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 22:36:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id b85so8952554pfc.3
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 14:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Vsg786idVHVwxGNQjEZIy5vnbRZd1Pj4iJlij1oGBAY=;
 b=rHNG0HbA2hZ6DbxYBpJ802GrOfohI2KUjrB1oz+2FvksO8gHumiWy2o5hlcMHeUAQw
 CBHrGNDznpcRGMQlNk0+RwoNIdQP+FJ7JVUkhymM5rCyMdtNbZZ9pfvuafYLmUehXgbh
 Mc66saEbOhmUalAjXnVqPno6y/cIeZkOe+2CLaMPM9elSGP12R+eac9KFpEdVXzIpT7S
 0xqTW4xEw/aOmtf3Z7/PlsC7zDFpPxZVF0ktcGvWrdYcsUNxzm0G7ihnFX99hBGhg4tA
 M3TYUOAQVBJ0Xx+kisOoXPf8De3QXwOeDZsFDv02aMeM7a/IUYjtrKyboxC+a+DzDYaq
 eGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Vsg786idVHVwxGNQjEZIy5vnbRZd1Pj4iJlij1oGBAY=;
 b=khUiRnVFBkQg+0S1Wetoxi8A9ZF73d3eUimSLi/cLIoLz2I4xH9WITfzl7Q7zoF/hp
 srIcBPn9HaNQExJU+oN4eoXQPIk7tgeQDsQBVuXLbeGGdQvmfQcR9DsIiSup9/mHSkJH
 WXLyHwPsjALY5hlGPXEVOXr2IFCV1bcTp0JXjBvRS4BqvxjiHkjlzqd4VjrgbUpjrHZy
 s9aZAQUJCV5KxXiJNrAZLMQNZgqjDDpfCOG1i+9bA6laHo9UB17dbErZ/s76PTa4sKo4
 a04w6iyz2pcpJyO5w47PBr/s18IYSwHt2FO9T9BbBrdS2esRwPlm02iX6rm2pm1KsFzB
 /fng==
X-Gm-Message-State: AA+aEWZ1NFwkVHU4EAlAyqf35k2cs9gITQ6FWmACH+Wi/Ox5BSXmHlVi
 7b0du3sRUM1MlbNU+nTXysnJPQ==
X-Google-Smtp-Source: AFSGD/W2WAVVT8g5ZQhZE1RFiY/NtCCKwME1tFyxpyG7j9jayKRfukdgMs07QylTG1AcnAFYfQkPGw==
X-Received: by 2002:a63:f047:: with SMTP id s7mr18251267pgj.441.1543962971559; 
 Tue, 04 Dec 2018 14:36:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id y6sm50525475pfd.104.2018.12.04.14.36.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 14:36:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>, arm@kernel.org
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
References: <20181130170634.9467-1-robh@kernel.org>
Date: Tue, 04 Dec 2018 14:36:10 -0800
Message-ID: <7h7egoor6t.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_143623_166595_908A8ABD 
X-CRM114-Status: GOOD (  13.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>,
 David Brown <david.brown@linaro.org>, Jamie Iles <jamie@jamieiles.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?utf-8?Q?Rafa?= =?utf-8?Q?=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Andy Gross <andy.gross@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, linux-oxnas@groups.io,
 Eric Miao <eric.y.miao@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Carlo Caione <carlo@caione.org>,
 Jun Nie <jun.nie@linaro.org>, Brian Norris <computersforpeace@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
>
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.

[...]

I gave this a spin through the kernelCI on multiple SoCs, and builds and
no new regressions for build or boot that I spotted.

Tested-by: Kevin Hilman <khilman@baylibre.com>

>  arch/arm/boot/dts/meson.dtsi                   |  3 ++-
>  arch/arm/boot/dts/meson6-atv1200.dts           |  1 +
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts      |  1 +
>  arch/arm/boot/dts/meson8b-ec100.dts            |  1 +
>  arch/arm/boot/dts/meson8b-mxq.dts              |  1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts         |  1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts      |  1 +

also for the amlogic/meson platforms,

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
