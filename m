Return-Path: <SRS0=EzQI=3J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE15C3F68F
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 09:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240CC2077C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 09:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qAb7a3FT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbYBd1i7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240CC2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F+O75StO7g24MA6grm++M93QI/SsO9kesANzKN6SauY=; b=qAb7a3FTJ8IAOVVlSAC2fDmcr
	qhnD2+O1sFX9peCtEnhQQxw719jXS1bKkCMVA3CiFoIFiJpf9d9+FCCFHyCrs/VbVcw6W4P6D+lZV
	AwkiEnwZmGzRBxR8vC9AzXnfbKMexYhETeDHId4mgcT46eQorpUyhwGOmnvG6vheggluCkSj/CVvM
	Jnsw+RicbhSC2VtAM2han7UY1BakbpuLPw7YdZK4DRb7VoFXOEvh/ijwo5mOtPkophHukMTH2Qui4
	/hbTywzyhFWgjOTsFCKUxPQSaIpLPx0/0BjSe81qw3o/V0LyFXhYzcSd9vkudOqYVxaf2rzx0Bmpr
	QlsnprWTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itT0O-0001ej-AA; Mon, 20 Jan 2020 09:05:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itT0H-0001db-7p; Mon, 20 Jan 2020 09:05:54 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7E862073D;
 Mon, 20 Jan 2020 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579511148;
 bh=hOGKfcLdv9OKkNbqFbJrj6fJFh85PVPo/RJsKujWiAo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KbYBd1i7M1f6Yi0KbjFcHi7YS7/6lzCyR+2JxRRHfgmnMVia5eOQJ2GGnK/JBx0LP
 3gAE456ROqcf1XhKUVbR3cd/UJCKZIDyOj8x5UaTUH1Kpmdulkkbwe6veIF9ydwboF
 S+sYd70GT8p0L9wX4178FSqtf7Fn62N4DhyxDuRc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1itT0E-000DbN-Tx; Mon, 20 Jan 2020 09:05:47 +0000
MIME-Version: 1.0
Date: Mon, 20 Jan 2020 10:05:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: Qianggui Song <qianggui.song@amlogic.com>
Subject: Re: [PATCH v2 0/4] irqchip/meson-gpio: Add support for Meson-A1 SoC
In-Reply-To: <20191216123645.10099-1-qianggui.song@amlogic.com>
References: <20191216123645.10099-1-qianggui.song@amlogic.com>
Message-ID: <8e78c2728bec3601cb9a6615a7f5b103@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: qianggui.song@amlogic.com, tglx@linutronix.de,
 jason@lakedaemon.net, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, jianxin.pan@amlogic.com, xingyu.chen@amlogic.com,
 hanjie.lin@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_010549_301647_04D219EE 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jason Cooper <jason@lakedaemon.net>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2019-12-16 13:36, Qianggui Song wrote:
> This patchset adds support for GPIO interrupt controller of Meson-A1 
> SoC
> which use new register layout, two main things are done in the patchset
> 1. rework current driver
> 2. add a1 support
> 
> changes since v1 at [0]
>  - place initial macro after the definition of param structure
>  - make common data as parameter of initial macro
>  - add dummy init function for previous chips
> 
> [0]https://lore.kernel.org/linux-amlogic/20191206121714.14579-1-qianggui.song@amlogic.com
> 
> Qianggui Song (4):
>   dt-bindings: interrupt-controller: New binding for Meson-A1 SoCs
>   irqchip/meson-gpio: rework meson irqchip driver to support meson-A1
>     SoCs
>   irqchip/meson-gpio: Add support for meson a1 SoCs
>   arm64: dts: meson: a1: add gpio interrupt controller support
> 
>  .../amlogic,meson-gpio-intc.txt               |   1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   9 ++
>  drivers/irqchip/irq-meson-gpio.c              | 137 ++++++++++++++----
>  3 files changed, 122 insertions(+), 25 deletions(-)

I've queued the first 3 patches. The last one can go taken via arm-soc.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
