Return-Path: <SRS0=68yh=GP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5FAC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jan 2021 14:47:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E22023121
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jan 2021 14:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E22023121
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mv4K6xKObN3mAHN6Q9CYoSCwCAc9892i71goc3T0bf4=; b=pLhfdUodtebi3Sk+5LrtGRifR
	Fgo5TYz27hywizOQgNstGwhGOJrn7lsptTg6I0cJHhYuYBExiqJLmW/yADuNp8mSj9kYbMyRU0EdL
	BPpDchT5O51dMUFiFpzIwr68vmEIUgzzRhTyDYEaWZznPbrpMUqmTIDbexrY74R5Vq3eWLlvE/ynb
	D2C1aJbqJZ9U0wXuO+pD4G4sR0I42BZIUR71Uv6o8IiKtx5gcrr6fEX55YIdEQr7pGYTKLJ04jdDN
	1/n91RiAMI9xtIOmuExPfBSjXlz2t59ei5fmN7Gqg6mZ0baj2PK7erLZ38M9ciREX1EB8myZAjvZk
	jqSZ9WD+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKwu-0007DC-Ix; Tue, 12 Jan 2021 14:47:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKwn-00079F-Pl
 for linux-amlogic@lists.infradead.org; Tue, 12 Jan 2021 14:47:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id c124so2108566wma.5
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Jan 2021 06:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DZADJFLeZtNtX5++V0ne+jZ8MKQsoTlf7N3vwNewytQ=;
 b=Apip1QRFUEpviUbTbzPw4KB3McpMhbRJK8+Mwl30en21Imr9rk4BbH2f742gqc0BTq
 n0qC2pbeYMJjkeFQLhSXKxqcXnyZuXg+qfCd7V73aIUSL73UTrshelk9rquoq8y6EL/y
 LTTrMKNPfCxD6plIjya7AsDT+wim2aiqPtAhqjv99z4lA34Eeys4uXHZPCRM+5oTOQCk
 CQ+h8RmXvsCZ5hcinNGQWQQLIk+2Y53+gAn/lLu7CKp4HBrHEt6oOuH0CL75c2IOpvxa
 OXvoQMQgOaqJmUQU5hX/sAjHI8obPv8d6keUkIBpuPIp1ZJqroj4HzOriJRqF3XRYi2M
 7MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DZADJFLeZtNtX5++V0ne+jZ8MKQsoTlf7N3vwNewytQ=;
 b=gazHCJhpI0HzfHVSrqmCs5XsaafT9ItfjfrEuPN1CmkbWDsvTnMqPBLPyT0GkyzLBK
 rRsqAFd0Xl6/6c35+6FD9/VUwmZ0WrvopWvo5Voat8yaB/edMj3Da7n7oPdHtVmnixlY
 XDQglstGJZfVktFGbUcA4Gwl3tsAYev3NJSOcwNwU8Mrj85LEKrwRp4286AOjSIWantk
 7fYS9Nj9DVdZQ4kM+JcKCTYAGCdfyzV+Pvg14dGWtO3sSJs216+eC2puW3KEuivd/PS0
 URIAEVOqV/uPEv/kNqscaj/3HfpIjgqpkC67eqYGrxslQDlF8Q59wffmmAP4bX8wlYEf
 EcRA==
X-Gm-Message-State: AOAM530lbo7YMRrB1dXtE+M7Wa1gxjcnqpfFqpdxpsyWCynmf8zqqLEN
 PXcogON0N67A4cL1YgaUYYhs/qC/auYQMpkY
X-Google-Smtp-Source: ABdhPJwpb3Y3B1CkOaFrt+N90j0H2uT/NLlT88IOLOCa7lyOvi7ctcedFic09kIFxMrpeGbl3/bakg==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr3943259wme.7.1610462817766;
 Tue, 12 Jan 2021 06:46:57 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:c414:1f2d:e8b9:b00e?
 ([2a01:e35:2ec0:82b0:c414:1f2d:e8b9:b00e])
 by smtp.gmail.com with ESMTPSA id c10sm5679465wrb.92.2021.01.12.06.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 06:46:56 -0800 (PST)
