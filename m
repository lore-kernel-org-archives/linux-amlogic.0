Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F15EC55178
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 23:46:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BAD20B1F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 23:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qmt5NA7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0SMOf1DB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BAD20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ibj/VqbaLOYCoLVhybtDHElq2MmHFBeNT66APK1O+4Y=; b=Qmt5NA7+1Y0BIavRNmnqEq75+
	/8W8bW7ggxzTMWPHbDn5U1Jy7fUrQsgsumBYn5+deeVz/RM+jQNZmbO8bj8izIf6Z1GXj4SIShX3m
	QMi7uHxEtSbXyJX7uvVyqRvZstEAcRhLtpMrw53CXWDwa/kJ5+l5xyeY9S/zyQJ7BtgFLVMFqNpux
	hnRqUVVwP/0qeb2P1I8gH4vd3VoKXTFtAMldr7IfFY2aLmR7boSns8avolYDdGv5feFKLvSjmfWHm
	yfojo/octLtqmVn+YBpPc1Dk7I5am85Z/xVLy0ZHxvktfI03g+WC9E++m4lqkek9ErEYbuHOOd56O
	PPQW/Xtbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCBe-0007fU-Qm; Mon, 26 Oct 2020 23:46:02 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCBY-0007d8-Md
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 23:45:58 +0000
Received: by mail-pf1-x444.google.com with SMTP id j18so7116345pfa.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CEpRSfPNTBvlxfYwUVnXYQlXTvWMOmV50TdlaJw1/KM=;
 b=0SMOf1DBVnGfkBYKzhH2a0tJ+REpXkXynH4K1FkevO4XwOsdbUkx67P1TdxjmRFFi4
 LRYeADD/+TG5cvbQ8AQVgAEJjxqRsOuyvQ0OJbeK5+P+e6MQqzqUIKNdjMZYSzgMDCZD
 8edAwLsdoDn763JJSKRFFFjhStAohpC+RGJUEl7GScZzII7FCVA36BUrGlNfJaypKh76
 E9B0j2acaeKPCe/r18hK6ezi+PEG7U0Xy34wvBgFxhs2Ubh2b/HmoPSctVSKwVKf4g+v
 xrxQy9/nrV7XkafX1N87z4jsZ+G3W3pp75b5wvgZCMEOWFq0h6CiAPHQBFECayg6YImW
 Mdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CEpRSfPNTBvlxfYwUVnXYQlXTvWMOmV50TdlaJw1/KM=;
 b=Rne9eqvjICSQoR/E0cm+iKzi6IPHLsjCXLFSGOEJqeaChyMo7XaMnXgT+O92RbqsUj
 wBN7D5Lfvy+9KQgFwZiKAVB35tal9yq3nU2P+Qd7t0apNgvNGAqHQRTAeOWwAQAG/i/+
 uYSBOHH/BT9/tnuDgm9daP4e1+b3Z3TdvTuhkNs5JgR99nqF609mb3DlPjzDfCojF+MR
 h8ZiQGSwquGqOj/E/ciIg9R8c4or//0IaNi/Ytqmq5qlaItyKXK25gaRkNrFWx1Xl8Wi
 Pr1GT2g0nMkaiyNKsoJmW/AjWdEwR6cvqamvEMihLPraxvjfsm58v9+vPkp4hBhJdLWd
 Cv8w==
X-Gm-Message-State: AOAM53218bK1JHsgSD8E9mjOf+tdnuIL2raIvKv+Cc31mfGvS+heiOJv
 djIN2DpyBMgE2uHXGpVbZdhh4A==
X-Google-Smtp-Source: ABdhPJzOSOKqn3r6Vv7s50wlTif70FjRaXnKyAMdNoynVTsKPMFy/tAzUXWNhP3B1BlCZCSsjArYSw==
X-Received: by 2002:a63:609:: with SMTP id 9mr6412492pgg.381.1603755954650;
 Mon, 26 Oct 2020 16:45:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w10sm13228085pjy.13.2020.10.26.16.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 16:45:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 0/2] irq-meson-gpio: make it possible to build as a module
In-Reply-To: <b0780e423d5fa527835ba55c64dba473@kernel.org>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <87v9eyo75s.wl-maz@kernel.org> <7ha6w9hsfm.fsf@baylibre.com>
 <b0780e423d5fa527835ba55c64dba473@kernel.org>
