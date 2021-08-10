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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B6DC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CCB560C51
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CCB560C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QtplrMLu2afDima57u7Qmu123wkH1GcE2KqgiOQbkgs=; b=LhbuZfp3B/8A4MzU/VtBXNJvwq
	ZKeukE3N0OlEr7EOFYUuYL4iJURxvqBm0w5PPG4TO+Lzob1CsUEvYPk9uXHqYuICbwu4zMdX72fN3
	krnW4GofRZ5V7F7kXxW+AM3qlqTZhVjGPY7e+pW6GOx4U7SXAlaCTy6op/mChh0bluItEh0BmJenn
	ZD++ZPWl+iTGfTehVXUPkleu94oGQFUciuvayc5F108+cteee/m+Y+Q8rqQOqoVAXnUONGRQ5vUQC
	p9FPjdD3MlGuVvg35j22470kPYapTHMzwmkPESikQd9ZrFfsYvPwSMebEaVpcU55p90gkTBoFVg2k
	OLr681fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMVJ-002nxE-Ow; Tue, 10 Aug 2021 07:48:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMV9-002ntg-I4
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:48:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id q10so1720191wro.2
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6e9/sqGBr6SL7sXKS2HQPlB7IrU87392c7UU58nujaY=;
 b=ANEHnntoFmqrjDLA7KyToEVGX5mvYSe2fEmRiD9apuD1GX47EVhGU6giaX6KTvnLE6
 YTIWHOcp5o1i0xlqg4K2+sQFkDqIt1M9UTI6t7oFv4A9uK6JUa+9vujGXxGVRudQkgtt
 ZhxT/JCCqVoUNksZ3jifJIFc+UextMVkmvzEw0a0PrlZsXqftTwQx6w5oOyf8kDdTHK9
 4IfaxSIwJ7FX9ww2+pL3UyAXH+DEdiB7L8N+6IiRS5dS8V91AytAdBI9TNsE7opx0dyG
 ClxyA/nwDTNcOyx7XXofMcnx4OYfrwvC3bguA7FmJihIaS94/bCd6wo8orhn/a2tmKDv
 DSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6e9/sqGBr6SL7sXKS2HQPlB7IrU87392c7UU58nujaY=;
 b=EA/M+3BwHLwMY7/zyuQRU34PKkANTIjI56D/8cvplXvf6nSW1QqafttklVKRJH16hw
 1gaYtu7p8irpqvkgvFQhefVJgJ63YTqmk1EASf00HaioJzYXgzn3u8FbcOq0vR/ee63t
 jZK9r/fyg6RWo4WmWM4bnJb5Ivql8mw2dvdNDWmdNjQVames42O0P18ejbuNSkSCx6S4
 LGFJVPKBva3pg8qkgFfdGqbiAnIXayz4ZDVzGBHppwsvelchnEFkxcLluABN1VgIxdPm
 COYdDmq6aohW712JKd53Fbu7SrSRCV4kYswR8OBJs0z4T6fwLpLA/fTdO3WhRjEDKzz7
 OVLg==
X-Gm-Message-State: AOAM533ZQUcEcW5ZoAJhslOv3n/OJa9GsqFFDY8gD1l0dAgi6ntZ7XK3
 QG2F04FG75D05Z+M0izch9xv3w==
X-Google-Smtp-Source: ABdhPJzL4h4LYTt15iMlUp/BR3tOk47yKGAfCvNFdi4maSWnF/4lfjRPRYJSXUkIjycasLz3eioL8g==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr28544928wrg.134.1628581722053; 
 Tue, 10 Aug 2021 00:48:42 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id y21sm1857172wma.38.2021.08.10.00.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:48:41 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to vega-s95 dtsi
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210804140258.4666-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fb7e150d-cbb4-8631-9ae8-aced75c6aa09@baylibre.com>
Date: Tue, 10 Aug 2021 09:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804140258.4666-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004843_676945_1466D186 
X-CRM114-Status: GOOD (  17.30  )
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

On 04/08/2021 16:02, Christian Hewitt wrote:
> Add initial support limited to HDMI i2s and SPDIF (LPCM).
> 
> Tested-by: Oleg Ivanov <150balbes@yandex.ru>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index 9b0b81f191f1..66daf3af34c3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "meson-gxbb.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	compatible = "tronsmart,vega-s95", "amlogic,meson-gxbb";
> @@ -17,6 +18,13 @@
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
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -97,6 +105,59 @@
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "VEGA-S95";
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
> +	pinctrl-0 = <&spdif_out_y_pins>;
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
