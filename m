Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA00CA5FEF
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/NpOoGIBbchveC694dkvRPgK3Bz3ibLC89+5TNHegA=; b=eAxjKGJdm1zFdNOtLfSdxyKYjN
	BznZeUwWG9PKQ7mHSDl7R6b/MFnyATSoLMZP3BmeU0k9x3+d2NwHb4rJ3rh+y7AVKDs/Qfy33Yoe0
	25Gsfw8npwuRhoPMmh30W/xbMNpKnyW+p48n/7me/G6syYIJ9fOjk9pE1baEJ70euc/5drPtZG8lc
	Bz4rr2rPLtMx6Hvu08nBEggXFTpnwrPgDRCZN59KM4nrKRlV8FpVjNaOraNHUpTI6H7bBwBG2wZGE
	t28rW2qcUzSM09K33zEQilz5UH0RtO6tM6JWkLjmvrsXcCzh5zuKrSvghz/BJfSEya7lGDBZEU3FJ
	lnOejmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8c-0000000Ez83-07YL;
	Sun, 04 Oct 2026 15:28:30 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8Y-0000000Ez6z-4BF5
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 15:28:28 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48c54d65743so363303f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127704; x=1791732504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=b03t48xMgTeFbzNfi1xgiA/kNQTzLvylNdfZKbYkia1+/HWc+BmstOuEm8x/NkSs9Z
         B53m6bJqIumi6aBtUcfGAeXf1iiHyPp0D4F3NPqUCGT/9OtCmvIFxVLB0+eJv0dEOh2H
         frIeYBNMrxE9vlz0kfdkqktNU2jsCXwcBLCQwKHEQHsiR6IVp4TuK7Bi6bhsmYqOb1Fi
         jC0lxebVXd3ieMY0Qp5rnCre/ht5hirUGcIYyQSWmLIBX3sb2HMJbCdpKyHKGnVb+/8L
         sV3d7il8nBJQp0zoqPVB6gTWpEUQA8yOspaWhsJ/FGtVnqIyUPrZTxh/Gf1kKRJlCblq
         E7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127704; x=1791732504;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=LlLizbpufLaoBPHvhCuCl4DVUBUzBu+WNK4+QWKFrfdC0S9oSVEmE47S37qwUhU0XZ
         BmY+Esq8dJIaIHW7ERSP+j+vR2Ia55Ewtd8EiHBD7+oAAa2Ms2VubNrd4Gp6CXwQ3zov
         thV1YmOqs6dD4quGsqyvi8/K+dL1DKLsG2UdDnH85LuyR/TJmDXrl5U/nlIvTcm+6GhR
         Dxq4EUZz0qKGQLhAu+cmX8NS/WEraPvDGy/NXVnmRpxaNvdBocVg362GqmOuR1LizTt6
         DuqyaVrXkp9QCDd7PDQkBHsPOlCVyh2anvYSfZv3EJpXwMULJpYTE0c+M9Sn0nMhsdtD
         G9KA==
X-Forwarded-Encrypted: i=1; AKwUvBw7MFQuSlBOd3tNOW8UYUVIqBE+qLnL4NmvLfQ8D6IxdkiVbdFwq7j5R7tjC/zfO6sTE21RTbyc6ExNGL/A@lists.infradead.org
X-Gm-Message-State: AFuF++ncXJ4MyOvVTJ5zJOSjsvztuTncadhL7OkY2bQaS+9oU1lH+wMh
	/22B/WaL34QZggn/y1NZFBl469PGJABdCwo0Ij5jwzPWAWEWjsFT2C99wL8CRLME9b4=
X-Gm-Gg: AYBFou1wO+m04z4rOnbhFd3AMmXLfkAdnd1ej6dje+yce7u/Mc5ayS9qeaHgTszkwab
	/e1+OXQKC0xMCDtyb/ffsBIT+sMUU32q8E7aWkZEh/KiUWAzExmOummgdsaLZ3BozZzzLJJAnrj
	NGXXCgKGzplB4G2slJFiHLEDxUWD0FEhVRdgqIuV6uHZQlFD0Z4XXzmPpSoJR1bm5ML9cfTiV3B
	QMbleThlO3D+LpsfKcehH9+ABUwGG/5T1lTn5nF7utZXsK+ytD7gDQ4Fjo96TZorSIjWusMMg3g
	30tfU/B9OZbyoGq1ntjzdSvi2q33wh1wvPEy77ZgSq+TepZ1nNezvHxN3ITIDXJsVfBT0IutUth
	FY0+UHsiEsPpdySSjPTpH2/0IE6665H+QWNkYXhyUEztEwNA4+L0z7TTAGKAzXdt27KZL22yB7q
	xF8Uiw1EnjD/zrZ7e8R/zVTlsO8/pIzry39e6XVNMwBHN/81/vYlyEw8aVnPOa25ZOVSiDvFNvt
	fIUH2pG
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr135331735e9.16.1791127704520;
        Sun, 04 Oct 2026 08:28:24 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm220380705e9.13.2026.10.04.08.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:28:23 -0700 (PDT)
Message-ID: <162c3908-cbf9-4bf2-8594-8592d5e4c3e5@linaro.org>
Date: Sun, 4 Oct 2026 17:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-4-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_082827_089094_07510929 
X-CRM114-Status: GOOD (  21.82  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/4/26 16:40, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What the T7 does not share is how the controller reaches DRAM: the bus
> path goes through a pipeline stage with a gate of its own, and no device
> other than the controller has any use for that gate. Claim it and hold
> it enabled for as long as the controller is bound, otherwise it is
> switched off as unused and a transfer that has been started can never
> complete.
> 
> Give the T7 match data of its own so that only it looks the clock up,
> and require the clock instead of treating it as optional: the controller
> cannot do DMA without it, and failing the probe with a clear message
> beats booting and hitting an undiagnosable hang later.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e4d5c41294f4..450f7b4b29a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -81,6 +81,7 @@ struct meson8b_dwmac;
>   struct meson8b_dwmac_data {
>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>   	bool has_prg_eth1_rgmii_rx_delay;
> +	bool has_pipeline_clk;
>   };
>   
>   struct meson8b_dwmac {
> @@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	struct plat_stmmacenet_data *plat_dat;
>   	struct stmmac_resources stmmac_res;
>   	struct meson8b_dwmac *dwmac;
> +	struct clk *pipeline_clk;
>   	int ret;
>   
>   	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	if (IS_ERR(dwmac->timing_adj_clk))
>   		return PTR_ERR(dwmac->timing_adj_clk);
>   
> +	if (dwmac->data->has_pipeline_clk) {
> +		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
> +		if (IS_ERR(pipeline_clk))
> +			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>   	ret = meson8b_init_rgmii_delays(dwmac);
>   	if (ret)
>   		return ret;
> @@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
>   	.has_prg_eth1_rgmii_rx_delay = true,
>   };
>   
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,
> +	.has_pipeline_clk = true,
> +};
> +
>   static const struct of_device_id meson8b_dwmac_match[] = {
>   	{
>   		.compatible = "amlogic,meson8b-dwmac",
> @@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
>   		.compatible = "amlogic,meson-g12a-dwmac",
>   		.data = &meson_g12a_dwmac_data,
>   	},
> +	{
> +		.compatible = "amlogic,t7-dwmac",
> +		.data = &meson_t7_dwmac_data,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
