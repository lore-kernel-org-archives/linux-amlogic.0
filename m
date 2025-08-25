Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F8CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WB8auAnAzZkSRmFybExzSrp4M/4tsyfjV1med+7gcRk=; b=ZJ4iXA8Qtxh/IC
	HYTx2OTDiCIEgmiAVq6vJYyDu+0AMCyx53J+XIyKfVeunr86GNmxzHy1IH+LFyCTxiR0Mj70a7qDq
	mEcsWcTNi9JCHCFsYA2gRqNmvX2413E8MbChWOG/dIF2Y9+rK2oh0q4PVsu+LY9GLCCfWRgLkDK1I
	aUl3iZ1LIXeh3SCIW1cRTUUxUS6NdAyEfFKbuFpZ10GCAPtTy5yHSKfOkkVybWDpcbA204XwOkigW
	qT5L3w7pN+GFO/LjwMTrBGvJ/Z/J8wTTVBEM+myjPkiOAe17BuT1VjaTWjzXAGBIcAAcSxW70IXwy
	4BF61mtqsYnNyp19b1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSxs-00000007PJk-042n;
	Mon, 25 Aug 2025 08:54:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSgm-00000007KvY-0YUd
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 08:36:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b5d49ae47so4324365e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756110986; x=1756715786; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=27QAgJVdcNVUAUk2ncH8A+hdeQ06ehFuAOKzeG3t1Sij6hzMXEQizhOTFJnwlbGcnr
         kK+HWOykLm/Y40qfkrM0LKjn+zGL62VGJ5nR6pcde9he5jWwh1tyGBWW4No+x3abfPyY
         EB3TzZnIab73NNr1ARkzzT4QpIkCcFxYF/TsMZNd5/xndqht70F5ktuwTWimbrkaSrt3
         D3kY/sv609IIFirzvxkT8IJZFf+cXIH+kGITMeUCW//BS3eCUVG0WnWM10ETeH67zLGI
         uJTZoLGGT/bne51EChW/9WLucay3kYb5RFedTKiWKMIgNjIGRBmDyl0j/XhVdcUvnK6P
         zEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756110986; x=1756715786;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=Beq54zch2KSlqiqvHNXwNWQ2mXYItjwIBYoqjycUhExrXPn32fYGb/4QaJb69IMl6N
         JSUilU0Icuru/tUwSb8a87SR269hQ9cCtgKh4W7HMZYU09wvWNnBtn5yj6XRtIBHYu2+
         FgkTYPmRvLrtP/mSmlIJYP4M4Mr4mFMgbPKonOLHhF+pxzN5uh7laZ5Zsmx1MnMvpodH
         egJy0oYdelb5SczwCcgcmhJZGgy7mxeT/75A+DVzjswl9bab2uzePttplvdoJwD0HNoy
         K7NYt+aAKdkOF5KapPcy9i6hckWAUemllGN1uOo8Tsd7quz/D0JBijlAQYErE94qpNp0
         RsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx/FYZEIkv/BkNIhQ5I9Td3OIKJvReTnzqypnxt8HUhOBTpg8nb35x0H72fEkih/C03VJKd/Ek9ehHGlFs@lists.infradead.org
X-Gm-Message-State: AOJu0YyUzqe+d4KA6RClVaAQVr6fb6owOrz/ryA562dXlNjyoceOVKlp
	u75OrPH8k5awXrFs0PudwJ8LDwN01SCJJgLGozwbiaGrXpTtBNlKG9xiFB7gud9+U1E=
X-Gm-Gg: ASbGncuJr/8ggfAFNmY66m/P+BFVlI64WDqNLRgcnY7TnA36c2JVppAA2yrHJfuWDVQ
	J0O5VVH/k/oGWf/QHKlLozDe+cpbV9cVVHLnBNN4wx+sNgpVXTkI0v7+obrfNf23FNzdA4mq5Zj
	NgFTtW7ZswfK8qcjTIJeb5o0NDBPoSCVYtW7tp8ostN1KZz8y4/+i4uMROfmAyQT1y3SsIrKnLC
	1ToOQfQvIEUP6Nc9FlWdODR1X2IALdH5urtq0dEGmeev6uQsQ7+G/UxQ/GZYitowmqhc3Egvx2W
	HBa5HqHf9PsYitPBL0LXSl0tfgGDeGtf+NIsE96Dumq7D+L/gIXxg23Azn3o2U5nN0O6s2CQ/dE
	k1aw3G4TuGULwVMjs8YEtQA==
X-Google-Smtp-Source: AGHT+IGiamtdsGY2kDX6w9f/mzPofYs3vSisqz5ZM4c90dOvsj+B0bgxdt8+7FzKKa6/ub2RebLE1A==
X-Received: by 2002:a05:600c:b8d:b0:459:e35e:a90d with SMTP id 5b1f17b1804b1-45b517c2eebmr91517135e9.27.1756110986280;
        Mon, 25 Aug 2025 01:36:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af88:b6ba:23b9:97e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5753adf7sm99733285e9.7.2025.08.25.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 01:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jian Hu <jian.hu@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <20250822002203.1979235-1-da@libre.computer> (Da Xue's message of
	"Thu, 21 Aug 2025 20:22:02 -0400")
References: <20250822002203.1979235-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 25 Aug 2025 10:36:25 +0200
Message-ID: <1jcy8j6bna.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_013628_258355_23169303 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu 21 Aug 2025 at 20:22, Da Xue <da@libre.computer> wrote:

> The bit range 17:0 does not match the datasheet for A311D / S905D3.
> Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.
>
> The frac field is missing for sys pll so add that as well.
>
> Patched:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 996999
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        3999999985
>        sys_pll                       0       0        0        499999999
>           sys_pll_div16_en           0       0        0        499999999
>              sys_pll_div16           0       0        0        31249999
>     fixed_pll_dco                    1       1        1        3987999985
>        fixed_pll                     3       3        1        1993999993
>
> Unpatch:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 1000000
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        4800000000
>        sys_pll                       0       0        0        1200000000
>           sys_pll_div16_en           0       0        0        1200000000
>              sys_pll_div16           0       0        0        75000000
>     fixed_pll_dco                    1       1        1        3999999939
>        fixed_pll                     3       3        1        1999999970
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 66f0e817e416..f78cca619ca5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_FIX_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_FIX_PLL_CNTL0,
> @@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
>  			.shift   = 10,
>  			.width   = 5,
>  		},
> +		.frac = {
> +			.reg_off = HHI_SYS_PLL_CNTL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
>  		.l = {
>  			.reg_off = HHI_SYS_PLL_CNTL0,
>  			.shift   = 31,
> @@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_HIFI_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_HIFI_PLL_CNTL0,

Thanks for this.

While this is indeed the same topic, this is doing 2 things at once.
Could you please split this, fixup in one change, adding the missing
frac in another ?

It is much easier to handle in case something needs to be reverted.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
