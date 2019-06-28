Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6BCC46478
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0E22063F
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TI44nYmK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eag4mvAB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0E22063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RnVau+bH3YpE7dwc+5us5ZCZ9mIbtDDlcF5vZ+MQy0=; b=TI44nYmKY9Rxaz
	fqxIMZRGReggiZ6CuzOt1lKTrrjFwdXnADhtLL0wFLkuhzkdBZ4FSeMfBl/iL70jeoefmNLKIafmR
	HztFXSwHQ7MGfItgs0582CW2t6r5mnnsxTbgjTJZ0rW4BEdGpdANegCR27hrHdqmJY793w6zAWnKD
	s3OuCaqAACsPFKpBgKutfH8djFKy3RuyI4hmNrQj8l6KdTfLOJmutoMSyTrxTx3tias2CFzlWo4RD
	eZ0VvIrEHRy1Q5zAsji0xK+9YCPQCWFB3fw16shSKlIh4bdylwT5A144wQeHYPyIBseGKl5CDkK+e
	jAQs8qWE3y+IpB7nn9Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgvN4-0000A8-CQ; Fri, 28 Jun 2019 18:13:14 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgvN1-000094-B1
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 18:13:13 +0000
Received: by mail-pl1-x644.google.com with SMTP id 9so2896780ple.5
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Cn9Q1Wbyl5xIGaCdkoIIaNcFmVQFrY2dwxn3d9BBkHc=;
 b=eag4mvABTu4bMgSKtKRaxm6hxG1BPnj1CEDFDSDsrF6DOjCGrRewpIXSDm7hcqEmzs
 mn+E004mWDj4R879Vf9eY87+iP/Wk2xBwki3jO3juI6uyXY8phyqEjB38IK3ihQKMwMc
 Cd6Llre7Oo/KZXZxjU80RAQo/+53AG/eeK+vmGfTUy39fzItmjufUSdfnyuecNykvLT7
 ztmI8T5bDDvTG2AqW44V6lcm7kOKJs2HrwEU87a23q26iR7Yfzxpm1YAOtsxOXwa6RUk
 moDdV4v+CP9qI3+CevCjHpdLRTZsYlBKjIwkb5sHJ19IF4aHoFmNkJLypftqcz4xfj51
 xVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Cn9Q1Wbyl5xIGaCdkoIIaNcFmVQFrY2dwxn3d9BBkHc=;
 b=Bja076tNf+smiYMekTPxEPX6NbSid9TFszz1oAi2d40CR2tMlc6AEazl1OKBHOKLa3
 H+QpFtBLWg71+r/14e2YBOyHSncArzgc+yaXEnC0+lF7gsGxAmFPQosrT9JVLdPugez5
 Uas+DvyI+IhXb3+cU7xoQFjCIK9VcTJO9ymtDKMt2dPA2r+EXrwt5TzAOj1txXNgzSCl
 ZRQNFSFWBWpaN8E1bHw5uOSthUeOxu/6+Jy7bCC8ZQvYzktOz1rKelafthMR7h1h7+QP
 a9CD7eP3S1PY7VRE0Xjw8+NVGuF6vItu8pzNVgUugd1K0XOYw6h1V95b3eCgcs2665K1
 EVjQ==
X-Gm-Message-State: APjAAAWIArd4yngHb0Kfw7tjj6dCW1EoBTCLQcHxJUHZIfERDJC0XHED
 QatajRSxdUJ+PqxM0tzDPOt8Cg==
X-Google-Smtp-Source: APXvYqyO0DxNwIeVEjqqmuJf6WfYaCTaV6owpC43va2Fglh9hukvx/iaKf2dkMByt/m7tQBZXRWWpw==
X-Received: by 2002:a17:902:da4:: with SMTP id
 33mr12037670plv.209.1561745590252; 
 Fri, 28 Jun 2019 11:13:10 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id o14sm2675345pjp.29.2019.06.28.11.13.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 11:13:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC/RFT v2 00/14] arm64: g12a: add support for DVFS
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
Date: Fri, 28 Jun 2019 11:13:08 -0700
Message-ID: <7hblyhr32j.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_111311_383038_A336C925 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
>
> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
> the CPU clock in a safe way as recommended by the vendor Documentation
> and reference code.
>
> This patchset :
> - introduces needed core and meson clk changes
> - adds support for the G12B second cluster clock measurer ids
> - protects clock measurer from cooncurent measures
> - adds the clock notifiers
> - moves the G12A DT to a common g12a-common dtsi
> - adds the G12A and G12B OPPs
> - enables DVFS on all supported boards
>
> Dependencies:
> - PWM AO input order fix at [1]
> - PWM enhancements from Martin at [2]
>
> Changes since RFT/RFC v1 at [3]:
> - Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
> - Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
> - Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
> - Fixed typo in "this the current path" in g12a.c
> - Fixed G12B dtsi by adding back the sdio quirk
> - Fixed G12A dtsi unwanted sdio quirk removal
> - Fixed various checkpatch errors
>
> [1] https://patchwork.kernel.org/patch/11006835/
> [2] https://patchwork.kernel.org/patch/11006835/
> [3] https://patchwork.kernel.org/cover/11006929/
>
> Neil Armstrong (14):
>   pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
>   clk: core: introduce clk_hw_set_parent()
>   clk: meson: regmap: export regmap_div ops functions
>   clk: meson: eeclk: add setup callback
>   soc: amlogic: meson-clk-measure: protect measure with a mutex
>   soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
>   clk: meson: g12a: add notifiers to handle cpu clock change
>   clk: meson: g12a: expose CPUB clock ID for G12B
>   arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
>   arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
>   arm64: dts: meson-g12a: add cpus OPP table
>   arm64: dts: meson-g12a: enable DVFS on G12A boards
>   arm64: dts: meson-g12b: add cpus OPP tables
>   arm64: dts: meson-g12b-odroid-n2: enable DVFS

The DT files don't apply cleanly to my tree (v5.3/dt64 branch).  Could
you rebase:

Then I can put into my testing branch, which gets included in 'integ'
and it will be easier for others to test.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
