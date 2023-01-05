Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E29C3DA7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSzK6XgTKvB/oYe31sfWG/n25urn/139MXb4LYZYxFc=; b=Wu+ippHIDC3Etbgg7C+yIoPYTn
	BtVF0a3XfHRT1+/6ckbZVj196sSL/ShfBlSCoqQWAcXcgTBeEC4Nx7jPxPB/onRiGN2kqqxyDllTq
	wB4o1k5eujRHLmdnhscNrdRNmj/PRiz/jib/7Amk0QLK5nA6C1D7cnQ/cxeU7KsJSP4kR3ysyPtjE
	995L5Q4tWd0h5kAxdYbJAuwhf2jdi9sLnchcCEw7NV9AbtNg/7kOBomMFqoTO0g3lt8l5NZ1mWNm3
	SypmibxC14WaAAw9ZZz0DtuxDB+R9sSoWIP9Nna+8MlkBx8qg5W2HrG/fKPF5tW9m5gNTuVT08vui
	1MznchjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWht-00ETLY-1P; Thu, 05 Jan 2023 20:19:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDNUi-00AfFT-7r
	for linux-amlogic@lists.infradead.org; Thu, 05 Jan 2023 10:29:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso987527wmb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Jan 2023 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9rFFXN2BkI6WyEDiocZpvAvR7562i16UeRZIHoNMPM=;
        b=uetlAdWWUg8gWJIXIKPWXeVNaCu/7ZJkqm707+WtuCHuFzGntE3boh2kQuvda2UrHg
         51gmoiPPngH4Q/cBSndB+2/fOAUztKUFpayjG8AyvM7z3W8/+3H8OHmlXvO0YxMRbfuO
         vWlEzQ7xN5dwklGZqxwmAbldhq6EFbnSQhqcz2gerNwbK4nRujWyfcwnUNWyHp4WKYp1
         n50HLADPRrG0Q9Q4KPRMH3lId3vjvLKafG7EOzmoCIm3wOHk6ZIst4QVmpGaIfjsWJoB
         hDfjIxrDTcwdgd0ELkuy538fBimfZ/O0qq2fMsundJShIzrjp+eqZMWjGr6klZBN95Hq
         wlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9rFFXN2BkI6WyEDiocZpvAvR7562i16UeRZIHoNMPM=;
        b=QzdiV4f0n8PSiSZ/vYg2HWsVF4TT/0aCNFY5Z4xBBiFEXT73OBFM/Swgb7unBnOhlz
         tAKV/BmAX+VLt65PmIWCJQp4x8c62m9L9/remZmyasTscbugBAq47DQZYjmUiEVXN7we
         XwmpltA9vs3TVRfDkVKOdeY/MTHQ5Hfzar9Gq5pgVPgUMT4Chwagvyu2Rz+1/12z130U
         oHaiLm4nFoILwkfrH9lJgqaxfQv87zKIzrKjg3DoFkYq98DoDno5ehblEYh0a+DzCR2Z
         t3/NYr6tlhHt6sSo8/oHKWl4YRMj+dxvPujzsouRgyyC2NdsndTlc4Nv5e0NeSPxVEKp
         NVfQ==
X-Gm-Message-State: AFqh2kqu1U0AAEDBke6LHz8Td2OsY3TIMpwjCsHSkvNkJx0hFa7OgeKo
	EsqueH83mc6ZEJJESR5iLmJE6PQmx77HGsOe
X-Google-Smtp-Source: AMrXdXt29VeD79vMh1Ehg47wlkHCzRpp7P5v3zBVIqmh0Edih2+Cj7MObkTtcqdCzXQm3AzciEx0nA==
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id bh18-20020a05600c3d1200b003d2392b3165mr35495994wmb.12.1672914543117;
        Thu, 05 Jan 2023 02:29:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003d995a704fdsm2086654wmq.33.2023.01.05.02.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 02:29:02 -0800 (PST)
Message-ID: <96b82341-0c76-79cb-8320-96a8af06d1dc@linaro.org>
Date: Thu, 5 Jan 2023 11:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused
 USB PHY0"
Content-Language: en-US
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>,
 martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <Y6okoXpwF/LZewhv@nemunai.re>
 <20230104140608.28432-1-nemunaire@nemunai.re>
Organization: Linaro Developer Services
In-Reply-To: <20230104140608.28432-1-nemunaire@nemunai.re>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_022908_399111_5F4FB7FF 
X-CRM114-Status: GOOD (  14.20  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/01/2023 15:06, Pierre-Olivier Mercier wrote:
> This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.
> 
> USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
> need to be enabled. This is inherited from the GLX USB design [0].
> 
> [0]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
> Link: https://lore.kernel.org/all/Y6okoXpwF%2FLZewhv@nemunai.re/

This should be [1] and referenced in the commit message, Link: will be used
with the applied patch URL.

> Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index e3486f60645a..a1f0c38ccadd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -131,10 +131,6 @@ flash@0 {
>   };
>   
>   &usb {
> -	phys = <&usb2_phy1>;
> -	phy-names = "usb2-phy1";
> -};
> -
> -&usb2_phy0 {
> -	status = "disabled";
> +	phys = <&usb2_phy0>, <&usb2_phy1>;
> +	phy-names = "usb2-phy0", "usb2-phy1";
>   };

With the commit log fixed:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
