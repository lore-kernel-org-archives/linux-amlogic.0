Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED166CCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 08:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xX+KP84tAJMjqwS9rNXXsGDbhU7x1ZeUN9OhwL0bdEk=; b=W6kdG3/3kt8Kzk
	JPEOKNtcTxpEGWSGK4mHaR/u8TSexoOCfiOBxJ4XDKsCb7/TYQlZagqMLQvJ7piZigA5ttq5dYd49
	DLm6hB6Mzt1Usj6N775NCVMRjiLVcltgv3ZdmP8jvv9NnJiVFoGVsfCZOu40ITTZuSSp5hJHa7fdw
	4jYTqZ4S9gYvunkIIlcecacr6sbap4Z1cWMCbtB/rsFf8wyUS2i00LbBApFHqJ/Lv0zwARUmzGxRr
	xYIs87oVRNgMUoieStxOj3AoX17bp5n+tyhCwEiXMrehSZs+7onNJ/C7jt/lLksUuHVBYDZvE/Gvw
	B1ZjQQSqOLRKSlzkhxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODD-00000003lu6-0A1a;
	Thu, 30 Oct 2025 08:40:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODA-00000003ltM-040P
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 08:40:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429b895458cso235344f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Oct 2025 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813646; x=1762418446; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6Foz8MaHxrmEMOx8NcxHNFwNAdtDbaYeCNwJR7rWXU=;
        b=cJoJ5/5zZi/US9P6jB2i+gTYUxUkDXqaFQLxlEShsMLN9LJTx1R1+m+NTqI57IVA8a
         f+FMbd0h0bWJihFU8kuxhhMfUNH/c7noiEF86kVkN4FWHAZIbg+gAjgPWAsozQVwvE12
         bGuNglOOYaw2DDOzif4cNjRUFIl8Osca7H137tYgdeslhWwG7qe0flQHbZKq3xCnJSfS
         nU1prmtM20f35JOBzQiGrpX4j4tjBOKxeAkCDlNZf7Ke2LSLFfdsyPqJioLkTNZ2f8rq
         kBqKJl5VnMMC6kkpOjplvcM9LpQwZAvUYjmjz4uo6zI5JqSzkV6MSz/LcjpGiad968Nq
         +4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813646; x=1762418446;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6Foz8MaHxrmEMOx8NcxHNFwNAdtDbaYeCNwJR7rWXU=;
        b=hDsA3OLbbwblL6JRnPg+jZ3Y9kjU/FzimeDKqZSwO0a+dY0HYOP2TunM3VbijMfofr
         /wNHpUU/BJejTZ9YBU1DdmmZROvBbru41NpY1l9ptmxi3U5wySIg2i2vDnsweHyb+XCf
         Un0wfGb6lzcIpv9tirdPYQYsBYqAxdmKkpcN6ijnOOWXcO6hwNloVDve3X8Y1qy8axE8
         lPJVK5V9xC43HibEjWIWKsIQnx1DDMuVUxAWf/K7vZ8C1MAGiyPAb90jAxL9Et88o8s/
         SwFz2RBBcE2ztjjcxwIjVHmfdoQNDxAiWeypVHdks4DaoUMWTky6EKKAgLBDCTkUEwuT
         fcBg==
X-Forwarded-Encrypted: i=1; AJvYcCW02B/yADwlB55wKszhkyzidETAsOjTjsoNWIWsecl3iQnx8JoVr1gA2qnSXdrN8yxqSgW/Fy3FOgkpjMZy@lists.infradead.org
X-Gm-Message-State: AOJu0YzeQv1laX6NDx6VOaYQ1HN+bplpy1ZDNDs4nbxlUAKGlZkbfbex
	H8P7n8JnAr0QO16GAjd7rsy4fFbSUidTR7Y0G+U0HXlfBYCRXXZoow2z4809ssMTGwM=
X-Gm-Gg: ASbGnctz9nwVpayeoTeojxcClJ2nLADZgJ7qvwP9dApDjrVxUmmPfYyv6O5ptZT9j8J
	qpDRb3V7GuyqI5XDhQEUDYh4YpqYwcUYE/CVcLKMrOo7mhFqe+CK5UgyW+41WaZ2hLgIX2c046c
	sIWymoTQZRoVIgu83v5E3QMVvWfAmfQ1z/WGwEnG1SQOvWGyCxdG/ZcNiE5I4Sto/8dtkpHe+bB
	r8w2ODcrqq9/toJYwg88z/49Nmr/74byMp6Drd5dYZoLm5uaPON31wmv26oPpjkOhQvpflPU8ww
	9IQ4iC2EjfiQ6a3+uVF2hjR27/xQkwdX5jutG3NodcUbPPfduRMWRT/l7fPqnH2pgyy7Nky4gKF
	6O894gaBTJSaq4iPvi//+n4HI4Xcy1LhehY6sCNFDyoIUKbUlCNy9ghqK5Fpm+OtOMHJy9aX6vI
	CMSC/yA2kZ
X-Google-Smtp-Source: AGHT+IGwgkS7kM3RE06V/HkLJNjMRlWeQ3z1eYRlCMXE2II174VLn8RIAaLYjqz/6xJH+FF23reQDg==
X-Received: by 2002:a5d:64c8:0:b0:426:d53a:fbb6 with SMTP id ffacd0b85a97d-429aefafca2mr5110907f8f.31.1761813646130;
        Thu, 30 Oct 2025 01:40:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b7a7csm30904879f8f.8.2025.10.30.01.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:40:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 5/5] clk: amlogic: Change the active level of l_detect
In-Reply-To: <20251030-optimize_pll_driver-v2-5-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:15 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-5-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:40:43 +0100
Message-ID: <1j4irgzss4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014048_091192_E9AE3D03 
X-CRM114-Status: GOOD (  20.66  )
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

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> l_detect controls the enable/disable of the PLL lock-detect module.
>
> The enable signal is normally active-high. This design ensures that
> the module remains disabled during the power-on process, preventing
> power fluctuations from affecting its operating state.
>
> For A1, the l_detect signal is active-low:
> 0 -> Enable lock-detect module;
> 1 -> Disable lock-detect module.
>
> Here, a flag CLK_MESON_PLL_L_DETECT_N is added to handle cases like
> A1, where the signal is active-low.

Given that A1 is the only ship supporting l_detect, this change is not
necessary.

Not now at least.

>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/a1-pll.c  |  1 +
>  drivers/clk/meson/clk-pll.c | 16 ++++++++++++----
>  drivers/clk/meson/clk-pll.h |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 1f82e9c7c14e..bfe559c71402 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -137,6 +137,7 @@ static struct clk_regmap a1_hifi_pll = {
>  		.range = &a1_hifi_pll_range,
>  		.init_regs = a1_hifi_pll_init_regs,
>  		.init_count = ARRAY_SIZE(a1_hifi_pll_init_regs),
> +		.flags = CLK_MESON_PLL_L_DETECT_N
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "hifi_pll",
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index c6eebde1f516..d729e933aa1c 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -384,8 +384,12 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		meson_parm_write(clk->map, &pll->rst, 1);
>  
>  	/* Disable the PLL lock-detect module */
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_N)
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
> @@ -413,8 +417,12 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	udelay(20);
>  
>  	/* Enable the lock-detect module */
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_N)
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +	}
>  
>  	if (meson_clk_pll_wait_lock(hw)) {
>  		/* disable PLL when PLL lock failed. */
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..83295a24721f 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,8 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +/* l_detect signal is active-low */
> +#define CLK_MESON_PLL_L_DETECT_N	BIT(2)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
