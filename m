Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59173E7AD58
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Oct 2023 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycppwj+dnUCYHwtXoQBD+KPMdaHAKpRrcNgwmUdaznw=; b=k77OHd86bGB2TW
	j8T4tYCIrsJ2dukrGOzgUnGY4tWy/hb1JHzcUHqHTFk5a9dpWHpyO5zsC/JznMhtdaSTnGLQUIMvV
	AqROedlWqpTbObIQkeRU5bGmY7/h+oT/yfXzsOXAO8MYfVoEBHPTER/jkXd1hjt/AbVIzevRJjgjD
	Tkm1d2lw5poy/lMirFrEL4QvFtWkk/+cikYl9b6d7dk7QD0Jr8ZAxRHWBi7SOLWbb9TBgPj3KEghX
	8Bp7ahwenwb99mcMXl5EyCGwC7Da84Y/G1TfAxt2+DfB/XmJ1u36Wfa6c0kK6miuqq92xV0kNQiKp
	wO7r5Rwtau9SsEuTRdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngJY-00Emv3-2q;
	Tue, 03 Oct 2023 14:23:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngJV-00EmtK-02
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Oct 2023 14:23:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-406618d080eso10133125e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Oct 2023 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696343029; x=1696947829; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=i9W+xcDsLhxBNouI0kvlQgnQl4ggfNC0ZxsEX/ORR1o=;
        b=SgBfF4LlXpGlTvm25grOb1HbnW3k9SCUV6pix/8/n3TPYcqcIqnX1Bpcy20orYTmpK
         aefjTCKSYl/7Cke8QyjkVtImMcIsfrZba/T0UCi6YyjMCgm/5ju2WNkw0QDYR9CbGrYb
         JBaxAdqbdrHqbFvTee1GFxdRwxqSceyuwKoSWTY+1eXlvLirNaOYxG6uxcbFFrohsmV1
         d0zyKQmyt5Hh6FX9UpVCJHSQdY6P/mJYWK7mH4MwjTw118ZyBT5Z/sEjafj+a5cdAPel
         RsLC2Ge/hSGglhVpWrxs8Ogjtf1dcd30rcGdfqHGOxnmdN+YJizvsvCeHz8m1Xd77Qdf
         VCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696343029; x=1696947829;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9W+xcDsLhxBNouI0kvlQgnQl4ggfNC0ZxsEX/ORR1o=;
        b=HHizEiX5j/wC4yuY1NvoZhwKmPLTjvPhwe6PVrUuo2PVl0ffDZotUbmhB33a22IcTP
         RBTJhJVFN1xHutnaBHq9st1J/VNhxHwSmfJCbKBhjGEEBQG/TiMIJ0cvnHjEVwwhwEpO
         4qNqqNF+PQ/DvWKU7JPacAwwA/K790qtLuIeyH1aJvah6bjwX+vGVbcDueRvN3ZxsTjM
         8Qkz5n1TUCs6dzRp4qJlme6HC1ugZ8854HybGRy3FBJatvivpP5EQ9+f/MyyCxrnppx2
         I/UEGFdMPF1P2LTHNQe8Ubnk57a2Pfa0sfGwbxfc2dxmpN1+CpHDs3pResftOc9d21cX
         tCZg==
X-Gm-Message-State: AOJu0YwclUw7opEAVtres2A+J4AbNUyitJKhJhWM+uojLhXaXtyRbVoQ
	OQNVnR5MHMMNYMPPrKNbAM6Hew==
X-Google-Smtp-Source: AGHT+IEitvNMt+a+vtvvuOtdMuApyI5AShG40m6AYATZJ5FSglCpEvc26P3572jMqNTAg060w3jzgw==
X-Received: by 2002:a05:600c:2146:b0:401:b53e:6c3b with SMTP id v6-20020a05600c214600b00401b53e6c3bmr13317155wml.6.1696343028424;
        Tue, 03 Oct 2023 07:23:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:15bf:5b59:3e24:71fe])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c0b5000b003fe61c33df5sm9569933wmr.3.2023.10.03.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:23:47 -0700 (PDT)
References: <20231003121205.2870923-1-jbrunet@baylibre.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: amlogic: add spdifout on libretech potatoes
Date: Tue, 03 Oct 2023 16:19:08 +0200
In-reply-to: <20231003121205.2870923-1-jbrunet@baylibre.com>
Message-ID: <1jsf6ryebw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_072353_232049_8D33D7B0 
X-CRM114-Status: GOOD (  14.53  )
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


On Tue 03 Oct 2023 at 14:12, Jerome Brunet <jbrunet@baylibre.com> wrote:

> SPDIF output is available libretech's Potato v1 and v2, on a dedicated
> header. Add the codec, pinmux and dai link to enable it on the sound card.

After discussing further within Da,
while the the schematics says SPDIF_OUT this is actually not the only
use of the header. This mis-understanding is on me.

Please do not merge this change.

At least the information is out there.

>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 17 +++++++++++++++++
>  .../amlogic/meson-gxl-s905x-libretech-cc.dts    | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> index 2825db91e462..ca6f922d162d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> @@ -23,6 +23,13 @@ aliases {
>  		spi0 = &spifc;
>  	};
>  
> +	spdif_dit: audio-codec {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "9J2";
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -189,11 +196,21 @@ codec-0 {
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
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 27093e6ac9e2..8b3234a9cb45 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -29,6 +29,13 @@ dio2133: analog-amplifier {
>  		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
>  	};
>  
> +	spdif_dit: audio-codec {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "9J1";
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -183,6 +190,14 @@ codec-0 {
>  				sound-dai = <&acodec>;
>  			};
>  		};
> +
> +		dai-link-4 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
>  	};
>  };
>  
> @@ -193,6 +208,8 @@ &acodec {
>  
>  &aiu {
>  	status = "okay";
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
>  };
>  
>  &cec_AO {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
