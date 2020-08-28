Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE2C433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFA22086A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LD/335jt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TXNXRBoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFA22086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wZf7k4yGxD9J0/+U9f47xTOJN6mUBAvF3aCP1y5ElKE=; b=LD/335jtrzb2U7sJC8hp2ULk7
	NEbaG6Nd8HTN0Nrw0S4IMoxpwDTcVcNOKl1gyOnNFkhlMrPeSI2qkKvqtjHBObO6o3oQ42GfkORUr
	xAorazNrCP6xKt77YrxQsO664iGfgb53suyU7RtRenqV9AVR9bXMV/bMs7foPZeYxARY0I0ETBOrm
	2dr25d781QEmXdNn1kQpBnWxOVQ+fbism2MU9MtWPyrWEGszRHRP6NLKeSQZjF1xIlHgf5Cj/bnsb
	HeQsNTs3AUB1SyhzDDvdEHFNSC/P41FSx3XJ+r6on82YyymwrMi5JGcDiWPjQOkX6F0szbeg/6f7Y
	O7UrrwSiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBenu-00028H-VW; Fri, 28 Aug 2020 13:52:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBenr-00026H-Ix
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 13:52:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id h15so1366353wrt.12
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=bBT41PTjpkxeOtnmEoEMjQZW/IInuRmPz2VzLucUDlQ=;
 b=TXNXRBoWbCfR99+m6BuMsne9w7crcganml+VXuM1yhnfzWuyUSH8bIO08cnzoDO+m2
 PoOxZ1XZCWmVpvGmwWQSOXJw8a5zy9utICHylZEC+OGmvvM+QZIjILR4hLtGB+1X93Jx
 O/E3s9+nzriK6Li1EY/CGNZUVV1GIWCo88e38bMCc/Z8OHPMRXlEVyKa2H1XaGeqI/x1
 U20TwxVeAX8bhrWFpGEgnobemVoi0YqygRdkRKKfARSa4l1O3vW3v11LyqgF3ItXNNHq
 Wxy6Sa5yhI+DBZLt7+i/9zzueqt/+yzl5+rlXPifogidu42yZjHC28pPr+inXDVkeczj
 RHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=bBT41PTjpkxeOtnmEoEMjQZW/IInuRmPz2VzLucUDlQ=;
 b=Z3RzPygxQGcj2xTkFe2wVQb9Em5pT7maIoudkbg6+/5GmJl0JnVhT1jQlW1sUGcM8L
 qzhDkWWemw4wWGbjiO5YQQ0Ww1mWw0ya5/W08gwLLBDMtIaaa+Kc6r6rYgNqETYIc04s
 Uwxs9x9S8+W0+brKEKl0sdpUT4gTgCYIuenUKgMF0HSA2/S+LZxcHA63uOsMMyGHvJkq
 kMe8yHDGUus872pPf2afXIyDtlw35n8bBPorCyXDruBAJM8tFuB5WRNkjwGxUsYDOPZs
 QeJxXvv7uDhRlURKv/t+LH5WnOZ+pLX7GAa0VLeD2atqZg0uypr2fl5bWcdTrdOIkz3W
 5jkA==
X-Gm-Message-State: AOAM532Bhvn7MV6G3xNA1iXr681CyEZEsnbYnv+IfAAzpF/a+uF+BPyP
 5Q36YF+m9PS401oIa97qGV9vHg==
X-Google-Smtp-Source: ABdhPJwxGZcjjbY0GowOYDW+dLIMgvBwqE/j+jaly5n+zkPdWErtdEEG2G5gKi3TLyKaKwyipUXMwQ==
X-Received: by 2002:adf:e78b:: with SMTP id n11mr1624422wrm.256.1598622745919; 
 Fri, 28 Aug 2020 06:52:25 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m11sm1993303wrn.11.2020.08.28.06.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 06:52:25 -0700 (PDT)
References: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stefan Agner <stefan@agner.ch>, narmstrong@baylibre.com
Subject: Re: [PATCH] clk: meson: g12a: mark fclk_div2 as critical
In-reply-to: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
Date: Fri, 28 Aug 2020 15:52:24 +0200
Message-ID: <1jft867u93.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_095227_678336_E2350EA8 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 27 Aug 2020 at 23:43, Stefan Agner <stefan@agner.ch> wrote:

> On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
> seems to be necessary for the system to operate correctly as well.
>
> Typically, the clock also gets chosen by the eMMC peripheral. This
> probably masked the problem so far. However, when booting from a SD
> card the clock seems to get disabled which leads to a system freeze.
>
> Let's mark this clock as critical, fixing boot from SD card on G12b
> platforms.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index fad616cac01e..2214b974f748 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>  			&g12a_fclk_div2_div.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_IS_CRITICAL,
>  	},
>  };

Hi Stephan,

Thanks for reporting and fixing this. That's unfortunately the things we
have to find the "hard way"

Could you please:
1) add a Fixes tag to commit description so stable can pick it up

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

2) Add a comment similar to the comment block of fdiv3 so we are pretty
clear why this clock needs to be critical and don't have to dig in
history find out.

Also please Cc Marek Szyprowski <m.szyprowski@samsung.com> ... you guys
apparently found this at them time :)

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
