Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EBAC2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5FF20882
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3I1jai5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iUba+NWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5FF20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqcZnmtrDR31xCisjrpEizpt9VgBgxie0iUSYD10xPY=; b=Y3I1jai5hIkJSs
	XofO+9lZ0iumjzVbCf/EPRLqLPZTsRgwNLSn+MMLlQBH6oBN4NHoq7y7B8B0jrUiXziUtRSohd+PB
	Lbwd4iSIPrz46pNo42rcV+HgH+EVSm9WOf9RKc469k0vJ+kh78WTYCAZBzB6PoocIN1PAYvCV6jrG
	Vrnrijr4L9Rkqzcfsi97hP9ypzT4B49qeoHR9OqYKrls9tCCpDjnYH7pCnFS090Dc8OFqoIrIVSKn
	j2MOhkhJJB9ftP5iXQtIfzYRjLZzo6NCQurZQYRp/QWwCxIvYohlNZmsxgIdP0rb5sNpEu3GeWGo+
	i9v7te4hATTiPqIwJzIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iktKN-0000IP-Ab; Fri, 27 Dec 2019 17:23:07 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iktKK-0000Hm-Q1; Fri, 27 Dec 2019 17:23:06 +0000
Received: by mail-ed1-x541.google.com with SMTP id i16so25853348edr.5;
 Fri, 27 Dec 2019 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UU+ysXx+Shc0uhfL0eYU+6BwpIeAsm7S9P/UHU0eAg=;
 b=iUba+NWNA3cOXpD5+r04DSS11HD3AciHWRXYHS97zSESLqL4y0CXv4NzzuOaX99bzt
 ijCXSOhYV7ucxVIFQWm5EEk/PHpCHm262LIdFhKd3Rj0m8MgP13uJJMMPxutIF12TVyt
 NeWqHxRT6MtNP4fmJIauTMBXbxKxEjttj5+94a23FLWXoIAoodB+HyGqa6S8lOrIe75v
 i60FDLNZzZLYOIW5tvr+PcsslPbLLmKqP+wm0iZRMRi6GIy9xPTVDyI4MDcgS98s5Z5k
 0s44aKJRenjj9Cfz02DFsvOurf9rWc/4pyIoPOH42pX6++sh94sq7PqyE2MsZ3kWiC4a
 Fk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UU+ysXx+Shc0uhfL0eYU+6BwpIeAsm7S9P/UHU0eAg=;
 b=pCSBsUgINGUI4mc4j8lUQbSKnuS5fN33MGAaRocV6wDvvUI+2Kj5WIADlZXK1Lzb6O
 5knKKSwbjMqQ/NZdsl9kcYYQQl6GjgXwxZKBpVWt6LOgxKczliAju7AkTxVU0kwZ0ekk
 f7Fp1L7pNgxay5ADE8LvyzbhbOZDSIxPJ6ZpI+Udubdb8az/UJfdDk28FIbL7V5YT3Jw
 6dEgv5jSurT5emVW7DqDMCgLCTDtTPgrBkrqSrBL8bruVxmhO6vjEPmzMarN8z65JA3Z
 my8bHwkCTKck0ZiSxEncX6lZvodSrV0L4eFxtfc5QLzq7BclLwrnF5rhs2jkatpRV6qf
 S+Yw==
X-Gm-Message-State: APjAAAWsIa9KdKPdM7qJFr1G4/pkuvIJjfyKtmQUVRQ5yQdFPFewvV+U
 cEVmXU36Sjvwxd+GNDzruTc40/r3SKmZ5n8XxKE=
X-Google-Smtp-Source: APXvYqygztpCwMZ2tOw2bt5blxVcse049EWJn1V8ypi9uRoEfMAWYxJV7H8W3FniudLtvI6csg6ZP2n5//ATD5ueUVI=
X-Received: by 2002:a50:bae1:: with SMTP id x88mr39175305ede.10.1577467383228; 
 Fri, 27 Dec 2019 09:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20191227094606.143637-1-jian.hu@amlogic.com>
 <20191227094606.143637-6-jian.hu@amlogic.com>
