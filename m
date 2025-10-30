Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CBACCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcGT8BMlkEStl0AoYvR/RWnD+fcWz+HJXAmLOWjYafg=; b=00ZzsOYwARwdtS
	k8aQ8BIxzUEd41txMZIuBulXSOCho4fjQepulPN+4VlkcqbBNmyfMeQ5j40x4hcnxlYVfnB3Bh53L
	vU4MwD/c2+QHb1k6kpLHTO+dLA9+26RqWcjG+vBGYcHBqVOTdFsAUgLnRdtY1heJaXSR4ZCZ+6I0w
	07ME5si/t7X+0WVCOPjaNJ205FmN0BZQoLaIsTLfda0h+yhZf6KxQT0wuUpCTt0yv033K1UW04JKg
	oHTgJTCC7sk6bw4kRz3mwieA4yyU4Nd9ClFYJwSYAQzq/1DmsbvcJaHIJC4gT1+rZNzZ5NZNam2Vc
	aLeA/HPOQMsMBiz/x7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODZ-00000003m02-3pIZ;
	Thu, 30 Oct 2025 08:41:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODX-00000003lyk-0wlT
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 08:41:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso4986175e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Oct 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813669; x=1762418469; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=r3zylcjZXR+M/aCSjnZspTUqmFu5gtogAqs+BjBAg4Cg9ZKJQAl1g2JnNqSd2goUDf
         m5bK3p6rQEKNeYoSZEWoN0VI9sO5wtKT2sZEp7H+5hRm+q+7EHwXDzRY8W92BEoi3wTt
         sNVccADaY8En/ibAtHsV7eUYZdlo11pg2zEKegct5+AAb9+lznhCmymWwaN8vxfOOyrE
         Xk9Csef1XVtvAlocj6GVaBH/n9IR1VgyxrPJazBEazg1B+PZmGD1yh2wtMk3sgjucrlO
         NZzhoadfZKqFUND5LU4uxCX9zCENHMF2w6YF6IbOWFAzNn+LL4zgLv3K/xds2QpFny0O
         QKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813669; x=1762418469;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=ONnulS/nfuUOrer3xTlGZLHFXGuek6jFjaEC5h3bdzyxHgGhvWtEuHJzm/YFZQEo/C
         ZJ6++FB4ftggUaPFZzr1JTpBMD4XRtBFG8gTwGDd6TuJL5wiD9GYgoY1fsPClDlRA6gh
         EVcjaALauS6Fjp/yz+d4n8oL0Xxg5TS1OHzwFVFrFTatDxcg/A+lxzGT7R3dQUxU+ume
         qLgL7kiOmDlOWI9NKjau+cwkoPj2dtBC5T3Ry24P4EEWaWeszW66cG0k6cVe4EL31aM2
         FuKZmdtkefXeaRhH5m/uGRqyCVLDnZ4fLs1aV93Si78esBP8pDqOPaI9o1T7msF8GrWO
         VoGA==
X-Forwarded-Encrypted: i=1; AJvYcCVVEFXcRDvbBM/kbrHAONhwYGLVBC1cyvE+2WVypgcarkVFzUo60Avi3s4jzLV5VPMVD6Qus4qunaGFr/BC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+h5jsA1RhkoubLsEboKpxjapGD4ESF0BRITv1YUiJYHXIsSZd
	77NvDRcExImrXPUY9TkSlNq3vI1v/Gw96QIPf2zGfy9thJxe2Bf8EzzjIkOsU6wz0Mg=
X-Gm-Gg: ASbGncsAzvaoHOXYLAZo9WktCr0odpmv6s3JFH1qKDxF2ywu6wQNSqrTpTnA0Mouyj8
	z+66js+ZFWc7x1RlpX+qUGvQ+5jrNI/pmRu86ck986nU6+x/oJqO/wa94ZexiRTSP+JfQPamEUM
	BA2OQWVEoHCnTMC6yguepYhu0gyangEGD9EROucEYz5QPGdo4fKDWtht0RGUZfQxXTaHF5tIo7j
	CRjMiwu6yULcOwkImVHz98PGfUhrOUT0wjDMiJXydM863fFlluly7TL8KVW4JoDsBpC8y8LLik6
	64wjHIFzqrHuGyLzSipLGIyy5C1yNCCmYm4vVdyfOxpy+73XOa2yP63OGwSEohTsFU9G1BaYIdz
	9euDy665ch9kSguW8H0un3VRk7Fq6xESEUbPGqliAw30nXaOmnC8cagfbx7+Wo5prPdIEsafNpA
	==
X-Google-Smtp-Source: AGHT+IFwKPzXQBj8+qdUcovmW5nKytQ1wr3jkj35PQinv3BFL4IiVgDQRKAM+0DPrZKXF0WjOPRCMA==
X-Received: by 2002:a05:6000:25c2:b0:429:8ceb:ac3d with SMTP id ffacd0b85a97d-429b4ca2f6emr2088198f8f.56.1761813669384;
        Thu, 30 Oct 2025 01:41:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477285d1e43sm32002085e9.0.2025.10.30.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:41:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 2/5] clk: amlogic: Improve the issue of PLL lock
 failures
In-Reply-To: <20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:12 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:41:07 +0100
Message-ID: <1jy0osye70.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014111_280978_616EFC82 
X-CRM114-Status: GOOD (  16.76  )
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
> Due to factors such as temperature and process variations, the
> internal circuits of the PLL may require a longer time to reach a
> steady state, which can result in occasional lock failures on some
> SoCs under low-temperature conditions.
>
> After enabling the PLL and releasing its reset, a 20 us delay is
> added at each step to provide enough time for the internal PLL
> circuit to stabilize, thus reducing the probability of PLL lock
> failure.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 629f6af18ea1..f81ebf6cc981 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -368,11 +368,16 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);

New line

> +	/* Wait for Bandgap and LDO to power up and stabilize */
> +	udelay(20);
>  
>  	/* Take the pll out reset */
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 0);
>  
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
> +
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
