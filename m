Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A9C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3+JsUKFw6Q7pjCRVs+8VK4OfXcWXOh8MJyXMqFaXVNE=; b=gv4W9zEBmL8+S/Nhud+uR9U1ks
	hQ/Mv//ZJmcopbTv+3/kiZKQQGN3jNbJCbtd5Iu1CfaKalQAmscQKp4pl1m8Zln98A4Q33x7p4jgo
	A16DLxV/X9aqg7inlAKm6pPymXMkR3VMHQ8UUxT+e3DeBbnqV13rGtW0cQHf4wv4HOY9hleOz7Io7
	aiRytBajNEOD+T4Y1CZ2vpLHBVbrLyT/EWij5qFEvStvK3cpxPR4adoNMr+9Kl/Utg3I8QoV9p0EL
	1xNTzd2UkfHXYAywKhD74u9rKW5zRrULi5ELkBYPLoRVM5pt+Z4ZQeK/hYHoPj+gTcOIzmR6Bu7b6
	2GvF2hNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0X8-004fYi-No; Tue, 30 Nov 2021 10:38:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0Wq-004fTp-Mm
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:38:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so14443439wmb.0
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S0WDfd094hQCN0b1mr/jtcBWQltUMMlx+eNjznbKeQ4=;
 b=7SIqr26sShwrURTElJbKQo2AiIjg4/wznyjqLPhBMKebkmMz04shyLIxiit9A/662M
 Dmpr+iFssBUkkJPw5Or/lExLW1GwIaKBSlxY4aayeuuXXu0sVAtb8LvJ+IlxIrf98oQ4
 DcSSpx6EKJA4macVtc1iR+GpJ1ZqtRkYtkKM29sv6zLiSsi0k8QicLE9iMn9EqaMEJV2
 EMuMq6xuQYozpGr3yc7e7hMhd51Cc37IABldQLbeHRU2X5MNkfPexj6nELnd80LtvuP2
 2nvvfRyn+aZX+yKyy5lnq9NGj7jwsGtUKOmBBFhmNajkFMlFtHKtu/7gZSMZo1j3p6yD
 IqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=S0WDfd094hQCN0b1mr/jtcBWQltUMMlx+eNjznbKeQ4=;
 b=bAjwMU9O6/TPbcON12C653kiRQF9i3GNes0RWe0O/kpqmEbNbrkkua6Sp8Re1b7iWq
 cfp3nKMGE9sGXzE7Yak89BbW9HGLtP8yzh1DhBy8MWxcf8BiFjuXJdikACmod47XifWG
 su1j5ahX9czmP5zLSsERpONiVVJ+GmE4HBrT9CT2YPUbJ84JrFGj/a1GErEthxPFqsBu
 +KASv7B7Qmcej4BjY4ZndweV21pa0IE4w/w3Z0fXN0+UEAXjs2RmcvmrFL95DgQud0Eq
 GUaTrlEoJJhrA7ykW8rgLYpPd3JWfmiHS76adwTqeohzNnpCCqO/iQNQqLGlbD1zMgSh
 xT+Q==
X-Gm-Message-State: AOAM531kUCzdjsoI1q5HaZ2lYnqnuOiSo1uJNbEksSha//++QBMBCial
 FltzMk+hPl7m+johb2DOu1Oxy/t8T29Hr68P
X-Google-Smtp-Source: ABdhPJzTeWm9B82jXzzbIKkAI0LYt5rTHVxwV2dBT3C4jipfItJRJuoBY5e+ItbeIuLu6Nom/Nhlcw==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr4034600wmq.50.1638268705210; 
 Tue, 30 Nov 2021 02:38:25 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a?
 ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id b15sm14411169wri.62.2021.11.30.02.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:38:24 -0800 (PST)
Subject: Re: [PATCH] arm64: meson: fix dts for JetHub D1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211125130246.1086627-1-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7f61ef3a-5ae5-086b-c63c-3b7b1ea28f13@baylibre.com>
Date: Tue, 30 Nov 2021 11:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211125130246.1086627-1-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_023828_789188_3AEEB89C 
X-CRM114-Status: GOOD (  14.98  )
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

On 25/11/2021 14:02, Vyacheslav Bocharov wrote:
> Fix misplace of cpu_cooling_maps for JetHub D1, move it to right place.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  .../amlogic/meson-axg-jethome-jethub-j100.dts | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> index 52ebe371df26..561eec21b4de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> @@ -134,23 +134,23 @@ cpu_critical: cpu-critical {
>  					type = "critical";
>  				};
>  			};
> -		};
>  
> -		cpu_cooling_maps: cooling-maps {
> -			map0 {
> -				trip = <&cpu_passive>;
> -				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> -			};
> +			cpu_cooling_maps: cooling-maps {
> +				map0 {
> +					trip = <&cpu_passive>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
>  
> -			map1 {
> -				trip = <&cpu_hot>;
> -				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				map1 {
> +					trip = <&cpu_hot>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
>  			};
>  		};
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