In-Reply-To: <20191227094606.143637-6-jian.hu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2019 18:22:52 +0100
Message-ID: <CAFBinCB_0+k6rGxChpB77rPUrb-0mzxt_nQWXbiztCJnJq8XnQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] clk: meson: a1: add support for Amlogic A1
 Peripheral clock driver
To: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_092304_870806_DAFC6662 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Chandle Zou <chandle.zou@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

 Hi Jian,

my comments and questions below
please keep in mind that I don't have access to the A1 datasheets, so
I may ask stupid questions :)

On Fri, Dec 27, 2019 at 10:47 AM Jian Hu <jian.hu@amlogic.com> wrote:
[...]
> +/* PLLs clock in gates, its parent is xtal */
yes. doesn't the code below describe exactly this (what is so special
about it that we need an extra comment)?

[...]
> +static const struct clk_parent_data sys_clk_parents[] = {
> +       { .fw_name = "xtal" },
> +       { .fw_name = "fclk_div2"},
> +       { .fw_name = "fclk_div3"},
> +       { .fw_name = "fclk_div5"},
the last three values are missing a space before "}"

[...]
> +       .hw.init = &(struct clk_init_data){
> +               .name = "sys_clk",
> +               .ops = &clk_regmap_mux_ro_ops,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &a1_sys_a.hw, &a1_sys_b.hw,
> +               },
> +               .num_parents = 2,
> +               /*
> +                * This clock is used by APB bus which setted in Romcode
like in the PLL clkc patch:
- setted -> "is set"
- Romcode == boot ROM ?

[...]
> +static struct clk_regmap a1_rtc_32k_sel = {
> +       .data = &(struct clk_regmap_mux_data) {
> +               .offset = RTC_CTRL,
> +               .mask = 0x3,
> +               .shift = 0,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
CLK_MUX_ROUND_CLOSEST means the common clock framework will also
accept rates greater than 32kHz.
is that fine for this case?

[...]
> +/*
> + * the second parent is sys_pll_div16, it will complete in the CPU clock,
I was confused by this but I assume you mean the parent with index 2?

> + * the forth parent is the clock measurement source, it relies on
> + * the clock measurement register configuration.
...and parent with index 4 here

[...]
> +static struct clk_regmap a1_pwm_a = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = PWM_CLK_AB_CTRL,
> +               .bit_idx = 8,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "pwm_a",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &a1_pwm_a_div.hw
> +               },
> +               .num_parents = 1,
> +               /*
> +                * The CPU working voltage is controlled by pwm_a
> +                * in BL2 firmware. add the CLK_IS_CRITICAL flag
> +                * to avoid changing at runtime.
on G12A and G12B Linux has to manage the CPU voltage regulator
can you confirm that for the A1 SoC this is really done by BL2? (I'm
wondering since A1 is newer than G12)

> +/*
> + * spicc clk
> + *    div2   |\         |\       _____
> + *  ---------| |---DIV--| |     |     |    spicc out
> + *  ---------| |        | |-----|GATE |---------
> + *     ..... |/         | /     |_____|
> + *  --------------------|/
> + *                 24M
does that "div2" stand for fclk_div2?

[...]
> +static const struct meson_eeclkc_data a1_periphs_data = {
> +               .regmap_clks = a1_periphs_regmaps,
> +               .regmap_clk_num = ARRAY_SIZE(a1_periphs_regmaps),
> +               .hw_onecell_data = &a1_periphs_hw_onecell_data,
> +};
same comment as for the PLL clkc: please drop this and use the
variables directly inside _probe to get rid of the struct
meson_eeclkc_data (so I won't be confused about "EE clocks" on A1,
while according to your description there's no "EE" domain)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
