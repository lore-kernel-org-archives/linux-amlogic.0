Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E144C282CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJiBQyLVz8e044UfwYmYiJiOW0xCeZvhxWk6MPrCUIQ=; b=cR1FZSoGz7plH4jt+acevSY04n
	fDQpXdfumSpswwlAYtJRMknTKy0Gkw5jlaiI1DvwXdR/9NeqnJk0DWwySorf3eJ8W+OaBzReHR32T
	AmkkMuTo59w+pJ2I2IFjgBNWoZ3bDMT+VqqDVEkQnyn+5DUXBP/KuoeFvWI7vknkY+jFK1zxI6p0H
	QOKVsCzgw7LNgxUh5+v5a4m+PjfxBT0xdlvbM3rs52/GbFymsCWluaDjZ1P1kx8bRYMXfkIqlwSek
	FUHBg6/KdTyPSCTDB0HO/oWmEal0RHZsAiAeuVGOOH2HkNnO7WJNtQw26j2zLR2Mrh7nRVXSZxxFn
	u3lZcgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6b-00000007nJ1-1eXL;
	Thu, 27 Feb 2025 14:43:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneiX-00000007gta-0vHi
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Feb 2025 14:18:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so7210345e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Feb 2025 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740665903; x=1741270703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KjmgTTmGKnNMLEkQ2tYRKgEmMShvtFLmbhC7J1ZseQ=;
        b=a6B308Evvam9ssFuF2zCRkiuYGedQQSpciXitd0q0RSBaWQg0ikUrBrUM14f3uy1NE
         uyuOH485qO9O6/FievPXp6NWfZLCtwdm7AHZCwKUT06HQ7cZRxKM6IvtXfYDppuytkWO
         KJ3mZ2ELiA/4jNC7rULsjO/lM/uG8KqvZ7KNAInNuDzglYmRIoEp1dpbHHOKdBn9pS9J
         33l+P/mdRr1L+wLLHuWZNzdsEtpD0FCH5KokBwt9Uw0ISg645DIsMBoJm1x74udTGP1Z
         o/84TV9XKEGHh7uJUmDmFK2XqEznGIwVeX+FhrQcdAsDEq2iHpXE4rn4tm7QAhV58cHb
         paVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665903; x=1741270703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3KjmgTTmGKnNMLEkQ2tYRKgEmMShvtFLmbhC7J1ZseQ=;
        b=JsC1E//Xb107OQGEpYGjjFh/PtXEBimD2B7OAxVMBtBXEYTmrfybq0+2ttK21pzQFg
         sQ9iEyzU5za7hX1dlIBEk7M6p/0aUK+rWcltWv+Pz4nKDDCqNfG1a0BeSy/bv06AGUAg
         j9rgQwPky/L2NQlOF1/sqxOXK7qCvu/H/lRtGDWlc5y8EkssFoZe1z0yzDBfMDtUKLXk
         EnUn4PtqTiNU/GhpX3+jjBlqxD2RVP69KMRCZx3R2sWrWeBV4yo9WrU2Wqmo+BJz4yNO
         R5MKoWZqSLTCjPI3kq4RkbqqfH3CYjKfyY2gaf1QWBIOCL0bWcKEljGUERGtIT0/o0au
         /zUw==
X-Forwarded-Encrypted: i=1; AJvYcCVkR9a11kUyBj2Y2jLbNkbxo8ZS8S8Oihxi0assw4ds+Rff/vdxj/Ok5QKpK5N19FnRy7B27oBRKf3dRoQh@lists.infradead.org
X-Gm-Message-State: AOJu0YywXT2Au74Vn845PENFTNdMUKur8E1h1d4ZTY1qtn9vraw2JQks
	YaWOuJIqauVZVlOl2lzvT0L/wlo7xNThOJGHiYi7Bpg6qmLkIfoaK8srxCmpKjM=
X-Gm-Gg: ASbGnctQIqo2ygs8EfjRol+WPkXdh1k8AajVzi7NXD6lDNo2W4C6ukYQkkFKPd7N6wW
	lzATrGpYzw9M3Ax0rVp2imABA4kvx/N77TxQhv743GmrtPM+cTEDhVJcTaZxfYpZx7KiVtjOrM2
	0zXHp8b7IWyy0F1MBIcqqVAp27qrJXVXHtOb9FweQ45RHgMDxuUpPPM7Zr73iEww77iqjYPERhq
	90wrQEmiYErDcfMRNfLE7qUyFOzsvOY/AxIU+XhX/hTQayV8S4zdoiMzUsGhVCbQjT+PEytzTV1
	494+yc0R6nyYxHZxx+aiTq49wr6bF2Y+jJM0e2Y/gnF4Ry9DEhrhHEjzmPnd55h8JQzDF7d+kpl
	QZNo=
X-Google-Smtp-Source: AGHT+IFcL1gSMJCTCnZcd6HJw2zwybdNPIHKIrsiUSeI2jk/mbKwBJYRWGcu2yQ2deoYklOEQz/emw==
X-Received: by 2002:a05:600c:4e50:b0:439:8653:20bb with SMTP id 5b1f17b1804b1-439b2b06189mr248030835e9.14.1740665903502;
        Thu, 27 Feb 2025 06:18:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958? ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5870e7sm59261405e9.35.2025.02.27.06.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:18:23 -0800 (PST)
Message-ID: <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
Date: Thu, 27 Feb 2025 15:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH net-next 10/11] net: stmmac: meson: switch to use
 set_clk_tx_rate() hook
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_061825_266565_382E75F0 
X-CRM114-Status: GOOD (  15.35  )
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

Hi,

On 27/02/2025 10:17, Russell King (Oracle) wrote:
> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> manage the transmit clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> index b115b7873cef..07c504d07604 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> @@ -22,9 +22,10 @@ struct meson_dwmac {
>   	void __iomem	*reg;
>   };
>   
> -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
> +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> +					phy_interface_t interface, int speed)

You can keep priv as first argument name and remove the next changes

Neil

>   {
> -	struct meson_dwmac *dwmac = priv;
> +	struct meson_dwmac *dwmac = bsp_priv;
>   	unsigned int val;
>   
>   	val = readl(dwmac->reg);
> @@ -39,6 +40,8 @@ static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
>   	}
>   
>   	writel(val, dwmac->reg);
> +
> +	return 0;
>   }
>   
>   static int meson6_dwmac_probe(struct platform_device *pdev)
> @@ -65,7 +68,7 @@ static int meson6_dwmac_probe(struct platform_device *pdev)
>   		return PTR_ERR(dwmac->reg);
>   
>   	plat_dat->bsp_priv = dwmac;
> -	plat_dat->fix_mac_speed = meson6_dwmac_fix_mac_speed;
> +	plat_dat->set_clk_tx_rate = meson6_dwmac_set_clk_tx_rate;
>   
>   	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   }


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
