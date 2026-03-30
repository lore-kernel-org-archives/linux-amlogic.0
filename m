Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BDFF4956
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K37m2Zk5WknPtDTsBlJRm+ND+UyxnDX3eTw+FjXGW8A=; b=vWxBJROWDj7cPyKcZ/kpruNIo8
	WL8XZzctSC0y2ORFsoc3CktltOhfBmfNXfovNvVSqo0etfTlPrCixz0YxTIBdgqDAcd+WJp7AazOV
	+vuu4wPGzxuzIVkDaAPa14Y5zN8GDYz3a9AuSuQt0ief0UULN8c8BnKjT5C5R3smrULzoVe7912kp
	LAfmi8YjL97IWnBkrAXx+Uxt2r/tBm+Tj9dR5ZuRPUxSLWogWyT2T9TOXUjvhujXLoh7edweuleP7
	4aKyNe3dhHbQkiEZJrciFWebsaZgUf51lbw7hCJsjCMP2J6b+lfJU81eqcg5cFEmGlDDYZc3lwWK7
	xrnC3k9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TI-0000000AnUd-1k2a;
	Mon, 30 Mar 2026 07:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TF-0000000AnUL-0nob
	for linux-amlogic@bombadil.infradead.org;
	Mon, 30 Mar 2026 07:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=; b=Z+N3/3ws8BxgjbSF7KFHKi2wm7
	GCYVx6dNWaOJMK9+3qKMGMJhd4bP6LTcOBXcArfENLrhlFakFw5E4yW2vMmTtr4Ob5HD/LGOG7dh+
	bWa3d21kxew0F5AnCCTvsiXF2cmkz1FSuDCRoDx3Qbqjl7B6c39lPujWhm8YegB/+LFVWYnShgvTX
	NRj5PkPL65ecXiLg+GPxVdqCNp3CXCHDYJ2TDLsuF400Icap2sx0Px2FikoceOVZXMJXjdble2EQn
	oUqc0czwLRJAkcZHfpy8mSevHU4VeG/y/RB+EwRBbtP0TpNnem4mbFSDba+lhkf6JZniVcySTEqPI
	bbWOcyzg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TA-0000000DG1V-3Ujv
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 07:55:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-487012ce896so24879145e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857330; x=1775462130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=mA+a02G9c7zhX/cvaLeBmG0Q9neUD9YgmOf9z6mCwARXp82zA7yhSOcNMWkjdzrnh+
         RPaZ4ao/FIEOcYm6r4Lu6oqGiLIQ1qsTsN8+YUUbSq1DGra5ymNBXnkhZf46J8wWPwa4
         1uZZkTDzWd5s75shKIohqODFwJ/6KbzxRBMKzdVgCD8ngvJi/9tCGOMnnj4XHzRDVMrg
         vu9AW31ZMYDF7wDuHJU9smJMREBDUDJvxZ/kIgZ2k5KvX081SY/FP6o2D9ib/OIQ79xb
         9mKo9/r1951FvYK0U23GCmJULxdCgISIH0JBbe8NioIZ7xLiMrqPFBC2VFpU1OX8zQLm
         CiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857330; x=1775462130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=TFjF5A8+76c/IFNmucBXnHMI38s5Xgo7N8VBUB7jFdwf2BTJiFybcFZAcwjQen8PyU
         /orvc0c6oV6bV6icwWOXEVXTPm3q5qEMhMqCbuUMCEZIfMG6zrznZa5R4TqVYLxuRleb
         cyJcKjYF6QBa3bpHNWigFNo1DmsGp0GFH3RGDOJEoBLCEfzeGMe87yvTuU/sQN6p5a//
         6IubBzmqNGIULGwOK/aO4RU4E4Man5vIVCvphDURQv61Gp7Gxy4svboEo9o6RvngiWcK
         pt9PJooFQ8d4KqMP6XFOPGNulvr4ge9pO1dLK9YA2cZjPV2oAc/CstgeKdBXiQUJEvOE
         tiwA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MFSV9Xo5jddFTnHt7LpDIXYCBz0OZIbF3EG1YuaLse367XQ/Ct+nbbfeI8JnIn46yKvNbFQQWs3Jfe9M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GbcdlfP1oH7CRG+wUd8iHxv27E7DLUA8+4aZPBhyS9VJZ00I
	mf1ChHp9GQgjc11EFIKjG74IUXkgW0CeAqt13pTkLdS7o6GQwrZnrPcG2sI6HjLNKRs=
X-Gm-Gg: ATEYQzwyu5d34c2ISKw1soGLGUHCLFYm8QnlgTDzxa4yUxTntN2aTsq2IG9WVV5Sd39
	InBmQpSeQyX4EJAreJiomlju8usNe596/GVcY2QS9ko2GpATVm32ZnwtvSzecifJQRMfE3/gBZA
	rKOowD+BAmmzBjBc9ZEEZJfqvt4Xj2SsWPSWqqUAQPrVDJrGJGzKxf1G604ZgW3JWvzZ41tREoE
	GV4TO7E4hnRR6BMkMDkUWYVwysEKll24V4LCX20y//PkktW7lgNoBXO7QXGxsHkvxwEY3fLcsTX
	lquH8SKbhmWWiq5JClWcRT2kUXnfcZaHoTRje7y+XolwIGC/atZqmM3b6SFFMYQS4mMZ70g5mW+
	y3GCt3h1eSEFt1EP5xXOgovzxy2wgOsrQt1DP2qM9X0fJQgciFU/LaQP7xUK9/QGyCTF5+Oel3h
	JuHHO6O/05zlDmikAhx9tA3j55EyiPHj3oXoBdDT7CziPpml8e2nybrHPhXCTSQhuWnNdj4e4Wb
	wK/7PM=
X-Received: by 2002:a05:600c:4f91:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48727eda62emr178938295e9.20.1774857330208;
        Mon, 30 Mar 2026 00:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0? ([2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48735faac9dsm60393575e9.0.2026.03.30.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:55:29 -0700 (PDT)
Message-ID: <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Date: Mon, 30 Mar 2026 09:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
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
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_085532_985972_77F4E0E9 
X-CRM114-Status: GOOD (  12.15  )
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

On 3/26/26 10:59, Ronald Claveau wrote:
> Add voltage regulator nodes describing the VIM4 power tree,
> required by peripheral nodes such as the SD card controller.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..2450084d37642 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -6,6 +6,8 @@
>   /dts-v1/;
>   
>   #include "amlogic-t7.dtsi"
> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Khadas vim4";
> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sdcard-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;

> +		enable-active-low;

This properly is invalid, please send follow up patch removing this,

Thanks,
Neil

<snip>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
