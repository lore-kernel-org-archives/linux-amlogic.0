Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9860CA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chx4GCZv9XEeDZM5LaMSpMBpEF//q5PVqbefskO5FIk=; b=McA+RI5iVYvyLAbi6yd6HGz1+8
	8Oz1dE6b1ygqAZEurXLAfmzmMJcjnFL7ydkUS3ZmRICehF1OGqYPBLQ9uujjWwfq4xjHAF/2EhcS7
	oRvtUyfSvKCFfg6uKir33G2PekRENZmAjlp8XYQu1AdYa6F9T02Up4hkF3x8Harh5AjxUSTr7QAq/
	hfvrqMvDTl16AbiboL7o/ryJg94C4bxcW1f91wSNBy+EW+W6IMFoEC8R3bI8yZrRQuzsdx0rGm79a
	XvNccwndK/dLDBr3BLCWTnIAeQPI8CuKebpXf8lm9i8udPDcyDtkjkNwmJIdF2sxCJUiKVdXHordS
	lKXNx9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQsD-00000002ST8-30wt;
	Wed, 07 Oct 2026 12:35:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQsA-00000002SS4-1JUN
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 12:35:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so39047045e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791376548; x=1791981348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atVsgpDLAd3FCy/r5rwHewVKjgkttl9/HQ0eAY9dsQ8=;
        b=Ev+CVOLRg+0y+Ud2r4Jg+nvHetz0yLpNUElhffGBAU3walYx1gvK8B0V0iGlcyCxoJ
         4S3AM1NuUBIza04BfGCtMSSs3ZhXHb7GEjlk19C4u1wlMic0BQdvNo0ZG1xFtV+VZgSU
         V8JvKRCBXCHn1VFbzcBFGRb5OzsMomQBmsdmfoXh2B0jX9wr9YdnT94xVbYZsIRxTclp
         SQvQ2rJPvwF/kZpdNWWjOYjS10nGxo8Zaw3Wr2jsFOWo+rJIBejNgJwr58AhmRRMkbfu
         1uTsQBbzk3Fn84VaZfbap3Em+jz9vkO5e3UN9VlIWST2Wh3i0c3tTV5Ss/SFlSVhFxrI
         wivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376548; x=1791981348;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atVsgpDLAd3FCy/r5rwHewVKjgkttl9/HQ0eAY9dsQ8=;
        b=kCIkohVOm9pVL875XCpBbVU+CVZ02O9G5J577CFP46jNFl7Oovv8WxHOR2Eg40Bjif
         m1IwV3R5bluONki4HJu+kSHBT0pqe0MazhDquXvdIJIrWejP+p/5hHwtv/KKB5ALi8UZ
         oZXL3KEcRiir3xo5HsfhPay47xANoA0WdWrNrNYS0DHzmkXb5HPfhwyGAR3c0XO3Av4b
         APR3OgFIBd5QL+3QHeVvnTg1akfZ1AAvoylEoVbtPGUEd52rRsbUvE4axZCQ4mc3CfJ/
         SeNvFjYS3VRmslDaD1c0REzQyq2sXVgRIhDfDBX9zW9lU1SIebDAB1OuLsl1zZtqNbd4
         M8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzLFpxdTGWhcFrdx28zSWvwWI19mNp1HabHn5PYaMKMmk+3UtaL9wq8SqTps2Y1YDWPZawx6Ir7ALBJsJk7@lists.infradead.org
X-Gm-Message-State: AFuF++l8SnOxzbna02zsuFi5W3GRNYvFUj0XmQvxrBDzPA/4DG+GxZA5
	xft/PjSudimJivx93fdwkgelUPka7iZ+7HEtxDrClKAg+uw+eolIC4QDDI54K4rs5PvkotO2ru5
	jdsvEgrA=
X-Gm-Gg: AYBFou1Uz0WOPvMbiuKESieWtkNThTlTtpuORb0aPMutzKZ7E7UMqVkZyC8EEfdMHM1
	UQ/dRa1f1XD/01GpKEVCpGhgqcvyolYSrv1/RylQvo/fBi7JoatvXY7ZE6ok8Uby+fHSmYnZwHQ
	Eisp03ffo10B9PqIgVMcGV7BfLOmbt9ibTe2X3pKyQySU6HPfDVXliHkhTTCpXS8bI/zxcPQkkn
	YNkE9d3Az9VBdqr2ABnfFYq6w1NEtMoktbjEZUIszfhRc65uJh7ZYPSVCY/QTCQ5iO14iYSn9zP
	fztokFadZbqO7F0OSoJbY16HHrQZ0D18W1NwAiWR2crdxkDj0bXley81CybjEeHxcQVppk0tH+V
	Fl0+A+mjuLiym9qSF1FvYFSnEV7p91Jx1cjd2b5eOEPq5QuTYRflmJGxd5fMQvHDu8rC2mia0DL
	VPBYmYAAdaSCD/FSbdrynFWifzTs0mw8se8sRbYwzcPy/hmcd5bh4H40EpnIyUhsNo6ZSCvH18Q
	+xURTSjuBndpSC77wYUKdU2SgX6Fdo=
X-Received: by 2002:a05:600c:8b54:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18043c9b9mr34840155e9.19.1791376548113;
        Wed, 07 Oct 2026 05:35:48 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1822af9d5sm37187375e9.15.2026.10.07.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:35:46 -0700 (PDT)
Message-ID: <c70d918e-7944-4229-b997-7f07d924125a@linaro.org>
Date: Wed, 7 Oct 2026 14:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
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
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
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
In-Reply-To: <20261007082627.63807-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_053550_506061_7C67B921 
X-CRM114-Status: GOOD (  19.08  )
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

On 10/7/26 10:26, Lucas Tanure wrote:
> The T7 has the same ethernet glue as the G12A, but the controller
> reaches memory through a pipeline stage that this SoC inserts in the
> bus path. That stage has a gate of its own, which no other member of
> the family has, and nothing else in Linux claims it. It is therefore
> switched off as unused, and the port can then no longer finish a
> transfer.
> 
> Describing it needs a fourth clock, and the fourth clock of the
> existing list drives the timing adjustment logic, which the T7 never
> uses. So the T7 gets a list of its own with the gate in that place,
> under the name the SD and eMMC controllers already use.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 90ef79161ab1..96118b4d1560 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,6 +23,7 @@ select:
>             - amlogic,meson-gxbb-dwmac
>             - amlogic,meson-axg-dwmac
>             - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>     required:
>       - compatible
>   
> @@ -57,6 +58,47 @@ allOf:
>               - const: clkin1
>               - const: timing-adjustment
>   
> +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
> +  # timing adjustment logic, so it has no timing-adjustment clock. What it does
> +  # need is the gate of the pipeline stage the controller reaches DRAM through.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path between
> +                the controller and the DRAM. Without it, the controller cannot
> +                complete DMA transfers.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +
> +  # Delay definitions for Meson8b and newer (including T7)
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
> +    then:
> +      properties:
>           amlogic,tx-delay-ns:

Do we still want to support the vendor property on t7 ?

Neil

>             enum: [0, 2, 4, 6]
>             default: 2
> @@ -106,6 +148,7 @@ allOf:
>             contains:
>               enum:
>                 - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>       then:
>         properties:
>           rx-internal-delay-ps:
> @@ -143,6 +186,10 @@ properties:
>                 - amlogic,meson6-dwmac
>                 - amlogic,meson8m2-dwmac
>             - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac
>   
>     reg:
>       items:


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
