Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7220C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jun 2022 06:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai44ShRjJy0DS3z+BUpCzjfverbBSpfx3qStbzAziGo=; b=fjzP0Ylx55VzjX
	In6zSzSH6F1CAPW4wG4DI4Z43oYiMucGTjjfn0h2FVroHdhQz3vuQsI/d7VDM8VCu8C6zKDsSteNx
	KXZl0sJPpGI/rPKNDfkKE+On3peQiil/c0fX2mvm67jwWrCr/jVZxjFkzy4OfZsM42BEE6z1QbexJ
	PwaHWnlxYwccCGGmpIW8FvcRetlNofndqKYEIIL+nu4qpZDr2QG2U57YjoS2ZObtvYxaIGwuVJbqV
	42DUo0Dn3wj3OX4riBEmdtAWlvGUIB7QnjYTBxSfaIwnAYI4D32cGQz4GF5FaQmgvK80Jy3xZjyMT
	RXDjwX39tnX9QPrat7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYLT-006D9P-Cj; Fri, 10 Jun 2022 06:42:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYLO-006D6v-6l
	for linux-amlogic@lists.infradead.org; Fri, 10 Jun 2022 06:42:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id c21so2072891wrb.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zMNCk/31aUciAiebJKdTYPV4j9Vtd2J/5ScdJkdhTD0=;
        b=a7Kl+RQHfdntGugzD0xjDrfMWJAGDI+fDDuTxoAllENKRCEjKkhj1TU1m3rJkt43pV
         u8KBobX0nLmOvcyJSSy+9o7GRnE82IU6qUwDCv5rpYbHAFcjg2qtSi23GtIlO6NhSrcS
         Mx8KVY6hqcYiCLaq6ppYN3VmWhyX2rK3Uumm14LSROEfumUby0ZRwrcJ8gWCMscn3ZQ8
         KbD/EqO3uhu+gaYi2hNjv+dOO2auTmxCXZu9flAnxh1bPAJigTaMfjcmKSmY3/rN7gJM
         CgR2AncNE44rlabNv82swyVUm5vVJoQ7v0/2iowjfs5jzKUeF4iMFtx5lKVjszSH16pB
         lDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zMNCk/31aUciAiebJKdTYPV4j9Vtd2J/5ScdJkdhTD0=;
        b=bdbialEUxL07yJN5LZKMYxgMnWYcBKg0nEWzkH3sYFMzfVHq8GtxRsm6RfGfSPxYir
         Ct76rpPe/0N16i/chwcKhcq89yj3BCTO1FzVZh55s5L8nXwkJNCnS5p0RiPCbyc34d5q
         Gr+qVxrydOkveU+o+ghM0uU9CFM2KrkDbUrNBb8D+KveQnMhUojlOSprHiSPmboTNgbm
         aVgTi5Fy797wylMsB1jT4Pgzakqk2cdyzxYHrGDbNmwiYstBdBQN5ZetK5uamfRFwSvu
         1yiRbxXGgI35TTm1R4J7CIxASq+DUTdRbJhZnj+mbSxTlUoYrX5JK3ajKXDBO5UXOgUK
         0RZQ==
X-Gm-Message-State: AOAM530Fp7moYCYXNH7SktDKEGBLvVl+UUwCuo2LWcE3DgOfFl8Jlmw2
	ljnuDEbQlJfApbBuWrBgFG+Flg==
X-Google-Smtp-Source: ABdhPJw+50PDWQ7tCG/zfY+Q7ldNoggWeqwArBqWYMbSFTVY9Q9vBf59wpT5cXbUD2OQct6Zm9qU/Q==
X-Received: by 2002:adf:ed45:0:b0:210:2f9c:f269 with SMTP id u5-20020adfed45000000b002102f9cf269mr42673305wro.470.1654843323444;
        Thu, 09 Jun 2022 23:42:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:27b0:82d9:d0c6:702a? ([2001:861:44c0:66c0:27b0:82d9:d0c6:702a])
        by smtp.gmail.com with ESMTPSA id k12-20020adfd84c000000b0021126891b05sm26247256wrl.61.2022.06.09.23.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 23:42:03 -0700 (PDT)
Message-ID: <c6a152af-dc8a-c3ec-3abb-015328554fbd@baylibre.com>
Date: Fri, 10 Jun 2022 08:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/1] arm64: dts: meson: add gpio-fan control to
 GS-King-X
Content-Language: en-US
To: Furkan Kardame <f.kardame@manjaro.org>
Cc: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20220516122511.40062-1-f.kardame@manjaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220516122511.40062-1-f.kardame@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_234206_297902_F5101CE2 
X-CRM114-Status: GOOD (  17.20  )
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

On 16/05/2022 14:25, Furkan Kardame wrote:
> GS-King-X has a single speed GPIO fan which is always-on by default. If
> we add controls for the fan and a trip point, the fan stays off most of
> the time, reducing background noise from the unit.
> 
> Signed-off-by: Furkan Kardame <f.kardame@manjaro.org>
> ---
>   .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> index 6c7bfacba..243410913 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> @@ -19,6 +19,15 @@ aliases {
>   		rtc0 = &rtc;
>   		rtc1 = &vrtc;
>   	};
> +
> +	gpio_fan: gpio-fan {
> +		compatible = "gpio-fan";
> +		gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +		/* Using Dummy Speed */
> +		gpio-fan,speed-map = <0 0
> +					1 1>;

The speed-map is not correctly indented, it should be:

gpio-fan,speed-map = <0 0>, <1 1>;

> +		#cooling-cells = <2>;
> +		};

This bracked is not correctly aligned

>   
>   	gpio-keys-polled {
>   		compatible = "gpio-keys-polled";
> @@ -131,3 +140,20 @@ &tdmout_a {
>   &tohdmitx {
>   	status = "okay";
>   };
> +
> +&cpu_thermal {
> +	trips {
> +		cpu_active: cpu-active
> +			temperature = <60000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&cpu_active>;
> +			cooling-device = <&gpio_fan 1 THERMAL_NO_LIMIT>;

This should be: cooling-device = <&gpio_fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

> +		};
> +	};
> +};

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
