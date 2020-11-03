Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5856C388F7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 08:56:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68DEA2071A
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 08:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ad2e24af";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pSecCe0X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68DEA2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G7EaFs4fXOIgPY6WV8+39MlgWMl9Qvc3jOx2zmRwdWE=; b=Ad2e24afqvgdSNxRSaGteoPe7
	xfa9GPUJTBv/iX1CTj3b8faktbmT/qIRvfS+UzxLshU5cLm6YS3sUgzzVp9/axZTR9KhyzVgTRI0A
	+amD1H6RO8ueBIMNFDJOut2QR9Am6rmNIlrdfV9TdY4i0+aXggNjxJThpfIS8YkchIHrCgM56bO+n
	Y1J9WPBW0l3vvzbOZB1pZ171knt55ev9oUzuiPGOGNV13zWKGw1BfndaieuZUsxJWacvTcIfFflV7
	Vmd+TbZUD9AST4vSSOeJUZYkp71fcOVCuwxqRSZItywAf/ADdos/7NDy/xA/X1x8xIFy8kQPSaPa2
	328wkXq/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZs72-0007O4-US; Tue, 03 Nov 2020 08:56:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZs6W-0007BR-U9
 for linux-amlogic@lists.infradead.org; Tue, 03 Nov 2020 08:55:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id k18so11949753wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2020 00:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xY34MN3iAkb+yO1dRrfDsV7FnfSbSim8FfV1oURLqNc=;
 b=pSecCe0XbNaG91QuJf7MfoesoIflmUXAxrQrP3oOuM3CEvlonIAzazXh+Bze9+Svno
 uCLWyTSHz5CkgxJrA/2rJzHzF8RalElJtsmZ4Y1cwmWwa5/fkjzXrvM0P6zBgR/vuztr
 1Ut46OauRe1pdBV0wlS/PeqfW+c8it1jZCEpHoqjIrDeDA/jjxFNCGsZH0T6L6qtLpqb
 i0NrwPEls393CFEl7K5D1Ea77Z1n7dE2bGXLtAxuzlJkOu/hxfntcqrH3MTkEcXAeaLH
 rP4idOgI1X4mNt+EzDy/xg1ewFDRAPpxjusTHfiUZBghmjmKapIFHced5F7jotSGk1rv
 YPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xY34MN3iAkb+yO1dRrfDsV7FnfSbSim8FfV1oURLqNc=;
 b=TdRBj2FQQxM9HkbQQZihDOlO4bx9lDC3aJl3EfPJN9O0iRS+n3kHyzJPqdKpBylcU0
 qLPKckHYK8kgo7PVr3UzXxEMKGwXeBQ52xV0l+vNjKKc9/S5mpy05aoRosXxgfBcukEC
 FzvnPmLOpj3HZs4Pf3cYpoBzWRLtkFIpxJPg9FHNcVYH22OOvMXvVX65vh6C0fR/oUgu
 FJOTu7Q7ywiPzv2XJvt+thk7thInPa8nnCTfBJzesLq49+vkuCGk6b3tQXFa+oTqJjAo
 nJC3noFz19ff9ZsOVuPy1s3MNQjoK0h5aXxT1yPXWygvbZhF+5s+RY/Lc4epAO4Fr1GY
 j4DQ==
X-Gm-Message-State: AOAM5338ga6xHbn5Ei4KXx8Y+ICCqaINcL8tJ0RW45knajCBBVQU3hqF
 UXw65nrOkSkEfv58j2IL3i58/qL7Uww/izWi
X-Google-Smtp-Source: ABdhPJzbcOoCtbYJTMm5ol+SOaiOHbSRFTPbXSUsF5wq26uFSKr/+k4ny0M8YqaDxsRS3CgKCZGf5Q==
X-Received: by 2002:a1c:3502:: with SMTP id c2mr2457466wma.79.1604393747079;
 Tue, 03 Nov 2020 00:55:47 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3?
 ([2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3])
 by smtp.gmail.com with ESMTPSA id u3sm2532324wme.0.2020.11.03.00.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 00:55:46 -0800 (PST)
Subject: Re: [PATCH AUTOSEL 5.9 02/35] arm64: dts: meson-axg: add USB nodes
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20201103011840.182814-1-sashal@kernel.org>
 <20201103011840.182814-2-sashal@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d3ef0d93-a95b-2109-ef6b-3d70ce3b9cc3@baylibre.com>
Date: Tue, 3 Nov 2020 09:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103011840.182814-2-sashal@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_035549_109445_6E317BF9 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/11/2020 02:18, Sasha Levin wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> [ Upstream commit 1b208bab34dc3f4ef8f408105017d4a7b72b2a2f ]
> 
> This adds the USB Glue node, with the USB2 & USB3 controllers along the single
> USB2 PHY node.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index b9efc8469265d..fae48efae83e9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -171,6 +171,46 @@ soc {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		usb: usb@ffe09080 {
> +			compatible = "amlogic,meson-axg-usb-ctrl";
> +			reg = <0x0 0xffe09080 0x0 0x20>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
> +			clock-names = "usb_ctrl", "ddr";
> +			resets = <&reset RESET_USB_OTG>;
> +
> +			dr_mode = "otg";
> +
> +			phys = <&usb2_phy1>;
> +			phy-names = "usb2-phy1";
> +
> +			dwc2: usb@ff400000 {
> +				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
> +				reg = <0x0 0xff400000 0x0 0x40000>;
> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc CLKID_USB1>;
> +				clock-names = "otg";
> +				phys = <&usb2_phy1>;
> +				dr_mode = "peripheral";
> +				g-rx-fifo-size = <192>;
> +				g-np-tx-fifo-size = <128>;
> +				g-tx-fifo-size = <128 128 16 16 16>;
> +			};
> +
> +			dwc3: usb@ff500000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0xff500000 0x0 0x100000>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				dr_mode = "host";
> +				maximum-speed = "high-speed";
> +				snps,dis_u2_susphy_quirk;
> +			};
> +		};
> +
>  		ethmac: ethernet@ff3f0000 {
>  			compatible = "amlogic,meson-axg-dwmac",
>  				     "snps,dwmac-3.70a",
> @@ -1734,6 +1774,16 @@ sd_emmc_c: mmc@7000 {
>  				clock-names = "core", "clkin0", "clkin1";
>  				resets = <&reset RESET_SD_EMMC_C>;
>  			};
> +
> +			usb2_phy1: phy@9020 {
> +				compatible = "amlogic,meson-gxl-usb2-phy";
> +				#phy-cells = <0>;
> +				reg = <0x0 0x9020 0x0 0x20>;
> +				clocks = <&clkc CLKID_USB>;
> +				clock-names = "phy";
> +				resets = <&reset RESET_USB_OTG>;
> +				reset-names = "phy";
> +			};
>  		};
>  
>  		sram: sram@fffc0000 {
> 

Hi Sasha,

This needs also support in the dwc3-meson-g12a driver, you can drop it from backport.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
