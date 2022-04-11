Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD0FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cr17Oz4M+6SsBUPTv3gJ+CkK9TmEuL6D2uXBpmigZPk=; b=lIonX2RSjYRZIc
	KPe+8/u6J0/3Q6ftAvRdrc23ND5vN/SP9YjoBPKCdx35YmLzk3r+U5D+8MqP3mGwgSGGfZW+2dOTi
	2tAGLrghmhLB+5fzlBwOYbrGE1hF9nh3v2tFnhZR8Bq3RRiXk4P5ZVFxUOgBNjn/R793XBmgAaCkb
	6NMNIfa38oo0z2pkVcflre/u2CCKZVYMu7xmIKgQO5pFJa5H9RPjRtbObNCi9FK7kHHiUTbnA/Nm0
	7tWIF0xKhqaLB3gkAJbYRCoDgMJramPtw0cLmqjMer1wHYHeG+J9E8aPh2euEAZXMAylIANt5CP4k
	UbDtnUkNvubsCmGB5i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduuZ-009MwY-Ba; Mon, 11 Apr 2022 14:20:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduuJ-009Mpx-L4
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 14:20:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id h16so10033857wmd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S3YV2NIKgVjmZIL+6HS0Sw9C7j5q+F7McJiN2a27ARM=;
 b=20ghj2lAKcSKoDLZ3O4IapS5ROMbvgbH9y83HJAP2vg5rlqfo+7fgfQl/xaG2Z6xCB
 vDsq9pLsiPeg3lUfzhbbNcnFfgv5c1iNz4qThO6N6Pi0FD8qjlup/Cgs70dwHM2eEAgk
 hqZIXj6Ot5j8w/0MMsqzxVcJZ5Rz1Vqibe7mz0E/4AAPZPcoLKGcnVMUDQes+d2ZyBmf
 jLYpFGwCPesKMISlCF84rw09wqq358l854W0OgVXxcUwh6ukhBdGft368zSvbmwuuQ7r
 KTaSYOY221gtQYfm3VWVACE9sR6Cx8ZYXCu+g4fsxydNr5oWJzdod0Ey1rWPgfVMO7j3
 HCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S3YV2NIKgVjmZIL+6HS0Sw9C7j5q+F7McJiN2a27ARM=;
 b=0nTVGpDqOsjk4RHq6ZGKKeiWHWxIu3VFz4IKi5qLusS0mdlSRGnl0V/lfsRl3WGpia
 1KM0oGDxtqyjN6UZsSlt5qn423KHuPtDDbOYJtpRwtExi+eMnJNYS3eziUC6IKY75LNO
 UtcaLXiZ2p6c7QzshG257yjOMMdJZG77WAOOG1ZVzC5mEJj6GpbXB68YY3CP04Y4KtbV
 lcME7kHEcUNMjyq2vlOA1znuPET7OlRRolmj8fbe9qExarxGNPFpn9FkruEDyt8hlClD
 HoatcFknxPtGsn5aSGUXKEiE4FfumA5+6sw7FfwAFv74HMGN2CB5f6HQoM9uGd2rW6UD
 Orpg==
X-Gm-Message-State: AOAM532mRtP1QOyK40qWhVZoNo5gXfG7T1Yp4XDn48ugOMBlFebCV2zm
 RxLTv90CugfeXSV5ApxcP8XruA==
X-Google-Smtp-Source: ABdhPJz4l3beiVULnQnS8K5T65hNj8lZdcPe3356nB8I4dOfBr0ZFNRG6vebaEI++CwpGxdZPwvo5Q==
X-Received: by 2002:a05:600c:3546:b0:38c:a8ff:843b with SMTP id
 i6-20020a05600c354600b0038ca8ff843bmr29729336wmq.24.1649686839724; 
 Mon, 11 Apr 2022 07:20:39 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 k124-20020a1ca182000000b0038eb706c030sm4974012wme.39.2022.04.11.07.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:20:39 -0700 (PDT)
Message-ID: <8bde8ee2-ee3f-bba6-66da-28adb3897178@baylibre.com>
Date: Mon, 11 Apr 2022 16:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO
 pin labeling for CON1
Content-Language: en-US
To: Guillaume Giraudon <ggiraudon@prism19.com>, kernel-dev@prism19.com
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220411140401.450-1-ggiraudon@prism19.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220411140401.450-1-ggiraudon@prism19.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_072043_965396_A215F96F 
X-CRM114-Status: GOOD (  15.30  )
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

On 11/04/2022 16:04, Guillaume Giraudon wrote:
> The labels for lines 61 through 84 on the periphs-banks were offset by 2.
> Realigned them to match the Banana Pi M5 schematics.
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> 
> Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 5751c48620ed..754c3d43ef0b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -448,7 +448,7 @@
>   		"",
>   		/* GPIOA */
>   		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
>   		"CON1-P27", /* GPIOA_14 */
>   		"CON1-P28", /* GPIOA_15 */
>   		/* GPIOX */

While reviewing more closely I figured that in fact the issue comes
from the :
		/* BOOT */
		"eMMC_D0", /* BOOT_0 */
		"eMMC_D1", /* BOOT_1 */
		"eMMC_D2", /* BOOT_2 */
		"eMMC_D3", /* BOOT_3 */
		"eMMC_D4", /* BOOT_4 */
		"eMMC_D5", /* BOOT_5 */
		"eMMC_D6", /* BOOT_6 */
		"eMMC_D7", /* BOOT_7 */
		"eMMC_CLK", /* BOOT_8 */
		"",
		"eMMC_CMD", /* BOOT_10 */
		"",
		"eMMC_RST#", /* BOOT_12 */
		"eMMC_DS", /* BOOT_13 */
		/* GPIOC */


it contains 14 entries, but there is 16 BOOT gpio lines.

So instead, send a V2 with 2 entries added in BOOT and leave the GPIOA entries as-is.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
