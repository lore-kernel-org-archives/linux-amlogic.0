Return-Path: <SRS0=sv0b=VF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF8C606C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2019 17:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB537217D8
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2019 17:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eC51JESY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cdBffCSM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB537217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNKo9ocPP8kEDtcppZa5Sw7He/KRnczrXtYvNZvSE1Q=; b=eC51JESYl77p7m
	6XwOTOKLxNhslZve4WHxYUmblQgOfJ0ieCDZvqpTnMAmLpc2EVMWavRqa8YkhQYBzxeQJOHWerF9m
	eoD70geqBrCWNTXHZJ4phwo9Xye+yQeaoWGkDeGI8dK1HK4/Zpaldh2mBwUO1GLW1xAGciRrINm5O
	bsIAKIQeD3jaqS5fRQhTFJDUfnVc0H4h5d3RaycfpjPbEmvWOuFUUKuq7wGYCYOoOmgBPLqYFelkQ
	C3t3TUJm6gkXgrvH2mTL5bnPfwInWGW8mC5vFiHc9fAtvgomr/jpTR/SDlm4m8tNKeuCdcDIm17QM
	QdWY30lJhq1v36RkUnHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkXd8-0000V3-H1; Mon, 08 Jul 2019 17:40:46 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkXcu-0000Im-9N; Mon, 08 Jul 2019 17:40:33 +0000
Received: by mail-ot1-x341.google.com with SMTP id r6so17063316oti.3;
 Mon, 08 Jul 2019 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSVacs8YIm4Q8FN/mo4VvWI9vvPJ+1SwGrfqSjXCwAs=;
 b=cdBffCSMGovpdqOuw2eSAroY4VE3XeTKZxsETQ39SYm80rCHztdOezzH+hyadWxoF6
 9dF8HVPWqM2q7E/vKF4k5/jrbKVOhfmoDju+uAtMNFbI/MTySJ5BUf1T96iKq5aLuUJg
 /edDw5SHMcsEJXpJlZyLKdfiM7PZ1ETj1uPHBJTw1H8278WnXEmz2dPlUImQct6O/LHi
 jLjPYYsoXgdmgPplMoare0LZmrcaFgAtR6HN3+WQvmvfpw653It07PGr6VZZLfWt5d0r
 PhbGvmsdyM1q0L6fhqjrhsUDeNpWbHLlUA3R/ocXz8R4FCpSnzbcj4DqOko+OJqaMsHC
 LJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSVacs8YIm4Q8FN/mo4VvWI9vvPJ+1SwGrfqSjXCwAs=;
 b=kwd4niFRjXuo4f+T1+UMOsxp4pb9lg6cwbLTYd47iMwkIOkt+s6hxUKsSzZB7/y9Dt
 fYBu1Fmi5vikCd76o367gzXAOXlE2cUnzD58OFOajL60JMN9Yu/BghJUpLdKOQ8xuJy3
 +sdTfc2VIe4fV6/WFLo13AgiZUgypCVZjVIUAJH/fgNC0rEGWPS/66xEQtmy89XWkDEn
 dWKu3nv2bAe5lKKYN9YE745ngAAsfvAgM2v2P2rWnzoV/YIJSkYjpqfFF41wkT7uq0lw
 agGNRzq+mmCAj66rNyB7w9FQHe2vFoD02NadsjmdEJGUxgeIwEnPo00SaEBwuAmCTuph
 DrgA==
X-Gm-Message-State: APjAAAUyL+Y3JaxVjuUJz5JoaRXJxQKC+lP+OXG1Dve48RWuUTGWwhhA
 fRpPE9cDa/aVzEE8Zl3fPSqFUxatgjJQdM+ghqo=
X-Google-Smtp-Source: APXvYqynS/GXRYen51q6ZZMCoT3bwhm+IUspfjINhfxpNq0N4KVOCnl2xnKfOrIoZv2GGw5qYNdOUzo9QUm7BhURwy0=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr16024114otb.81.1562607630822; 
 Mon, 08 Jul 2019 10:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190708173330.13217-1-martin.blumenstingl@googlemail.com>
 <20190708173330.13217-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190708173330.13217-3-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Jul 2019 19:40:19 +0200
Message-ID: <CAFBinCD8UG5PtCLzFDmiK22T03TVgGrgLB1zW3vLOAvXWs3Tvg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To: jianxin.pan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_104032_354182_41243339 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jianxin,

