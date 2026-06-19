Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5ADCD98F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jun 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOVD1NJizsd80BBiH65auNVn3YVnO5uPdZdYBv9UBCw=; b=Qy4Caj75t4+DFy
	QJPpwmw+lyqTgTVD4/soiK1UZvXhsD/jqH4pLPTJF0CrS6L961nesfuXYfmVouFq3B84Oa5ywkeso
	i6TnACwEvE7SbD3o5fsitlAniNZGSU2Hk0v82OPztPSDdpMoCaalo1gPE7oBeijAyXnX6uPl3i/Di
	1ML5H1U8E8leKExeXPDNEDm1EJAFInCNv/3QBcJtemF6DbXa7Ix5CWgRUfYdjmmaIAjajSKmtL43G
	NTq2LYfA5GB70FS+xgAAWB0qfPHolGYEDpyOUyVgbf6/dLW00rIQDvVOrgCp5NX1+kZ0NEoh03EVV
	QzBl75S27VwZ1YZoXvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTk8-0000000274P-33to;
	Fri, 19 Jun 2026 07:34:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTk6-00000002744-45AI
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jun 2026 07:34:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4923139e940so10309105e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jun 2026 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854461; x=1782459261; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6ROwWS+BraRmUYYx28pn3bvnZE1QcDyqCuuK0v9v/Y=;
        b=of+PVH+Aual4Qc3wOxG/yHT6GSE8bG0NsokuFaFOEcZ0dXRUiaJJYBkyrDLwG1yjIq
         3iqS9+6x14FXZc6UTdNIAo7m+EGA8dUv7jBM+TRHOl1/GhyXKhbn6OHh8PMejJV6eU7h
         5Le9QjOUFmk/K3vGcguWprc5KbpXwJvP756Q53NEXBzZLq+7Fx7mWhbWzyvNcdJfh8fO
         4FxFd6M1V76fEtNudgqtvvahnSE3OYeZZ5vvSXjTHUzgXqjOacEsCuytVtkmudB6jK2l
         93XF89kI8uqKMw1jk8A1QMGIXqufkut5QtK8zVk2OsgtH3B2KTfAtz/BjHo9zR8z0/Lz
         fAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854461; x=1782459261;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6ROwWS+BraRmUYYx28pn3bvnZE1QcDyqCuuK0v9v/Y=;
        b=FRp18CP/6X5Koa7l/SbllUyiWzp9MjQ2ZTcBZd6/SUSchT9RsZi1atUG8xYj70klxX
         qXO4TKYa4/q49QD1Vc/4HwFTLEa8IsuLi0/cCXMQtIJP293fRXqrHpgLHAXfPw02sbSc
         fmq5e1O+68DenI+fVb0FIJ01KUtpjj0VfLsRCgwXaDQWPaWsFvjA/jIXKXt3f6VR5jg9
         YG4eNmw0RJGefdIavErYVS19IpKPyiNhAr/uUX3ng8y88wH3pOqNrBKjCyAGpUJlde+L
         /j60tIhQSdMR2OMNQwj+xVk+e8rzijNTpkRVUbfraAxwBGn+Qk9FUV+mVMTuEEITW5mx
         ryNw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yi1w806aS0Pf5MLcAghZ6HZMKYOg7QojiaSqdFqeW0gmv4DbfoxO4KzI4ZAzgMsSYTclHetghiWlLnNds@lists.infradead.org
X-Gm-Message-State: AOJu0YzmBM85XGxYR2yrQY1L8H0/uXbxG35jXqtjQewnQUmkBOPcKXKF
	yAbnj1bOZMOQ0npt97wXVfcWMrY39s32LsgpYSzB/neMF7ps5nZpyF3GupkzOruz6ec=
