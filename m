Return-Path: <SRS0=1mM9=QG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29CCC282D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 16:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8982087F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 16:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a7HdBSri"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8982087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCecQJ8nmoPb/QeJ5J18EC0jcFstLTdYGvyLiBCO4rc=; b=a7HdBSriuCInh/
	Yl4EKK/DWvR73g3aiYxhpzLM/JWy5JeMQhvW7hLRg5bg9VfRYFLn9NcFBPxscbmrCg1gd44F/rkxK
	N0Vyh1EImU51ZMBhGSjD09AopVOpfrU3KBmX25jWvHJqJN8bgFPRMqBTZL2e59EuNlhRCmHKBwI0J
	+d3Ov8/bi6D7Ftk52xHz/37B1U64F5uqmVAxUdVR726123sXkdWHvsD1tem0IPD6YhT/OsmhfTiE5
	Q9ao452G5CUETPJ9xQHUwY9fWwMlDsr8CMWliFEy4U5v6s/yP5fUsY5YgdbVI4Fh+jrwDaaMpNCi5
	2rueWnq5l8UXcYkz+b3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gosmH-00019j-02; Wed, 30 Jan 2019 16:31:53 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gosmD-00019I-K0; Wed, 30 Jan 2019 16:31:51 +0000
Received: by mail-qt1-f193.google.com with SMTP id y20so88494qtm.13;
 Wed, 30 Jan 2019 08:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mE2839Eu/L8jZo/jfini7SFxL2uXh0hAXh9/f8DGdfA=;
 b=FULxPervWy27K+hhjlwKTYDIB6zRQWNEirqV/aWfhXejCXKiwsTu9IyHucB+KaRVBr
 xGzra3ogkl9Sfs8fFk5CB+S4+sjwouWOcEo3i7Gwyl+HyIWCtmfmWkDibVDQ0gHJNZP9
 4EkfG3RFcmlT5HY5kxOdbHnMeOlT7IW8AAvOQr1DnliEqEsSqoDf5SqbXVOAjeY+sliL
 HjPqq9UXphlQwpAnwy2SmbQi+k7nQ+/IA0SYIM0W9Dv1qhcAobLDTDCgZLJK3pI/XhcC
 F2bkBMVzEwu2WkHD7qxxGLNMoKMfgMR6e8x9cB7Z1ds4MejAo1JhALgVb7qG+n3yUeD5
 QWvg==
X-Gm-Message-State: AJcUukd1mpAYHfjvz1NRr5MiYxCHX+dlipP4MR21B7NV2u90JrfvY2uo
 m69ACJsk8XbWBqV8AK+wLFtJBsq1lrb4O5e+fPQ=
X-Google-Smtp-Source: ALg8bN44if90JNA0lf0lqOB2ElvGnSGT4mzoxt0SoGosr5LzJ5k7nSyAUzTfFGYQ9G4NRPp4T3Gm2yvetnk9GpjH4sY=
X-Received: by 2002:a0c:d992:: with SMTP id y18mr29860895qvj.161.1548865907585; 
 Wed, 30 Jan 2019 08:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20190109162614.30855-1-robh@kernel.org> <87h8ehpwm2.fsf@FE-laptop>
In-Reply-To: <87h8ehpwm2.fsf@FE-laptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 30 Jan 2019 17:31:31 +0100
Message-ID: <CAK8P3a04uO2Nz-M4NVgMsGy2BPRx9pM1cCuUeS54Jf8N18-9NQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: Kill off skeleton{64}.dtsi
To: Gregory CLEMENT <gregory.clement@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_083149_673069_509E7C5D 
X-CRM114-Status: GOOD (  16.28  )
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-oxnas@groups.io,
 Baruch Siach <baruch@tkos.co.il>, David Brown <david.brown@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Andy Gross <andy.gross@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Lars Persson <lars.persson@axis.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Wed, Jan 9, 2019 at 6:30 PM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Hi Rob,
>
>  On mer., janv. 09 2019, Rob Herring <robh@kernel.org> wrote:
>
> > Remove the usage of skeleton.dtsi in the remaining dts files. It was
> > deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> > skeleton.dtsi as deprecated"). This will make adding a unit-address to
> > memory nodes easier.
> >
> > The main tricky part to removing skeleton.dtsi is we could end up with
> > no /memory node at all when a bootloader depends on one being present. I
> > hacked up dtc to check for this condition.
>
>
> Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> and for Armada 38x:
> Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>

Applied to arm/dt now, thanks!

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