I thought I'd put my questions inline again so it's easier to follow me.
I hope you can help clarify some of the questions I have.

On Mon, Jul 8, 2019 at 7:33 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> WiP - only partially working - see performance numbers.
>
> Odroid-C1 eMMC (HS-200):
> Amlogic's vendor driver @ Linux 3.10:
>   7781351936 bytes (7.8 GB) copied, 134.714 s, 57.8 MB/s
> This driver:
>   7781351936 bytes (7.8 GB, 7.2 GiB) copied, 189.02 s, 41.2 MB/s
>
> EC-100 eMMC (HS MMC):
> Amlogic's vendor driver @ Linux 3.10:
>   15762194432 bytes (16 GB) copied, 422.967 s, 37.3 MB/s
> This driver:
>   15762194432 bytes (16 GB, 15 GiB) copied, 9232.65 s, 1.7 MB/s
my EC-100 board uses high-speed MMC (no HS-200) mode only and it's
really bad there
on Odroid-C1 the MMC the performance is at ~70% of the 3.10 kernel driver

my thinking is that phase tuning "fixes" the performance on Odroid-C1
(EC-100 doesn't use tuning because it's not using HS-200 mode).
I could be wrong here though. Please let me know if you have any suggestions


[...]
> +               if (mmc->actual_clock > 100000000) {
> +                       rx_clk_phase = 1;
> +               } else if (mmc->actual_clock > 45000000) {
> +                       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
> +                               rx_clk_phase = 15;
> +                       else
> +                               rx_clk_phase = 11;
> +               } else if (mmc->actual_clock >= 25000000) {
> +                       rx_clk_phase = 15;
> +               } else if (mmc->actual_clock > 5000000) {
> +                       rx_clk_phase = 23;
> +               } else if (mmc->actual_clock > 1000000) {
> +                       rx_clk_phase = 55;
> +               } else {
> +                       rx_clk_phase = 1061;
> +               }
this MMC clock frequency to RX clock phase mapping only seems to work
for FCLK_DIV3
how do I calculate this dynamically?

[...]
> +static int meson_mx_sdhc_register_clks(struct meson_mx_sdhc_host *host)
> +{
> +       struct clk *mux_parents[MESON_SDHC_PARENT_CLKS];
> +       struct clk *mux_clk, *div_clk;
> +       int i;
> +
> +       for (i = 0; i < MESON_SDHC_PARENT_CLKS; i++)
> +               mux_parents[i] = host->parent_clks[i].clk;
> +
> +       host->clkc_clk_src_sel.reg = host->base + MESON_SDHC_CLKC;
> +       host->clkc_clk_src_sel.shift = __ffs(MESON_SDHC_CLKC_CLK_SRC_SEL);
> +       host->clkc_clk_src_sel.mask = MESON_SDHC_CLKC_CLK_SRC_SEL >>
> +                                     host->clkc_clk_src_sel.shift;
> +       mux_clk = meson_mx_sdhc_register_clk(mmc_dev(host->mmc),
> +                                            &host->clkc_clk_src_sel.hw,
> +                                            "clk_src_sel",
> +                                            MESON_SDHC_PARENT_CLKS,
> +                                            mux_parents,
> +                                            CLK_SET_RATE_NO_REPARENT,
> +                                            &clk_mux_ops);
> +       if (IS_ERR(mux_clk))
> +               return PTR_ERR(mux_clk);
> +
> +       host->clkc_clk_div.reg = host->base + MESON_SDHC_CLKC;
> +       host->clkc_clk_div.shift = __ffs(MESON_SDHC_CLKC_CLK_DIV);
> +       host->clkc_clk_div.width = fls(MESON_SDHC_CLKC_CLK_DIV) -
> +                                  host->clkc_clk_div.shift;
are there any constraints for the divider?
the driver from the Amlogic kernel sources does this, but I'm not sure
what this is trying to achieve (and why):
       clk_div = input_rate / clk_ios - !(input_rate%clk_ios);
       if (!(clk_div & 0x01)) // if even number, turn it to an odd one
          clk_div++;

[...]
> +       mmc->max_busy_timeout = 0; // TODO: actual value?
do you know the actual busy timeout of this IP block?


Thank you for your time!
Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
