Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C11BC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 05:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2831220851
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 05:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKuWTXhq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYk9dwWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2831220851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ntAaOqyYKuVKmpr7vlwTDkoKgC56hZUwowfYs5Gb3Q=; b=gKuWTXhqrMCnFH
	E4kMMzbKbkFvzKIlr3twI7Xr9iaSBU3/CnPBbhzF3C6yRfPupsn0n621QjsqQgU69d1dx2xWMMHCg
	24NPEINoNvbOH66CZg6npE7mLGgE71135zZDeEAKLgu4ObcocG7OQp2tcu3+jnokiBnqP8QIX0ydN
	zvhdr+P5EOebKoqemoH8MX6S15IL1EfMcZ6w3j4AuRrhOWLka+qzzsIoIJOQfqeIBeMFHQ/azs0AS
	lremQWYbyd6OnXzQ64oPli3JSJ/lHacOR6K6u+WIHjGJla3FAbLayrrQxlNs5S1WDTN0Kw2SkZiwd
	B3rXtdecldEKVfNEc/RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gThBe-0001sr-8u; Mon, 03 Dec 2018 05:54:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gThBb-0001rX-OJ
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 05:54:29 +0000
Received: by mail-pf1-x443.google.com with SMTP id w73so5788476pfk.10
 for <linux-amlogic@lists.infradead.org>; Sun, 02 Dec 2018 21:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JqctOZeX0TcnM+wa/H8KIRXlMI4Beh7WTAsArwlfrrU=;
 b=BYk9dwWqB83mUhOQIeYlA+ZyETdo1g/zSjAKVuMB53YYy+vDlsTt+g0lz07pLSlZwl
 geF+vKve4inySSUpAtiUBGcsbVyelFxA7Hb6hIaMvpBlZpjjthrx9/97Fuk43TilKTZt
 +c1q0QKShXGiuljYSzxjVr95s+SglbBZ0r53g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JqctOZeX0TcnM+wa/H8KIRXlMI4Beh7WTAsArwlfrrU=;
 b=gSMNfbaYM90py9qn1QO5XzzrmsI79i80FlFHSC/Inix7LXu8RFGVuOqyjEhOrth70d
 gfEm4VpWN0KICjcBN9NcG2LTPFO0nE9BzC83SxWNpjDxZbs9c+i23M6mMv935rdxZhkL
 Qg3IzBBwiCE1SsZBvDJp812N2KR/ZW2BA8RLi0SxgdJCGfgRnMFS5ZSokD9SuNUG2/X5
 R4dlBCXCpTlMaLR9IPZBZEdaHZB/SjiXZQzvQoP+9GIKSzAfiqSYHheuG7gzlZj0ZzDW
 0j24VA4xs/jVh9Tszq6z71vm/w3f/0OH+CDE7nwjAjubitw+oeHr6qbPZyUN6vUDFVj6
 z9ig==
X-Gm-Message-State: AA+aEWZHLqsZbYWtSDo6enA26X9CGV3vPXrlveDh2vou7tQVKnfCvxNO
 tY98Qqtjznj0bX9/39o8LzrdtA==
X-Google-Smtp-Source: AFSGD/VfMAqBwSuXvSa487/KNWpdHkGifORyjUYKnphreg3hgPg/SILhJ9wz8YwdwlFIuVMhMZag6g==
X-Received: by 2002:a62:4549:: with SMTP id s70mr14476834pfa.233.1543816455276; 
 Sun, 02 Dec 2018 21:54:15 -0800 (PST)
Received: from localhost ([122.172.23.29])
 by smtp.gmail.com with ESMTPSA id f67sm7864684pff.29.2018.12.02.21.54.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Dec 2018 21:54:14 -0800 (PST)
Date: Mon, 3 Dec 2018 11:24:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
Message-ID: <20181203055411.ucca2f6haugxxxwx@vireshk-i7>
References: <20181130170634.9467-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
User-Agent: NeoMutt/20180323-120-3dd1ac
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181202_215427_794745_B24D10EC 
X-CRM114-Status: GOOD (  17.10  )
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
 Linus Walleij <linus.walleij@linaro.org>, linux-oxnas@groups.io,
 Baruch Siach <baruch@tkos.co.il>, David Brown <david.brown@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, arm@kernel.org,
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
 Barry Song <baohua@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30-11-18, 11:06, Rob Herring wrote:
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
> 
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Yes, I'm being lazy and not splitting this up into dozens of sub-arch 
> patches. I don't think this should conflict nor should we be getting new 
> dependencies on skeleton.dtsi. So please apply directly to arm-soc.
> 

>  arch/arm/boot/dts/spear13xx.dtsi               |  4 ++--
>  arch/arm/boot/dts/spear3xx.dtsi                |  4 ++--
>  arch/arm/boot/dts/spear600.dtsi                |  4 ++--

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
