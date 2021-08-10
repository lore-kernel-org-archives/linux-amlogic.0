Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075D2C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B2B60C51
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58B2B60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ay7AR21dYUSxm77Wm1WzbKg7oIC4MIJdD0T3CHsssJs=; b=JEl236tKpYTDleaZWt7WxuPZQC
	fWRtEQuo7M3IpNMYkSma5X8pb+mJC8i5ZwQHP2RygSSmDi44a9wUh0eSW7ZnEMXrbXx6AuAEMl1dY
	Mw1Io14oOQ1SxI5VeMMiQjaYytteOYPExk6pwydyuMq7Igjy9sQaIHQ1fDVEFLR+8006xxoWqNAVi
	SurNrSoA1M2PUQg+vNbMVs/oZWlDX+diuix4yLYmPoNY3OjXr5fSAWQA2bB07Hk+x9Yi74nRdknc2
	SL6x7iJTgmckATKvvaVtv/GQBq1ZPJUM2xQ6YF4s4Od5q+ErATuKlAYHEUs10gTa8muSdP5tdtaSI
	lm7NTJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMV5-002nsX-PH; Tue, 10 Aug 2021 07:48:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMV3-002nrA-0s
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:48:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso1262358wms.1
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U3X7GU0Q/4kIdlftXZNDYWFqtztkfUdLJOvlg5BxTdA=;
 b=WXcmipQZFcMdc0p7vhOxoaa4gEFzolTVMjv2pQ+kTvqMZYsycltOJ+y1MCobdXy+30
 JOKJCdsHeBpUq6AI8NnFMpDJMzq+zNUkuCf2R8WyaUbueTSztkcQZsPgRNecI/vIgnCF
 rfjeaEyiLefIYw9cizljRa6N4ljDIJSwZ8GbhhVghagc8YMGT97JFflyETNZmNrkEw4r
 OrqOJ1ElbGAPufPXjrkWroUwztRBxT9FfRP7S5f4q7TPFwq4Xz6lQnj8wq85YIDhQ6wo
 kyBzaFthEU6g5d9DEEWyTojQTfQimkw+7WbWxHgVI+LpHauhPbUKUtb9S2Vffjo6yUYQ
 Dn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=U3X7GU0Q/4kIdlftXZNDYWFqtztkfUdLJOvlg5BxTdA=;
 b=YOpg1QAzOpTlK7P6u7IaCRtXjX8wYrcRciSGsSnQxrk5t3OAly61e73MjWfa0F3N10
 /7Evu8Yxe6Wn9ybwT7bWJEE8498MVegypQkP8tjlYH0HPPtgBap6Fo8HF6PG/zaKzPdO
 LzjZLw5RMwcpJBbTa71q5T79KLcUyMGAWtv4yX49ffip0le2Q8lA2B3djj6nJGQ1AuDt
 5qwEor58eqA8xmdnMMkvXTTLopOIQyD4ATYA3Cr7Sj/g3VoK9VMM01RuwOG26H07Fqs+
 ER6b+XLVsJXVEKzGtmitKDAn0tHacGJU4Q+OyUCiXFfrEctA2iuPsLtxr9afyn7HhnHK
 2qyQ==
X-Gm-Message-State: AOAM533Jv4e9SSUE9v0SZMpY+FIOkLF95UYEQUg/E5DJZ1St3rwq6Bbx
 qOa9OBarUwvAzmVlreYIJ6OR2w==
X-Google-Smtp-Source: ABdhPJxN5+EbW8dWjwkIOdFVoyE0zxBvIYfwUJiIptC47NVz8jB5PvMzNLoBGIkdLoULMJmYQH47wQ==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr14275408wml.158.1628581715772; 
 Tue, 10 Aug 2021 00:48:35 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id r10sm5325150wrq.32.2021.08.10.00.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:48:35 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to nexbox-a1
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210804140029.4445-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7f060ba5-139a-3656-53ac-0ecef37ac496@baylibre.com>
Date: Tue, 10 Aug 2021 09:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804140029.4445-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004837_123413_1C58809E 
X-CRM114-Status: GOOD (  16.80  )
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

On 04/08/2021 16:00, Christian Hewitt wrote:
> Add initial support limited to HDMI i2s and SPDIF (LPCM).
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index dfa7a37a1281..236c0a144142 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -10,6 +10,7 @@
>  /dts-v1/;
>  
>  #include "meson-gxm.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	compatible = "nexbox,a1", "amlogic,s912", "amlogic,meson-gxm";
> @@ -24,6 +25,13 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x0 0x0 0x80000000>;
> @@ -75,6 +83,59 @@
>  			};
>  		};
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "NEXBOX-A1";
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&aiu {
> +	status = "okay";
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
>  };
>  
>  &cec_AO {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
