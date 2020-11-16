Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3CEC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:36:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86A8208C7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XsHdBMKI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iylfEb6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86A8208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CkTn/6tbI5eGcxb1T6rKbhNgRZ2DqPSyCzHyK54Qp4c=; b=XsHdBMKIIsYD31lKEfLD6T1qA
	9tlg0B0/QYeJCbkbOOGFD93bag2c98JpS9hvhHqrj0CcOi095MMstO+2S08fxjB9jkEvrh2hshMbu
	vtGnyIIjoPaPJr3odE6IdpwpIEKWJkgIG/+0zAHk4uB6tVkP/fW5lFwQRL5J2isoyrVCZhbeL4VV8
	GUTNclo0x2mLu/I7SAeKYwy9q/G7V+tn0VGyUu4sOCFTB2z6r8ibwL5UEZETu9yv7LJhlx21aQxiq
	vEPQXHMY95TR6Rl41rONxudPXPq7JNaRblnGi+1U7OxhntagblpkQP226KfGhziMjkWGRl7hXPJYl
	QbSktlGhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea00-0001ju-K7; Mon, 16 Nov 2020 08:36:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZzf-0001af-1U
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 08:36:12 +0000
Received: by mail-wr1-x442.google.com with SMTP id c17so17665116wrc.11
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4EG4aCcIJxzY9+5Wm6px9/vBxPVbMMJi/JSK5pdZ4+k=;
 b=iylfEb6YBFN4jnlgbKtaUSV/gnmc2cbkl3Qe2ftxdBLHXKBNUr8j0SHNcaEdnzK17D
 BR9Aeod28MU6BPwDoWqcAt2syWIqUd6hq4pXArHNDUoorVCFqLCRuytEp98uz5EwUYUQ
 Z6GjlVVpW7YZLjmPleNe+WbLh1fXkU0/qdGHcCbeZsP+TRnT61wtq6l5EDRC8AOcLSjn
 HoVg0v+vaTtYH1Y34icVeuci7IyjbLNbmADBiW3/nt5yXinhBgehcZ0bVdOK3sT7phZg
 hg6SLDtmN52P5I22LxVf6aGNxSN8yauipNusAH9zQsj3MTTWmt6ffAY+ViO36TuGzThU
 lJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4EG4aCcIJxzY9+5Wm6px9/vBxPVbMMJi/JSK5pdZ4+k=;
 b=G76Q4nxdBUFvSQbB6Cw7KrFA0rJ/EZU2o+patjQj0GuuLBvydL5bGgTkz0yR8Tq8ZG
 4mn9+lRAGXDEz3r5l4rwejXge9LTREZk1mjUL9PSCb1rUBVIYSv7n2sozedS6UMflQDX
 KD4fpb3PpdA61gXT8IMJwlhA2l/mDCZRmf1D7fAfCuKIGVLjGvi9JRBt1tQkSsGH8cro
 hbNqUsMJnDJyQVjwaOrc3jcTfh+L0OcwfYfF4SNRk1qsb+KXZjFKSIGp5Fgk6h+DSYOi
 YAbeZ56HfrEgCXVsW+GeftN0egsCKUr4xCq7Myc25Skd6FyTzEMvTV8o9uUtnkOmq/it
 ikjg==
X-Gm-Message-State: AOAM533yDevUKn/CTM4F0EHieAoSu9qUWqNEpJ5hMiuBdxUb+sgf8Zrp
 9VUmGkz6kRVaJBk5QLnobl5ddA==
X-Google-Smtp-Source: ABdhPJyNs5Eh4oa6C07M4CdtL8gIJBM+vrm8CXRhfRnS7p3S87X9PBb9p33sOL5twCZabIK/2mKHEw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr18793500wrt.66.1605515769916; 
 Mon, 16 Nov 2020 00:36:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb?
 ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id z6sm18297622wmi.1.2020.11.16.00.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 00:36:08 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2
 boards
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20201116064147.12062-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9e790744-c966-0ed6-349e-b1e0013f5193@baylibre.com>
Date: Mon, 16 Nov 2020 09:36:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116064147.12062-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_033611_169764_717DF3D3 
X-CRM114-Status: GOOD (  24.64  )
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
Cc: Artem Lapkin <art@khadas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/11/2020 07:41, Christian Hewitt wrote:
> Enable the rtc node on VIM1/VIM2 boards so users can simply attach a power
> cell and use the on-board RTC without modifying the device-tree.
> 
> Cold boot with no cell attached is gracefully handled:
> 
> VIM2:~ # dmesg | grep rtc
> [    7.716150] rtc-hym8563 1-0051: no valid clock/calendar values available
> [    7.716957] rtc-hym8563 1-0051: registered as rtc0
> [    7.729850] rtc-hym8563 1-0051: no valid clock/calendar values available
> [    7.729877] rtc-hym8563 1-0051: hctosys: unable to read the hardware clock
> [    8.126768] rtc-hym8563 1-0051: no valid clock/calendar values available
> 
> Warm boot (and any boot with cell attached) recalls stored values resulting
> in consistently faster (re)boot times:
> 
> VIM2:~ # dmesg | grep rtc
> [    7.441671] rtc-hym8563 1-0051: registered as rtc0
> [    7.442663] rtc-hym8563 1-0051: setting system clock to 2020-11-16T05:49:59 UTC (1605505799)
> 
> Suggested-by: Artem Lapkin <art@khadas.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> 
> This supersedes other recent attempts by Art to make the same change [0]
> and [1] which were rejected for lack of justification for the change and
> leaving comments behind. I have been using the same changes in my own
> tree for a while.
> 
> Christian
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/20200925033017.1790973-8-art@khadas.com/
> [1] https://patchwork.kernel.org/project/linux-amlogic/patch/20200925033017.1790973-9-art@khadas.com/
> 
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 8bcdffdf55d0..638a5992d760 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -97,8 +97,7 @@
>  	pinctrl-names = "default";
>  
>  	rtc: rtc@51 {
> -		/* has to be enabled manually when a battery is connected: */
> -		status = "disabled";
> +		status = "okay";
>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
>  		#clock-cells = <0>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index bff8ec2c1c70..da000c10b945 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -228,8 +228,7 @@
>  	pinctrl-names = "default";
>  
>  	rtc: rtc@51 {
> -		/* has to be enabled manually when a battery is connected: */
> -		status = "disabled";
> +		status = "okay";
>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
>  		#clock-cells = <0>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
