Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B2BCDB483
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Oct 2023 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKRI9x+NC1owV+N0HF04ibr2RAzFdgCkT3uVwsO9kJY=; b=2FtTSHULhgwVi8
	Jcv1JErQy4MpjrSd2qHTfXI8PPvsB9oRhSY8+oXnfHiSgJKPh/oCq7UUHQ5B+/3RghC7xk6tskJS7
	DIrCXAw/YHuyK3nx1koi8Ivd7rZ7DWERjYO9fq/O5lEmLQmNGLJJSmz2IEtf58t2sY+iMuezfqXn/
	68OUcTSx5798MgEdlhaY2tfQ0toXtO0Ej9L8BT2pr++izfJul6z7Xn57zY54heXyih/PILRRBg6z9
	xx2yLjAN3ZVuy2csh1H4Qd6YkCHTfwWfhDdxbPJtkIXt6HIrVFgx8H3recLKYIw1u4MLy34FQIKHl
	sMaXsu64X7fHZNXa/6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslKL-00CYWK-1C;
	Tue, 17 Oct 2023 14:45:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslKI-00CYVa-2T
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Oct 2023 14:45:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32d9effe314so3434628f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Oct 2023 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697553940; x=1698158740; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=+DWlrz0x76UjYkaGdGnLZ2Rh1fZ6zXslYKfY1dC+IHA=;
        b=Ws3UWFm04Mmc6sUJTQeVqbjeGViXZTHtAeB8u32zLqgKU1CY8QX2mOr260H1EgsmZN
         g0pBhF8wj2Mh1CXhpDLzHaFuiRBmm9h6hmFQVloXtXMuhA/rxsSdvRwRHD7zLGFS2X8w
         zL7LFv3IcvyokFRd1vIu9Z1/87brISBUL3xhb7Hk2xmSlOxllP2wuyDms5co7vFpylAt
         jf9TTxZChUTdqyym3+CdXIwa9N+kgdGpwEezMTBgWtI+QTiin/wdPFfi56FYf9BdMbON
         7VjyjhDsqdE9yjgtJvPLae+H5a2mx+nLRyXQ8EtLFY6oqo7/RLKC8HMmlupu0IiBgQ2e
         izkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697553940; x=1698158740;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DWlrz0x76UjYkaGdGnLZ2Rh1fZ6zXslYKfY1dC+IHA=;
        b=oTOsKB4Qx+PmgJ9i5uFlJO+V+qW49QdOQzgibD2xaeiroeVYQA/9JokngUfafFiuYO
         5HXGSSGTnE165xLe35LLmyqs43lg8SkGaIrzR5iYLiYuKOMWXOYXedZTXFmmSOpR0x1s
         JiJW8UtsYqOEK+xKjhwjLiKak21sy8wscqWTzil9kkzUVkvhh3lixGH13VM7hv/5h53f
         djPrc9UAqy9LRH5/DkF7Pm43kZihOhCOpZ7BVwY3vqSlfDEUMNOvhNF3Ja1CldQr/wxs
         sHLuWlv6iT9Wrbdp3G4nawRNigvKHY3VPg57vuqN38tGUpCSK3lyVzx2Gbedti6em4v2
         ZiEA==
X-Gm-Message-State: AOJu0YxEHNsBpO8rAwDOkBb0EOhQ0NG8q3uBb7sbWTRFMRgpy7YJRY3w
	nhnUIasKfeaixtfjXh2xRkGaxQ==
X-Google-Smtp-Source: AGHT+IHv4tMX6UOg3kp7PY1gGcIQM6g1TDAYAriGkQzPC8aBujNF8FwzAx86QVQ0PfLQQ8q7Fyek6A==
X-Received: by 2002:adf:f006:0:b0:32c:ea14:89e5 with SMTP id j6-20020adff006000000b0032cea1489e5mr2086062wro.39.1697553939617;
        Tue, 17 Oct 2023 07:45:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:93d3:2aab:95bb:3a09])
        by smtp.gmail.com with ESMTPSA id d18-20020adff2d2000000b0032da40fd7bdsm1836412wrp.24.2023.10.17.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:45:39 -0700 (PDT)
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-4-xianwei.zhao@amlogic.com>
 <1jil7ax64i.fsf@starbuckisacylon.baylibre.com>
 <3238e57a-1141-53ad-8170-c6ad9df03acb@amlogic.com>
 <1jfs29v0n3.fsf@starbuckisacylon.baylibre.com>
 <8011f0c0-0d21-447f-9a6b-07ede7db8713@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 3/4] clk: meson: c3: add support for the C3 SoC PLL
 clock
Date: Tue, 17 Oct 2023 16:42:25 +0200
In-reply-to: <8011f0c0-0d21-447f-9a6b-07ede7db8713@amlogic.com>
Message-ID: <1j34y9ux2l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074542_809695_40297C3E 
X-CRM114-Status: GOOD (  12.08  )
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


On Tue 17 Oct 2023 at 22:39, Chuan Liu <chuan.liu@amlogic.com> wrote:


>>>>> +
>>>>> +static struct clk_fixed_factor fclk_div2p5_div = {
>>>>> +     .mult = 2,
>>>>> +     .div = 5,
>>>>> +     .hw.init = &(struct clk_init_data){
>>>>> +             .name = "fclk_div2p5_div",
>>>>> +             .ops = &clk_fixed_factor_ops,
>>>>> +             .parent_hws = (const struct clk_hw *[]) {
>>>>> +                     &fixed_pll.hw
>>>>> +             },
>>>>> +             .num_parents = 1,
>>>>> +     },
>>>>> +};
>>>> This one is wrong if I follow the doc.
>>>> It is supposed to be fixed 8 divider taking it's source directly from
>>>> the DCO, skipping the OD post divider ... assuming the doc is up to date.
>>>>
>>> No, C3 SoC div2p5 is not skipping the OD post divider.
>> I a bit surprised there would be a frequency multiplier considering the
>> complexity of it, when skiping a divider is possible HW wise. Are you
>> sure ?
> This part confirms with our chip design engineer that fclk_div2p5 here is
> actually a clock output by a divider with decimal (divider factor is
> 2.5). The divider factor in clk-divider.c is int, so this description is
> used in the software. Or what do you suggest would be a better way to
> describe this type of divider with decimals?

It's alright. keep it that way then.
Consider fixing the doc maybe.

>>>>> +
>>>>> +static struct clk_regmap fclk_div2p5 = {
>>>>> +     .data = &(struct clk_regmap_gate_data){
>>>>> +             .offset = ANACTRL_FIXPLL_CTRL4,
>>>>> +             .bit_idx = 4,
>>>>> +     },
>>>>> +     .hw.init = &(struct clk_init_data) {
>>>>> +             .name = "fclk_div2p5",
>>>>> +             .ops = &clk_regmap_gate_ro_ops,
>>>>> +             .parent_hws = (const struct clk_hw *[]) {
>>>>> +                     &fclk_div2p5_div.hw
>>>>> +             },
>>>>> +             .num_parents = 1,
>>>>> +     },
>>>>> +};
>>>>> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
