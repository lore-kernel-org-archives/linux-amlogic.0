Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5137FCA5FEF
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl21xh1ZCIHCPc5uWhGDQ44f5CGo2ddbDNu4zta4+/k=; b=yspKNgMD7C29MxV1AoXkUXFCZn
	tex0sS64uVWp8ur6uZlQALdrC8tSaf+pnvjDP7MpORSHJp8PZnlbf9gEdkjy9p3aYRoVXtKSKg1nM
	a5Agb/8gXffwMjG1gBJZ7HcbnCKyunIVr/IkioEqUXvKnu7Fc1jaVUSa94omx2vt9nq6ZAGZTARbC
	V20DQ+zeN2KIph+iKFbnSHJr8dd9mDlzhpdERpXm9k5qDmHq/Lgb1WtFvUrWNoEpy8XSMIqTr3epz
	X1cMXt+bQzMCoEai8H0WnpiA4YSF7MmBUhiKTL2QbU4VfMfJDJv1zaOcG3BgoyJaLfvw9O/4iwbLf
	ZP5gTE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8s-0000000EzBp-1AjL;
	Sun, 04 Oct 2026 15:28:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8q-0000000EzAq-12Yk
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 15:28:45 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so6978785e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127722; x=1791732522; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MkHQ33bfr4m25EDydRQk1cIUu8p3JZCdXBnxf0p91E=;
        b=sLMCtpYzqSFB47sE5srXD3/35UBufnoCCpyFK1R5IkkAroiE86b3bdNL/3vtV4UTXi
         fUoWMHF5BTEt8F7L21bBKG5ExALNZ0MjTRFBwAcW5FFI4CqFNFDUwFUNLj/Anmxqb5Hd
         ww8JTvjB7woFGQ244+iw4+Xu7MJu3uxIp5dEm/KDBGwJyLXHisK9Haxc0p/LycIhOa4I
         EowwPMYCjR7/H21e61yzpaMzQ4CIm0iJ1zgH75GclN7L5crySGg0CLtetHVdkWqy7PcZ
         TnIGnw6AWI3TXp/TENvDmkTKukMifTPBDmX9MT11zMtmxGaDnI7KID8+i0b2NQnwKFvC
         8lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127722; x=1791732522;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MkHQ33bfr4m25EDydRQk1cIUu8p3JZCdXBnxf0p91E=;
        b=JAHxWeHTkJrgPkVNL/d4ySKuIPo5uGagXshitsWEI+Spao0i3EEqhYIjMpajOxhX24
         Y6tC7zJ0qGj247gQSl9+iWsx+bKJphK/awZmEuHuQadsg0GoRp8AK5gQot1YzvPPTmQk
         +pYP6h2Mtvq/bCq5aFUuvtjlL7R/kMMu/J61+d/0H7rGj94wWVRE9ZBheQnRo2Vpw4vW
         saty3m1K1sSS9AuazC/Kt4vJP3sAt3ekEvIyeMnvnjxAFe3F37TEBd5uoHR1F1LmNAzN
         jlm6m8PxuoDR/WYhAN3YD/3CYT1Kr+WWMRH4jJg2vRuz+Wo2IvCWoTx6IpmXPtwhHgdn
         cVeA==
X-Forwarded-Encrypted: i=1; AKwUvByb5SoICxs05+oxo5xHNPF3lEvP//ma0u4VxmXxIf6L+342aOCVPeBSXmcPrhVJIYY0LRtXA2k85n32hH/6@lists.infradead.org
X-Gm-Message-State: AFuF++nnHWJ83+YQ7O1bSQcgEbfXyM+cOvDCf53g48EZDEL3HEi93hVH
	9/nGnkT70Fo8TCWSEU11DsCbybjD+cls8VtG05/3Af76jw2eWmKeeQPpcy8LHnFbPVc=
X-Gm-Gg: AYBFou18W6jyO916D9BdBDsDwrOsjT8/dIQTg+ai3Ho2w7BHCr4muJX+GyUFSZ0PfNz
	WX+cbLf2HhDcuQ0pvMPJKETH4iLVzI32KnOCxZCDRzHFnF9Ck/iUu3gSMMCjifu1EIzMKPS6+5R
	fSrUqUSMxgnvB4rv5xx5nt3SjKdzKAnJFGphBGNBk3SnQEi+qSE2cgToIX0HRydCDWp0+9meaZn
	CCQ+H7WMMnLpbrAChuBiJDwlhefjMKcSREoytR7E5/XenPH26nBwsm97A3I687bOYx3dRMZjJf7
	KyTX8xUBq7Wc8Zr/ytD2rKfgy4DQIZnvAaRE1Hrtf9IDbeo89/ZQcp4DNYOK8kAuJ1qNzMQxjOk
	lfvMvaw6fqPZo05lFq08/p3HP7QjlMMZl/oO03XwrBenKLYGE5Z0zCpBqz/K63QW5mRYFmZ1vh+
	Z+2LonGHjKJHRSx7qx8vmLywkgP+UPoAtKq0tFhlO/TItys529c9LQNjsV0zHiuDbOdvwQIseEA
	qT6AyZtUfQmRVh5iD4e
X-Received: by 2002:a05:600c:8b6c:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-4a0276b3e15mr140322415e9.33.1791127722245;
        Sun, 04 Oct 2026 08:28:42 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm231387545e9.3.2026.10.04.08.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:28:41 -0700 (PDT)
Message-ID: <413e7e67-ccdc-40e3-b360-8e349820de85@linaro.org>
Date: Sun, 4 Oct 2026 17:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 4/6] arm64: dts: amlogic: t7: add the ethernet pinctrl
 nodes
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
 <20261004144046.391444-5-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_082844_320034_C2484A50 
X-CRM114-Status: GOOD (  12.41  )
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
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
> 
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6894c06a836b..7bd53ec16607 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -376,6 +376,36 @@ mux {
>   					};
>   				};
>   
> +				eth_pins: eth {
> +					mux {
> +						groups = "eth_mdio",
> +							 "eth_mdc",
> +							 "eth_rgmii_rx_clk",
> +							 "eth_rx_dv",
> +							 "eth_rxd0",
> +							 "eth_rxd1",
> +							 "eth_txen",
> +							 "eth_txd0",
> +							 "eth_txd1";
> +						function = "eth";
> +						drive-strength-microamp = <4000>;
> +						bias-disable;
> +					};
> +				};
> +
> +				eth_rgmii_pins: eth-rgmii {
> +					mux {
> +						groups = "eth_rxd2_rgmii",
> +							 "eth_rxd3_rgmii",
> +							 "eth_rgmii_tx_clk",
> +							 "eth_txd2_rgmii",
> +							 "eth_txd3_rgmii";
> +						function = "eth";
> +						drive-strength-microamp = <4000>;
> +						bias-disable;
> +					};
> +				};
> +
>   				i2c0_ao_d_pins: i2c0-ao-d {
>   					mux {
>   						groups = "i2c0_ao_sck_d",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
