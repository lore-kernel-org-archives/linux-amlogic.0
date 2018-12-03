Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E4CC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 04:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C4E20672
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 04:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSoZ6j9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C4E20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tpZG0NzW91uVFoZ5apDqtwPZLnnI7UJOkw12PYqSOA=; b=rSoZ6j9bhGrPzL
	org1jtnRSW8kcogvlBiA4DEcCZa1kHML/KzAfLE4q8tPp/LwWmQHNrLh7ngXp79w5eWN9f0ZbpU6i
	fmr7HKNjIG/i88OR4Nbq3lWn5MbOKPN4l2iK/jvUyrJaDzFhWhXBztyik+5yHEtNULeobn7oHfhS+
	rVIAt7z4APq9De6fCJXvoRjyUCWSjHsmAvzn4qhueIg874uWuO7r0ejf4wb+Sw/gfCIggUBzQzIOU
	69vCbpa0pcTOt3yLCb8VBdoDSDNlrlTT2BZUluzp5wOoS+QxeEsoVstwXTLUFDkhWDRXA260ofxd1
	kqvTvfLhpkqKaeTqvK8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTfRp-000124-DM; Mon, 03 Dec 2018 04:03:05 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTfRk-00011Q-VA; Mon, 03 Dec 2018 04:03:02 +0000
Received: by mail-ed1-f65.google.com with SMTP id h15so9519630edb.4;
 Sun, 02 Dec 2018 20:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqHWCM76pq9fXVlGPy2kHznNBMTOAduc6a/YXUL6ZfM=;
 b=STnNkiaOxHwuDR25tdXNl/xmYFWM2T6BJy9oQxlRmmNTkyRxDHNA9vdfMBpG0du7sr
 OywMiy1dtn6hEtyRTBtlFQNFLcGsQvmFerXeeRELVxl0BghtxTpu7voXAT5PXZZr/aZp
 kEOuifFgQTxioLS6pe4lz253G6LpwtANxtS3Rke6eZnufCisDtS9KtTiU4agLh69kvMf
 r9gfxidBgKB5hJCDRD896yfSIHg4HJWkf/R5PFtl+a7Z5y2ghjaJOlitcLZXAgfzVAaM
 lSgTPBqAMhyAMhLETMVIYpy5AHllL8JNAoI2uBUazek8qAaME75vUbBwt4ZpFQSswIkk
 0KpA==
X-Gm-Message-State: AA+aEWY5nkaPRb6y9P1CRieDZDerTraXK737qKkwOsA/KOLIEtd5vR9h
 IpLxXtlOjs35CRy8LigGyoosRLlUIM/chQ==
X-Google-Smtp-Source: AFSGD/UJBZGpnkdPoAqtYI9pG5UWDfyxhzsdPZSUOT7ZT1pT5ccAUdD/fUBmDbtvxW2gZ8fVpZZ/UQ==
X-Received: by 2002:a17:906:55d2:: with SMTP id
 z18-v6mr11172141ejp.163.1543809767087; 
 Sun, 02 Dec 2018 20:02:47 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id r7-v6sm2012634ejs.36.2018.12.02.20.02.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Dec 2018 20:02:46 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id c126so4178688wmh.0;
 Sun, 02 Dec 2018 20:02:45 -0800 (PST)
X-Received: by 2002:a1c:91d1:: with SMTP id t200mr6592818wmd.111.1543809765116; 
 Sun, 02 Dec 2018 20:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20181130170634.9467-1-robh@kernel.org>
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 3 Dec 2018 12:02:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v644LTpJ6XpCbhpBGYT3ZBr_Yt-4OVGQwNcOD15-+PqshA@mail.gmail.com>
Message-ID: <CAGb2v644LTpJ6XpCbhpBGYT3ZBr_Yt-4OVGQwNcOD15-+PqshA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
To: Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181202_200301_005144_9132ED78 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.belloni@bootlin.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-oxnas@groups.io,
 Baruch Siach <baruch@tkos.co.il>, david.brown@linaro.org,
 Jamie Iles <jamie@jamieiles.com>, robert.jarzmik@free.fr,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, jesper.nilsson@axis.com,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 gregory.clement@bootlin.com, zajec5@gmail.com, linux-arm-kernel@axis.com,
 jonmason@broadcom.com, ludovic.desroches@microchip.com,
 arm-soc <arm@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 hauke@hauke-m.de, Andy Gross <andy.gross@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 antoine.tenart@bootlin.com, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 lars.persson@axis.com, gregory.0xf0@gmail.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-soc@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 eric.y.miao@gmail.com, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, leoyang.li@nxp.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 tsahee@annapurnalabs.com, Shawn Guo <shawnguo@kernel.org>, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 1, 2018 at 1:06 AM Rob Herring <robh@kernel.org> wrote:
>
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
> Rob
>

[...]

>  arch/arm/boot/dts/sun5i-a10s.dtsi              |  4 ++--
>  arch/arm/boot/dts/sun5i-a13.dtsi               |  4 ++--
>  arch/arm/boot/dts/sun5i.dtsi                   |  9 +++++++--
>  arch/arm/boot/dts/sun6i-a31.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun7i-a20.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi           |  4 ++--
>  arch/arm/boot/dts/sun8i-a23.dtsi               |  1 +
>  arch/arm/boot/dts/sun8i-a33.dtsi               |  1 +

Maxime recently took care of this for Allwinner/sunxi. It should already
be in linux-next now.

ChenYu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
