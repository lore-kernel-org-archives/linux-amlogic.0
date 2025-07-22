Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53AFC83F25
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs2r/bDV4mqsOs7gxsBd8QfJYj8SB5QfA9e2buSIkxY=; b=siyzMKNOicp2I60y1lMUFeSz2j
	SHXbrMVfnH7ZWNk9fc/2vTb8OV8nck0xxUKuigVzZn0E5UIdAZo3VNXuPOHPEa6A7PBehB6VPp20q
	VEXeiyspfm/r0MiX2++7J81oZj3h/744B0rs88NkDXMXsjWUQFQga8xXoi/IEkU/Jk15Gzrkn2uRj
	lrrb86eUZLNBxS1WF1mEUwJg4YzTB2efEWorpGB0QUFEZXfuYmgrDNgixGLollxv+9vYYHUFzoGt1
	9VXh2nZqxygwmLUGKeeHku2RJ1AWJx1SoA27+NlN/7lueh2q1oIQIbrotCnf0qFpcZlWO0LgzSvw8
	AwH6qy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA3h-000000028YF-2J1d;
	Tue, 22 Jul 2025 10:17:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9s7-000000026JB-3hxk
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Jul 2025 10:05:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2575254f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Jul 2025 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178718; x=1753783518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eACVn/AeNUkJSj6fqs1SPdUKZxcJXedSP1FDf4UsU+0=;
        b=JvyFTyZ3jgqS0SEub8L+X3bW0YoI7TR7JyaT+59N5j8DkXhbKfpbwJ3PqH3lnp736q
         +gM2BtM2Hs43EMHg/FPeTzNnlqdP/9bBDOmjbb0qz88DtPB3LTm6MvXiocYSAn7mf41q
         w6Lxye+VHv2vN2I8aib8b+R5XTnzU1RhXRH0I0NFcTIcdiRXSyurv//paV8FIcZNF/yQ
         NQkhXNFK9VHMkmToU42tJQrQPoULIKF8+PSkn4QDG0G5kVP6w/XQA5/hMciMOBDN35oQ
         ZbDDe+4sPxKVP5sjk3fnbvRUJSTvDIug/0wihwYy4yUGzfstuwdgmrjgMc53VEAGxPcH
         fg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178718; x=1753783518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eACVn/AeNUkJSj6fqs1SPdUKZxcJXedSP1FDf4UsU+0=;
        b=iXjyL/Ou3EDURdUisfgdYQ67Nd36DPpxAA2ZXQwXcuZX2qKwocSXzfcWAFxxLkRzAn
         7JrxYtqXmfmNFt2qrQwdOZJiVpOkRinZClFAiyYrpxuLp69UxCsjZSblDo6KZNUPMbj1
         ZIW6KaQgnsdTLCmFqKHc/5KvtOoAX8kK9pW9XcajG1mbmySqs8fbflZXsmxZS5gMI8cn
         szdCFWQumpkUkm0R+POhovSCvNuJK7qnc/b4vONMhrTMrwfwzMuyuxhFG5F9+71itYl7
         nY18ILjHHasXwAgL9Zj+pQk8oV2r6rj+9FkBUY1g2ydFKGjXbpeiMKSDtViStbZjQ/vj
         2j0w==
X-Forwarded-Encrypted: i=1; AJvYcCWX0PvcRsxgOQHKoBvliNqIxqgJ9T7qCWTH5PhP8EbLz+cSzaLe6Xp0qoQ/TAU6OsScA2axPAe8ZYAWcbkW@lists.infradead.org
X-Gm-Message-State: AOJu0YxkKpcssyfnvA956i/RaUOx48yTnpXwynqQzR6FanDh+D1KP9ps
	4n3sJadlxVT3K4ShJduRhBD0Cw7K/QRaDa7HNyyUD4KzVOIotCgx5SsdxNFALzWFUfgf9A9orHf
	cjQ17
X-Gm-Gg: ASbGncuU8eydznQGX/gN5QpzbiHl2b53GrIkhfzuUDf219CwjKfr8ZJy3cag3/u/mg8
	iz/Fmdk8qKETvb9RIF/f5xs3eFNPqPHgG05Db63m47V0ddr2QYZnuMe+GKa98VGoRoD3Tcf+38i
	sUl6UbiXlS1cZ7zY4ilJwmmdNb8HXse8Rua9nf8e3iJdamecKG1cIFjuou/yg84P/acUjHrnBLc
	KWOtU6alldrMwCPbSZ4fSpnclmzX7tRYsNhqcp8tegXQLbwJ4cDUiGG3u2nny19KLin+bbYqw2+
	gLXqfzoE9zaaoOm6tUuGnVpOdKRexKd0R1yjjqzU5RZyOOjiqZkCpkPqFwj5bNvEaQ1hfPvLBhF
	dpD0e+tGxAMOjux+L+kXffFYRPLG8B/e/D7Pa3tTRnexcRmn8p6bsPJir3A9z9Tn0IY2UgZEGDm
	8=
X-Google-Smtp-Source: AGHT+IGRKY81gkhXWhMn/9LTWKt4F1bWwxEHclEpgsQnRjAMZGrMWAwlAapyO/AgjZWzNQLVWrBoIw==
X-Received: by 2002:a5d:5f46:0:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b60e5127efmr20108404f8f.31.1753178718150;
        Tue, 22 Jul 2025 03:05:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b75baa7072sm6012611f8f.2.2025.07.22.03.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:05:17 -0700 (PDT)
Message-ID: <6692f1e4-978e-4138-9d76-ac2b80613a65@linaro.org>
Date: Tue, 22 Jul 2025 12:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: c3: Add tempsensor controller
 node
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liming Xue <liming.xue@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
 <20250718-c3-thermal-v1-3-674f9a991690@amlogic.com>
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
In-Reply-To: <20250718-c3-thermal-v1-3-674f9a991690@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030519_927952_B3AC9B4A 
X-CRM114-Status: GOOD (  11.78  )
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

On 18/07/2025 08:37, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the Tempsensor controller node for C3 SoC family.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index cb9ea3ca6ee0..c853390eca6c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -727,6 +727,17 @@ clkc_pll: clock-controller@8000 {
>   					      "fix";
>   			};
>   
> +			temperature-sensor@20000 {
> +				compatible = "amlogic,c3-cpu-thermal";
> +				reg = <0x0 0x20000 0x0 0x50>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				assigned-clocks = <&clkc_periphs CLKID_TS>;
> +				assigned-clock-rates = <500000>;
> +				amlogic,ao-secure = <&sec_ao>;
> +				#thermal-sensor-cells = <0>;
> +			};
> +
>   			eth_phy: mdio-multiplexer@28000 {
>   				compatible = "amlogic,g12a-mdio-mux";
>   				reg = <0x0 0x28000 0x0 0xa4>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
