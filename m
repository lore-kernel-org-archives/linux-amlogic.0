Return-Path: <SRS0=3eID=6G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FF5C54FCB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 14:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBF82074B
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 14:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJY5aNYu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NWXrMGMW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBF82074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+eMtChMoKiEpZmoXCcJ6LdmVdSBO30KoEqCO+6XjiQ4=; b=iJY5aNYuS3pJi52FDGOjLq4MlS
	MUlBwF4eRBhUGQLFjKDGPgB442Xmy/ASEC2vz2ysWuebs35QB6k0dWam+x4W2E2mSTCQzN6Zxz6wz
	vNi/8cdU3/liCi3LVxVVsx/PwQL6djGA/mHc6jxX4s8U+2OWSJL6dG8ZdDjceVNfHEVcesdBwAIWn
	6QE/9rkw2cNPlUZDa7M5g+k6m7I4o87e3pM1OpMK+J5uPGwwS1jCCBAuPk3VWJELDDYZOkANUAfql
	vsLoZAcMepm0dtt7V/tIY2wmiNHu+Tx6nnyUykwZZk3u+/zGo6uQM7Jx5IreMIB1yzUdN7E86XU6+
	W6P3E6SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRGWl-0001ov-OS; Wed, 22 Apr 2020 14:39:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRGWh-0001nL-Qk
 for linux-amlogic@lists.infradead.org; Wed, 22 Apr 2020 14:39:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id 188so2624960wmc.2
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=VPAi1jzLz5ivFSLbrGPumH1oKGnefQqrzmeoEGE1ITQ=;
 b=NWXrMGMWMxCuyyrkVI4ygim/zyyRBFfu0ln1870AObF6kViSLCgRrduj5VNqiYJjZh
 CLQih+MuUGO0UE3mMHcEzIjYzavQdqHD9OfkQkHtVC+aY5tVgwfKjfTiG/Xtj5xS7BAy
 cYxQx3eHrTRhYlvHHGcz5OK1E77s4vw09iHqF6KL1V8nwEQUw3XQ3t3TSa/16CyKnqHy
 PxhiVLdTCArUK3uDtGofQ42UEPpAen1euxQDweVl0dOEawd77txkTo781ZdpAbzyUURu
 CwlctttVX4b4OKRqBGzsBiCmy0E1puIEHLmqDbyHo6t0WVx+utyl6UkxGlIvXAj1bqR7
 xEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=VPAi1jzLz5ivFSLbrGPumH1oKGnefQqrzmeoEGE1ITQ=;
 b=VDFmNO5r4DwUCvoMBAeb6oL/UY9bnzrzBl0hnx6GoO2JYDcRd+ex7Ta3G88DjK35CI
 xO1YU4m+MF62M7G8K9v63PZ1lI6zISNhczoKpSQqFB5N+RfH/dLO+XDtrW+D5RKCCpnm
 BLsird5vFsh7fr3iR21uqmS8zw4/bbv7HAFvqqqCxLGOdLiJijpT3GWeGMZa+JNmFWrG
 SNAQ1gO+5TbK9ssIaFx9ADVCQw3ZCFcZoLzZJGZXtX1Z9ruTrxpti2Dw4Im0Fj+nygAD
 s5f4R2nBTFg2hxLw+9iJtppzPf7jNQOF9Q7f56oFT7jOxeaIC/HcnwppJqW63slYJobk
 EJKA==
X-Gm-Message-State: AGi0Pua+gHRTKHq3Mts4tpeS8LtJCOZLPfWy8nDIE05WYJYjEdZONwp8
 9Y6I/KngNOIwVQBf3WoaxtMAPg==
X-Google-Smtp-Source: APiQypKaHUpWnwclQRW8xfFhyadtn5bDQCs+tzS8XlFHPn49wjgX/3RyvXk4ThzLcKVkkCZU4zhaCQ==
X-Received: by 2002:a1c:2506:: with SMTP id l6mr10538294wml.44.1587566334432; 
 Wed, 22 Apr 2020 07:38:54 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y40sm9394800wrd.20.2020.04.22.07.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 07:38:53 -0700 (PDT)
References: <20200421163935.775935-1-jbrunet@baylibre.com>
 <20200421163935.775935-3-jbrunet@baylibre.com>
 <63b05930-4814-f8f9-d1eb-2bd487ed3406@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/6] arm64: dts: meson-gx: add aiu support
