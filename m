Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A398C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8351960F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8351960F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5vKUyNTbREjgIpdm69kDuW/8MkIMZnUXsC2llbdEkUM=; b=nieurmY41z0C7TOd3/7wpNfT8Z
	j6H8JfSafZAFATRt1wH9SmpQQU8RYoxtB5LQjFJSnZiFA+nm8ve02FPIuolpAma8DDVFYoOcToG75
	wOxTaADYM7hvLHlZWjst/vTgXTPq15VL9LeKkfs+LyoGJB88a7EXwxKEWdyDX8FjrJ1ldBSOK+YXD
	wX9/PYLVAPLmqjtqQcTMO/PnAKtvxO7EPPIdKO8EeNjE9xLx7re2WPug+RZTaNZEw8N5H6LIfW6Qk
	BPl7z/8Q/c8OhOYCmTHHQ24p4Z33neeOew7A73wiNPU5PU+iOpAij57X0rRJgHkHNEPr0Nh9DHvoS
	KufGIT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMbd-002pah-7Q; Tue, 10 Aug 2021 07:55:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMba-002pZq-N0
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:55:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso1295323wms.0
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UEIC6vC085t9n2FyShdhmhsgyOLA36QxIjvXMeHquq0=;
 b=lQU3LBLFbHdd5zE7+32px5brS1X6XEO+rld3svvmZwIwOoZ/oDQ6uS3P3af4N96XPH
 k8a+6YuTwt7GTkC1MSXsrdCXaWMKoqjluzwxzTQg8qM91yRHDI97/oHYT442BOE/Oifs
 e/jD24flWz+Z/qCLmG+l+sDss2NlCnhk6E0OZtlILOABpvkHoJRlSvBn8nYesS/SOTJ9
 hus3gH8Wb7ReHaFf+Q43/51vrR2ywjowggaNnnlLLKo/csNoTAUKA+fJkxwpraylqe6N
 6G6rfw55XQ41XJ9xN8WY99g3cNuS+xkfadqo02c7/BtbmukYFyP1YLyi/bm/0I+odB+w
 smtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UEIC6vC085t9n2FyShdhmhsgyOLA36QxIjvXMeHquq0=;
 b=G97m9yslFHt+H+hPHpOogAvO27PtvLduPaJ+YiFTSnb7hkUY0lb8/2TIFmeSL+vSpi
 /9btY9zDjkOmFanyiq+kkEFYvX6QRfpKQnD91+Kpwm+VpqEJnoR/Byw1CMUBpKUIuJ5U
 TqECoYTmvw974ocwzDdwS/Tu0tyZ71lRbHHeQH0ZV1+SILciX5u0c+FnfNsjV8mgieUV
 v8i253Dk6OrOQ+7wm4kgbEezCMuoJCyk15HFdQzcem1RohPW3CbZIzY+14nGtb1FgJZZ
 uG5sr5glq/IeVS3BYuNjVHyIzlGtwbruNL9m9iIdP5DYG4WjDdmDO1w/AVXpwp2Gg79R
 fe4Q==
X-Gm-Message-State: AOAM532/t00Ac1iXOeuY4MnMo3rwTzF9Ws+RUoOxZOvyGxwSCck8oxxy
 rMNCZP3+tHcqjuJMA1bFq30ecQ==
X-Google-Smtp-Source: ABdhPJxshFcI3Wz1ZgfsUyujpG2l2zEiOyoWmR2VYFq6qGOGebeVxmBsvqD41bot25hKF3x60nKJfg==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr2237873wmq.159.1628582120078; 
 Tue, 10 Aug 2021 00:55:20 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id u5sm5233357wrr.94.2021.08.10.00.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:55:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: meson: add spdif out to khadas-vim
To: Artem Lapkin <email2tema@gmail.com>
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210810041630.3673406-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7dbba936-e8ab-4d47-1af8-0d3d1adb8c30@baylibre.com>
Date: Tue, 10 Aug 2021 09:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810041630.3673406-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_005522_821903_ED914203 
X-CRM114-Status: GOOD (  18.27  )
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

On 10/08/2021 06:16, Artem Lapkin wrote:
> Add spdif output audio support to khadas-vim
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 60feac0179c0..01f13822a616 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -64,6 +64,13 @@ hdmi_connector_in: endpoint {
>  		};
>  	};
>  
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "KHADAS-VIM";
> @@ -97,11 +104,21 @@ codec-0 {
>  				sound-dai = <&hdmi_tx>;
>  			};
>  		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
>  	};
>  };
>  
>  &aiu {
>  	status = "okay";
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
>  };
>  
>  &cec_AO {
> 

AFAIK the board doesn't have a physical SPDIF output, but one of the 40pin header can output SPDIF, right ?

In this case, following the other boards mainline definitions, we do not enable any function by default
for pins on the 40pin (or other programmable) headers.

There is still ongoing discussions on how to handle that on a more generic level, but you should write a bunch
of DT overlays for the VIM boards to enable optional functions like SPDIF and store then in a public git
tree for everybody to use (like armbian or LibreELEC for example) from the U-Boot stage.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
