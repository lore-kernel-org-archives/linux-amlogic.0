Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBBBD31A29
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAyITfSo3enPzGCPe9FX1UAkFAWbCpbRrDlr7n+Eta0=; b=Zu9IuKu8J0uU5c78zHhqxH/VUK
	/knkgtNb3d3WAGIRLq9FyXSiLT/YZk52S+qO5DHcFeVoUHleXoGZ/Ov3Na1tRTljlvaNSIoI7DgJr
	khmoYT82v3EqBdWQxrUKorX0U0pIHTX/p8Ixhrv6/cRblBhEwgsB9z82xNOfxlYHS33OhQCXUJ2/G
	qni/ayc0XUls9p1hDjhogGasN4U4S3GbDqZLEJgD45Xe9IqjYc0EJWz78abUMgElddfDKjwiXMlCk
	Pgn5ciIpOGYyVRDM8veALCFxfVweJTRHBWr8L9ZueXDls/7lwiLUQXxyOSp48WgGC+fEAzYxbi2sm
	K5HBqcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwow-00000008Sfe-3aUt;
	Wed, 14 Jan 2026 09:05:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwot-00000008ScE-348a
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 09:05:41 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so3090705e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768381538; x=1768986338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwG15GopvSaIUizczqNnDWH98rC0KVKMXbS2DOpVO8A=;
        b=Rqz73CU8cDJma4jhtiMPzLnOJxjT0tsAveq/DJsIL5SsXdtMqXguAm4QxNQefxK2UL
         tSxazpWAWvbpfuQu5E30tHcmjfO39hoJYkSLsz7JVUUErEOCYedWpapD7rXREwWZ60/E
         r5CIm8AiF+isqEh14KdKXeuks7Y/o8hSg30MWx+d/axfqC7OKcb10+EGMPugXnqrSX8n
         RbqNTX+qZ7pjgtSmQgO196yjQKnqTetZP88K5sVyRAcgdt1YMAWBQym2+4BO2neb0mZ0
         ZX/Q96V0xDCWDw2uvxG2Y8iAAxsys6o+PjcmxvJC2uAAzT8TDCXzAl/wbIKOqHVbkHsq
         nkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381538; x=1768986338;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwG15GopvSaIUizczqNnDWH98rC0KVKMXbS2DOpVO8A=;
        b=RIwtdsta65nopPUmMtKmh6QisWZHnXsxNXy2QnGM/jj0PuV2Z9s+cBJ77j3FxgGVSw
         5tN9kTGOWJNNe/MIK5qi0h8YqmIm4V2h3kHSuRNr455jcFCyiKyuEzwbZ+MO5rNEHz6Q
         vvvGAmc+PkLuXY6zyHYmb35VTgTtXZGJRT1l1qKFxLrXWYuUr/yx9GEnbQRd2uYOMBzb
         JP3TNPX74Wpdm5fnynnJekSKrFtpmP5yKxGEEuxaN/+A2z9d/jbVrFoacKztgx5UDaE3
         OfUlUsIBOnNPcoWpJixPxDGaCMU6lHYLm22LWVnWT0zI2Vbf3VvK/sRNh+aLspXja54b
         z5jA==
X-Forwarded-Encrypted: i=1; AJvYcCVF8Ukh02i8ymoNx0hsOJsyxpGI0S9el64gUByKknj1aLUT1E1MSWNTzxUz8Uy40OQb+5a6XSrfGst9NA7h@lists.infradead.org
X-Gm-Message-State: AOJu0YyTTnWpk8ZaQuXPh4j2gB5PwKJvXu6HaP6OjqdFOOFly66btFBd
	oQ1Bg1HuLzX0t8LUk9kV24zjlldER2mgqy6WMh4ibbAeLM3cSJ1OXB16R2WNnUQofOA=
X-Gm-Gg: AY/fxX7S/HXuNN2QNAZ/9F5kl3AkyGb6GsyK5Gb5BNpditsAPF4kyW3qZj7pP/Rz0uE
	425GpHDI57PEQDcKk4z6t9eXOSYTFER6isVDwfVrZzZxf4akW2mq0BOMFp0oqOpy+Isg0aT6uNG
	1JHJVkxxNdTn78dA++XMov3PGyRf2GEXrq7RTmHF2fKxia7lgcuEarL1rq0s3mEum3M2R//AFhE
	Tjo5fvq7GXWDmP/YbZFiG5pNioPOrJ3klSI/ds4GDL5OTLbaHFLwsJweL7o5xZpV2wLQs9pD62n
	ig9ZeFxuPAmCjnzdwhW4WZnnUdGQtUhWijWG/6uB0khTnyTc5Eh4BIb1OUfYYoeUf/0A+793sMi
	zXzW5hKqXh+NksZoitF00f9Y6RVBaPfSfFpV4RG2+yvIubiJf7WvS4281Li2HETSmpP6luUqwCV
	EtTgETV7gB6zRqpa9c/eEXyuvMbgdGsE/a4L1OCsDNZnduRSwA79o7rSlraTLlZOuH70ujjgePT
	g==
X-Received: by 2002:a05:600c:4446:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-47ee47222f1mr14772495e9.0.1768381536276;
        Wed, 14 Jan 2026 01:05:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee562d7aasm17655715e9.11.2026.01.14.01.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:05:35 -0800 (PST)
Message-ID: <d55bd5c6-d5f8-45d8-9c6b-22e401f6a7ff@linaro.org>
Date: Wed, 14 Jan 2026 10:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
 <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
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
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_010539_809274_5414DEA7 
X-CRM114-Status: GOOD (  17.85  )
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

On 1/14/26 09:56, Jerome Brunet wrote:
> The amlogic MMC driver operate with the assumption that MMC clock
> is configured to provide 24MHz. It uses this path for low
> rates such as 400kHz.
> 
> This assumption did hold true until but it now, but it is apparently
> not the case with s4. The clock has been reported to provide 1GHz
> instead. This is most likely due to how the bootloader is using the MMC
> clock on this platform.
> 
> Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
> 24MHz, the clock should be properly assigned, so assign it.
> 
> Reported-by: Nick Xie <nick@khadas.com>
> Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
> Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
> Tested-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 9d99ed2994df..62538fd9db6b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
>   			clock-names = "core", "clkin0", "clkin1";
>   			resets = <&reset RESET_SD_EMMC_B>;
>   			status = "disabled";
> +
> +			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
> +			assigned-clock-parents = <0>;

In this case, assigned-clock-parents should be dropped.

Neil

> +			assigned-clock-rates = <24000000>;
>   		};
>   
>   		emmc: mmc@fe08c000 {
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
