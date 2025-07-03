Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE2BC83030
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuxN6jlYULJrHLSmVps4SMNSx/50muQDZpbDpVUyPR4=; b=t3cMYRxccjqIXJ
	sM2Z6ShaLixeeHwkxpLdon2AfTwvEFfTecekJT6BrH0ObOR1DbxGM/poz6y6jNFhPd805HCjodqYX
	NloS5lWXY5KLL+D4ZF8Ej3qVxByqKxggfhkRLVb5JSt6armCej1Z12VUdzAPuXmiilC87EJTWJNUI
	OWg5bzFvsGQdGer3GWk+LQyAl9lc/8FSuDh7a6sdQxMhNqVZXBRu3NNSg/osY3DhvDHJ21gLhHqSl
	GgGJhnfxOXu7PBovxNTrvI651SM2H/j+DqhgmfFkkcIVO+mfrdgNpjgTYfbx8gJ/JJKP3kH5sqSb4
	gfO5qtrgCATJLO5PQkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEjp-0000000AZRI-293d;
	Thu, 03 Jul 2025 07:52:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEgS-0000000AYkx-3r9Y
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 07:48:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4530921461aso50899285e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751528919; x=1752133719; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8j/0HFcGq80O81mlMY+WzGVR3ktjzb/D67nQLfvYiE=;
        b=pK5xiB+/4zF+wnoUKE50mIlBE09XewCKFB8qs+m1cDO2rb0lpuuZP+1rTA4vlMrsaT
         gx6yGq/F+eUUY86hzyTT/5uRDaPUNyFfCwke3hGu29o1ynpFdwH6Kw5+OHOoGiuy7RTE
         SdP7G2sYx+Qg7wtlanWHKaQFvooUttVXXItABNnPevuyxB/0yqtpR3SykefpdRIIAFSD
         IhI/ijm8+mXGsA3t85WdCG1FCzfc1dBrmc3kfStxgGlOldauA/fABQZLaboiSfy+9D8D
         4zvJkkgvWrfofaTF+XIyBcoO6Lq9Mlz5d/RYbjVb/aQ/3thnj/SIpmaMZjAm2BCdFWqP
         s/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528919; x=1752133719;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8j/0HFcGq80O81mlMY+WzGVR3ktjzb/D67nQLfvYiE=;
        b=VmVLOodq1jvcYhhA28IbSMFt+MJ+QNZ1QMJ+EhY3lde3RYJ6j5edwgJUSOaRXRXkqR
         bHD2hnPsQd5KS4QHMdg0bxwqHnka+5yxJ1WiOe/9TNOY1FPlnRRAG0A4LxPuD/WFZHxk
         9UNVQKRx8AiK0kMlcLqfmamwzmVFNATS0LpSTDNUOzmvo1TBusHR2CZZ2zJ3X5+V9agI
         Tt7xRE/nC1RGAaPfQx1pm1pZYSPBQksQgO1PnvW6S5SxYprBj8JcmneaPOUQ4CemxXLG
         B0/KIuU299SN86RA7JtmKUlwJJmmgIJY13q+XmnoXlkN4lUm5ilK4Zcumd/XHINN+OD9
         LjtA==
X-Forwarded-Encrypted: i=1; AJvYcCVo/lN35P6E0Db5nl/QNacEwnO6LyqaA2ayZSmDH4oMgqdmo8Egsfn6FtWrkv9TeKwGPzA1V+Pk49Y4TYB1@lists.infradead.org
X-Gm-Message-State: AOJu0YzHg8KjQn2laSg3aZ2WW0p7IqCflL2KYHV/U1LL2pdyVl3WzXJD
	6RW3tw583AQHmMswKPQhbKvwWw21sWlzQ4thqavz7Vjm569/rD9QFVOZeND1KgpVS7M=
X-Gm-Gg: ASbGncu10BcJIQb0QwQ/FfQ2Opc0yhZCuTBuCdTMS7OASK7aphfDw+0Cx8+YOe8/gwS
	BUoLGzTiMXn203n7mfMBLznuiBg3AZ+TrlbGjMI51Wvok+HyLeL1tx8ZQgsTH5eJjwi74BgWoCI
	A68MUk5O3t2Afu7S7r1FLO46TI7z4Q1IABWKq+Oxv6EnCrW1JAAqXnsucqlmFJVkJqXopIxowv0
	botBK2R6gTXk7upWi7ZjQqlq62qbK7OPQ3CTc4uZMWMIN5ocSJeuHRfOv4M5+udpUlZpM7sGtkQ
	MQqk2uAXjlryJvtkoLNsKdbnmrKZYc+M5+CSupJeQpGpS4n/u8ydMErPKjGpkA==
