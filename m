Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA30FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YJVnGsI+RAxcd5vRDdT30EbCGTaFcahvzUlxH1eugXA=; b=wl7C5Qdxu2PeQhuTkdr65PL9qv
	GRsGO3ATT0E2JyZxFcM+DST8fXDYAlVvN6ql3PnpQm7v0Ze89BtXVybzw3kHAQyh3mS6TxP2fBy1/
	ONTeMfZibX3XDm1Y/9IrjGNbOQLVDAKSpiOklX/DMUgj/XgvGmyebYAxuucKsXaYFPUS3+T3jgNTu
	BtBhatK7GI1fwyd+BK+YDiYnOUJf70UeqxOFASqnZH3VGeUXs65z7YPULnHEEDZW8nXY7rHpk+f9b
	nGV1VOeTAAyypvdi8UgWt7xU5Hppox6pV4VD78TrBgMD6/hfz72qwfSbYXba2A6qg/FJAsnQbdokN
	qfgFy+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9T3J-00FBfL-IM; Mon, 17 Jan 2022 14:32:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9T3G-00FBdQ-PL
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 14:32:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso23141484wmd.5
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JkVqqY9kZfQlCXm2Gf4qVdWbnEyCYzJMqa1tKAalEO0=;
 b=GwOd4qQ17iTBKi/M2U09g7wFRrZ7O1AcmcJsEB4JxJHNHmQDDZeuIJcVxi2iKOt3LI
 sjaEewjLWKtdO/Fcual2luU6kyA/r/EhCe/KRLfQCueOCNTkSduqbysao57Bo1lhmYd3
 9nJ2sk3UjPwh1ZMjx58Us5bV0deT7dp2w8u/N/lzJXfHKSKUxLE8fZ2ZTAGJ4djz2uhW
 p47foC9ykdJDRwLlldDV++bMlA9SPs7gMkmOzuG+Dss144I1w2tuj+ByGPpp5opg4XIw
 JE/LAuQe99lypus2YI8qHf4+JPmy+9ACu6dXlxpf5GjHixnpKmryC2HsPo828+KHOKsM
 uHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JkVqqY9kZfQlCXm2Gf4qVdWbnEyCYzJMqa1tKAalEO0=;
 b=LWlnm5IpLEtUy+EVIZm6HvvXnI/UKkvVzFlAJob41PDWoWJqMN3HE4IFQW5zN/EhSV
 9anqSc46dNyOu4ojlw+fIpg/mmIo6yUW+SxbYnyAd5aZGmKEMuKbnvkd+8xWifz99FhI
 wgeC+iErD5Hwav0FQZEDlc7ogisv3YR55FoeVeAu3ciAtxGAQlUUE5kfOZy16zD+eIMb
 0py0gX//YZsqXdUePn1GPmxmRvuhAoGAWRnlsEvJE92DTsJv6gqgI6ks/Ot0etx0MrQl
 dTQjP2dXz3+zWx5fR3a4uMJHLy7MMkDrxVuFM6lfMy3N8P/rrLoRn1glAIPWIXSLIKeD
 KFhg==
X-Gm-Message-State: AOAM532e15zerz0tUv5oHy3IG9+6afGCyJU2DY2LeHpDCdas396JTC3o
 7mBq77N+pUWDtSRsKvALq/mnZA==
X-Google-Smtp-Source: ABdhPJy96ZZV8+Ibug5tTlQussK4v5Du7LmRau62LTD73sovJWJzj+U7KynntUu/47ZyvxG+FR4F6A==
X-Received: by 2002:a5d:6d89:: with SMTP id l9mr15499890wrs.14.1642429925354; 
 Mon, 17 Jan 2022 06:32:05 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id y9sm6702962wrm.94.2022.01.17.06.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:32:04 -0800 (PST)
Subject: Re: [PATCH 1/3] arm64: dts: meson: add Broadcom WiFi to P212 dtsi
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220113041746.16040-1-christianshewitt@gmail.com>
 <20220113041746.16040-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <927257db-1338-af1c-3198-3153e122967b@baylibre.com>
Date: Mon, 17 Jan 2022 15:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113041746.16040-2-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_063206_852711_2DC350CD 
X-CRM114-Status: GOOD (  19.18  )
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

On 13/01/2022 05:17, Christian Hewitt wrote:
> The P212 has a combined WiFi/BT module. The BT side is already enabled
> in the dtsi but the WiFi side is not. Let's tweak SDIO speed (in-line
> with other GXL/GXM devices) and enable the WiFi module.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> index 05cb2f5e5c36..c635e5858929 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> @@ -113,7 +113,7 @@
>  
>  	bus-width = <4>;
>  	cap-sd-highspeed;
> -	max-frequency = <50000000>;
> +	max-frequency = <100000000>;
>  
>  	non-removable;
>  	disable-wp;
> @@ -125,6 +125,11 @@
>  
>  	vmmc-supply = <&vddao_3v3>;
>  	vqmmc-supply = <&vddio_boot>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
>  };
>  
>  /* SD card */
> 

As I commented in patch 3, the 2 changes should be split.

When you resend, you can put my:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

in both patches.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
