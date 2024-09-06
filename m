Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475FFCE7AB9
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD5Uu41xQTHwpGerx87IYS/+DGMd2QhrCy/jPQM4XPg=; b=Ed6xA2P/95oGu6
	8ZLC6JRFsX2hKbbQdhVSpBiegjbEcM7QtDIKzdRDy6GKwQ5xxuZ3l0pcBsmr9e3qNegGfkpcktqFh
	3xSyi169UrjTmKMbNoB+fw7hbgkjRlQ6fsGUABnKb08M4TJ4MI5DL22fNJ3geHseacOh1kh2VBn/n
	7wGghMSif1V6DBnbKRZQjX5K1bHp3CrL+bFKYAxMyvHBi7F7InYFVSKFSGPeE389Gug4lbPZp8hpa
	tNxYjBMfe8Wh7cWkX0YyCaSZ6r6NAQ1A94yyVS+1lmZ14SryZY9RIxegNNmq65zgkDcD9IaNHuXYb
	8c3K6u3TPed1pb2FDwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT3N-0000000B0zU-2HSn;
	Fri, 06 Sep 2024 07:06:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSsn-0000000AxoY-1y6k
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 06:55:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-371ba7e46easo998227f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605748; x=1726210548; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXVPGKCWkvIyxnOaace+gmP1pBIJW2/wUZj/AGb7QaY=;
        b=SqjojBikaJ1ccVKQgT+u0h5R+TypR0Rd8z0GrYCCmUOgFkhgwlYpKaK6ahCIFYdhPH
         OsRvnV+w68D7lmSPNWiG0LViVCZEf+CVNxz1oWKDqvEDG5N1YtEJMBl2ctUv3x3ybtmV
         0Qv2HzXE30wa1tAUKmRoRuL03U2PGXSe8XD21zme8ga7n8B/Q9CUOfyIQl0pdmCt+gz2
         wcYuMDhq3fReoLSFcnSk6mS7+KCcFMhKdkTpT6Al7NSx/WsJ93ZslHB7tdkvFiPn79nM
         v9d3NAMpNOhNOUiDiXbhh5HB2aPmdBuw7tGuDl7QTY+gImwoF8k5Po8DOLYegqfj6EkC
         StSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605748; x=1726210548;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXVPGKCWkvIyxnOaace+gmP1pBIJW2/wUZj/AGb7QaY=;
        b=obyqN9uATbiTzioVw4Eee6vK+Xr9mrzF4opquXBOczpY4IMzLXD0TXqKF15QKan3yP
         dNdSvWpSwc+qGhhj77VbiH3652E3PCJv6mdQsGkUBCcW39Tk2QFQQw21Sg7Jc85mBIhD
         pB6WsQmFNhNpKIS97oqpmV2fTwc/ZjyZocDQOrRwd4nr/q5/3XoPEfIb5RUpocKlugUj
         uYO60O6PdIzinmd1aw6/7P36/jjZNpXwCpFV+9rZdLgdZKfZVOiCBHEGrluNl75pdhZy
         AQOBiNSM/mkHg0akVItNVBrF/B4L/4J3U6vEvxAq1JjfJ8dO1ZxiQf1D7A8NLDFdLgXl
         +/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlSBe4oeH0kiAG8V9dq/2447y1DfFPAEGW8FLcohGjTW9l/PiYcp9lHum4QJu890SfIwLt0XPZTmRpDf66@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4p2P1sHgot2mldFyD7Y9UcO5Au41m7IStH4qzyqsLxptwmwuJ
	fw6JbXDeclXW1f1lPb74GcmIlIhDX7GSE/S78FrmqMfYTv9muPa1BeQMPzo+VPI=
X-Google-Smtp-Source: AGHT+IGN9vDlwteKqK7cnYQWXkf07Qewxeb9HmZVyNNN7jUwDQ4VFe4yEkgEVz9AUOTtKtIhJ/ptBw==
X-Received: by 2002:a5d:5225:0:b0:36b:3384:40e5 with SMTP id ffacd0b85a97d-378895de480mr914131f8f.24.1725605746995;
        Thu, 05 Sep 2024 23:55:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-375348df4e8sm9303380f8f.115.2024.09.05.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:55:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: meson: c3: pll: hifi_pll frequency is not
 accurate
In-Reply-To: <20240906-fix_clk-v1-2-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:34 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-2-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:55:46 +0200
Message-ID: <1jy145qnil.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_235549_534680_A7C807F6 
X-CRM114-Status: GOOD (  16.34  )
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

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>

The patch title is not good. the clock innacurate ... Ok, but you are doing
something about it, right ? Plus just saying that is a bit vague.

How about something like "fix frac maximum value" ? This what you are
doing, right ?

>
> The fractional denominator of C3's hifi_pll fractional multiplier is
> fixed to 100000, so flag CLK_MESON_PLL_FIXED_FRAC_MAX is added.
>
> Fixes: 8a9a129dc565 ("clk: meson: c3: add support for the C3 SoC PLL clock")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/c3-pll.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 32bd2ed9d304..a350173efe90 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -361,6 +361,7 @@ static struct clk_regmap hifi_pll_dco = {
>  		.range = &c3_gp0_pll_mult_range,
>  		.init_regs = c3_hifi_init_regs,
>  		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
> +		.flags = CLK_MESON_PLL_FIXED_FRAC_MAX,
>  	},
>  	.hw.init = &(struct clk_init_data) {
>  		.name = "hifi_pll_dco",

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