Subject: Re: [PATCH v2 5/5] ARM: dts: meson: add the AO ARC remote processor
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <f6bb1468-1fd6-e7a3-64b3-5cbcacf37599@baylibre.com>
Date: Tue, 12 Jan 2021 15:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_094702_032059_F33465DA 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 02/01/2021 21:59, Martin Blumenstingl wrote:
> The 32-bit Amlogic Meson SoCs embed an ARC processor in the Always-On
> power domain which is typically used for managing system suspend. The
> memory for this ARC core is taken from the AHB SRAM area. Depending on
> the actual SoC a different ARC core is used:
> - Meson6 and earlier: some ARCv1 ISA based core (probably an ARC625)
> - Meson8 and later: an ARC EM4 (ARCv2 ISA) based core
> 
> Add the device-tree node for this remote-processor along with the
> required SRAM sections, clocks and reset-lines. Also use the
> SoC-specific compatible string to manage any differences (should
> they exist).
> 
> On Meson8, Meson8b and Meson8m2 the "secbus2" IO region is needed as
> some bits need to be programmed there. Add this IO region for those
> SoCs as well.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>  arch/arm/boot/dts/meson8.dtsi  | 21 +++++++++++++++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index e0ca5f08d07d..8bae6ed0abb2 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -200,6 +200,13 @@ aobus: aobus@c8100000 {
>  			#size-cells = <1>;
>  			ranges = <0x0 0xc8100000 0x100000>;
>  
> +			ao_arc_rproc: remoteproc@1c {
> +				compatible= "amlogic,meson-mx-ao-arc";
> +				reg = <0x1c 0x8>, <0x38 0x8>;
> +				reg-names = "remap", "cpu";
> +				status = "disabled";
> +			};
> +
>  			ir_receiver: ir-receiver@480 {
>  				compatible= "amlogic,meson6-ir";
>  				reg = <0x480 0x20>;
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 420324ea2ad7..157a950a55d3 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -369,6 +369,14 @@ mux {
>  	};
>  };
>  
> +&ao_arc_rproc {
> +	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +	amlogic,secbus2 = <&secbus2>;
> +	sram = <&ao_arc_sram>;
> +	resets = <&reset RESET_MEDIA_CPU>;
> +	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
> +};
> +
>  &cbus {
>  	reset: reset-controller@4404 {
>  		compatible = "amlogic,meson8b-reset";
> @@ -496,6 +504,12 @@ mux {
>  };
>  
>  &ahb_sram {
> +	ao_arc_sram: ao-arc-sram@0 {
> +		compatible = "amlogic,meson8-ao-arc-sram";
> +		reg = <0x0 0x8000>;
> +		pool;
> +	};
> +
>  	smp-sram@1ff80 {
>  		compatible = "amlogic,meson8-smp-sram";
>  		reg = <0x1ff80 0x8>;
> @@ -631,6 +645,13 @@ &sdhc {
>  	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
>  };
>  
> +&secbus {
> +	secbus2: system-controller@4000 {
> +		compatible = "amlogic,meson8-secbus2", "syscon";
> +		reg = <0x4000 0x2000>;
> +	};
> +};
> +
>  &sdio {
>  	compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
>  	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index dbf7963b6c87..c02b03cbcdf4 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -320,6 +320,14 @@ mux {
>  	};
>  };
>  
> +&ao_arc_rproc {
> +	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
> +	amlogic,secbus2 = <&secbus2>;
> +	sram = <&ao_arc_sram>;
> +	resets = <&reset RESET_MEDIA_CPU>;
> +	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
> +};
> +
>  &cbus {
>  	reset: reset-controller@4404 {
>  		compatible = "amlogic,meson8b-reset";
> @@ -464,6 +472,12 @@ mux {
>  };
>  
>  &ahb_sram {
> +	ao_arc_sram: ao-arc-sram@0 {
> +		compatible = "amlogic,meson8b-ao-arc-sram";
> +		reg = <0x0 0x8000>;
> +		pool;
> +	};
> +
>  	smp-sram@1ff80 {
>  		compatible = "amlogic,meson8b-smp-sram";
>  		reg = <0x1ff80 0x8>;
> @@ -628,6 +642,13 @@ &sdhc {
>  	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
>  };
>  
> +&secbus {
> +	secbus2: system-controller@4000 {
> +		compatible = "amlogic,meson8b-secbus2", "syscon";
> +		reg = <0x4000 0x2000>;
> +	};
> +};
> +
>  &sdio {
>  	compatible = "amlogic,meson8b-sdio", "amlogic,meson-mx-sdio";
>  	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
