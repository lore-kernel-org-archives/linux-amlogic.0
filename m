Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D1C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH9hxtNI4e/iQTX/MS21cGojPluEz+5RkZhJtJLPymQ=; b=AzZw7lRlKaWXNuJdbp2f1vKJnY
	kpyQt1gjf9/0P7ajeIx5B342ym5ntvDie25VHm7chYZAlsFfUZbaPDN9g41UNyPAtWlYznN7hmMr/
	hGk95vXEuyzx/p69Sbm8HDWh1kI170E1JFLHJox6eCE64FOLb2XEYP1jbKDQMqej8MUcDfCCahsR/
	sPyPdnv7fdc3kSaZG/l1fgeMkr6o+sPy0/EjUgutDX0/iXHUCZ4QRuz7DJ1STlbmfenwFP/Jan4wm
	KwdN5G6ea7rExkgZAMTDf+swZmI6kH24+x41JRn221ebeQEnexX6m+4j0ZPs0lips4Df2uduKFqr9
	i/CPHaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXntA-002rmG-Ct; Fri, 25 Mar 2022 17:38:16 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnoY-002px3-Se
 for linux-amlogic@lists.infradead.org; Fri, 25 Mar 2022 17:33:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id h23so11799129wrb.8
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Mar 2022 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=j/qujzbOuESO1PpbNdCPI/EIyCvZoY0MDDUpDJ3vHQ8=;
 b=uP0lqXFXhzYKz5P+7JgxvfcuieaiSaPuf6FKbYTRS1nnhh5/8/waCnRzHNJ5x1Yoco
 zrYA3C9C4XMNhUA0WzVXJEE9gIATswTBPhmTD65WwKR6UUnzz1sNLe7SafOd9hTnAjyj
 EN7M8SBexFuEDWPP4mZhkEfBBCfpBXiHi987yqTmx+nRBmrr0h/P+eRB+ItIAulBYAMh
 //HJtcs2GloFlcIVy/N+Nf3IJnY79DhNMDKHFr5hhFZMbrDN9bQIsWc2sFd+/H4CjDRp
 pUx/FIe2HcWc3iq5Gotf0CRIXxWN5azSG+FZEr5zreXnY+WzOhk1Mqiw79g7lgL2tw/K
 7gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j/qujzbOuESO1PpbNdCPI/EIyCvZoY0MDDUpDJ3vHQ8=;
 b=6n3s2zUu3DK7uZsEzwzfq3MJN4L+t0CAKCHH4RIoXwdc/DlOoEXWODdjUcukglpV6p
 9C6LQ4Hdk7CoA6G4P8K4zPkva37pSeNMuvU1u0zfg/r273C/k3FIKJbqSamkfjOq+LN2
 kiRnF49OVTXcM9/tvPMHrDBfJh0mhunkNEO/itF+Uw77H3NPP9MUCW0Ao5yt9a8BsdOZ
 jYRYwHuZhl8lNiVI6EAsfAlmDxEh5FGkENe+S4OcfKiPLHLRvesohMtXukSkbQSbYkJl
 GuQphu2UrpaRj1Qsw8p6QmJKPCVeaI9ef5KfroknEeDJdgEW0Zfgaaak6P3t07J+6Cap
 f7Yw==
X-Gm-Message-State: AOAM530rd5M5Tlph6685XDnFbE5ehZK3e+C2W8tX7j7WSnuHZJhQ813p
 fg0I2l9Q0LpubT1Wk+FRCH6Oiw==
X-Google-Smtp-Source: ABdhPJxWqVuvY3ZRZ1JUHUDqORUP0Rmjzvw0CFxpJIL8aXbTr9PeJxwL33wgu5gJe3wFMd27QXw06A==
X-Received: by 2002:a05:6000:1379:b0:203:ee50:45ad with SMTP id
 q25-20020a056000137900b00203ee5045admr10011117wrz.268.1648229609490; 
 Fri, 25 Mar 2022 10:33:29 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d3b0:47bd:8485:31cd?
 ([2001:861:44c0:66c0:d3b0:47bd:8485:31cd])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm8602540wmq.21.2022.03.25.10.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:33:29 -0700 (PDT)
Message-ID: <934c32f1-5fc3-7b38-3fee-0c75de928302@baylibre.com>
Date: Fri, 25 Mar 2022 18:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] arm64: meson: update SDIO in dts for JetHub D1
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220325165501.81551-1-adeep@lexina.in>
 <20220325165501.81551-4-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220325165501.81551-4-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_103331_003426_E6164E6E 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/03/2022 17:55, Vyacheslav Bocharov wrote:
> Fix the dts to match board's reference design:
> - update vddio_boot regulator to 3.3v (Wi-Fi SDIO module)
> - add vccq_1v8 regulator with 1.8v for eMMC SDIO
> 
> In the first revision of JetHub D1 the vccq_1v8 regulator was 3.3v.
> All installed eMMC modules were tested to work in HS200 mode at 3.3v
> supply voltage. In the next revisions of the board eMMC will be
> powered with 1.8v according to the standard.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>   .../dts/amlogic/meson-axg-jethome-jethub-j100.dts | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> index 66c1eeba8f48..bc00d672a357 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> @@ -81,12 +81,22 @@ vddio_ao18: regulator-vddio_ao18 {
>   	vddio_boot: regulator-vddio_boot {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VDDIO_BOOT";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vccq_1v8: regulator-vccq_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCCQ_1V8";
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <1800000>;
>   		vin-supply = <&vddao_3v3>;
>   		regulator-always-on;
>   	};
>   
> +
>   	usb_pwr: regulator-usb_pwr {
>   		compatible = "regulator-fixed";
>   		regulator-name = "USB_PWR";
> @@ -248,8 +258,7 @@ &sd_emmc_b {
>   
>   	bus-width = <4>;
>   	cap-sd-highspeed;
> -	sd-uhs-sdr104;
> -	max-frequency = <200000000>;
> +	max-frequency = <50000000>;

This changes should be in a separate commit

>   	non-removable;
>   	disable-wp;
>   
> @@ -282,7 +291,7 @@ &sd_emmc_c {
>   	mmc-pwrseq = <&emmc_pwrseq>;
>   
>   	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&vddio_boot>;
> +	vqmmc-supply = <&vccq_1v8>;
>   };
>   
>   /* UART Bluetooth */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
