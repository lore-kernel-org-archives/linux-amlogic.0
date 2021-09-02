Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B829DC4320E
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2726108B
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A2726108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y9G2g9MJadm0Kw/gt+vYvTPCriRSnOGjzFfa1JhlNik=; b=ULBHTbI7bfNFKuNFxjfYhN9618
	oq/J0K+//DB5u3VeSZ+gGkFVSTo9DwQxwbGtCEG4aDEMdyw7CqhCH2j7cybpPS1uOqxPV7a4pM8/P
	EIMGEiwcF07NV/AWfMUquDX7bKgXv45Ea813tkgXYpPdOloF0X6SGWVAUDheJBSUgSEhgaIMm2U9a
	YPiQnN9H471Iza0qgLXcBl2C8g9lQjn7znv5+fJzDvLDtiUkLXIVEKijrGs0XVCcYcVlFW0pm2fSI
	W/fhsDFYVvrvFk1baau2L9ghGC12nTBnRJg39EU2bVuY9cbC8ySpkIhhVgRVpMSxeKuI3ZgWzmUNI
	UZZubXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmoV-009iLr-6W; Thu, 02 Sep 2021 13:31:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmoG-009iH6-DQ
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:31:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id g138so1288677wmg.4
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gxi9Kqsy6vY5Br0x3Qy9vxSPyyM/MBtQ+2co26fvBU=;
 b=u07MnjYoJd4ToW6TOOtZFuPbDUsGKC4+4IPtShXatLOI3i5McO2C+LlhGVohAgrIUb
 sBlD8DOLsfn5/OZFiFvhoGWfdatEdpgKJUhpzGb6Hq24UMq1BgPVs46LRZ8bCPnJIkG8
 3RS7211MWbG2LoMDnSt5PZwTcsz1TNPfVlRfVUvnBfZ6WJDIDKEn+YlKI9N4KzL9/BBr
 Fua7rGtjPAbuMnzITzI/ycqeFNC78t7tr8JPqoVuGqKdaYdBtAMDJeQtVZyeDfi902uz
 qEq/grvgQlXaFS5+dbQwMc8vutwe3b5FFhmjx9g7iYd3WuweNM7q3wrmhfIh/0EHByB5
 ZQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4gxi9Kqsy6vY5Br0x3Qy9vxSPyyM/MBtQ+2co26fvBU=;
 b=l7doYXYL7NQIuHT7N/8JyQeKacz6BkPuwame/UGsZ//hsjitVITXCxLTXPdo5w/Ush
 XbEP1r7+ocowNVbp7sjj4NqaxkQF2TB3phzmCc8r92fpo7yHYowmdFrRtUJ08HKAGmlw
 SMd3pozVgHd5bxSV47KwqzsTkELaLIMPNajNNZAH43gzHVTw++8ozlXEphi6gnph9p/q
 hyvnZmgKFlsuC7KKzV0qb0TBS6XCoVsLClC9tTrmCR1e78OdeZi6Kz71JJOVGccuyhwS
 rVuXxhPlYBQ1bd6Dc1FUb3JLxdYJnqBFaYEYAfxTs6mk3pECYN2IPr6SjPuWAjIXYPJh
 X46Q==
X-Gm-Message-State: AOAM5337iJsw9wCQEMPiPpYyChgNHS3gPXx0u3yyOiYpQdwAPbOULEz7
 +s23dmmjHv0JHBDZEGsaC73BaQ==
X-Google-Smtp-Source: ABdhPJyVTIrOykcHm9Tz+zCbl+Dt+2flbbXghMcfXjE9o2eBFlm7cHCvOunhVb9EF0jaSVbGs0i5UA==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3244799wmj.126.1630589474811; 
 Thu, 02 Sep 2021 06:31:14 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id u23sm1660340wmc.24.2021.09.02.06.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:31:14 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: sm1-khadas-vim3l use one sound node
 configuration with VIM3
To: jbrunet@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com, Artem Lapkin <email2tema@gmail.com>
References: <20210812051059.1103641-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <247c746b-621c-5db0-25c0-1ef0d0a0d77e@baylibre.com>
Date: Thu, 2 Sep 2021 15:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812051059.1103641-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_063116_599084_04D99B43 
X-CRM114-Status: GOOD (  16.67  )
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

Hi,

On 12/08/2021 07:10, Artem Lapkin wrote:
> Khadas VIM3L board sound configuration same as Khadas VIM3, its already
> defined in meson-khadas-vim3.dtsi and no need overwrite it with different
> card names and routing configurations.
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index f2c098143..06de0b1ce 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -32,19 +32,6 @@ vddcpu: regulator-vddcpu {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> -
> -	sound {
> -		model = "G12B-KHADAS-VIM3L";
> -		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> -				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> -				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> -				"TDM_A Playback", "TDMOUT_A OUT",
> -				"TDMIN_A IN 0", "TDM_A Capture",
> -				"TDMIN_A IN 13", "TDM_A Loopback",
> -				"TODDR_A IN 0", "TDMIN_A OUT",
> -				"TODDR_B IN 0", "TDMIN_A OUT",
> -				"TODDR_C IN 0", "TDMIN_A OUT";
> -	};
>  };
>  
>  &cpu0 {
> 

Jerome could you quickly review this ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
