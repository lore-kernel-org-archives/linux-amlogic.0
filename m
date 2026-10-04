Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C28CA5FEF
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OVy2wTyWFcOuDuS13BS//P5pzhFQgz5NPw1TQ6IbAs=; b=WT6e45IyHxG7P52kFJsUkY9cpo
	U2X+Oac2a1XlrXmISodPOKC2LA1Q3Q7U8enr+m04OOA9f/oa37WUR2ATIa6LNHwl/ZtuZd1HIbB+R
	wTcKAKmTb8gM89OUL+HQF1CpQ1KHvIiBEdv4/fBnIMhcJbAT7xQNa9CjQ5GUqIJR0ONB1zRggmtUn
	t+SW1vSBjFUiRXYhpCDqV6AUTDSV2NU4m+cLPeBmcMRB1kI5DVB6Dx1oNHajvuxOtbMd9rYgJZyIF
	SPeBCUF1A7kSh5iqOEIiz4FJuZJBqJe4k/IyTIw6HMJ+Euqg9GOL5StUF5MWGvnE2J/58JNfaTyP+
	lOQYeI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO9q-0000000EzUh-3WOF;
	Sun, 04 Oct 2026 15:29:46 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO9m-0000000EzSn-2FJ2
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 15:29:46 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so520560f8f.2
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127781; x=1791732581; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ijVzIve29PHeaUaMD0UnyB/2N/58uvZFm5f+2hPLu0=;
        b=jq6IcRNlczbKj4idOg1ibCBIss5o/eWZmbz/1nP04sI4S36/dElHTezNmbyQzFPTDF
         eQDLZhoiHdY+GlpAl5+20IBgpejhQizPpUUQmFqBl4Rjb4pLBfI6p7gMQ2M9FJ5vX74T
         OKHScIVfVdqL0DuEA/xMoA0vkorQ+t539vYeLDtbID/7j2F+6ChQBVLodAh5qPffXWaB
         Dgon3rLO8c28rtmG1K0ONhbJ8IRRVM+G8mpSQtsjChqBWQb2L7M8Umvgjbwlzvbz47Tg
         sjvCMPjVTsEF1jTAIMB8MQQirvDIwDVGQSpazauzmZs6RHPdGGKhQPqJHPswy+dU8kbm
         qeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127781; x=1791732581;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ijVzIve29PHeaUaMD0UnyB/2N/58uvZFm5f+2hPLu0=;
        b=Ub+DJvR2R5NJuYEyRFVc2p1gkY/5tFQgQR0ZMF0UGsItXERqRO4WhZwlxbilwuBC/U
         K2rD4CZTkZ0KaAmTI19IPfpIX9BZdertDigiI8sI+yWU/oDT6fow+PiEVdmkPWXloa2T
         s2sAUWuj11tvxorVcO0BHfd+wz1GGVqTURw9Wr7ffRehI4OJIR164AEVj1zNYx91ryxg
         M6kz30jYHqBdZagJtMVoCWL0Gfb3yKh3UDHfz8TL18EYisOZUR+yqZTgzn52KMFNDz+w
         uJZgxOaqTpKfBERzqAEoiOYk12nIn0EVPB5RQGZdKGpw6xpxEaRbB7n9/bjxhD8R9Z1Q
         DR/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcGlHqruiRj6zKf6YeIcGOCFHSUMmY7TVSeaFJIyq23BHALfSwcF9kKKfbMDgj9pZpNldrjlPk5ULERhyc@lists.infradead.org
X-Gm-Message-State: AFuF++mK0jTib+pSn2lgGOJjaE6F99ghxWf4RSjXFxD6T1yB/iXjo2Gr
	Vg6ICn+RfLMAfNx+zSeeJthHwHCzXLK85lhSHNoHSwHAEhDN9KeTBofvRn13XdyO+nY=
X-Gm-Gg: AYBFou3udIbhRsHnHjkfJUc4yCiL7Ax45lmCu9y4Qeik3hjV+bP7BoR7t9T1aQ+Yq2M
	/8QLHi5uvrHUaHlt3g4LCK1rwYOGFhzNUSmaWEbKSE3voJtHf9Y49G6oLtU42j2RJA5wz1sEEM3
	HdcTczS0f1NTsCoyj7xkvPHnh+rcPq7tK2Uj5J9VqcgVLE/kOnCYaO9N26flIEbpUQM/Atg9TXw
	8YEGf6PZt5MFBN4ooFPWLVNDKqnpdJBxQiUCtna2064zohYb1F7IVUDwWUJY7OHAngO0K1BIc0g
	pwfackONEc9cIGAUmJQwq1YNPwwfX94aKzhXvYyQDgyLxaxuZS+xCeAunfA4qTaRXG4SQCiORAv
	qaOejN279NE5uzDjtlEhYr9weVT+Ho40/tOyHFhQLrbMAVkveMc8wYVUzP2hXWggOiS20SNV5jK
	B++aM9qz/k8Nz+9+/Z4W89KpLRJGYT2lb+IdPC7YHxgdTEeuVU4nCM/YNP8ZwkphSJrAXKghy7g
	1ZbHIj9
X-Received: by 2002:a05:600c:8b22:b0:4a1:6811:8d with SMTP id 5b1f17b1804b1-4a1681100f1mr75606585e9.11.1791127780679;
        Sun, 04 Oct 2026 08:29:40 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm220447725e9.13.2026.10.04.08.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:29:39 -0700 (PDT)
Message-ID: <e27cd2c3-7fd6-4327-a84d-3f66d902f141@linaro.org>
Date: Sun, 4 Oct 2026 17:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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
 <20261004144046.391444-7-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-7-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_082944_919962_62512A7F 
X-CRM114-Status: GOOD (  18.84  )
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
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII.
> 
> Enable the controller, hand it the ethernet pins and point it at the
> PHY. The clock delays RGMII needs are supplied by the MAC rather than
> the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
> kernel programs.
> 
> The PHY interrupt output is wired to GPIOH_6, so describe it and let
> link changes be reported instead of polled. The PHY reset pin is driven
> by an RC network on the board, not by the SoC, so there is no reset line
> to describe.
> 
> Tested at 930Mbit/s sustained receive over a minute, with no MAC error
> counters moving in either direction.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 0fa83362b417..5d0365ddde72 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -14,6 +14,7 @@ / {
>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>   
>   	aliases {
> +		ethernet0 = &ethmac;
>   		serial0 = &uart_a;
>   		mmc0 = &sd_emmc_c;
>   		mmc1 = &sd_emmc_b;
> @@ -256,6 +257,33 @@ xtal: xtal-clk {
>   	};
>   };
>   
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +
> +	/*
> +	 * The RGMII clock delays are added by the MAC, so the PHY is
> +	 * asked for the mode that adds none.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&external_phy>;
> +	amlogic,tx-delay-ns = <2>;
> +	rx-internal-delay-ps = <2000>;
> +};
> +
> +&ext_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211FD-CG */
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* RGMII_INT on GPIOH_6 */
> +		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
>   &i2c_m_ao_a {
>   	status = "okay";
>   	pinctrl-0 = <&i2c0_ao_d_pins>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
