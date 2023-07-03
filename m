Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B1FEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRG+PF+Zz0ukpEO+/3XKIQJBU7fxbb0ajK2G2NIUfNI=; b=l8Yg3OoOd0iNeFyiO1CUcDzJ9t
	eImrugbeaDcrdmmzL+vB0OnIYs4z+uebliQ5AATjoQj7XWxnA6JlfuDMzKuhSI7t9vs05XpqfwtrV
	MQtmw7Aiud7IdZBxA6zySF0jDGC9RK+P+RPnpvKJA0/0Oz6szCKPdsLtK+/O6jup5QP+oSVXMi/px
	6fZzCJAIclZKyOAE88kG6M0HG/lZf0oBRVoI88k4rOzuEvT+ZR2u+/vxh8/Q6BVnWcY2pPpRCXWVk
	zR/PZ0+XmtL8XKQlfBqaAV6aRZpo+p6WPa4qi5SmsJ1L+3OULixdBaB7qEuDncEbJ70SLV7Pwyc4K
	LuA2Q6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFtj-009wDM-1k;
	Mon, 03 Jul 2023 09:31:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFtf-009wAu-1d
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:31:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313e742a787so3524320f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 02:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688376661; x=1690968661;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FuT4xWkOihq2mrZtoWDkd43kDCIJLbZrTBfddFWhGMs=;
        b=HL5Fed4s+7c6wXe5MltRoTZHcxVOjU8x2HVFWZSlDD1UuGG67NewwEfJNpr0mOEFKV
         ysApBigicygyXkXRPkzFiYpKr3A0PlNWJGHirnRXEJFC6cNwLk50s55urBOm0i0wCxGL
         QXJS2D3KDAVIL6TJPj4Yx6FFa8JzB0GjlgY8C7AHPE6M5wJl+lsRCDx8Jiw4cNj/2EHO
         PoqO/fTP4F6hZ8LBavjVZUXS9Z2eC/JPd2Ow9614HTZzWWaEyv1XPG2C5YLlLmzHREJu
         vWFhaWCnP0+lWdjUqQXFMnrx47NU753d0/D+jMWRLPjJI7NwE4mtt8OnpQB/IZJWE7LW
         x9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688376661; x=1690968661;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuT4xWkOihq2mrZtoWDkd43kDCIJLbZrTBfddFWhGMs=;
        b=AwpRyydNIRTNzRXAdu0mk81mbrfcrdOQ84V8fN+PQCRfiKWOTO6+8rMBNnPYf1Xx9T
         gwLzY/OY12m286bCdOhsP4UFQJx+drl3NaIU1VRsyTvcsobekHDjcBYBezJlQnhp1eAS
         ZcCA7yTr9vS4cmvYBM+RR8KGCzvqptOAHuA1s0awhC9FqUwELo49oFXfxmCBXTeLcwlh
         VWmeunMnlQbrBfuKHZjp30P1DteHwNz8SdBsFReRmDUKSxwbdvgbC2akW7Y0PVRGKUB/
         Of/XHalQhoNXre/20Dl+XU2tsvfKHMTtdHIWiys+qaJRV7JOvNNi17qR333DtZgDqiXn
         Vexw==
X-Gm-Message-State: ABy/qLbtfIPToP+2V7haiRmZhE25KxjpQdKsSHUTsyly8JmURP0NWBl2
	WAndrqmhAQpQhAsDNRuGP+VKmg==
X-Google-Smtp-Source: APBJJlFtC78bXoBLWFg9lY69vjdN93P6PIRVIJJMMRjsCUTOQl3IUP4GVH+ppYUkqsNTBbrmxR35zQ==
X-Received: by 2002:a05:6000:1b08:b0:314:3a9a:d70e with SMTP id f8-20020a0560001b0800b003143a9ad70emr958740wrz.11.1688376661309;
        Mon, 03 Jul 2023 02:31:01 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id w9-20020adfee49000000b0031435731dfasm3049882wro.35.2023.07.03.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 02:31:00 -0700 (PDT)
Message-ID: <15d0da72-8227-5f75-27a3-34693262d06d@linaro.org>
Date: Mon, 3 Jul 2023 11:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: minor whitespace cleanup around '='
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230702185327.44625-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230702185327.44625-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_023103_564024_D2A5BCD8 
X-CRM114-Status: GOOD (  12.11  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 02/07/2023 20:53, Krzysztof Kozlowski wrote:
> Use space after '=' sign to match DTS coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> index 1b0c3881c6a1..13d478f9c891 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> @@ -65,7 +65,7 @@ sound {
>   		compatible = "amlogic,axg-sound-card";
>   		model = "BPI-CM4IO";
>   		audio-aux-devs = <&tdmout_b>;
> -		audio-routing =	"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>   				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
>   				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>   				"TDM_B Playback", "TDMOUT_B OUT";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 29d642e746d4..276e95b34022 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -221,7 +221,7 @@ sound {
>   				"Headphone", "Headphones",
>   				"Speaker", "Internal Speakers";
>   		audio-aux-devs = <&tdmout_b>, <&tdmin_b>, <&speaker_amp>;
> -		audio-routing =	"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>   				"TDM_B Playback", "TDMOUT_B OUT",
>   				"TDMIN_B IN 1", "TDM_B Capture",
>   				"TDMIN_B IN 4", "TDM_B Loopback",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
