Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF7C36010
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRD9A7kor6Voev97YsKgFqwcZEFSaJIUYTOK8rMvXfg=; b=yzLe8CCbWXINJQk5vamPTufEFZ
	H+DFxyKO8ZmOKD8Hfp9mXgO5HbmyZyL1iOEDoKIzb1PWFWjcA1OdCF0QBF/IbcX/m/iJ/20ezeWGI
	uWy1xmQrG566SwCeRX1/paL4brGpl0ITFIjenGgjbNy20A1U4+OQSMDOQAf6dsXOiBuu7uCMdseLY
	bJbKjjbn68stfXw4mQHUknK1ip7o8umJVeTtgudEDYU4qJhIKyGkO6aAwrH4T1wgZThE8PITrB0T4
	aJ8dmxG946Ehz8Z3YEa+g0o/5eLU2kgbp00PNnMiZBKH1JFz6BkpvMEJWE1CZRN1SEJPgbyqBqJG7
	l0H0DO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39tm-0000000D30f-3eT0;
	Fri, 11 Apr 2025 08:38:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oU-0000000D1mW-3imZ
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso872131f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360357; x=1744965157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=AriW8d9O4tskH4Kql0+w9eiQB4OnCnQvr1Bn7kPatpH3ZPpBen4EkoyrKp3GwgiHlN
         gjeVGLQhkEMEqA5ZxZvavVYD4F8Fv6NEUiCBh9PRFkwrNOFPdnT6JhA2jGqH4QGe4ggZ
         HtVPhhsvorxsmBfJAaH+IhXUKNdZLNrgbTK7AWxS8XU+DwnLjUAwYIl4iyQgFsWVMAYO
         QI8d0X2Zm5oPH8N8iI0nhEqiu8WE6ks4+DMPTrgrlXikndX01aeVc8leKfeklvr55N00
         AULqpu2/7eZZ5LVX71po3SWUAcqFxFvO+ph0IFUHWKA/9b6u0K8u52JC91bKPjkBiZob
         wFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360357; x=1744965157;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=GYjgVQol52evaVvHOeDv5tpgRXE9V2wUpP6dwGauh723XIjW9sNcFJPmrUSAya2okL
         4JC4Ssp66Lf4K8o+OD+13PGj9IgFWqH42YeNWCk+HepY+iBoeC+KJE4WI0KgtqpuYrVH
         RYtmSu4YughpPDqopm33KHrcZGEehH5pJaRnF0Km62QInQK3iJKzVxYKhJHwk+zuXfHM
         4AlBlOomtSQAYAEE7406ObQtoFewIiMA+zEJr/m2Os1v2nR7cfPgZv5AUl1/LO6FwfL4
         wLim2k2KUwU0UixKfiJ6JKmamSaM+g3yFyb8vmnJh6lkCGLoKlSyebQh3cQmGeYpVOaE
         zdKA==
X-Forwarded-Encrypted: i=1; AJvYcCXp3UKpiNXWYgcBpscVDi5eiet6IaDTWAT4GSHhYe02fz1eRupy9PVV2GXkSyrKLyL7m4HqRWhitTjIGeYk@lists.infradead.org
X-Gm-Message-State: AOJu0YyOZanzWthEJsNf51OMcx4I1yzHXv9F6gik+LTgm4HKkvuR84sQ
	8tHah9qnoW2hNjM6122J1AAlXRNr74mXUIQpYejVTvIhCrQ0jPvcilC8lVFAQRg+C21eoJW/YE/
	R
X-Gm-Gg: ASbGnctDYolFHqgm09rgeF6rOFBESEmqJ36JcplPjUOqWcVi33qz9KNoMf46/sTsHR1
	dA+NjI36+ZDc2A44FzUeCmLa8ZJtkQ7FnUpXlttJZ6o3NA3JZl1s1ti3tvoIi2QfVNjOV6phgam
	YB8j6jRfH5lcbUV75jm4b31jqxz3t4lxzprHqj+Av9ranUDQpxq1B1Jo6x2aTYz9NOmH2ryMsNG
	K5CrSu7SOOZy9QYzPRyvUwUbsUdr9roxJxy0hQkz86lE9QPbRG7z4bTaGfwuiFOepG0pqDfEX02
	MUgSDXLV+50c16zx4eUHrFfRPMQQf7HbL46moTggEFQTaFcNZY5nIBLztqXCystDe2MU74MYXqn
	UhhyuLnlrahnzWefpbA==
X-Google-Smtp-Source: AGHT+IFUbDwr+dUTvC67ZJxa+UMe9UcTiY3kMIzVR47Og8ohlxwGVWTRBoL9btY+9GZISqqXHtjb3w==
X-Received: by 2002:a05:6000:1a8a:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39eaaec7b91mr1244633f8f.42.1744360357266;
        Fri, 11 Apr 2025 01:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:36 -0700 (PDT)
Message-ID: <3d64a7ba-3bf1-4fa7-a1f1-b6fb2bfecfa7@linaro.org>
Date: Fri, 11 Apr 2025 10:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error
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
 <20250410133332.294556-3-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013238_982423_539C39AF 
X-CRM114-Status: GOOD (  12.71  )
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
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 0e0b5c00b676f..66bf0b7ef8ed3 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -339,13 +339,9 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
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
>   	phy_set_bus_width(phy, 8);
>   	phy_set_drvdata(phy, priv);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
