Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B9BC7EE24
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2AITHFn3T0OgbycVTudEwwqPWVbURUEbH0w6ogVU9E=; b=iEgN1ga0+AbGlGPvvqyL6ch38F
	UCRrBSAJlqV1P0le12Wucky2vZekmt9ErzbJyqrGkgWR/WWq6tahUT8NDE/ezdcVYigb8PlObgME8
	GRDuIpyOkmDbMyTN5f1Zz1iRm3rBs/Ja3Tg+w+j5QLOx8m38d9/WfctzbBAg9mRpk32LM8Azbpf0G
	iZkOG0Q/9e/CgNfun/RH9+YDngpQi4FdkF+x/pdULqE5vb3epBuLOM4sDh4Y1gtUkc9yQtgFxUPpr
	hhV5dd1nKlc7V3YJlwmfAaR2zw6AKkIQp2sVzLA0K230GS5DJQLQ+BujU288MNsx4JoAeHfigQUpn
	SNCDsf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50tV-006Lf4-2e;
	Fri, 02 Jun 2023 09:16:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50tT-006LdD-1g
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 09:16:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so18608945e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Jun 2023 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697379; x=1688289379;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XCSBt06ODCOO6aeVJ2PlXGU7kys31a0U2ya2eb1ukWw=;
        b=Z+ctFkEefF0e4doqq0Ug4bfRYfV4IApiuCj62wHwH5KpnMjImkCKEMD6dqT7PNRqck
         1KxgSYzQW+icJWnxf2IK5Zp6wkBYQ4bRr7wuvKK94lbSyRpz8wwAkskcQMj24qiM1v0M
         GAluuGomAl2RCXaT9ZNXSrDGVZapBa7+Jq9d18QJrscreKDrwX3flFnK43x57UYOsIv7
         zbcespmhVHncyojB36fAyNh5rqJJzl51FFFHTVKe35+DnbdMKCKo7o58rfG7d9pVH8OQ
         EDdUTisqSCde7B8cMJMJtg/sm2DSAVQCSVe5ZJZSZNK6PQkM3H4WEQBgjLvVos0fww56
         a6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697379; x=1688289379;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCSBt06ODCOO6aeVJ2PlXGU7kys31a0U2ya2eb1ukWw=;
        b=a9F+rjYlhwo8GrEFWzqCi6nIY+I0ENtlGwABZ3Ez1FYv0hHTbxaJPTbyVXtxKbggLV
         L22wQx+I49BgRHAbMG6ZOUkLVefT4Y9az5Wp/B1flSOyN/iGN78mRnHxkWbxLM/pO/Hr
         XMPodyO1i0Cky2rbFgbbeLTH1vNiFShe7+5oJ5EbMPwnHh7LbTElrSKIrxE5Erkugalv
         l7tO5ytF7PZhHcc2tOrLD7hT7Y4ZzE9xp0Tg9xbJI7Nh1Pv+6toE6eyGELsUrmazq23k
         db1gMF/c1QH2qoqH3KAhD3UYxXQ0Hy0I9GIPb14LwZ5t3Rv3YQe6/HJ/PfDYLcsXW1zw
         bw8A==
X-Gm-Message-State: AC+VfDyT4hrBp5UO/XblbpDTU9NXnvmmVaILEV6wJmrQOBc/drWR7Q8Y
	W5GiZU3DpJy8WNfEhlRrWlwTIg==
X-Google-Smtp-Source: ACHHUZ5kFDVkTijAYhopCOawiE08DDNzoy6papAmWv1662nnpG5t1S72iJGGObX98yTOLoivrgSqwg==
X-Received: by 2002:a05:600c:3798:b0:3f6:244:55df with SMTP id o24-20020a05600c379800b003f6024455dfmr1508463wmr.29.1685697378846;
        Fri, 02 Jun 2023 02:16:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2? ([2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003f60119ee08sm4895391wmc.43.2023.06.02.02.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:16:18 -0700 (PDT)
Message-ID: <1ed84d1f-d999-f0f2-bd84-d56f46efa384@linaro.org>
Date: Fri, 2 Jun 2023 11:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH -next] drm/meson: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
Organization: Linaro Developer Services
In-Reply-To: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_021623_558742_6588EB32 
X-CRM114-Status: GOOD (  12.53  )
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

On 02/06/2023 11:14, Yang Li wrote:
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5392
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index dd505ac37976..57447abf1a29 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -114,7 +114,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		return -EINVAL;
> -	};
> +	}
>   
>   	/* Configure color format for DPI register */
>   	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
> @@ -228,7 +228,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   	case MIPI_DSI_FMT_RGB565:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
>   		return -EINVAL;
> -	};
> +	}
>   
>   	ret = phy_init(mipi_dsi->phy);
>   	if (ret)

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
