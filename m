Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A2FC04EB8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 17:52:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2367620834
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 17:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKLqkDp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu8He1P4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2367620834
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nE61w9DeMXsb3IqoO0UFiG9t+QVgP1dXEcNLzvXwIdU=; b=TKLqkDp7l3sEs3
	N8uWcYNzhtCkDpF2xH2voOwpLVJbiSVKx3sLtqbexbGM+X8vzvAgTkJkGxEXNlIAsDuuK3zi16YAf
	6zE/GLkESHeFiuyiXA3jl0vpf4xbE/pTbmRnty3IFUcEqj3q8/xoJD3MH0ePyKOn5gQ8deynRMjM/
	9BXgU4hMU9etPgBLWOyrEVgGxmXUPVdWMNyJaAdWZ6pG9vXSwzFbQD9ilYYk7XaHxzSq1erpPvPJL
	Zd/8+z+8vyP9wVn162UQG1FOBGuEIZIaJ29uPwQamTXtCMjlkKstK2zVx9r1A2JRtcfDnEATceYlA
	XZ2ijt1s6jINMvhGyPCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSmy0-0008Ta-Km; Fri, 30 Nov 2018 17:52:40 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSmxx-0008Sm-5A; Fri, 30 Nov 2018 17:52:38 +0000
Received: by mail-pl1-x641.google.com with SMTP id p8so3174379plo.2;
 Fri, 30 Nov 2018 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEHO3QjPndCJKK5bqMDKL2hOoKPKNuUCJXTWPwHdB6E=;
 b=mu8He1P4QndcZ6Xhmqwb503dCX6vAC9UiZcOtvDJMLhUEZReSBUFWGuhb8Jj9K+kwB
 UUPkBpPCY0m7y7+pjCg364ENOhYvuHV1LfGskUhYPVesnZiOW5EoHOsJWAVQh1vsooSp
 B1K5JjjHX767i0BC3sOpH8vq2u/5gIWO4KESa3gEM4BZqqCxn6yFXedN8MLjZOuw4RME
 w20Ou4ryjd0Bytn/tNSbspvF3OsAhgmd88xBsp6QCJ+eIXB/YWJHQfRz7IPirn/aVycz
 RabzoSFeOvCXCByc9IoSTJpUJd7T1CovzBnyKuvSMxXUIPeFnAjjunbikaUZCk0PcZTy
 /Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZEHO3QjPndCJKK5bqMDKL2hOoKPKNuUCJXTWPwHdB6E=;
 b=Nm7jkYQLGiP4NcBm8uCiJECFLd9InLCy8bOSNS/zG647JaWLJiDLfDf+eOTdLoHFuu
 hhb6MnBxcr4Mtttu+ZgN2tCP395Jze2BinyuPCezD6Gyhj7ZPTDskAN1wqnf0jYq9MtJ
 zncIes28PbXFwpP/MCLmVd3IcrHbBrKq7ZOe54kRtXNK6hUR8iv1ToObk6TzLgKXSFIt
 BKEaTNs4TwSg9x7jtgj6k+ym6yniTSB5NRLvopQOROB2TIni9JYJTS/pDtmOcjDKU2UZ
 YHmByqIcIB/N/eVHx/T9OfQ6d58X7I4+aKHqcNr65B7mmFw5ZULmS4cB3zgSprbz0q2x
 nhgA==
X-Gm-Message-State: AA+aEWbOaWbjCOGYes0u27pxQi9MV4O1HKXI3i3tvr1nAhDNgAALKs/O
 wWKA5S7yjkXKcYY2our8zgs=
X-Google-Smtp-Source: AFSGD/WwiQoIDJ18BFPQNC3LwvBMHiZxbkIoBpwraCPqc0/0lVMmXcudjCjwpHdbzIaSDiNIsuyGZQ==
X-Received: by 2002:a17:902:f20d:: with SMTP id
 gn13mr6336672plb.11.1543600345955; 
 Fri, 30 Nov 2018 09:52:25 -0800 (PST)
Received: from [10.69.78.41] (igp-prod-emp-gw.vpn.broadcom.com.
 [192.19.223.250])
 by smtp.gmail.com with ESMTPSA id b10sm11539801pfj.183.2018.11.30.09.52.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 09:52:24 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
To: Rob Herring <robh@kernel.org>, arm@kernel.org
References: <20181130170634.9467-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 w0j9Sw==
Message-ID: <3d46df10-9b85-7ecf-9302-0cde08b9283a@gmail.com>
Date: Fri, 30 Nov 2018 09:52:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_095237_194833_869EB567 
X-CRM114-Status: GOOD (  18.45  )
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
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 11/30/2018 9:06 AM, Rob Herring wrote:
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

>  arch/arm/boot/dts/bcm-cygnus.dtsi              |  9 +++++++--
>  arch/arm/boot/dts/bcm-nsp.dtsi                 |  4 ++--
>  arch/arm/boot/dts/bcm11351.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm21664-garnet.dts          |  1 +
>  arch/arm/boot/dts/bcm21664.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm23550-sparrow.dts         |  1 +
>  arch/arm/boot/dts/bcm23550.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm28155-ap.dts              |  1 +
>  arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts    |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-600dhp2.dts  |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-900dhp.dts   |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts  |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts  |  1 +
>  .../boot/dts/bcm47081-tplink-archer-c5-v2.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts  |  1 +
>  .../arm/boot/dts/bcm47094-linksys-panamera.dts |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts  |  1 +
>  .../boot/dts/bcm47094-luxul-xwr-3150-v1.dts    |  1 +
>  arch/arm/boot/dts/bcm47094-netgear-r8500.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts  |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-810.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-tenda-ac9.dts       |  1 +
>  arch/arm/boot/dts/bcm5301x.dtsi                |  3 ++-
>  .../boot/dts/bcm53340-ubnt-unifi-switch8.dts   |  1 +
>  arch/arm/boot/dts/bcm53573.dtsi                |  3 ++-
>  arch/arm/boot/dts/bcm63138.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm7445.dtsi                 |  2 --
>  arch/arm/boot/dts/bcm947189acdbmr.dts          |  1 +
>  arch/arm/boot/dts/bcm953012er.dts              |  1 +
>  arch/arm/boot/dts/bcm953012hr.dts              |  1 +
>  arch/arm/boot/dts/bcm953012k.dts               |  1 +

For these files above (Broadcom):

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
--
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
