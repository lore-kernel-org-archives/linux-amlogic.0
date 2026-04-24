Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD24AFE51F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HQRpoYj0NCIiKxHkFG2Vjwlf/PfRSNf9/MqVcQF2Jc=; b=ZZZ2RAcBFoYBQBX1NdNZbnhSOO
	BCvevXQqfY4TLBCFeZo+GG3CCmxIKBjqjPJSiEHzDmfRDuCneIgCJteSWAA66vM9qPIj8WGAQ3Mkp
	IZR6X0Z5dwkjsCYVxQmHnMBcdpruoq/O9Z6EuKrkpgoYSuTYfu+fcJZ0TuDfG/tpLxH8pz2zTYIJZ
	IeAY+naNXM8vBUTeoTWPCVb+IMFmig/5CdCjnLlUr8Lac3c2kqcvAW4BLF3XT5/qsxAoHrvG9/84S
	uI/lrp29ZWUCh7Fjvc/BqRWZr16oKFgnWaKvrMZ8DenLTc93YicN6SH8ql+16qf+6u+dFdsgNhaT+
	YDdJXpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLb-0000000Cz2b-2P95;
	Fri, 24 Apr 2026 10:01:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLW-0000000Cyym-2gmB
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 10:01:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so125138875e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024873; x=1777629673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsMn/6Mklq7GQLtU1u5HkQpW7v3yh2oa94aAy8k1B2Q=;
        b=KB/rIeIYpmaXRI7+ELGyENYEqgtwYoOBwIyqyxBr6pIwpDn3gBfVrc4VL3URLwEQG1
         E3eNaUZ3k4wp9Xm4cXQDsAffnowfeAjzu7VHDjtlS9n0tjusNctOU65QSM2KG1/X8dUc
         XSkkGBYRvHSJ+zba5LyCz1Ak3d9qzoo5rMpB2gWXKnxWlQn1QqCYfsFk5/DuRsluB6zc
         bxzgX4sjyh+DUl99ZVHwjFbl0S5fFqYHSQ82s6xpf1e4BkwuwvJbUr2RAKj3VoONyIzY
         u15RKoXfGqMRqv8abruV8Wbcnw2CYP2D/jEcRlu9x6F8K0DRX5ZwtdIVe8GHYqkcE0cJ
         W+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024873; x=1777629673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsMn/6Mklq7GQLtU1u5HkQpW7v3yh2oa94aAy8k1B2Q=;
        b=OKZeLJrmmp67kTPbyykzyIIdFb6e44E+s9Vqsg/XKnAGNKnijFvZOfyHk0AF4vyzpA
         lyb+vu8aoPqs6+OR16U+9YWV/SVDB7egsCl+pKvy8LxOQ2ddST1qdtozt2Esyg469ci+
         OurYFH1WK+NuDPD8eLA5ZmP+9s2oQ29HCRmM1/AHTRcZH8BSgf631QuExddQPvINJ0Hr
         cpDx/5kE/pFPuQhuo3/CqTA43qgll4G3oalUiDonKYZcMJKUFFlTuACWlHA5gXtYaoHt
         b1RqE0Q6rmwsveCPN87SZRX2G5jP+FAJIBHx96u3AXQ4U2Udlqm5aApxVu+G0UZtx86m
         3XvQ==
X-Gm-Message-State: AOJu0Yw/mU03TpmVdeRRZriFn6f+e2HllnTmyRMoOT2szZg89MFkTF4P
	b+7SGxNegWAai1xZI5wt7qjMJqXL7h9HP5buoqy+vinGZG8rg1wg+GcHCugmrkC56AU=
X-Gm-Gg: AeBDies0AOmXoAJ7k6C1uVrK9M1utnWewCaQ3ydCRI1n7E+LOYm0ycyNKK+P2NwJKjm
	7nxNE62a8dX307IjtDNHGapTv2RHPYiI7KSGuMoHBhz2nMqr8rOfb5VjE8RgIGR4TMkpJCRoFng
	j3mmmmXByWqaHU7XIYYaf1rmQ7Yo9+ayIgGGXFoAobY46RzQ0YMeTbG06n30yioWh0XF0pGd5ow
	jMpmgCxxaNc/U4MX6wRgbLiKLZr3oqaXJb2S75fwdbnQNWcVVHbX/MfvLbmE8mbxmKszAeQR5TO
	xJcomwbdsC+Y0j2osM+yYQpEs0JmdzsuMI+U+/uL1/Tg0DjxTOe2m8azzpWuveYc7IdcWB68Nu8
	njsUdO6Zh+mTjIc8ya0L1BZrA0kXZ9Y++/fWIDV9uoyg57PVW7Ok6LUl4fevYGilbD+GjR+rJSV
	qVRy9idc3+LzVxAJsYpyARKWAgOH27hvR6X2kcjX1OT6K6cKn2qnjgii+3mIgdnFkQClj/axoBl
	jXW3dtiK4yfB4I0yA==
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488fb7861c0mr465740345e9.29.1777024870872;
        Fri, 24 Apr 2026 03:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6124d7e7sm136810305e9.5.2026.04.24.03.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:01:10 -0700 (PDT)
Message-ID: <f05e4ca0-1fd1-4900-9af8-6e402887bf09@linaro.org>
Date: Fri, 24 Apr 2026 12:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-8-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-8-447114a28f2d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030114_747031_5D6944B4 
X-CRM114-Status: GOOD (  11.17  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts      | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..5d7f5390f3a66 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -157,6 +157,19 @@ wifi32k: wifi32k {
>   	};
>   };
>   
> +&i2c_m_ao_a {
> +	status = "okay";
> +	pinctrl-0 = <&i2c0_ao_d_pins>;
> +	pinctrl-names = "default";
> +
> +	khadas_mcu: system-controller@18 {
> +		compatible = "khadas,vim4-mcu";
> +		reg = <0x18>;
> +		fan-supply = <&vcc5v>;
> +		#cooling-cells = <2>;
> +	};
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_pins>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