Date: Mon, 26 Oct 2020 16:45:53 -0700
Message-ID: <7hblgoft5a.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_194557_019029_E6429825 
X-CRM114-Status: GOOD (  27.29  )
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
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Marc Zyngier <maz@kernel.org> writes:

> On 2020-10-26 16:18, Kevin Hilman wrote:
>> Marc Zyngier <maz@kernel.org> writes:
>> 
>>> On Tue, 20 Oct 2020 08:25:30 +0100,
>>> Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>> 
>>>> In order to reduce the kernel Image size on multi-platform 
>>>> distributions,
>>>> make it possible to build the Amlogic GPIO IRQ controller as a module
>>>> by switching it to a platform driver.
>>>> 
>>>> The second patch removes MESON_IRQ_GPIO selection from ARCH_MESON to 
>>>> allow
>>>> building the driver as module.
>>>> 
>>>> Neil Armstrong (2):
>>>>   irqchip: irq-meson-gpio: make it possible to build as a module
>>>>   arm64: meson: remove MESON_IRQ_GPIO selection
>>>> 
>>>>  arch/arm64/Kconfig.platforms     |  1 -
>>>>  drivers/irqchip/Kconfig          |  5 +-
>>>>  drivers/irqchip/irq-meson-gpio.c | 89 
>>>> ++++++++++++++++++++------------
>>>>  3 files changed, 59 insertions(+), 36 deletions(-)
>>> 
>>> I've tried this series on my vim3l with the this driver compiled as a
>>> module, and lost the Ethernet interface in the process, as the phy
>>> wasn't able to resolve its interrupt and things fail later on:
>>> 
>>> [   72.238291] meson8b-dwmac ff3f0000.ethernet eth1: no phy at addr -1
>>> [   72.238917] meson8b-dwmac ff3f0000.ethernet eth1: stmmac_open: 
>>> Cannot attach to PHY (error: -19)
>>> 
>>> This is a generic problem with making DT-based interrupt controllers
>>> modular when not *all* the drivers can deal with probing deferral.
>> 
>> Yes, but this series still keeps the default as built-in.
>> 
>> If you build as a module, and you add `fw_devlink=on` to the kernel
>> command-line, device-links will be created based on DT dependencies
>> which will ensure the right module load order.
>
> It doesn't work here. I get the exact same error (well, with eth0 
> instead
> of eth1). In my experience, fw_devlink isn't reliable yet. Config on 
> request.
>
>> I've tested this series with `fw_devlink=on` on several Amlogic
>> platforms and it works just fine, but since it requires the extra
>> cmdline option, I think the default should remain built-in.
>> 
>> So, I'd still like to see this series merged so that at least it's an
>> option to enable this as a module.
>
> I have taken similar patches in 5.9 for other SoC families (qcomm, mtk),
> and ended up reverting them in -rc2, because there is simply too much
> breakage. Even keeping it as built in changes the init order, which
> tons of drivers depend on. I proposed a middle-of-the-road approach
> (modules can break, built-in stays the same) which Rob pushed back on.
>
> So either we fix fw_devlink to work for everything and be on by default,
> or we keep the current setup.
>
>> Also, another reason to make it optional is that not all platforms need
>> this feature at all, but right now we select it for all Amlogic SoCs.
>
> I understand that, but I don't want another episode of widespread
> breakages, and this series definitely breaks things.

Yeah, I understand there's potential breakage things if you enable build
as a module, but that's not the default with this series so one would
have to do that on purpose.

If you don't manually enable as a module and leave the default as
built-in (e.g. CONFIG_MESON_IRQ_GPIO=y) does it work for you?  Using
your .config, I used the default to built-in and this series booted fine
for me on top of v5.10-rc1 on my VIM3L.

Using your .config, I do see issues with this driver when explicity
enabling as a module, and I'll debug those, but again, leaving it as
built-in, it's working fine for me with your .config.

I understand that even building as a built-in might change link order,
but I'd be pretty surprised if just changing from OF_DECLARE to a
built-in module made things break.

If so, I can commit to helping find/fix any issues there.

For that matter, I'm actively working on making all amlogic drivers
modular (including clocks, pinctrl, reset, etc.) and I have it all
working locally several SoCs, so I will also commit to actively help
find/fix any issues this uncovers with ordering.

My goal is to enable the *option* of building everything as modules (but
leave them as built-in by default) so I can help debug any remaining
fw_devlink issues.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
