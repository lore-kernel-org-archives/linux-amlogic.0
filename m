Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE3BC7115E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U34+XvrCgQQOxkub2Ld4JJNxAGn2lVISEzHc7Xbg2Dk=; b=rEhFljOxkP+x9D
	7NwYGSgflSP+f294y5nOS6BCJFZV7Zp6QIwnfALFbfjESyDY1Dgfs33xFCP2vTgiWfXvMn0cxVKMv
	ZSUtd9BNEkEobmw1cq1ploKMyAdzhd5l0a5FuGtRSjPwsWwYc13jvh72OxMFVnKhAuU4Zc8FOapoP
	K2L0LWXcS2646lu2aYZUdLDHAYor9nAs3OX44AQWHCveIBlUKaNpq82n8hfD4Do8v2MDaR7MAAIAl
	Ezo+bhTo4qylKA72UTf1j9Jio1yGy5b7As7EY5ckE8UUzZ4zqfgM6Mew3IlcsKOeF9xuOl4yNBnOv
	Zsq2+EpzQT1a3p6mSqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaE-00000005E0a-3A2b;
	Mon, 16 Jun 2025 18:29:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRChg-000000050Sa-0pNm
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Jun 2025 16:29:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a522224582so2599253f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jun 2025 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750091339; x=1750696139; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLMk8sUAbFDL9awvd1JVfmla5ZuGflgSXmH7EtFQNMY=;
        b=gNjrieKDRnOGiwN11S+QvSfW9PDzACXXvYHbmZo0PfEJXROck5nf4JOt0nqSXurZHj
         iDiX8GjP6Vd3Q4DdshacL7T1W2V3lt2hsMAWohwCp9fHGG8hcav69+oh2csVP8nBU8QC
         UgFI2xNdgNFiOXozsWCShBRvB9my27JeuiVSmebgNcfZxaIas1V62j+6drkB+cIgcxef
         lDSAZ2KYVpbUDf1PNqhRHPgAHNO/viBtiCwUcfr9KijqGtrKJ5OyOai/dqyrdSeNM9kl
         1mX5xmhKa5Y//ZkHI5cVLhVzx5VTH6Tudx4A/fKl7CnoaQo5pRaDPbm/g1B9wppdMgLK
         nqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091339; x=1750696139;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLMk8sUAbFDL9awvd1JVfmla5ZuGflgSXmH7EtFQNMY=;
        b=ZF9MIELg12QEnw28Qbbm1gt4TQG+kyi1VnSw98+9Ncdf00CW8/eDYlVUzfeHdloRIv
         PhK7MWOm+EMOOhh8kJFFOyb+6xm/xOWGfrTW+OuyCYzgdIlDCzvWVqYdrWD+WHywE3tC
         K8fHH6nnpQ0lYGTMYV8eplLp4TQVFktoDWwIdeJOmgzB+FL25HGvUnZC8h6/xWy0k6p/
         Y+dTUJEZe98OKn80KCglmXoc3WxCta94nfQKyYDlpN5UPxceEQzUFP5wDP9lTqK8AKmL
         GKAXRqNY5ZmiKLe6+Ne6zvnJd2LrgKrX6pKzRTj+BGw2JE8XloWWRHwEOzfo9ZQxIl72
         9dog==
X-Forwarded-Encrypted: i=1; AJvYcCV0YL9T4ue+WAIkTUAduyMsLzuESMy7SkuaDeLPr5fsnOYL03vz8IpvKTzxriZQBMUKcZQKzcyslzxgHob6@lists.infradead.org
X-Gm-Message-State: AOJu0YyyuAKSqkunJa01zksepQcA5X01byy/20CuamnvyR0e3WDJ+YUf
	Wcu2GFmxtIu9VQOvT+dr34X6swbFhU1XW68Agi8Me7z3WdVCi0uLHohEFrXRh+B7/Ps=
X-Gm-Gg: ASbGnctnWdlJOIkC0ExGLsng1D96lM0LRJ4CoCVJIRh/7I+v5Dezsrex9p4WLxx6Omg
	RstKWEKi6zjClB+SQDMWu17B/fKpdXRNqBZ1PBjvzxINKWSSX7GHZE/E3EdPIYLLfEO8cf7hzcG
	T/fgBP3xX0BJNU8VxHBoT/dANm3MCCTlvmWcllH0cRAK9u/cRt4LZGUIl8q7aFAm1xsiiuKgc1M
	s8FXReHB38brAzhRfd9KCM5TabnyI7A3HhU0HlyKl5198YY6NC3IFCtvtlrOhwY+HB6nA586316
	/LfDqJJG8f0OttNydcgn9c0Z/5xhw/H/txITEtuwvMzjskElXiV1Cib4yma+yA==
