Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FA3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pj1KmNrTNh+Y+a8GFBoIdqljQ/M5Pra2kPt89hkDK3I=; b=QtqffUNc2HN4Lu
	jx0e0vzyo8Y8IcYiyB5peMIngT7t4tmFLwJDNuCqLHvNRHIIy1F4nqJCGOdJMeFFmDVAVM3KzdtZI
	7TBWBuoWA8cyaoCBNctLEzScBatOvI2+5o/DT5QLCarE+f5ctFVz/bgqkt5QzgTBsfG/FtkOT2cC9
	wk7IX9xaXuu3Cq9xApapVr0rreqhUOp8ONNGwS/M0hqWugI3FZxghedvAQtCVHIjO2XjhUaM+LN4d
	oMdwkSLaah+9IhvJGDI7B5aJLgt01GhMR/ldd4gW1SCbcXWIQQ+bJwDa5O2pEW36wHlQ8fW83et1+
	doF9m3Qf2D20YZdpkizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHgt-00DkUQ-S9; Mon, 04 Apr 2022 08:03:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHgi-00DkNq-Hx
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:03:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id q19so6228820wrc.6
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8SQNSCl1uQRFQcDuyQdlt7wBlezOf9jiirA2VzBwlTs=;
 b=r7qbe0tbTjLNBedoiJzvlcd0MyQzMz89evtKZ45Moj8D2/wG66KyV1n8k8DOp8d6fj
 Y0/NgMDCFdJPZjLhXBd4X6t3IqVMTtFYcYv2xlc7qmKvB0o2rTaFxJew1fRY5ydikaoS
 6pYJ5mxtpL2IQCKXQFbETsgSOkfwesqVrUGv58cr8VVT9WkvP0TMrVlzJStclZNlCTbz
 xrcCnJX2m6T/5mVZExDIjRN68VcearoFIBnQTINBtWZmuVBnJayyYD5i6SYCZocu/pkl
 MeRSYCNnaT2X2SFZ8LpiktDFhRqmWYVftCc11bmOWdbR2kCUeiJSMftZcE2+RoRqb/XS
 OcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8SQNSCl1uQRFQcDuyQdlt7wBlezOf9jiirA2VzBwlTs=;
 b=qL0OlMDwZbtusXXlSoKtpl22ZEL5wfgfa8Hg4fcvbcICy3jcd1EkzyC7mBqwo3DxCk
 PkZ6OH825409hfyyykc+uIhCLS3IQBhEa+OiwhVf6I6dFcyGl3jG2eIRvOlq4mTjYOy9
 Uq83JeZKCy9bGXJZoWQ9HUDEMjUbXfqpeEsapqgHAXS5i6DtZqTTBjmCukwq6HgeBmq0
 jEeQw9j6P/zR1P616DpoelUkU8e1pDlcXCaEUR5vAlQWfdAt9b1/6GahVP3FkDx9b+0B
 QlSJgdddwMZ+5/vrlF5sc6bJsP9Rd17eTY/Kx9/wNLX2K3cNoZXdOCYp4+yNJ3A3lC7U
 4zoA==
X-Gm-Message-State: AOAM533e+Gtv3BZYJQ4387iVWcialSm8x9FEi5bYVzsuv1rjU7F6b1jH
 /WptogxV0nmllI3K5Ua2FZkqWg==
X-Google-Smtp-Source: ABdhPJwnzzQCrd/ul/KUoS0o1nlGzDCH/uXy9DdlPxkD6ROj6GeaZpPH1NaKlI/9Hbf7XDWlF5NnvQ==
X-Received: by 2002:a5d:6d8f:0:b0:204:101e:753f with SMTP id
 l15-20020a5d6d8f000000b00204101e753fmr16529793wrs.707.1649059423757; 
 Mon, 04 Apr 2022 01:03:43 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm8814162wmz.43.2022.04.04.01.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 01:03:43 -0700 (PDT)
Message-ID: <048b9b97-62b9-5add-9d37-0f91f708a3dd@baylibre.com>
Date: Mon, 4 Apr 2022 10:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V0] arm64: dts: add support for S4 power domain controller
Content-Language: en-US
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220401110306.3364551-1-shunzhou.jiang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220401110306.3364551-1-shunzhou.jiang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_010348_655475_72896B2D 
X-CRM114-Status: GOOD (  12.05  )
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

On 01/04/2022 13:03, Shunzhou Jiang wrote:
> Enable power domain controller for Meson s4 SoC
> 
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index bf9ae1e1016b..96ea95ea5eb9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -60,6 +60,12 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	pwrc: power-controller {
> +		compatible = "amlogic,meson-s4-pwrc";
> +		#power-domain-cells = <1>;
> +		status = "okay";
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
> 
> base-commit: 1930a6e739c4b4a654a69164dbe39e554d228915

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
