Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085EE606A321
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+6+/kMC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XZJAWcBs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kojT78Pn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cFl5Lv7eVFx09XHBN1Jl3bPKahSzf318f2ayIsv28/o=; b=G+6+/kMCxBbdW6IZ0h6WwomYhf
	XWaNlDRMR+m3/jb/YxlQXrR3ZxmKNZJN7v7mpBt7RMx5ZOO93et2ynY4QDtJSsLrWJn2QqzERf4xK
	IU0rBmxAwIOtxt3d0gOQLHpMYv8kcF1pWnGRoaat2I103ZHvL1j+w9JQ57UBtMSPM5sSP91bLJpOn
	MBIs6GKoSgR+t2HBUupvcn7pdddY5gtzW3HRrekqVDsl+nB+YxksG8yHqiNuOouX+APEJVt8IUHab
	+2kUjfPNah4KmuXDV8IyvwbQPkC9T+JL58E/MozSlRWd1nTMUixuNT5dpJjk1b2ZrD/Jq2ehw8HXN
	U1slgkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxyD-0000000GqyL-2Tvn;
	Fri, 27 Nov 2026 15:34:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxx-0000000GqfN-0Yun
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=m/dN4LxwUdT57Q0XKu6ReA6JVhPOgPXvyTRBH+EO9hA=; b=XZJAWcBsSKfdBWgo3k2agu4Y7S
	kyc1wh+Kx6OsZzcHRbkUvqIundVEMN5Uhcu1Mhp0i1eNSx/yGX4BMCeUiE793RQG1rtoyOO0PnHHN
	yUk4zpbuWJ5BvSa2ee8AssH8zAkrz+klyBuQ2i+z0ELXHPwgRGyjx/RMlMBZtI7f/bNi5MKGV02Wj
	t8oXC+Mi3nJfWL9uQt5vS5SUvBvhF9vG9mUIB7Ya5r+3GGlha2I5g6m8tdMtyrmFTYyUdY9D3VBHz
	EdPSJEI7RChcB6tJo5mRRYV/cIanC9MFJFRzmLGVepW8cckyH1aAfpHChGSMquMumSVGuLXvdaCF8
	w3zjuM/w==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxr-00000007vD8-29Wb
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 15:34:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5611589f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795793657; x=1796398457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/dN4LxwUdT57Q0XKu6ReA6JVhPOgPXvyTRBH+EO9hA=;
        b=kojT78Pni2sgmgeQgdHZxdDmqmg9pFUQCmyPbi2dNcgGQdSD91bOG9gfTbQZ+mYfBj
         gZp0wQ/J8PMlfvCJP27RbgM1icbcgg8nltgWchBVOaSkhJ6uGF93TGHj11UV7gRiyvXz
         LKlCyMWVLdgKB+AjuZc0/N+BBvF4oA8HluHZi8LLGLsJI+57w0DIScfwVVm09wvi3nzE
         /VHHiiqZLw1OE6OLB6zXCx0SMHYstgvKYhA1qzoa/vOzDpgkpw3gW3n4uzEesO6vRQmL
         ziQmekAqAZJ2lNAfpOUQSLD5rLTiobMluFHiJZoH4m5iXgfcfuNPE8M1t22RTyOa2aUp
         7i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793657; x=1796398457;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/dN4LxwUdT57Q0XKu6ReA6JVhPOgPXvyTRBH+EO9hA=;
        b=VQcnMnV8LdN54KvaGt5UibKkHQteHt6iwU/Vj40qmUB2TiRV2qiCm8fxF9l+nao77x
         SmmaIv0ekzC0C5Y2N1Fja5+pZ2sI5DIQQAe0FLY9mGx21JRo5JgdoE84+e5bEdciWjxu
         PzeLwvhYrFmudI1ATbDWgibG6Z+UqTun3xZR1FZEpzb6RPMs29LuYnogsZ4y0ZQWWy0V
         YIRJE8ZmdO1csyIO/Dktm9dY6jRAtfyMPPT5LPgjRAXe/uB7U/lJdstMZfs1Ra3NXs9Z
         4jpQ2F/mzZBrYxaQDEIbjgcXJQ9o+9PewezfPJ9nwDv639yBllviAvjz4Rf6OlnMj+Uz
         z4lw==