X-Google-Smtp-Source: AGHT+IFJpSqy935AeSkMTPdOYET1P8hC02KkMBO+l6v23mFxwRQ4BlWOp1U7Ls20FOnt3iQ5UlOJAQ==
X-Received: by 2002:a05:600c:608c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-454ab3a9274mr19797505e9.17.1751528919290;
        Thu, 03 Jul 2025 00:48:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a997ae2esm18696005e9.9.2025.07.03.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:48:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
In-Reply-To: <eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 10:51:07 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
	<eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 09:48:37 +0200
Message-ID: <1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_004841_609389_A8F97390 
X-CRM114-Status: GOOD (  21.39  )
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

On Thu 03 Jul 2025 at 10:51, Chuan Liu <chuan.liu@amlogic.com> wrote:

> hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Amlogic clock controller drivers are all doing the same thing, more or
>> less. Yet, over the years, tiny (and often pointless) differences have
>> emerged.
>>
>> This makes reviews more difficult, allows some errors to slip through and
>> make it more difficult to exploit SoC commonalities, leading to code
>> duplication.
>>
>> This change enforce, wherever possible, a consistent and predictable scheme
>> when it comes to code organisation and naming, The scheme chosen is what
>> was used the most already, to try and minimise the size of the ugly
>> resulting diff. Here are some of the rules applied:
>> - Aligning clock names, variable names and IDs.
>>    - ID cannot change (used in DT)
>>    - Variable names w/ SoC name prefixes
>>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
>> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
>> - Parent table systematically named with the same name as the clock and
>>    a '_parents' suffix
>> - Group various tables next to the related clock
>> - etc ...
>>
>> Doing so removes what would otherwise show up as unrelated diff in
>> following changes. It will allow to introduce common definitions for
>> peripheral clocks, probe helpers, composite clocks, etc ... making further
>> review and maintenance easier.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/c3-peripherals.c | 1261 ++++++++++++++++++------------------
>>   1 file changed, 630 insertions(+), 631 deletions(-)
>>
>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>> index a25e7d5dc6691d2d4a852e3d3da2b36f251cc141..a09cb1435ab108b2dcc209c6557bcd1988c4ba1a 100644
>> --- a/drivers/clk/meson/c3-peripherals.c
>> +++ b/drivers/clk/meson/c3-peripherals.c
>> @@ -48,7 +48,7 @@
>>   #define SPIFC_CLK_CTRL                         0x1a0
>>   #define NNA_CLK_CTRL                           0x220
>>
>> -static struct clk_regmap rtc_xtal_clkin = {
>> +static struct clk_regmap c3_rtc_xtal_clkin = {
>>          .data = &(struct clk_regmap_gate_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL0,
>>                  .bit_idx = 31,
>> @@ -63,12 +63,12 @@ static struct clk_regmap rtc_xtal_clkin = {
>>          },
>>   };
>>
>> -static const struct meson_clk_dualdiv_param rtc_32k_div_table[] = {
>> +static const struct meson_clk_dualdiv_param c3_rtc_32k_div_table[] = {
>>          { 733, 732, 8, 11, 1 },
>>          { /* sentinel */ }
>>   };
>>
>> -static struct clk_regmap rtc_32k_div = {
>> +static struct clk_regmap c3_rtc_32k_div = {
>>          .data = &(struct meson_clk_dualdiv_data) {
>>                  .n1 = {
>>                          .reg_off = RTC_BY_OSCIN_CTRL0,
>> @@ -95,39 +95,39 @@ static struct clk_regmap rtc_32k_div = {
>>                          .shift   = 28,
>>                          .width   = 1,
>>                  },
>> -               .table = rtc_32k_div_table,
>> +               .table = c3_rtc_32k_div_table,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>>                  .name = "rtc_32k_div",
>>                  .ops = &meson_clk_dualdiv_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &rtc_xtal_clkin.hw
>> +                       &c3_rtc_xtal_clkin.hw
>>                  },
>>                  .num_parents = 1,
>>          },
>>   };
>>
>> -static const struct clk_parent_data rtc_32k_mux_parent_data[] = {
>> -       { .hw = &rtc_32k_div.hw },
>> -       { .hw = &rtc_xtal_clkin.hw }
>> +static const struct clk_parent_data c3_rtc_32k_parents[] = {
>> +       { .hw = &c3_rtc_32k_div.hw },
>> +       { .hw = &c3_rtc_xtal_clkin.hw }
>>   };
>>
>> -static struct clk_regmap rtc_32k_mux = {
>> +static struct clk_regmap c3_rtc_32k_sel = {
>>          .data = &(struct clk_regmap_mux_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL1,
>>                  .mask = 0x1,
>>                  .shift = 24,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "rtc_32k_mux",
>> +               .name = "rtc_32k_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = rtc_32k_mux_parent_data,
>> -               .num_parents = ARRAY_SIZE(rtc_32k_mux_parent_data),
>> +               .parent_data = c3_rtc_32k_parents,
>> +               .num_parents = ARRAY_SIZE(c3_rtc_32k_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static struct clk_regmap rtc_32k = {
>> +static struct clk_regmap c3_rtc_32k = {
>>          .data = &(struct clk_regmap_gate_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL0,
>>                  .bit_idx = 30,
>> @@ -136,20 +136,20 @@ static struct clk_regmap rtc_32k = {
>>                  .name = "rtc_32k",
>>                  .ops = &clk_regmap_gate_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &rtc_32k_mux.hw
>> +                       &c3_rtc_32k_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static const struct clk_parent_data rtc_clk_mux_parent_data[] = {
>> +static const struct clk_parent_data c3_rtc_clk_parents[] = {
>>          { .fw_name = "oscin" },
>> -       { .hw = &rtc_32k.hw },
>> +       { .hw = &c3_rtc_32k.hw },
>>          { .fw_name = "pad_osc" }
>>   };
>>
>> -static struct clk_regmap rtc_clk = {
>> +static struct clk_regmap c3_rtc_clk = {
>>          .data = &(struct clk_regmap_mux_data) {
>>                  .offset = RTC_CTRL,
>>                  .mask = 0x3,
>> @@ -158,62 +158,62 @@ static struct clk_regmap rtc_clk = {
>>          .hw.init = &(struct clk_init_data) {
>>                  .name = "rtc_clk",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = rtc_clk_mux_parent_data,
>> -               .num_parents = ARRAY_SIZE(rtc_clk_mux_parent_data),
>> +               .parent_data = c3_rtc_clk_parents,
>> +               .num_parents = ARRAY_SIZE(c3_rtc_clk_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)         \
>> -struct clk_regmap _name = {                                            \
>> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
>> +struct clk_regmap c3_##_name = {                                       \
>>          .data = &(struct clk_regmap_gate_data){                         \
>>                  .offset = (_reg),                                       \
>>                  .bit_idx = (_bit),                                      \
>>          },                                                              \
>>          .hw.init = &(struct clk_init_data) {                            \
>> -               .name = #_name,                                         \
>> +               .name = "c3_" #_name,                                   \
>
>
> Prefixing variable names with 'SoC' is understandable (to avoid duplicate
> definitions and facilitate variable searching), but is it necessary to add
> 'SoC' prefixes to clock names?

This is part of the description but I'll ellaborate.

Some controllers do so, some do not. This is a typical pointless
difference that make code sharing difficult and lead to the duplication
I'm addressing now.

Both with and without are fine but picking one a sticking to it helps a
lot. I would have preferred to drop the prefix from the pclk clock
names, same as the other clock, but:
* It would have changed more clock names and I prefer to minimize those
changes
* It would have caused several name clashes with other clocks.

so prefix it is for the peripheral clock.

In the end, what matters is consistency.

>
>
>>                  .ops = _ops,                                            \
>>                  .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = #_fw_name,                           \
>> +                       .fw_name = (_fw_name),                          \
>>                  },                                                      \
>>                  .num_parents = 1,                                       \
>>                  .flags = (_flags),                                      \
>>          },                                                              \
>>   }
>
>
> [...]

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
