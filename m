Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E4C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gtByi20CV8oZqp4kjIjL2VKsDXMeon6aWfW/xkab5Bs=; b=KnJfjZ3zUt6EkXnUGXCRJd+FAJ
	OpIm1I2P7qUPkbLzt3f/7k0bMieQJjjJuFt6TUEsJQvBA9li19SSr1obPIsMaHMYeNpkxRJ8X7e+J
	zn5iDWGJQziNKms6nY3NFdtk/p6rhC6r895C58ickJ1ljHyyHRwGui/ANvHL25odIn13B3zMoqtSZ
	h/ijBIXK9eSYkn+qynMPqlly1dkI7lDlK3ZrOpjuSbokr0KS8TF0QFbUNyEKVGJu3FqFreeyWuYRI
	2dKaosm5IrhopsI5y3O7L0f2gkSdZjytD2qNUPtNPdIs9dxn6wA9eZYLA39MpBwTyXxpToshE2wSn
	2Sc8l9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9T2H-00FBCf-Ke; Mon, 17 Jan 2022 14:31:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9T23-00FB9L-1Z
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 14:30:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso24183565wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+iR+xqLn4ZA/GgQGnZu/dK+PUE+Bi1dnz/SKyfphrsw=;
 b=YksXckYFme2RHIMHoHrPqpFRTQIn6dwj6tbKYWd0JJb20Y3P1MMFSu0ck4f4kDxJrq
 IcIuDPplD6b3zCQChjSM2fnnBH3/DDCcPQ5dYEdRXzMlABv+UuH1NiuQEWV0Dr3/+MzC
 E94+YE8ZQisz1rE2mbNWakLMrq7/VmY0VFRGlPiQ8Mr/kN2iJ7QiPM0C5/JWgqKP0pnN
 Lc1G75IgbfoSEiTec6D0MQVG4WwcT9NVWfJg1t6DVUMHtNxLlP4H2dYr1L0S4nqI3dEv
 3bZpYHh5kS4odyWB2GmYSOLof8n7Yq+hPnAR7j+XXLruY9akvQRYKnhmHeM6P1VrH7AH
 Gtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+iR+xqLn4ZA/GgQGnZu/dK+PUE+Bi1dnz/SKyfphrsw=;
 b=4/PD8VaYCL8cR14PAgGuokUg68mbfBGDhBZ+M/MX/wg1bhYELAHLQwSyfBW/xJMm0R
 HIvKo+VBqqvrlTAcEY3pRF7yzGeTzaR5rQwXTXY79XBI0vXQXZuQIe/MmnqOn1me1NzM
 W3FXeTfmQAQfqOoefI6yq5yBbY7Fl6GuFBm0VUj9Hbl2X7Z0THQf8ucgYrRgfqZp49PV
 CvQZr1PXzoFsrpx+uvs4TtUl6M2eHfhXps1pJ4S6YEleC+NyMIdgThFcOi9A5N0Hxmz/
 sRQeoiiFIiYiWxJxrui/QWy4qb7c7HaqDiibZ0tYubDr6v/kj6bfr9B07qxZ604wVHec
 kfVA==
X-Gm-Message-State: AOAM530MYIY+sN7/bjVEUixHUAVD2DYW5cH/ragNLHfS99Th0a+fNkNH
 VxdS5qaYGZ4XUC8V+RkpNoyg4w==
X-Google-Smtp-Source: ABdhPJzRsacQaPlAcYkmmUq1iTAa0t7SHBvG/AXsT2UMm1nGzdbQK6xp6O3BzDQpBYliXghu7ZcNEg==
X-Received: by 2002:a05:6000:110d:: with SMTP id
 z13mr19925997wrw.662.1642429849388; 
 Mon, 17 Jan 2022 06:30:49 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id k31sm12542420wms.15.2022.01.17.06.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:30:48 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: meson: move pwm_ef node in P212 dtsi
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220113041746.16040-1-christianshewitt@gmail.com>
 <20220113041746.16040-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d82549cf-01cc-68de-8af3-763b94ba6ef6@baylibre.com>
Date: Mon, 17 Jan 2022 15:30:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113041746.16040-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_063051_104325_EEA806C8 
X-CRM114-Status: GOOD (  17.34  )
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
> Cosmetic-only change to move/alpha-sort the node.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> index c635e5858929..b3d7b8613d6d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> @@ -97,6 +97,14 @@
>  	pinctrl-names = "default";
>  };
>  
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&clkc CLKID_FCLK_DIV4>;
> +	clock-names = "clkin0";
> +};
> +
>  &saradc {
>  	status = "okay";
>  	vref-supply = <&vddio_ao18>;
> @@ -170,14 +178,6 @@
>  	vqmmc-supply = <&vddio_boot>;
>  };
>  
> -&pwm_ef {
> -	status = "okay";
> -	pinctrl-0 = <&pwm_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&clkc CLKID_FCLK_DIV4>;
> -	clock-names = "clkin0";
> -};
> -
>  /* This is connected to the Bluetooth module: */
>  &uart_A {
>  	status = "okay";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
