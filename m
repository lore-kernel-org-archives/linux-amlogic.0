Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62112C369A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGZkkZPN04C4JoEQN6Kp+9UwQPd0pefzzLRRm7e7HII=; b=JB2SLagzwpTlENWABfbgwg61Pg
	jLYLnavhC+ZLBjNGPevugGZUWt20fqEaUsbQpOhIETdCd3JTA2Ovh8tTAFs97lzzEPq4v+OUKGhZu
	tLfAYTNrKrLCK/ILhquzDg/uxm8WILuRuJVpGR6NXgksQsU+DmLPGHTv6LqRa4RTuZ88NYzDuLteH
	1Jkaq8GnUxMLamIyRVIA9hmMvKbfrsmLLnCI4ZLzpDaEEtnb+KfdmxFt7lICdh4W7C64/PN7ECtYB
	HmdVgG59J4MWN9gZogeOYGBKB+VEwoePNd4dcRB7ma9yE1f+FncMgsr1ysZc4mz7TtKJnCQ8cChtW
	tjOxuoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39s0-0000000D2Wo-1WfP;
	Fri, 11 Apr 2025 08:36:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oL-0000000D1jb-3pjD
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12748205e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360348; x=1744965148; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=dvu2N/Z7xddjjCHXdB6XK1rIsAqkmhd+QvhxXRFSSqbR+QOPOnwvZfkYjXUBp0/JO6
         VAhMIoWhRKa8YJgG7NGOAmZ6thS2Vaz4E0dItyTZvZx0Ir48Groxd9fvZsDCvRaeG/cC
         SDK+krSvRc44/ay/Dr8XZYvjSexyTWJ13zCremxxoOsAoPduDLge4mMpSKMjJZLM5gAW
         1kGG5B3ltpYvnRML1wSf4QxSdGHok0Qf5ddcox4feXbROHjbTBFdPNGOJMumyi+mM11c
         9KOzm12Rq55AuyFqGSUQ5Z3rzBnuLJnh9URNGMG2nmbeQGtU4t7pAb0mGJJsy063mfZR
         05QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360348; x=1744965148;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=lyjdM8Rc6K/8lzL9pwyPJSOAJ1ARbGCAIb54hAyR78g3l86+p8uUx/37nSsHWGWqF+
         lapsDnob2ZwWSWaqwbp+JGZAWXFTyNAteDCoTwquT42xHudyRdqyVOTKs/do0mXx82hF
         K+HXYasl1FGECrKefJwln8qcSKEHdKeNlkyYpXrPk4bZ5ejdNpyVOZivVAr8oi1/c3YQ
         9O78j5Ta5hvfTZAzu0EY9nXZ+MrPf30a9qrOxbvvMlsAHaFQDJKIpnATeySuLFZMZykL
         aU2xtYoiDwruH7gjyrkfIEyfz+lMX/z9LUYtlfw8pDeJqWdSxA+Tsl85YRhZ722oSkLq
         q8tA==
X-Forwarded-Encrypted: i=1; AJvYcCXdqTLhpagZKyBXv6xHwi/AqP7d8U2uBYz6t6KaTzjcEYjavQaMuCRBU5Do8DOsUyzG1iAapXlho+XBUxSm@lists.infradead.org
X-Gm-Message-State: AOJu0Yycl2gtrm/hV+c0j/rjyaTlI9JdhUX6wE08szd3djGdN9o/YG0R
	EWa0UJTKHEJmOGSkHIi9bNNRYZBH9I8tgbb9ZZCdH5/C6ir5ZUgI1ceJYz/vWLY=
X-Gm-Gg: ASbGncuTpSdFjDUiU1GTWppF8vwc+JBRmhCrZ3nWvkgpr1Lpc1FlBF6IHO8858IMWp7
	ZED3/5jCMOQAq3IHZUK3rayFK6QGx4O5jQDb/ynWT9ffew1PiyVusPfWsHU7LbkZH6syDlA5WkY
	qDuxhNwmZ9tQIBfmvN1B4nBJTOC+HOKZ7PG7DjTTr7pLdwQM6h9ycRvo81LJfD9oU6XAii/vpsn
	Ti3pc/SSbp2J7YqC01UufE0KcFEwj/U7RkSHrByAyyp1+pnmBnIdkH2B9Tups6l0gEo5DcNpeDR
	g6gX8rkyTQgfbEeeX9Bx/Dc3ktK7FmHQVLq2x+AwXeZ1P/yzkHcMTG7xyv01PrYv0Lmax5kQXVm
	DvSp+JbhqDu/ATJF+5Q==
X-Google-Smtp-Source: AGHT+IFy7DI7w+bf+TzbwYeaeMvt+UTEl9M52U5ZWizMhQesvmiV7Mq5Ube+HjPUMbBTeDkCz3uXvw==
X-Received: by 2002:a5d:648e:0:b0:39c:30d8:a67 with SMTP id ffacd0b85a97d-39eaaecd91emr1259666f8f.55.1744360347745;
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm75951255e9.28.2025.04.11.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Message-ID: <7f6910a0-c56c-4284-b928-eb7ae7fb7e92@linaro.org>
Date: Fri, 11 Apr 2025 10:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error
 handling with dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
 <20250410133332.294556-2-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013229_956867_C050454C 
X-CRM114-Status: GOOD (  13.47  )
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

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 14ea89927ab14..6b390304f723c 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -237,7 +237,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   	struct phy_meson_gxl_usb2_priv *priv;
>   	struct phy *phy;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -266,13 +265,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->reset);
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
> -	if (IS_ERR(phy)) {
> -		ret = PTR_ERR(phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to create PHY\n");
> -
> -		return ret;
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "failed to create PHY\n");
>   
>   	phy_set_drvdata(phy, priv);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