X-Google-Smtp-Source: AGHT+IG+uKVD+2uQ30rqIvYD8novgngIzsToeM/OcxULMAkMYw8cbJlVs0Ezi+EAX8FyDekCYLEjHA==
X-Received: by 2002:a05:6000:1447:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3a572371aa7mr7369046f8f.13.1750091338599;
        Mon, 16 Jun 2025 09:28:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1866:9357:88b6:f1b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a5407csm11646209f8f.12.2025.06.16.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:28:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
In-Reply-To: <ea83e375-7088-4047-92f1-31d0e7c2c331@amlogic.com> (Jian Hu's
	message of "Fri, 13 Jun 2025 13:35:22 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-6-jian.hu@amlogic.com>
	<1jzfffy738.fsf@starbuckisacylon.baylibre.com>
	<ea83e375-7088-4047-92f1-31d0e7c2c331@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 16 Jun 2025 18:28:57 +0200
Message-ID: <1j8qlrd512.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_092900_237709_A1E6AFFC 
X-CRM114-Status: GOOD (  35.36  )
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

On Fri 13 Jun 2025 at 13:35, Jian Hu <jian.hu@amlogic.com> wrote:

> On 2025/5/14 15:39, Jerome Brunet wrote:
>
>  [ EXTERNAL EMAIL ]

Please fix your mailer, can't read that reply

>
> On Fri 09 May 2025 at 07:48, Jian Hu <jian.hu@amlogic.com> wrote:
>
>  A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
> is an SCMI clock. It belongs to another clock controller, and the parent
> configuration is different from  that of MESON_PCLK. This avoids new macro
> definition in the peripheral clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54e..61b8fc2d875f 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
>
>
> This file is not meant for amlogic specific stuff. I know some found
> their way in regardless but that's being fixed
>
> I found macro MESON_PCLK is used in G12A/MESON8B/GXBB/S4.
>
> you mean the macro will be fixed? and use something else instead.
>
>  
>  @@ -134,4 +134,28 @@ struct clk_regmap _name = {                                              \
>
>  #define MESON_PCLK_RO(_name, _reg, _bit, _pname)     \
>       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
> +#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)             \
> +struct clk_regmap _name = {                                          \
> +     .data = &(struct clk_regmap_gate_data){                         \
> +             .offset = (_reg),                                       \
> +             .bit_idx = (_bit),                                      \
> +     },                                                              \
> +     .hw.init = &(struct clk_init_data) {                            \
> +             .name = #_name,                                         \
> +             .ops = _ops,                                            \
> +             .parent_data = &(const struct clk_parent_data) {        \
> +                     .fw_name = #_pname,                             \
> +             },                                                      \
> +             .num_parents = 1,                                       \
> +             .flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),     \
> +     },                                                              \
> +}
>
>
> The proliferation of those macros has been going on for far too long,
> add using CLK_IGNORE_UNUSED inside is certainly a mistake I won't
> repeat.
>
> This will be part of more general clean-up that currently depends on a
> this [1] patch to go further. You'll have to be patient.
>
> [1]: https://lore.kernel.org/r/20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com
>
> OK, CLK_IGNORE_UNUSED is added for all gate clocks. it is better to remove it. and wait for your patch merged.
>
> And  quote your comments in v2.  the T7_CLK_GATE is newly added in T7 Peripheral driver in v2.
>
> If I understand you correctly.  A common macro should be added for it and remove T7_CLK_GATE.
>
> So I add a common macro in clk-regmap.h, and it can be used for different SoCs.
>
> MESON_PCLK and MESON_PCLK_V2 difference is a clocks's parent defination.
>
> the sys gate clock parent is in another clock controller. So parent_data member is need for it.
>
> and parent_hw member is for previous SoCs which clock and parent clock are in one clock controller.
>
> How should we deal with it. 
>
> 1.Add the macro in T7 Perpheral driver.
>
> 2.Or add a common macro for parent_data,   and where the macro should be placed?
>
> ---
>
>> +#define T7_CLK_GATE(_name, _reg, _bit, _fw_name, _flags)		\
>
> See, redefining the peripheral once again ... something all the SoCs
> uses with minor variation.
>
>> +struct clk_regmap _name = {						\
>> +	.data = &(struct clk_regmap_gate_data){				\
>> +		.offset = (_reg),					\
>> +		.bit_idx = (_bit),					\
>> +	},								\
>> +	.hw.init = &(struct clk_init_data) {				\
>> +		.name = #_name,						\
>
> There is an exception in the naming convention for peripheral clocks.
>
> The name is soc id prefixed in most SoC. It is these pointless minor
> diff that makes factorisation difficult.
>
>> +		.ops = &clk_regmap_gate_ops,				\
>> +		.parent_data = &(const struct clk_parent_data) {	\
>> +			.fw_name = #_fw_name,				\
>> +		},							\
>> +		.num_parents = 1,					\
>> +		.flags = (_flags),					\
>> +	},								\
>
> ---
>
>  
>  +
> +#define MESON_PCLK_V2(_name, _reg, _bit, _pname)     \
> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
> +
> +#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)  \
> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
>  #endif /* __CLK_REGMAP_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
