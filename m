Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E0C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pj883cX7eYb37IRCzNEb2DbpfcE7Gho7YNk4tQpQl8Y=; b=pklHQ+ynlCU1qwwkPT5ZX7R7X+
	/3SXp+k/eGGBrP2LPJdJHsHThfwJD2jcqg/eqOFVkHBR7PDmWbJDUGzUt9DTXdRZUAVW9vOuefKMF
	Dn1/p2DQ/YlciYWAl1v1+7xdL+T7bF+VVEffh5t75O/Jpola0fPcnkOKF2T1xZ1TfNvxu22Y9tVVT
	bFIWYvn2ct8u4OmyvdAZPAOATkNzORBMW4VnDXdBHTxGTYu48Hj02IuDQbRwUc1Id9s/TtjL4I0I0
	PoRWiuaz8gd6MwJ+lKDxapdNA34pLH5/E0lcwd0Kqre10UVD6ms3Guv0M7eni/XVUe1YEjRvPtkeQ
	bH7KIj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9T26-00FBAn-Ss; Mon, 17 Jan 2022 14:30:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9T1u-00FB7u-8k
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 14:30:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso24775453wmc.3
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1qCDtK0pn2oxt/dygNI3dBfTIc8Ow2NP2GJorgRm9sA=;
 b=tC0xSuKFutKm9eO/94iduqujirQJ/J/cZSJASDLdN3De2Q8dwRjZEOS7gNymWSZtJk
 nJ4h6NgRWKUZFHxeib0pOht0apN3VL48llsfJc8ay91rjw4KiRm7kHeuWSgfnz5Z57EE
 aAqk43UviPgI8fRAywyd5JCxul27SxUkkz9cR9jOBSZCIFKIDmdb6I3Aoi7EQKaexCXl
 wFGjiAoLDJ/sTvl33QO2EVNS4c/ZPpWg1juygPJjlrfESgUpfwIefrSMcaBbroZUA2T9
 Xz5lNn78G5Ih/PtIuBmxC6WHNj1Ov8v1IUPjV8WLyO6cXHJ7iTZcZJGMiq0aJOKqHAXa
 RlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1qCDtK0pn2oxt/dygNI3dBfTIc8Ow2NP2GJorgRm9sA=;
 b=jnvIEIP75z2Vlds/LG/NwNwhxuidvCXpLnLob9MwpZ/rXfFHM/xs3IrJfwpqzB6nzz
 pmr6EtGNm1OKU8pdUjvIg5n+yftsdjCqueQiMVtO/ppGXOW3osbBoENX+qviXl2RcPux
 sD/I0BkGAqhqI/6Im7FlioZBXC0TEVNfK0xh/OkrRMIA7Ylw9pVAVSLxG7QUseXyOJQG
 ZYjFUJqEZkQbkAiCgBAX6lX5wZRNFMlFShF7r6Fy9u/b8G8B9NoNA5rGS64cdk6DgtPh
 SnMJXX91fpXPitosjpvYo9lYdmMn0ixTnj5X/Mdv1dyIVn3wSzJYQRApjZB+aQhXmF03
 6TnQ==
X-Gm-Message-State: AOAM531TOBtGGYvWOHsW7QLhsvcTnHhxUlfZ1qpAQcOx6mGEu/ZpZ4Md
 dXX04S3gjupqSZ2Sh6/N+TfKwg==
X-Google-Smtp-Source: ABdhPJwiQM+eAaGs9tYAY5xvpnrS+AV2fSNWJAZH9VzjH87QRF+7ENwGFzuPyU57bwh6CbY/aqM+XA==
X-Received: by 2002:a5d:42c3:: with SMTP id t3mr19995885wrr.301.1642429840767; 
 Mon, 17 Jan 2022 06:30:40 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id x8sm13243778wru.102.2022.01.17.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:30:40 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: meson: remove Broadcom WiFi/BT nodes from
 Khadas VIM1
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220113041746.16040-1-christianshewitt@gmail.com>
 <20220113041746.16040-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <2236d8a8-77e7-7dc9-fd32-b3ade335a128@baylibre.com>
Date: Mon, 17 Jan 2022 15:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113041746.16040-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_063042_321651_3E89B7CC 
X-CRM114-Status: GOOD (  18.51  )
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

On 13/01/2022 05:17, Christian Hewitt wrote:
> The Broadcom WiFi/BT SDIO nodes are now inherited from the P212 common dtsi
> so we can remove them from the VIM1 board dts.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 6ab1cc125b96..108232a5aa2e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -217,25 +217,6 @@
>  	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
>  };
>  
> -&sd_emmc_a {
> -	max-frequency = <100000000>;

The SDIO freq is marked as 50000000 in the p212 DTSI and was explicitly changes
by Jerome in adc52bf7ef16 ("arm64: dts: meson: fix mmc v2 chips max frequencies")

The change is ok if you change the p212 DTSI to 100000000 aswell.

> -
> -	brcmf: wifi@1 {
> -		reg = <1>;
> -		compatible = "brcm,bcm4329-fmac";
> -	};
> -};
> -
> -&uart_A {
> -	bluetooth {
> -		compatible = "brcm,bcm43438-bt";
> -		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> -		max-speed = <2000000>;
> -		clocks = <&wifi32k>;
> -		clock-names = "lpo";
> -	};
> -};
> -
>  /* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */
>  &uart_AO {
>  	status = "okay";
> 

With the change in p212 dtsi:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
