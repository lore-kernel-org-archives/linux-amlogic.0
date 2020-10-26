Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7144BC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED5322450
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="roaQxLrJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V/fE40tc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED5322450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1zMjXkpNtTzOwKHoZ3tu/Piqzo756fMOIxbOHElNz8=; b=roaQxLrJf+RhrIv21SbzqDa0p
	72oLBEKFkPCBF6m1QMRPvT2vfEumashutm/Z6Czww/amfU9pw/cMS+n4v4/9TBoQyBVian5FxNCU7
	dfICPo2ylQdHBRsychL1Eq4wCYODBLddM3bp1nVQP3YPDuHmyPDbwLPJ8FNcLOKC23QrL2RSWXyCZ
	Q82F5MLmCtmuCreDpprsqmY92QfoT5KlYzXenybMEh/561FvC1Jmui7/ueJwWpyFbQqVEHavknkH6
	+q+jXrCZ+8bAe9lu7WJEvXx+VeiRJGnVTz5tkpMdBkzzST0qjeRiMpT0VIUpOE0wmHY/R7+IYPrzo
	LZ/YHha8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX5CY-0006Rd-Em; Mon, 26 Oct 2020 16:18:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX5CU-0006QU-Nf
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 16:18:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id s9so13277636wro.8
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pQ0aH8vkh/RuMG2EbCkeHZofkPtOKcG6AGLMjFaIfKo=;
 b=V/fE40tcYq1luuBZ0MbaRboqBRgpBc7MEkmzkf07U4AC4J7Ip1aq5NP3Ywo4ZyXeo7
 aEash4Aw1EkEc5Y2yMZwJ6ptcOX0POFo91TkimvhjZJGNIS1oxXv4/7nRngjAwyQuruu
 GAqKTHRRsul8vNs+qi/8Nw2l7E8Yq3jQkwloQXPchJuYJ/lwhEnQx9oWJEVA13e57AtX
 J/vQMC7Zx9NYr4RC3hBH/gsEPdEV8aRD55c6ORJniQqixVmSvOFkS8jImVgwDbDlmb5k
 jB2WYwxmM0v6qnOhy6v/XfD8L9npr3kgFO9hdkZyJspRMW/wFTPrvgDZXt2aVCbCL6AX
 OikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pQ0aH8vkh/RuMG2EbCkeHZofkPtOKcG6AGLMjFaIfKo=;
 b=naqmPacu26giTNiSu58Rx14/89Pr2EJNl+HycRNj3OlNQJUc7jHrBrAl1OZ9GdD0oy
 b2sSbbaU0rQsBaEXPkqKGtK/gKbfr3efjJbr8guNDcBv/cX+ZwnIhiZU0ffMDGAW7i8b
 ADjQJ0gBVV2OqxEA5m1tLoEX3LVLx9Lvs7Dshj6paRYh0diezDzMsFIojDNh84L+PKAL
 JjaO16PVGnUMCvyzhPPfI+/FiP+qujBAVVSIonj6ke9yQVVjXXvpoXfE3UIxlYDx3oab
 Q/oXkPJqO9XWB96pYcDLD7afjCeGjiRwOCo/pR5v0o9jR/ujVWwPvJyzVOgBxszsyE5c
 YHEg==
X-Gm-Message-State: AOAM530xKeF7DSJE73taGv6dDYv894Nd9EKVzYGDBvhbo8FsaKfXi4lE
 9FRy/FueOZpTjNn0KPJwIcFLXA==
X-Google-Smtp-Source: ABdhPJzOdjlZHc+JYLpJI68Uu0skwrGhj3rHqIryTu3Qk/DA8usP1837G8FFeL8i/MVqFwkCNNlEyw==
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr19756169wrp.179.1603729104988; 
 Mon, 26 Oct 2020 09:18:24 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y2sm20017573wmi.21.2020.10.26.09.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 09:18:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] irq-meson-gpio: make it possible to build as a module
In-Reply-To: <87v9eyo75s.wl-maz@kernel.org>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <87v9eyo75s.wl-maz@kernel.org>
Date: Mon, 26 Oct 2020 09:18:21 -0700
Message-ID: <7ha6w9hsfm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_121826_797003_B01F7CC1 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Marc Zyngier <maz@kernel.org> writes:

> On Tue, 20 Oct 2020 08:25:30 +0100,
> Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>> In order to reduce the kernel Image size on multi-platform distributions,
>> make it possible to build the Amlogic GPIO IRQ controller as a module
>> by switching it to a platform driver.
>> 
>> The second patch removes MESON_IRQ_GPIO selection from ARCH_MESON to allow
>> building the driver as module.
>> 
>> Neil Armstrong (2):
>>   irqchip: irq-meson-gpio: make it possible to build as a module
>>   arm64: meson: remove MESON_IRQ_GPIO selection
>> 
>>  arch/arm64/Kconfig.platforms     |  1 -
>>  drivers/irqchip/Kconfig          |  5 +-
>>  drivers/irqchip/irq-meson-gpio.c | 89 ++++++++++++++++++++------------
>>  3 files changed, 59 insertions(+), 36 deletions(-)
>
> I've tried this series on my vim3l with the this driver compiled as a
> module, and lost the Ethernet interface in the process, as the phy
> wasn't able to resolve its interrupt and things fail later on:
>
> [   72.238291] meson8b-dwmac ff3f0000.ethernet eth1: no phy at addr -1
> [   72.238917] meson8b-dwmac ff3f0000.ethernet eth1: stmmac_open: Cannot attach to PHY (error: -19)
>
> This is a generic problem with making DT-based interrupt controllers
> modular when not *all* the drivers can deal with probing deferral.

Yes, but this series still keeps the default as built-in.

If you build as a module, and you add `fw_devlink=on` to the kernel
command-line, device-links will be created based on DT dependencies 
which will ensure the right module load order.

I've tested this series with `fw_devlink=on` on several Amlogic
platforms and it works just fine, but since it requires the extra
cmdline option, I think the default should remain built-in.

So, I'd still like to see this series merged so that at least it's an
option to enable this as a module.

Also, another reason to make it optional is that not all platforms need
this feature at all, but right now we select it for all Amlogic SoCs.

Kevin









_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
