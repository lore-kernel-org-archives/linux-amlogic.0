Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A626C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 11:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD0AB20830
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 11:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VrVQLFJV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HhB4Wj99";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p4lYenqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD0AB20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmoicnVBypo3+HapFVzeDJD21gtxd4fpQmAsic0+zNY=; b=VrVQLFJVa8qt3U
	94Ixb7KOVrzp59IRnvPrEd6VicXDFy4xwZtrPTHFPCtkEFLlOHLXcsbTgCQJ7VNzZVoVFQ66uZ0qb
	OCDnPTEBorEA0fDHJviM3smdEf1E8NEGlrHyMsY1neFDQ078c1LE9bojgF26bY6W2I/U2a6ki3Vj2
	oSSuSH/dum9N5e4tHaqWgbQHWL7lQc/7Szds6SHhkMAIwekTcjtcJtisYvUwcG5jFRYxOOI8AmsqU
	hH7R/lUMNUhlZUJjW5r1POBsKdJDpr5EqSL6Rq6J4Tim6omgtTVp4eFn93ArpjV2DZ2WlRANgxD1X
	JT8JIdFeAy1Rp0z6FvOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDpHN-00008v-Ad; Tue, 09 Apr 2019 11:51:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDpHL-0008Tp-Qo
 for linux-amlogic@bombadil.infradead.org; Tue, 09 Apr 2019 11:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J2G8itL6On7XrTj4IGeUKtu8uuc7mhO20zhj78qvweE=; b=HhB4Wj99mdtNDnx7k6HrU3VupZ
 YWYn694CE0uJIxeGwjoVCRoU4ueOdURCFSx00b7TD2p+R+TWJyJGCwn2+XrQT+u4u2fa1WSCH7I6z
 v3vrZeEcTpayZ5diNoQ2gghlMweJKNDDEK8oIBLhoJJcGPwmQScqhnRrpdIybNEsvFykAnVhLMtV+
 A/qp32p46OxTbm++W6b9L34px4yO69h1k5Gi50b6fkG1yX8uxasMYqRlmxzN6sh7FxrAq+vLqlqdw
 mtbKC1E9EbM8mHCI6RkPouL5Cgt2CReUIZm5yNT5Wxv2sbf9vlwwjtcHOyeyrng8aC3ha3OejzUZD
 Mfl3SXUQ==;
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp33-00056Y-R7
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 11:36:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id j9so20449473wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=J2G8itL6On7XrTj4IGeUKtu8uuc7mhO20zhj78qvweE=;
 b=p4lYenqK99tT+pYGYZhJ48Jb6j33SCV5epzBTrTaL92xw/td44gqLpZWDn3bXbNLxE
 6ACZfZLFKbgBS5kFzhMh2QXD1AQTB2rtmKUA2ssvRtCi1B8mbG9ynGJlnevKOTLJrjLn
 0bkoT5/KQaw8FyPtE6ggqd16+dgP00nFw3u2mehvdRzIlrhRNg49PsDNZqOTuhtSt4ww
 dP13KdATPJjncf1amoVEfq0ZEbHE7z9xBSiOKRcKQb2L/3tfJVLH8De6la7K7tAu/d6W
 Am/zWf3x1oZntTTzgRHocNwAuMFMkwyUiGFWn7mgsPs+as0Oct0m7rdhRYnEJLI/kSEO
 Gwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=J2G8itL6On7XrTj4IGeUKtu8uuc7mhO20zhj78qvweE=;
 b=lNkXvFKgy0AbFPo2z3O3mSsNFFTZN1jWXhwzsZo8l8/09h14IMMRoRf1uTBJ+2lxLI
 wMQHv2GJJY5UaSBV7iJWsENRrl6C0AuzqN0pMsuLMVEDyJ8+yaLPqOFGFh8eu34mpJ64
 QMWiV/uOO07uKWj8QHF6BEAnRyfO3NB1nmfazRqEbCw+Z+vfFaK6E6cAnb+OKdumle+c
 Au1eLTArQUdTE1Y303xZ/zjCu7C6z+TBmFY33nVrchdjRViYmTlxaXtYqeps7XZXG9iy
 wTOBJKJBP2iB8gQ/b4n3d5XeerD/hCJJ0MBq83qevAWALXiZRBXIzYw1J3hxWkKclHM4
 gNJw==
X-Gm-Message-State: APjAAAW7hBv0ik59LVCfYkJSd4tu5WzGnZGvK2cXcLGAPJmZcLOpkex3
 Cb1nDaSelJu7jxK0/5ZNtPmFegYQKXw=
X-Google-Smtp-Source: APXvYqyOav8eVbZIzeuuDcu8S0m5tQQjnYPEId2xZ7DfLy40syxbR1wafBmcXOSR096S1UU2+tghZw==
X-Received: by 2002:a5d:6b02:: with SMTP id v2mr12450408wrw.84.1554809776032; 
 Tue, 09 Apr 2019 04:36:16 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 w11sm96427814wre.15.2019.04.09.04.36.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 04:36:15 -0700 (PDT)
Message-ID: <c79c89b5a0cb1b132543aea70ff1c16872b6f6e7.camel@baylibre.com>
Subject: Re: stable/linux-5.0.y boot bisection: v5.0.7 on meson-gxl-s805x-p241
From: Jerome Brunet <jbrunet@baylibre.com>
To: "kernelci.org bot" <bot@kernelci.org>, tomeu.vizoso@collabora.com, Sasha
 Levin <sashal@kernel.org>, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Neil Armstrong <narmstrong@baylibre.com>,
 broonie@kernel.org, matthew.hart@linaro.org,  khilman@baylibre.com,
 enric.balletbo@collabora.com