X-Forwarded-Encrypted: i=1; AL+hErGSzLGQFP+veddBZ7eesJo0ewehFIP8/7drYGzikdnlmPrbluKk3hQTrrpm3+agUIOC4v7fV4pXIUoZFI2O@lists.infradead.org
X-Gm-Message-State: APuU4Z8N547k3KPI7NshVgtWbR+Fb1RH9tco4Yp/Qie/ZyCv7RnUKE/1
	zlkf1wkWQFOxQyt5dJZqZ3N0JjTU1wM8IOnbzVLB3j1sMJZrMUgqX/xJm0Sa0isl+ZM=
X-Gm-Gg: AZFdTZc6qnK0cR6+1zQOL7jdYsXm7sWlDu/rPqTASEOtCgBI7b+jud2+MxZk98KYB6l
	easoXGXtE35Ydl1BHJaMrGwzhRSQIpVcG7/LpTpHWO5iDlMckB14OuggTprCqBu3UqieTEUXk5z
	PeCuSf2TUtbJ8IPLaBTPJ1GXnJK+scsjWa2Vcl7mstgeLarr6Jz5aNGkkMI+9C6aE8uNxl5OqXQ
	k2NayJ/JOOnHXfVvF7QabsyCS20/HJVlnxAD+Ny2ntwXFeMr19ipmUbqR9MxxD1JdBO/laIfm7E
	w+aNB5r7c+vc5XEzXNkMyCOJ8bMeP5HRApfnO6WqM3McGrfF/fXBsNfgUfr6VXNJv987T8jDmif
	vAqNRGvk3Q1xBGUzH7jp46c+akykgOL3WxbrKM7ESO+VyKmeK6eXMdWhxrEowHQaM7Nc7H/AVLN
	EAUdFu2fqwb0wXmduewcPUxrdOaE3XLtcP345vbUL7FqFC/2Z0dRGzrp+hKIHvHjwQxQ+p6QR8v
	+JDILTPmlXTG80MaFhlm0UlOL+j9YZIVWjflBrqEpfyTIHNYAjarXgbQQQhPqmwqZ2QcD3WtZMB
	5LJDBV1lI1OeWT8DYhd5S5505W5ohtqy4ZS/tzjN1x7DpT5vzm4RfLKt3jmkKeLKGK5B0nceYns
	DJXWyjfDk
X-Received: by 2002:a05:6000:2992:10b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-4abafd034aamr36212221f8f.6.1795793657002;
        Fri, 27 Nov 2026 07:34:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c897:5d9b:d0a4:e684? ([2a01:e0a:106d:1080:c897:5d9b:d0a4:e684])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm43545126f8f.23.2026.11.27.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 07:34:16 -0800 (PST)
Message-ID: <db58da62-b79f-43e7-9285-094d886ce403@linaro.org>
Date: Fri, 27 Nov 2026 16:34:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 05/12] phy: amlogic: meson-hdmi-tx: Add GXBB, GXL, GXM
 and G12A support
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
 <20261127-meson-drm-create-hdmitx-phy-v5-5-88c43eb95468@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-5-88c43eb95468@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_153419_541894_9E82114E 