X-Gm-Gg: AfdE7cn13tNtN2Wh3fzEzGvx6QUdbRR4uUSwggk5MCgaEI7ruBoUVCckTt4PkfibMfp
	g/8gl6DEvY6ljzmzItmLQkEAfmUra75VMZ2DTk4C45OSuIcxTiqd9YObpzeb2ZI2Bi5J/3BpQbM
	8MBjTk7zdLHBD4phJ75T6neasclZtACeWB29+tcUBAHFlz9CaO5brGFY3WM2TV9nIEcuzEo2tIf
	VHpq3yXHmNzPwxySyu8XqRnDA/EEl4d1U93i3BitTNYwpOZlWAvOcvdnHKxC5nashipc4klRFXB
	RUsk5SrTfaVPmRndQEIj4bpbUs+po2JrKJ4dfoQyt9vjK58fgxVsrafoOvgkgjCMBZKCapCQxLp
	lEPi9R5qM7zykDhKVFbVMd/ucdgcfz8C+IQpj1SvyOZR9/hYLjnkXB8fb3m8e19X+v558GJ2TDu
	5vF8q7/uZqoJQYu1hJrobvdg==
X-Received: by 2002:a05:600c:8b73:b0:490:c682:e37d with SMTP id 5b1f17b1804b1-4924258f728mr21532045e9.32.1781854461201;
        Fri, 19 Jun 2026 00:34:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49240084928sm47909745e9.15.2026.06.19.00.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:34:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>,
  sashiko-reviews@lists.linux.dev,  linux-amlogic@lists.infradead.org,
  neil.armstrong@linaro.org,  robh@kernel.org,  devicetree@vger.kernel.org,
  conor+dt@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <20260618100341.0A42F1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 18 Jun 2026 10:03:40
	+0000")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<20260618100341.0A42F1F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:34:18 +0200
Message-ID: <1j33yjc7b9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_003423_026872_E4800B15 
X-CRM114-Status: GOOD (  21.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On jeu. 18 juin 2026 at 10:03, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The AO PWM clocks are registered without an `ao_` or `a9_ao_`
> prefix, which will cause global namespace collisions with the main clock
> controller.
> - [Low] Typographical error in the clock name string literal for the RTC
> dualdiv input gate: `ao_rtc_duandiv_in` instead of `ao_rtc_dualdiv_in`.
> - [Low] Missing `#include <linux/module.h>` for `MODULE_*` macros.
> --
>
> commit ef5998ff087b6faed09d9eed4f59078d2b2f0a60
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: amlogic: Add A9 AO clock controller driver
>     
> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>
>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>> new file mode 100644
>> index 0000000000000..88aa8cf3f5d00
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-aoclk.c
>> @@ -0,0 +1,488 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>
> [Severity: Low]
> Should this file explicitly include <linux/module.h>?
>
> The file relies on several module macros at the end (such as MODULE_DESCRIPTION,
> MODULE_AUTHOR, and MODULE_LICENSE). Although it currently compiles successfully
> due to transitive includes from <linux/platform_device.h>, standard kernel
> practice is to include the header explicitly.

Yes please fix this

>
> [ ... ]
>
>> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
>> +	{ .hw = &a9_ao_xtal.hw },
>> +	{ .fw_name = "fdiv5", },
>> +	{ .fw_name = "fdiv4", },
>> +	{ .fw_name = "fdiv3", }
>> +};
>> +
>> +static A9_COMP_SEL(pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
>
> [Severity: Medium]
> Will this cause a clock name collision with the main clock controller?
>
> Because the A9_COMP_SEL macro uses the #_name stringification operator inside
> MESON_COMP_SEL, this will generate the clock name as exactly "pwm_a_sel"
> (and similarly "pwm_a_div" and "pwm_a" for the others), without any "ao_" or
> "a9_ao_" prefix.

I think AI got it wrong and missed the prefix addition. Unless I missed
something my self, I think you are fine here

>
> If the main clock controller conventionally registers a "pwm_a" clock, failing
> to prefix the Always-On clocks will lead to global namespace collisions in the
> Common Clock Framework and debugfs.
>
>> +static A9_COMP_DIV(pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
>> +static A9_COMP_GATE(pwm_a, AO_PWM_CLK_A_CTRL, 8);
>> +
>> +static A9_COMP_SEL(pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
>
> [ ... ]
>
>> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
>> +		.bit_idx = 31,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "ao_rtc_duandiv_in",
>
> [Severity: Low]
> This isn't a bug, but there's a typo in the clock name literal. Should
> "ao_rtc_duandiv_in" be "ao_rtc_dualdiv_in"?

Yes

>
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a9_ao_xtal.hw
>> +		},

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
