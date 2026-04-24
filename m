Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D130FE51FB
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk63yrZMIwEyz+Em4q9tf2FXp9TbU8n5+YwPQnGrx/w=; b=wiC/LDMddMDId/CqpO0Y6nviiX
	M6IXk82dbv3hZvLjid6ODGj8ELmGIfvPpvUlwib29d3K/z688zo29W4yQ72/pFLZnogAwnRJz4ypw
	YruqzjlMTa7zSBojH/oX+6LLEcMcEfaw0Z051upmiJvegnWxZ4QqnqYqIpgeW6k7V1NDA1J1x23kE
	4atwSqrhjeEh9f+hz8omwbAdB8V0pLZ2ACqW54Y+CJj21Zo9bO6LEKWJsLLsD+CCDPeH3MmS5cW1r
	lGguHnSDLFfrO8vXQegU9YLDmJEgpIi5b9Kkc1iNHv5PJf4ce0wPlFmGldVd1hOgPFaymrSrogUn6
	vUfx1VYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDP4-0000000CzYJ-44p3;
	Fri, 24 Apr 2026 10:04:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDP2-0000000CzXX-3dka
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 10:04:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d70b3e159so3973660f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777025091; x=1777629891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh4cO1Jd848Orxw87E3q8qfUwzpksTw/eGdTo6fgVGY=;
        b=PS4DUYEQDHlxOgszg0RVlz9++r+FYCIFatSXGaC6mYXmTePoEq0s89wYzliiJOq2oU
         rfVjdQ27R7SLizZs8u5M8YRV9t/1znCxYMu+654uvxqnChIW/XPAJgb9L1fGRc+7h0g3
         R7BdBiNZrpdorUU632JMMzT+P7milNDKm6U+iGDVoQxsJ9lqY+JfhpjSL5THww6UGgRN
         3K4jr8sZAj2VIw3I49A7AF/fOVfnSej7VSx8B/D3G5ixE6vIXtuhNuikeGmCo4LZj++y
         TctwfQhHyRLsxtuX0tOGY0nhkJ+OboiBZaPje+GfV/3NuN56/08dBcKnLTG7yhQUjiKl
         Jr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777025091; x=1777629891;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh4cO1Jd848Orxw87E3q8qfUwzpksTw/eGdTo6fgVGY=;
        b=g1N3Z2v72nuuLPKx41M/OozZGR/3/Bl86XLFtZLlBhOd+vtidSwWaiCpiJK7cgm4Eq
         uIpVIjq7NS8GRNSDkgZyUlzEMbWMOHYCg0dz5D431lqMrkFQn6mcSYk7fZ1It1divTMw
         ujh50+vU0cMZANTvL6Qoa0QaQv1L76Ck3I7uBjZVglJTyvlrvWlcM0CXePPV7Z19+pou
         77HFzQlyulckEk9SNBjRjMNiqEy2sLrSOvB+XXZ9RRBtvPwW1ObuRISQ0gqDMLPo4b7g
         64Fv+JXmpc7VPnJbLit9o2mi8+fHbsGyMZ4V6M69lvYPeev8PZrdfUzP+ZwX0MFkNAkp
         1EjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kYPolF4VF5fKBuSUDL/lQnoWgeTsc/rDPz5c0WCHA/2kpTl4u9qsL+XXotZQIcJaFQqMl6r2111WyeeEb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFgFfTnFGeX3JvsxgVoMGEe3mW1vdrozVjLWdlz+rK8qpwseiu
	LUf0Ux3nMfEmprq3+nd1euYs/Khjdbu/Vzcz2XMbn2v4dmNujErb9tFNqsIHGSE5nkY=
X-Gm-Gg: AeBDietkcNH9cIrILjVB+kqtnnrHjGajyLg1L3sMhQ3YLtGk93FGzAX2iaPJHNcN31n
	VEQ0eRBiImGtEmXakUUfssTnWUpHR2EQIa7cMivTP6UAo4rvoXVGK4Bv+lWrYHOZA8MiucfICI6
	6mcGi8fCjLnbIcyh+Z4KbrboHJ2ZbbhiQ2xR7MsUgOkmjqaIQklKtVsTWCff873Lre9iupeU6a1
	rdkDh+b+2KlaycmKzQPHP3+v9xXJSw2Ms6bo7B7GsSEov82ioXK54YRjoL1cHCTx4z5f/YwSpgk
	y8J5Q+T+I61TOUSPfKX4xcvFJ5vuSnVb2HULYI6PtKQsJq/ab5wANrdbcgrmbJe0lcI3vOM4PzH
	fB4Y6PqckxEW1mha8I+/lL2qpgxEqR67LLZNz+z9U8siDBbXfzkJdJDvDwp4hmk2Dj/gcX3hegH
	dlq8yCapny85ZbrmZr2qK+DSvakFMpYxoJ9CTMnMWWsZAcJDAPzJNT4LkIHBYzyp2Lpeux/+Bop
	2StEnDpvFRtkhmZow==
X-Received: by 2002:a05:6000:26cf:b0:43f:dfbc:8c71 with SMTP id ffacd0b85a97d-43fe3dfbd89mr47455531f8f.25.1777025090737;
        Fri, 24 Apr 2026 03:04:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm53197398f8f.14.2026.04.24.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:04:50 -0700 (PDT)
Message-ID: <c4543cc3-4093-481e-b737-4ab9f7f6802e@linaro.org>
Date: Fri, 24 Apr 2026 12:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v4-4-9505df0e7016@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-4-9505df0e7016@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030452_942522_A4FE7738 
X-CRM114-Status: GOOD (  11.90  )
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

On 4/20/26 15:54, Ronald Claveau wrote:
> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>   compatible Bluetooth controller to it. The node configures the RTS/CTS
> hardware flow control, the associated pinmux, the power supplies (vddao_3v3
> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
> clock, and the GPIO lines used for host wakeup, device wakeup and
> shutdown.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 3227ab27de107..8ea7ae609fbd5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -251,3 +251,22 @@ &sd_emmc_c {
>   &uart_a {
>   	status = "okay";
>   };
> +
> +&uart_c {
> +	status = "okay";
> +	pinctrl-0 = <&uart_c_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +		device-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +		vbat-supply = <&vddao_3v3>;
> +		vddio-supply = <&vddao_1v8>;
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
