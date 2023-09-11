Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48171EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kTR4umuTbY+mZW6tm5H4/8tj/msAhVTCI+CZzMrNDY=; b=bZGZyooDCvUbya
	+fINngOrWUksmA6EtdRqKNtG6SXf5RSfBmiQ8Jqgwo+itHeUpFCObfIIIQ/+5roD3en8YP57ASNR4
	okOcbkiilsK9TV9tjLxj/mDsl47MTKEjqF4VmTWTNq5NU3w7CDaYSBEs2zK+C9CJtu3U8swIunVbY
	cOFHlUToxxIgwXC8EVL9zVAWpYGYr7NvC0r+d14wp15k4exMmv+Gr13Ug5Xv10BWVmQOFgRn6HW7H
	C+VW9IoJiBNlm7vjHgWxM3zKyMdGRytroR6/5T2OvEcRUax3bcMKBpej1BwjywWL+mWFVgikq6P2c
	G6iWR1NmzclCjao5IT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjGl-000x0R-35;
	Mon, 11 Sep 2023 15:56:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjGj-000wzl-2I
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:56:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso52660865e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694447766; x=1695052566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP/eP8jDYXQ289unHUdgYKQAZk5IRHf3RfjCHo6X25s=;
        b=sem7ozzqrPq0i0Z8L1uHvU602ZvMgqYT4f6W++SYkpfkU+0H6+NqmMSkywT3lgB+an
         DLTnjNSq0wCT0mgntKOe90mQzEgHiwAqchY8Yx2zQ7iQi2q62VkhFDwXFP9jmB/kUPwt
         /G3NRakXsjoXIqBRmkCrgg0f/lJdt5KL27Fll2B7C6Mc/Sr6xAm3Bpeq9843g+j4YDoj
         wCFNCzpw2d43qe9khqh4bEnV6tkf6/uht3OWfluCwOZp0mj4f7trw7k5Y3roMKhVAknK
         gSbsO4U5/l+Dy18o1On3xQZPdFpknPMr+gi2a+1fumuJhlFYP/si6ezCmKzdiELaf6nC
         rRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447766; x=1695052566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GP/eP8jDYXQ289unHUdgYKQAZk5IRHf3RfjCHo6X25s=;
        b=oTVwDvcE1RUaPKqRHEFmYiWh6vR4uB/PNWNpADE6vK/UUbjV+yjlzaJfWQHR2l2Iy2
         FTiS4Fz4sPu+9o8S/PqqLL9F1lijPxzcJz/j90sDHOVhLItnm3qhCHrkIL7rqMW7M/Nd
         Jkxsdvhq6wjn+H7q2Pb5MqrlmKpH6t5mcjQG+Q5p1wfy3+QGPevU+bP8LNZPVFLibOmr
         owe7gIKmW/I2By9piEh2mLNkYnpWvtpOR+MwlZpeOT1in/G+HGihPQftRACwUxuJhttK
         XtSZjyqE/LVGcOsfqc+4OY3eXS86B3Bdd9oQnEXsyJ9dwL5opa4MoPpsf5zOAFAAY+Bz
         Vwew==
X-Gm-Message-State: AOJu0YxtRKlSUt25FcIGm0phdR+LknmAM+suydBojhom4DnWu3Fqpb2x
	QyRhJa4TLAr2D7A1nlzK415B0g==
X-Google-Smtp-Source: AGHT+IEkFcMfdK3cHPbfayqFmuBT7sJyfrGNzvvJusP8Zhs4Fgi4D1oLDfLEtlFjqtfNeGMrgNcMtQ==
X-Received: by 2002:a05:600c:24c:b0:3fe:dcd0:2e32 with SMTP id 12-20020a05600c024c00b003fedcd02e32mr8331633wmj.19.1694447765769;
        Mon, 11 Sep 2023 08:56:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003fee567235bsm13713079wmr.1.2023.09.11.08.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 08:56:04 -0700 (PDT)
Message-ID: <eedc9787-06b7-bac5-a1f5-ba07d23f4ac7@linaro.org>
Date: Mon, 11 Sep 2023 17:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/5] arm64: dts: meson: u200: add onboard devices
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
 <20230911154541.471484-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911154541.471484-6-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085609_752009_087B3646 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/09/2023 17:45, Jerome Brunet wrote:
> Add missing audio devices found on the u200 PCB. This includes
> * Lineout connected to the internal DAC
> * SPDIF input connected to a coaxial socket
> * TDM input decoders allowing output loopback
> * TDM A and B output encoders and interfaces
> 
> TDM A and B link format is set by the related external codec.
> Internal audio DAC can hook to any TDM output.
> 
> This change does not include support necessary the optional the speaker and
> PDM Mic headers
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-u200.dts      | 228 +++++++++++++++++-
>  1 file changed, 218 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index da66e2e1dffb..9abe37b5b227 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>  
>  / {
>  	compatible = "amlogic,u200", "amlogic,g12a";
> @@ -19,6 +20,22 @@ aliases {
>  		ethernet0 = &ethmac;
>  	};
>  
> +	dioo2133: audio-amplifier-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "simple-audio-amplifier";

compatible is by convention first property. Do you have different style
in Amlogic/Meson?

> +		status = "okay";

status is by default.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