In-reply-to: <63b05930-4814-f8f9-d1eb-2bd487ed3406@baylibre.com>
Date: Wed, 22 Apr 2020 16:38:52 +0200
Message-ID: <1jimhrzitf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_073859_938152_7C55423E 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 22 Apr 2020 at 15:12, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 21/04/2020 18:39, Jerome Brunet wrote:
>> Add the AIU audio device to the Amlogic GX SoC family DT.
>> ATM, this device provides the i2s and spdif output stages and also
>> the hdmi and internal codec glues.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 13 ++++++++++++
>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 23 +++++++++++++++++++++
>>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 23 +++++++++++++++++++++
>>  3 files changed, 59 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> index 03f79fe045b7..a8dc8f810253 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> @@ -278,6 +278,17 @@ reset: reset-controller@4404 {
>>  				#reset-cells = <1>;
>>  			};
>>  
>> +			aiu: audio-controller@5400 {
>> +				compatible = "amlogic,aiu";
>> +				#sound-dai-cells = <2>;
>> +				sound-name-prefix = "AIU";
>> +				reg = <0x0 0x5400 0x0 0x2ac>;
>> +				interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
>> +					     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
>> +				interrupt-names = "i2s", "spdif";
>> +				status = "disabled";
>> +			};
>> +
>>  			uart_A: serial@84c0 {
>>  				compatible = "amlogic,meson-gx-uart";
>>  				reg = <0x0 0x84c0 0x0 0x18>;
>> @@ -626,6 +637,8 @@ hdmi_tx: hdmi-tx@c883a000 {
>>  			interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			#sound-dai-cells = <0>;
>> +			sound-name-prefix = "HDMITX";
>
> sound-name-prefix is not a valid property in Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>
> It should be added.

Not sure it should be explicitly added. It should be valid for any
device providing a sound-dai (sound-dai-cell)

>
> AFAIK sound-name-prefix is not present on g12-common, is it missing ?

It might not be strictly required, as long as there is no name colision
in the ASoC widget and Control, it is OK. IMHO, it is a good practice to
set one to avoid those colision.

>
> Neil
>
>>  			status = "disabled";
>>  
>>  			/* VPU VENC Input */
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> index 0cb40326b0d3..234490d3ee68 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> @@ -60,6 +60,29 @@ usb1: usb@c9100000 {
>>  	};
>>  };
>>  
>> +&aiu {
>> +	compatible = "amlogic,aiu-gxbb", "amlogic,aiu";
>> +	clocks = <&clkc CLKID_AIU_GLUE>,
>> +		 <&clkc CLKID_I2S_OUT>,
>> +		 <&clkc CLKID_AOCLK_GATE>,
>> +		 <&clkc CLKID_CTS_AMCLK>,
>> +		 <&clkc CLKID_MIXER_IFACE>,
>> +		 <&clkc CLKID_IEC958>,
>> +		 <&clkc CLKID_IEC958_GATE>,
>> +		 <&clkc CLKID_CTS_MCLK_I958>,
>> +		 <&clkc CLKID_CTS_I958>;
>> +	clock-names = "pclk",
>> +		      "i2s_pclk",
>> +		      "i2s_aoclk",
>> +		      "i2s_mclk",
>> +		      "i2s_mixer",
>> +		      "spdif_pclk",
>> +		      "spdif_aoclk",
>> +		      "spdif_mclk",
>> +		      "spdif_mclk_sel";
>> +	resets = <&reset RESET_AIU>;
>> +};
>> +
>>  &aobus {
>>  	pinctrl_aobus: pinctrl@14 {
>>  		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> index 259d86399390..d9f00c5a9a5c 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> @@ -49,6 +49,29 @@ crypto: crypto@c883e000 {
>>  	};
>>  };
>>  
>> +&aiu {
>> +	compatible = "amlogic,aiu-gxl", "amlogic,aiu";
>> +	clocks = <&clkc CLKID_AIU_GLUE>,
>> +		 <&clkc CLKID_I2S_OUT>,
>> +		 <&clkc CLKID_AOCLK_GATE>,
>> +		 <&clkc CLKID_CTS_AMCLK>,
>> +		 <&clkc CLKID_MIXER_IFACE>,
>> +		 <&clkc CLKID_IEC958>,
>> +		 <&clkc CLKID_IEC958_GATE>,
>> +		 <&clkc CLKID_CTS_MCLK_I958>,
>> +		 <&clkc CLKID_CTS_I958>;
>> +	clock-names = "pclk",
>> +		      "i2s_pclk",
>> +		      "i2s_aoclk",
>> +		      "i2s_mclk",
>> +		      "i2s_mixer",
>> +		      "spdif_pclk",
>> +		      "spdif_aoclk",
>> +		      "spdif_mclk",
>> +		      "spdif_mclk_sel";
>> +	resets = <&reset RESET_AIU>;
>> +};
>> +
>>  &apb {
>>  	usb2_phy0: phy@78000 {
>>  		compatible = "amlogic,meson-gxl-usb2-phy";
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