Date: Tue, 09 Apr 2019 13:36:12 +0200
In-Reply-To: <5ca84614.1c69fb81.e2ab3.2e61@mx.google.com>
References: <5ca84614.1c69fb81.e2ab3.2e61@mx.google.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_123618_033329_3E0EE3E3 
X-CRM114-Status: GOOD (  27.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-04-05 at 23:24 -0700, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> stable/linux-5.0.y boot bisection: v5.0.7 on meson-gxl-s805x-p241
> 
> Summary:
>   Start:      8b298d3a0bd5 Linux 5.0.7
>   Details:    https://kernelci.org/boot/id/5ca7df3959b5141abafe6036
>   Plain log:  https://storage.kernelci.org//stable/linux-5.0.y/v5.0.7/arm64/defconfig/gcc-7/lab-baylibre/boot-meson-gxl-s805x-p241.txt
>   HTML log:   https://storage.kernelci.org//stable/linux-5.0.y/v5.0.7/arm64/defconfig/gcc-7/lab-baylibre/boot-meson-gxl-s805x-p241.html
>   Result:     9b0f430450cf clk: meson: clean-up clock registration
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       stable
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>   Branch:     linux-5.0.y
>   Target:     meson-gxl-s805x-p241
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-7
>   Config:     defconfig
>   Test suite: boot
> 
> Breaking commit found:

The problem is that one of the clock (the cec clock) is registered twice.

> gxbb-aoclkc c8100000.sys-ctrl:clock-controller: Clock registration failed
> gxbb-aoclkc: probe of c8100000.sys-ctrl:clock-controller failed with error
-17

It is not a problem on mainline because there has been some rework on AO clock
controller before this particular patch.

It is safe to drop this patch from the stable branch, it does fix anything. It
is a clean up.

If you prefer, I can try to submit a fixup to keep the patch in stable.

Status is the same for the stable/linux-4.19.y.

> 
> -------------------------------------------------------------------------------
> commit 9b0f430450cf230e736bc40f95bf34fbdb99cead
> Author: Jerome Brunet <jbrunet@baylibre.com>
> Date:   Fri Dec 21 17:02:36 2018 +0100
> 
>     clk: meson: clean-up clock registration
>     
>     [ Upstream commit 8d9981efbcab066d17af4d3c85c169200f6f78df ]
>     
>     Order, ids and size  between the table of regmap clocks and the onecell
>     data table could be different.
>     
>     Set regmap pointer in all the regmap clocks before starting the
>     registration using the onecell data, to make sure we don't
>     get into an incoherent situation.
>     
>     Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>     Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>     Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>     Link: https://lkml.kernel.org/r/20181221160239.26265-3-jbrunet@baylibre.com
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index f965845917e3..258c8d259ea1 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -65,15 +65,20 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	/*
> -	 * Populate regmap and register all clks
> -	 */
> -	for (clkid = 0; clkid < data->num_clks; clkid++) {
> +	/* Populate regmap */
> +	for (clkid = 0; clkid < data->num_clks; clkid++)
>  		data->clks[clkid]->map = regmap;
>  
> +	/* Register all clks */
> +	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
> +		if (!data->hw_data->hws[clkid])
> +			continue;
> +
>  		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
> -		if (ret)
> +		if (ret) {
> +			dev_err(dev, "Clock registration failed\n");
>  			return ret;
> +		}
>  	}
>  
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [820c1fa515010d280551075da59fc2668ba8b3ae] Linux 5.0.6
> git bisect good 820c1fa515010d280551075da59fc2668ba8b3ae
> # bad: [8b298d3a0bd5feeb47129c4889356b38b78ab231] Linux 5.0.7
> git bisect bad 8b298d3a0bd5feeb47129c4889356b38b78ab231
> # good: [55d7152d37dccfa9add45df82fd45c373e032f46] cgroup, rstat: Don't flush subtree root unless necessary
> git bisect good 55d7152d37dccfa9add45df82fd45c373e032f46
> # good: [8b3b22aa7c558e713a179710a6f1e2fdbef44b20] block, bfq: fix queue removal from weights tree
> git bisect good 8b3b22aa7c558e713a179710a6f1e2fdbef44b20
> # good: [ebd0f3066c35bd27d3a4b224135e638eeaf70b8d] netfilter: physdev: relax br_netfilter dependency
> git bisect good ebd0f3066c35bd27d3a4b224135e638eeaf70b8d
> # bad: [9b0f430450cf230e736bc40f95bf34fbdb99cead] clk: meson: clean-up clock registration
> git bisect bad 9b0f430450cf230e736bc40f95bf34fbdb99cead
> # good: [bfb59eabe2c940c6869f128200f2047d46215845] drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> git bisect good bfb59eabe2c940c6869f128200f2047d46215845
> # good: [ab79dc3ef0244c9b3d712d0cef17b74c363d6069] brcmfmac: Use firmware_request_nowarn for the clm_blob
> git bisect good ab79dc3ef0244c9b3d712d0cef17b74c363d6069
> # good: [c8a8dd1d85ca715ec65169feac54a7a06b8d2a29] x86/build: Mark per-CPU symbols as absolute explicitly for LLD
> git bisect good c8a8dd1d85ca715ec65169feac54a7a06b8d2a29
> # good: [a644d2d28baf8472368903b28823cf85c9a13a1d] drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
> git bisect good a644d2d28baf8472368903b28823cf85c9a13a1d
> # first bad commit: [9b0f430450cf230e736bc40f95bf34fbdb99cead] clk: meson: clean-up clock registration
> -------------------------------------------------------------------------------



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
