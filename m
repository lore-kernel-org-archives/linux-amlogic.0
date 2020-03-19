Return-Path: <SRS0=2SAA=5E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BFDC4332B
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 23:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB712076C
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 23:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLDZZsgJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j8G9K+B+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB712076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53JuKPV3H0xBB8NyqX10XbE5/6G/+3racTRA61eDmnA=; b=bLDZZsgJog2xm5
	p585v/4DBSVkWnhMZd1Y0zdYc//TbZwZaX4VvPZ9ibpKVoCTO8B8GQTiVlD/mk2KWAkM/oEqsjuQ1
	3iuX6eRd/RoXSgwbpDY1wndME9+a6ltflm6ALqIbqDsHQ3vHU9vuoj/kQgNyqTfYFj1zA85nHKGNs
	8sQVcLUsJTm3qt3fTzwa115tCJkRLZp3DNZuUeHPF0CTedUch4L0BvCvnfqm2SIRp84QFx4PLYMY3
	fiRZijG53keF88U8WhuiRbLG52YdzscHVnm780FN27eA1aDaD7BWIXhlF77kRZz5SI0aKL7cYXDoA
	fdH8f+2LGePYE11CHGsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF4lH-0001Ne-JE; Thu, 19 Mar 2020 23:39:39 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF4lA-0001Hp-R6; Thu, 19 Mar 2020 23:39:34 +0000
Received: by mail-ed1-x543.google.com with SMTP id z3so4907801edq.11;
 Thu, 19 Mar 2020 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/mfJWmxNQuzD0dp6KizZYLJ7CLCpefixytllKpkTzc=;
 b=j8G9K+B+n/Ojbh81OEur+lMEXOYshUECgbkp9tY2M6biLvzxuXxFN6lSXsbzkFslae
 jc9HBRJfL/ELl9ivB2zl+RB7BwJBWe6Fe3cJUqDS3BvY8Ew3qTlSEHLOlAxL28+8zSzI
 K5mjzp5BIPEOKCjcxnOZcDUWvMDfzyFwri/UuDoqUNbN7Qbjb/4+tlqa9mer6w8iaXHu
 eWkmtlPpdTgLysTFsSzvDEb9VUTf7QQ61jEIzK6nEAYhOoZRP38YT3+XgmgwbWUc83Mm
 gE+Xe2D0Vbn9fvK4gxEZ/0IYCMKCgwcybXlA0udklqhacor6tDl6DYRYOk6EVgM544Zt
 dSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/mfJWmxNQuzD0dp6KizZYLJ7CLCpefixytllKpkTzc=;
 b=PzmOkw3OC5bUqkTWjsl1BUD/TYBIVu3z6ERnzjTY62667AM8sGqvBqWCA/628elcA8
 sCzuYGRVfKv0gJ0oR41rut792JLmXCxtuPNOGf9f2USqcl/Xwt3mlhydt5YVP8sP499s
 DLVshPUikCyPs4KGgxuUGpTkAMn+T+ceygYseoQcWqFUoBoAjhOjDAQQLQoSgmMe5TI/
 aL1MGW4zk0D6rtRopsKtyCBWcqlGbiXi4MER2gGdX78Xm1x3GmCRDe/TfaIlyVo+Drre
 HlzAx6+ntofHJjpr6Mxts1n3Vk8FlB3JlqrUTDm5OU4bwfBRnfDUUioPnoTV05hOWCD2
 HHuA==
X-Gm-Message-State: ANhLgQ1qRRItTh+TX+n/rsjCvoAMqsPegPXGJVI2T7LfY6ZZv4sZIC0K
 pjinx8st35gtd0aa1FYIomQDZ1R3fCXZF+2DwfA=
X-Google-Smtp-Source: ADFU+vsBYF3lmb/S9MivVj1ar9fEgyHh9mNe7PH/to4h3/J9OWLSH5rf3wC8erfomQYZyINKFfGztDXrzBfrtovFz/I=
X-Received: by 2002:a17:906:6d0:: with SMTP id
 v16mr5698516ejb.90.1584661168372; 
 Thu, 19 Mar 2020 16:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200302125310.742-1-linux.amoon@gmail.com>
 <20200302125310.742-3-linux.amoon@gmail.com>
 <7hlfoir8rj.fsf@baylibre.com>
In-Reply-To: <7hlfoir8rj.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 20 Mar 2020 00:39:17 +0100
Message-ID: <CAFBinCB2WXZNRg4wdFD0RJ5k4hHqcfAOCHemvHzZE42-Mo5vzA@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] clk: meson: g12a: set cpub_clk flags to
 CLK_IS_CRITICAL
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_163932_903224_AE0008C4 
X-CRM114-Status: GOOD (  12.37  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Mon, Mar 2, 2020 at 6:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> > updating flags to CLK_IS_CRITICAL which help enable all the parent for
> > cpub_clk.
>
> With current mainline, I've tested DVFS using CPUfreq on both clusters
> on odroid-n2, and both clusters are booting, so I don't understand the
> need for this patch.
I *think* there is a race condition at kernel boot between cpufreq and
disabling orphaned clocks
I'm not sure I fully understand it though and I don't have any G12B
board to verify it

my understanding is that u-boot runs Linux off CPU0 which is clocked by cpub_clk
this means we need to keep cpub_clk enabled as long as Linux wants the
CPU0 processor to be enabled (on 32-bit ARM platforms that would be
smp_operations.cpu_{kill,die})
cpufreq does not call clk_prepare_enable on the CPU clocks so this
means that the orphaned clock cleanup mechanism can disable it "at any
time", killing everything running on CPU0 and CPU1 (which are both
clocked by cpub_clk)

I have no explanation why this depends on booting from SD or eMMC.

for the 32-bit SoCs we have CLK_IS_CRITICAL on the CPU clock as well
since commit 0dad1ec65bc30a
on G12A we have CLK_IS_CRITICAL on the sys_pll clocks, however my
understanding is that cpub_clk could also be fed by one of the
fixed_pll derived clocks (which have a gate as well, which may or may
not be turned off by the orphaned clock cleanup - that is pure
speculation from my side though).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
