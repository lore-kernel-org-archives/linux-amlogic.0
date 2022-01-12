Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4DFC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VW6qy6vhvcLZBXP5f2PStygw/eIWq+FDMnEeGhAkSME=; b=11WEden1vCDZcY0vGXoBQoPC2/
	tYSsP9Ln2JTxgXSm1+IMXz8JvZkosWtImLzr8P4c2W+pOHXCKv1JpwkE3kHqo63aTbtDK1w5EmWpX
	4lS/xxdliTdvT/rvNC19pS5gLo87zqgvqLLcCO5uHBp+2/kQaBP8e3ahxCn4mEPEJItY7W/cgXZ8G
	INmvoKTnnxCTNUeGdPXKbwXlLWRFMmhpIANIzgUcqZ5ACIL00Lrn/VMEx0hex/WSmKnA5C3aiSpC8
	zYGcR0Mg4K2+82/OfapcIv6lJhbG2TFEa9HM7f9wNso/2vcVxLUKfz0kjsgMCtEkaJdRNUQIfp+16
	tj6Whz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z26-001XXz-6W; Wed, 12 Jan 2022 08:31:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Z20-001XUS-EA
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:30:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1086922wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vJ+w22PTxUPaJcKWhY/UceXma5p+nqWWd0Bsmebx8pQ=;
 b=IeeX2Is5svan06jOKIvq/96afdKfJzhzUKgHhQ0u3wtF46c8hjl3h1OBkqD4qXrQm0
 /KbWT6JaUOGhdO0C+JbtgZonOP1rb8bp1Jt6GiSUz0jpJ23IbDPBZ9CTtyY/rzrMBR+B
 aCOFCWREcEAk27MX53Tnv0n4CVIEuvSpIzMigVMQglVkTxGoC0xN138aXE6J8fSBJjqI
 pKpcMP/FQhH1tlN82stvigaOWpKwkwzF6BUYLwqlgv7HCTrGv6zRllLN/MC/WWt+X0gl
 xjw44EEjrXtd4Dl9g3SLB2LSTF8BfR3cOcFnzbTHLq3yoJE++xNvbhq15kZrZi2iMBI2
 umOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vJ+w22PTxUPaJcKWhY/UceXma5p+nqWWd0Bsmebx8pQ=;
 b=C0a7nZez//7X9V/fKjBkXvhLMr59XWv6ugG+FT3FLNnPMmFvRhOebrUn2y2UOHMyJr
 vZmA1J87xAK+GXpZOnVu5pwvhfutXRlXa+qYhLvmjcTEv09PW81uOevjVRPrblFbg8dJ
 vE1B/rc3hl8b5tqUIqcwwNxksBU9NCPc+1HhDavSUHBfENaEnd6AIkdQ9kMaR1VMyvtP
 L3tCh8SlC5gk9TBci291k+LtmZDVchnpnAgE6ty8yi24vZINQcNHQfW5fJ1O1HuhI710
 JYWSwZyQ6j6kcEeyFGvjIk6BwhLgJI9Asb5dx3XYcO7CNJmfjycTtLI2L6UE9sdMqtEp
 8dbQ==
X-Gm-Message-State: AOAM5323SePKUXGb4nEIuPLaHEsHtEFY0XITCSeh+NNAeLZ82CL9wkEG
 oJRr6CxYs9/RVNtp4EZaUOSiOA==
X-Google-Smtp-Source: ABdhPJxLOO/vJS+ah4oOFATT6onrl/OkLjwtx4tPEXlqChpCptI4FLbhrbta4n/T6Sb+KXZ8/ItwFQ==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr5616827wmq.152.1641976255095; 
 Wed, 12 Jan 2022 00:30:55 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id q206sm3981739wme.8.2022.01.12.00.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:30:54 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: meson-g12-common: add more pwm_f options
To: Gary Bisson <gary.bisson@boundarydevices.com>,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-3-gary.bisson@boundarydevices.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a4282cb9-3ebd-0c95-7a47-522eb1bbb770@baylibre.com>
Date: Wed, 12 Jan 2022 09:30:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103154616.308376-3-gary.bisson@boundarydevices.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003056_539055_E030AC64 
X-CRM114-Status: GOOD (  14.51  )
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

On 03/01/2022 16:46, Gary Bisson wrote:
> Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../arm64/boot/dts/amlogic/meson-g12-common.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 00c6f53290d4..af1357c48bee 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -894,6 +894,22 @@ mux {
>  						};
>  					};
>  
> +					pwm_f_z_pins: pwm-f-z {
> +						mux {
> +							groups = "pwm_f_z";
> +							function = "pwm_f";
> +							bias-disable;
> +						};
> +					};
> +
> +					pwm_f_a_pins: pwm-f-a {
> +						mux {
> +							groups = "pwm_f_a";
> +							function = "pwm_f";
> +							bias-disable;
> +						};
> +					};
> +
>  					pwm_f_x_pins: pwm-f-x {
>  						mux {
>  							groups = "pwm_f_x";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