X-CRM114-Status: GOOD (  36.45  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/27/26 16:27, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Extend the Meson8 HDMI TX PHY driver  for the HDMI TX PHY found on
> Amlogic GXBB, GXL, GXM and G12A SoCs. The PHY is controlled through
> the HHI_HDMI_PHY_CNTL0..5 registers of the same HHI system controller,
> but differ in the analog settings, in the CNTL1 enable bits
> (FIFO enable and FIFO write enable on GXBB and newer) and in the
> presence of CNTL3 to CNTL5. The PHY node is a child of the HHI syscon,
> so the regmap is still obtained from the parent syscon.
> 
> To support this, move the Meson8 hardcoded values into per-SoC match
> data (register init values, rate table and maximum TMDS character
> rate). The TMDS clock is now only requested on Meson8, the only SoC
> where it is needed.
> 
> The driver now implements the generic PHY HDMI configuration options:
> .validate() accepts only 8 bpc and a TMDS character rate covered by
> the per-SoC table, .configure() programs the analog settings matching
> that rate, and .power_on()/.power_off() handle the reset sequence and
> the return to the initial state. The Meson8 behaviour is preserved,
> except that the analog settings are now programmed from .configure()
> instead of .power_on(), and that the reset sequence uses
> read-modify-write updates of the CNTL1 enable bits.
> 
> The per-SoC register values and rate thresholds for GXBB and newer are
> taken from the existing HDMI TX code in meson_dw_hdmi.c, so that the
> PHY handling can be moved out of the display driver.
> 
> For DTs that do not provide a "phys" property on the HDMI TX node,
> export meson_hdmi_phy_create_legacy() so that the display driver can
> still create the PHY itself. It is marked as deprecated and will be
> removed together with the fallback in meson_dw_hdmi.c.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/phy/amlogic/phy-meson-hdmi-tx.c | 341 ++++++++++++++++++++++++++------
>   include/linux/phy/phy-meson-hdmi-tx.h   |  19 ++
>   2 files changed, 305 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-hdmi-tx.c b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> index e4e606ab4eef..158b13e26a55 100644
> --- a/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> +++ b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> @@ -1,18 +1,27 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   /*
>    * Amlogic Meson HDMI TX PHY driver
> - * (Meson8/8b/8m2)
> + * (Meson8/8b/8m2, GXBB / GXL / GXM / G12A)
>    *
>    * Copyright (C) 2021 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> + * Copyright (C) 2026 Ronald Claveau <linux-kernel-dev@aliel.fr>
> + *
> + * GXBB+ support Based on meson_dw_hdmi.c:
> + * Copyright (C) 2016 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>    */
>   
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
>   #include <linux/clk.h>
> +#include <linux/delay.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/phy/phy.h>
> +#include <linux/phy/phy-hdmi.h>
> +#include <linux/phy/phy-meson-hdmi-tx.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   
> @@ -22,26 +31,167 @@
>    * Magic register values in the driver below are taken from the vendor
>    * BSP / kernel.
>    */
> -#define HHI_HDMI_PHY_CNTL0				0x3a0
> -	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL1		GENMASK(31, 16)
> -	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL0		GENMASK(15, 0)
> -
> -#define HHI_HDMI_PHY_CNTL1				0x3a4
> -	#define HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE		BIT(1)
> -	#define HHI_HDMI_PHY_CNTL1_SOFT_RESET		BIT(0)
> +#define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
> +#define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
> +#define  PHY_CNTL1_INIT		0x03900000
> +#define  PHY_INVERT		BIT(17)
> +#define  PHY_CNTL1_SOFT_RESET	BIT(0)
> +#define  PHY_CNTL1_CLOCK_EN	BIT(1)
> +#define  PHY_CNTL1_FIFO_EN	BIT(2)	/* GXBB and newer */
> +#define  PHY_CNTL1_FIFO_WR_EN	BIT(3)	/* GXBB and newer */
> +
> +#define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
> +#define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb, GXBB and newer */
> +#define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
> +#define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed, G12A */
> +
> +/* The code resets the PHY 3 times in a row */
> +#define PHY_RESET_COUNT		3
> +
> +struct meson_hdmi_phy_rate {
> +	unsigned int min_rate;	/* TMDS character rate, in Hz */
> +	u32 cntl0;
> +	u32 cntl3;		/* only used if has_cntl3 */
> +	u32 cntl5;		/* only used if has_cntl5 */
> +};
>   
> -#define HHI_HDMI_PHY_CNTL2				0x3a8
> +struct meson_hdmi_phy_data {
> +	const struct meson_hdmi_phy_rate *rates;
> +	unsigned int num_rates;
> +	unsigned int max_rate;	/* Hz, TMDS character rate maximum */
> +	bool has_tmds_clk;	/* Meson8 only */
> +	bool has_cntl3;
> +	bool has_cntl5;
> +	u32 cntl0_init;
> +	u32 cntl1_init;
> +	u32 cntl1_en;		/* CNTL1 enable bits (clock, fifo, ...) */
> +};
>   
>   struct meson_hdmi_phy {
> -	struct regmap		*hhi;
> -	struct clk		*tmds_clk;
> +	struct regmap *hhi;
> +	struct clk *tmds_clk;	/* optional, Meson8 only */
> +	const struct meson_hdmi_phy_data *data;
> +};
> +
> +/* Meson8, Meson8b, Meson8m2 */
> +static const struct meson_hdmi_phy_rate meson8_rates[] = {
> +	/* 2.97Gbps */
> +	{ 297000000, 0x08c31e8b },
> +	/* below 2.97Gbps, down to 250Mbps */
> +	{ 25000000,  0x08c34d0b },
> +};
> +
> +/* GXBB */
> +static const struct meson_hdmi_phy_rate gxbb_rates[] = {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x33353245, 0x2100115b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33634283, 0xb000115b },
> +	/* 1.485Gbps, down to 159Mbps */
> +	{ 15900000,  0x33632122, 0x2000115b },
> +};
> +
> +/* GXL / GXM */
> +static const struct meson_hdmi_phy_rate gxl_rates[] = {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x333d3282, 0x2136315b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33303382, 0x2036315b },
> +	/* 1.485Gbps */
> +	{ 148500000, 0x33303362, 0x2016315b },
> +	/* 742.5Mbps, down to 159Mbps */
> +	{ 15900000,  0x33604142, 0x0016315b },
> +};
> +
> +/* G12A */
> +static const struct meson_hdmi_phy_rate g12a_rates[] = {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x37eb65c4, 0x2ab0ff3b, 0x0000080b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33eb6262, 0x2ab0ff3b, 0x00000003 },
> +	/* 1.485Gbps, down to 159Mbps */
> +	{ 15900000,  0x33eb4242, 0x2ab0ff3b, 0x00000003 },
> +};
> +
> +static const struct meson_hdmi_phy_data meson8_data = {
> +	.rates = meson8_rates,
> +	.num_rates = ARRAY_SIZE(meson8_rates),
> +	.max_rate = 297000000, /* HDMI 1.4b limited to 4k@30 */
> +	.has_tmds_clk = true,
> +	.cntl0_init = 0x08418d00,
> +	.cntl1_init = 0x0,
> +	.cntl1_en = PHY_CNTL1_CLOCK_EN,
> +};
> +
> +static const struct meson_hdmi_phy_data gxbb_data = {
> +	.rates = gxbb_rates,
> +	.num_rates = ARRAY_SIZE(gxbb_rates),
> +	.max_rate  = 600000000, /* HDMI 2.0 */
> +	.has_cntl3 = true,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
> +	.cntl1_en = PHY_CNTL1_CLOCK_EN | PHY_CNTL1_FIFO_EN |
> +		    PHY_CNTL1_FIFO_WR_EN,
> +};
> +
> +static const struct meson_hdmi_phy_data gxl_data = {
> +	.rates = gxl_rates,
> +	.num_rates = ARRAY_SIZE(gxl_rates),
> +	.max_rate  = 600000000, /* HDMI 2.0 */
> +	.has_cntl3 = true,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT,
> +	.cntl1_en = PHY_CNTL1_CLOCK_EN | PHY_CNTL1_FIFO_EN |
> +		    PHY_CNTL1_FIFO_WR_EN,
> +};
> +
> +static const struct meson_hdmi_phy_data g12a_data = {
> +	.rates = g12a_rates,
> +	.num_rates = ARRAY_SIZE(g12a_rates),
> +	.max_rate  = 600000000, /* HDMI 2.0 */
> +	.has_cntl3 = true,
> +	.has_cntl5 = true,
> +	.cntl0_init = 0x000b4242, /* Bandgap */
> +	.cntl1_init = PHY_CNTL1_INIT,
> +	.cntl1_en = PHY_CNTL1_CLOCK_EN | PHY_CNTL1_FIFO_EN |
> +		    PHY_CNTL1_FIFO_WR_EN,
>   };
>   
> +static const struct meson_hdmi_phy_rate *
> +meson_hdmi_phy_find_rate(const struct meson_hdmi_phy_data *data, u64 rate)
> +{
> +	unsigned int i;
> +
> +	if (rate > data->max_rate)
> +		return NULL;
> +
> +	for (i = 0; i < data->num_rates; i++)
> +		if (rate >= data->rates[i].min_rate)
> +			return &data->rates[i];
> +
> +	return NULL;
> +}
> +
> +/* Fallback to init mode: CNTL1 first, then CNTL0 (order matters) */
> +static void meson_hdmi_phy_set_init_state(struct meson_hdmi_phy *priv)
> +{
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, priv->data->cntl1_init);
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, priv->data->cntl0_init);
> +}
> +
>   static int meson_hdmi_phy_init(struct phy *phy)
>   {
>   	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
> +	int ret;
>   
> -	return clk_prepare_enable(priv->tmds_clk);
> +	/* No-op if there is no clock (GXBB and newer) */
> +	ret = clk_prepare_enable(priv->tmds_clk);
> +	if (ret)
> +		return ret;
> +
> +	meson_hdmi_phy_set_init_state(priv);
> +
> +	return 0;
>   }
>   
>   static int meson_hdmi_phy_exit(struct phy *phy)
> @@ -53,33 +203,64 @@ static int meson_hdmi_phy_exit(struct phy *phy)
>   	return 0;
>   }
>   
> -static int meson_hdmi_phy_power_on(struct phy *phy)
> +static int meson_hdmi_phy_configure(struct phy *phy,
> +				    union phy_configure_opts *opts)
>   {
>   	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
> -	unsigned int i;
> -	u16 hdmi_ctl0;
> +	const struct meson_hdmi_phy_rate *r;
> +
> +	r = meson_hdmi_phy_find_rate(priv->data, opts->hdmi.tmds_char_rate);
> +	if (!r)
> +		return -EINVAL;
> +
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, r->cntl0);
> +	if (priv->data->has_cntl3)
> +		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, r->cntl3);
> +	if (priv->data->has_cntl5)
> +		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, r->cntl5);
> +
> +	/* Disable clock, (and fifo, fifo_wr where present), release reset */
> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +			   priv->data->cntl1_en | PHY_CNTL1_SOFT_RESET, 0);
>   
> -	if (clk_get_rate(priv->tmds_clk) >= 2970UL * 1000 * 1000)
> -		hdmi_ctl0 = 0x1e8b;
> -	else
> -		hdmi_ctl0 = 0x4d0b;
> +	return 0;
> +}
> +
> +static int meson_hdmi_phy_validate(struct phy *phy, enum phy_mode mode,
> +				   int submode, union phy_configure_opts *opts)
> +{
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   
> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
> -		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x08c3) |
> -		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, hdmi_ctl0));
> +	if (mode != PHY_MODE_HDMI || submode != PHY_HDMI_MODE_TMDS)
> +		return -EINVAL;
>   
> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, 0x0);
> +	if (opts->hdmi.bpc != 8)
> +		return -EINVAL;
>   
> -	/* Reset three times, just like the vendor driver does */
> -	for (i = 0; i < 3; i++) {
> -		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE |
> -			     HHI_HDMI_PHY_CNTL1_SOFT_RESET);
> -		usleep_range(1000, 2000);
> +	if (!meson_hdmi_phy_find_rate(priv->data, opts->hdmi.tmds_char_rate))
> +		return -EINVAL;
> +
> +	return 0;
> +}
>   
> -		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE);
> -		usleep_range(1000, 2000);
> +static int meson_hdmi_phy_power_on(struct phy *phy)
> +{
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
> +	u32 en = priv->data->cntl1_en;
> +	u32 mask = en | PHY_CNTL1_SOFT_RESET;
> +	int i;
> +
> +	/* Reset PHY 3 times in a row */
> +	for (i = 0; i < PHY_RESET_COUNT; i++) {
> +		/* Enable and software reset */
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   mask, mask);
> +		fsleep(2000);
> +
> +		/* Enable and unreset */
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   mask, en);
> +		fsleep(2000);
>   	}
>   
>   	return 0;
> @@ -89,9 +270,7 @@ static int meson_hdmi_phy_power_off(struct phy *phy)
>   {
>   	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   
> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
> -		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x0841) |
> -		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, 0x8d00));
> +	meson_hdmi_phy_set_init_state(priv);
>   
>   	return 0;
>   }
> @@ -99,41 +278,90 @@ static int meson_hdmi_phy_power_off(struct phy *phy)
>   static const struct phy_ops meson_hdmi_phy_ops = {
>   	.init		= meson_hdmi_phy_init,
>   	.exit		= meson_hdmi_phy_exit,
> +	.configure	= meson_hdmi_phy_configure,
> +	.validate	= meson_hdmi_phy_validate,
>   	.power_on	= meson_hdmi_phy_power_on,
>   	.power_off	= meson_hdmi_phy_power_off,
>   	.owner		= THIS_MODULE,
>   };
>   
> -static int meson_hdmi_phy_probe(struct platform_device *pdev)
> +static struct phy *meson_hdmi_phy_alloc(struct device *dev,
> +					struct regmap *hhi,
> +					struct clk *tmds_clk,
> +					const struct meson_hdmi_phy_data *data)
>   {
> -	struct device_node *np = pdev->dev.of_node;
>   	struct meson_hdmi_phy *priv;
> -	struct phy_provider *phy_provider;
> -	struct resource *res;
>   	struct phy *phy;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EINVAL;
> -
> -	priv = devm_kzalloc_obj(&pdev->dev, *priv);
> +	priv = devm_kzalloc_obj(dev, *priv);
>   	if (!priv)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>   
> -	priv->hhi = syscon_node_to_regmap(np->parent);
> -	if (IS_ERR(priv->hhi))
> -		return PTR_ERR(priv->hhi);
> +	priv->hhi = hhi;
> +	priv->tmds_clk = tmds_clk;
> +	priv->data = data;
>   
> -	priv->tmds_clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(priv->tmds_clk))
> -		return PTR_ERR(priv->tmds_clk);
> -
> -	phy = devm_phy_create(&pdev->dev, np, &meson_hdmi_phy_ops);
> +	phy = devm_phy_create(dev, NULL, &meson_hdmi_phy_ops);
>   	if (IS_ERR(phy))
> -		return PTR_ERR(phy);
> +		return phy;
>   
>   	phy_set_drvdata(phy, priv);
>   
> +	return phy;
> +}
> +
> +/*
> + * DEPRECATED: only for DTs without a "phys" property on the HDMI TX node.
> + * Remove together with the fallback in meson_dw_hdmi.c.
> + */
> +struct phy *meson_hdmi_phy_create_legacy(struct device *dev,
> +					 struct regmap *hhi,
> +					 enum meson_hdmi_phy_soc soc)
> +{
> +	static const struct meson_hdmi_phy_data *const soc_data[] = {
> +		[MESON_HDMI_PHY_GXBB] = &gxbb_data,
> +		[MESON_HDMI_PHY_GXL]  = &gxl_data,
> +		[MESON_HDMI_PHY_G12A] = &g12a_data,
> +	};
> +
> +	if (soc >= ARRAY_SIZE(soc_data))
> +		return ERR_PTR(-EINVAL);
> +
> +	return meson_hdmi_phy_alloc(dev, hhi, NULL, soc_data[soc]);
> +}
> +EXPORT_SYMBOL_GPL(meson_hdmi_phy_create_legacy);
> +
> +static int meson_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct meson_hdmi_phy_data *data;
> +	struct phy_provider *phy_provider;
> +	struct clk *tmds_clk = NULL;
> +	struct regmap *hhi;
> +	struct phy *phy;
> +
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
> +	/* The PHY node is a child of the HHI syscon */
> +	hhi = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(hhi))
> +		return dev_err_probe(dev, PTR_ERR(hhi),
> +				     "failed to get HHI regmap\n");
> +
> +	if (data->has_tmds_clk) {
> +		tmds_clk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(tmds_clk))
> +			return dev_err_probe(dev, PTR_ERR(tmds_clk),
> +					     "failed to get TMDS clock\n");
> +	}
> +
> +	phy = meson_hdmi_phy_alloc(dev, hhi, tmds_clk, data);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "failed to create PHY\n");
> +
>   	phy_provider = devm_of_phy_provider_register(&pdev->dev,
>   						     of_phy_simple_xlate);
>   
> @@ -141,7 +369,10 @@ static int meson_hdmi_phy_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id meson_hdmi_phy_of_match[] = {
> -	{ .compatible = "amlogic,meson8-hdmi-tx-phy" },
> +	{ .compatible = "amlogic,meson8-hdmi-tx-phy",     .data = &meson8_data },
> +	{ .compatible = "amlogic,meson-gxbb-hdmi-tx-phy", .data = &gxbb_data },
> +	{ .compatible = "amlogic,meson-gxl-hdmi-tx-phy",  .data = &gxl_data },
> +	{ .compatible = "amlogic,meson-g12a-hdmi-tx-phy", .data = &g12a_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, meson_hdmi_phy_of_match);
> diff --git a/include/linux/phy/phy-meson-hdmi-tx.h b/include/linux/phy/phy-meson-hdmi-tx.h
> new file mode 100644
> index 000000000000..fe76a5f7efdb
> --- /dev/null
> +++ b/include/linux/phy/phy-meson-hdmi-tx.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __PHY_MESON_HDMI_TX_H
> +#define __PHY_MESON_HDMI_TX_H
> +
> +struct device;
> +struct regmap;
> +
> +enum meson_hdmi_phy_soc {
> +	MESON_HDMI_PHY_GXBB,
> +	MESON_HDMI_PHY_GXL,	/* GXL and GXM */
> +	MESON_HDMI_PHY_G12A,
> +};
> +
> +/* DEPRECATED: compat for DTs without "phys" on the HDMI TX node */
> +struct phy *meson_hdmi_phy_create_legacy(struct device *dev,
> +					 struct regmap *hhi,
> +					 enum meson_hdmi_phy_soc soc);
> +
> +#endif /* __PHY_MESON_HDMI_TX_H */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

LGTM

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
