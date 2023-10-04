Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB6E8FDDB
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U35YbhUWWF27ivwWjhZ3jEZBgFNJOk8n5p67X0dCPNs=; b=QetkpEW0/JwYZ3UY9I6XQeLoHG
	oampwm8obWBGM9ymRindKx6pCLBQijWFha5iYpjmXP18aWEnyPH7p6xvjH13CQ7BaPYDOGaU9Gj3V
	zrhrDyqUxfvc8OXkz/UvEBpmvUdTwsP6glwiyT4FI1Prv+oYHz7hymeFagtiIez+g7leZS8PhVhDb
	FEqF1t2ZR1wDT9yFYCFplZpnuzo2gp7MyBrVuakKt6a6t0v2JUTkipIhEdznVjItJ9pNzrmP+jvJL
	gcEYbV2cf6o/Y2ItixxtzYtN8dvXz09gcJljTU8ebiyUpHEpJU8M8Op+oLirmTwO5DLyYr700bsNO
	TStwWm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qny3h-00H2Xp-24;
	Wed, 04 Oct 2023 09:20:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qny3e-00H2W3-05
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Oct 2023 09:20:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so18285365e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Oct 2023 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696411238; x=1697016038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYUpaA39Zc2Claj+3mSht0h7QLhWJIDPOIO7TJqJpH4=;
        b=wn6gUejWw4cqOmhA2KrdWbuRjcnT4TJPCLy+s4dsNx3o4C0PG85NPW17T9sry2naaO
         M03wMvGautdqeb8gI0vqQiAM0TDwJ2glkOWzCJsSh49AfYMJ20NRa9hCow2tOT2E5OWq
         1+DC/e8LtsPJe3k2BLDTeHtciQlRqbKcNjyPMB0T/Uav/F9BSlofdA/JwZVIpD8FSSTz
         YSvJ2/Ctg/ZYSY/nTWo2YAtCsTXgUz7xs6VOOhiw/Zy4JX8fRLgQfJyJB7H6ew9QpvjC
         2lEa5FgTiKdr07xSsmKN/MypdmZetkFHIY2xjcuwwCGLE6HyaTtCG7FiKznlvnAfGefE
         Yq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696411238; x=1697016038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FYUpaA39Zc2Claj+3mSht0h7QLhWJIDPOIO7TJqJpH4=;
        b=IVGJyJdlKBfhL0d9Dg/ghKr0Kv+faf6f5J4EdXb6Y8VTA4Lp2+h4iLJzEQdyDGPrsQ
         pkD4MMQ98dKSuU+1OI+3yqu3elY6w3Sr/dSrQDLPanN69G15hRvwKTKQN5Y7Flv8NHQE
         gMZkvqIBcQUhjTENg5roZORln1LwP7/xqDUCdGMyvU+LojR/s/AtXQjx87+FIfFfPxmB
         mCK5nn71sSJNkhriGDo+w7WvbWzv45ISVFebhNSoWp+/6Lfnk3W7ScjU4x/drwyF4NgI
         yQwc//sskbYPK8DJJn9wKU7n7EkZVeGgJ1ZwDNrHS3GqcojZymCULtVXAVSdfFDyDFVu
         s0/A==
X-Gm-Message-State: AOJu0Yz8nK8sF8A6iWCC6H1lFtOJxOhcjo+oiFyM8Fq6+phJuA0IdmrL
	4QQBwd3H+w7JZ20cT0mUNFZ7hg==
X-Google-Smtp-Source: AGHT+IGhb5sZH7KTL52JvEolZHRy2oJ4mfpdYcXphWQZvT1QqIVd+xEVOW+XeIPHs63dgbbvXQ+zEg==
X-Received: by 2002:a1c:4c13:0:b0:406:7d74:a29b with SMTP id z19-20020a1c4c13000000b004067d74a29bmr1709008wmf.13.1696411237969;
        Wed, 04 Oct 2023 02:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5bcc:9741:3ed2:97f5? ([2a01:e0a:982:cbb0:5bcc:9741:3ed2:97f5])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b0040531f5c51asm1032465wmq.5.2023.10.04.02.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:20:37 -0700 (PDT)
Message-ID: <2248b34e-d755-4142-986c-0ead80796e13@linaro.org>
Date: Wed, 4 Oct 2023 11:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20231002141020.2403652-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_022042_064164_3F27B51D 
X-CRM114-Status: GOOD (  10.86  )
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

On 02/10/2023 16:10, Jerome Brunet wrote:
> Add support for the Libretech cottonwood board family.
> These 2 boards are based on the same PCB, with an RPi B form factor.
> 
> The "Alta" board uses an a311d while the "Solitude" variant uses an s905d3.
> 
> Co-developed-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   2 +
>   .../amlogic/meson-g12b-a311d-libretech-cc.dts | 133 ++++
>   .../amlogic/meson-libretech-cottonwood.dtsi   | 610 ++++++++++++++++++
>   .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  89 +++
>   4 files changed, 834 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> 

<snip>

> +
> +	leds-pwm {
> +		compatible = "pwm-leds";
> +
> +		led-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			linux,default-trigger = "default-on";
> +			panic-indicator;
> +			max-brightness = <255>;
> +			pwms = <&pwm_cd 1 1250 0>;
> +			active-low;
> +		};
> +
> +		led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_ACTIVITY;
> +			linux,default-trigger = "activity";

"activity" isn't documented, perhaps heartbeat instead ?

> +			max-brightness = <255>;
> +			pwms = <&pwm_ab 1 1250 0>;
> +			active-low;
> +		};

leds subnodes should be named as led(-[0-9a-f]+)

see Documentation/devicetree/bindings/leds/leds-pwm.yaml

> +	};
> +
> +	leds-gpio {
> +		compatible = "gpio-leds";
> +
> +		led-orange {
> +			color = <LED_COLOR_ID_AMBER>;
> +			function = LED_FUNCTION_STANDBY;
> +			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		};

Ditto, but you can simply use "led" since it's the only one.

See Documentation/devicetree/bindings/leds/leds-gpio.yaml

Neil


<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
