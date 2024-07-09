Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02005C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4pWHtHfyHfB4U3nzAvAAYsyEUVdR3oObFELnbKeWC4=; b=lG1Qc4iuyfZwm5i5VvRqafsdS7
	yY9cDiaSAkjxSPDrPrQFUUgg2gKG9hHc6b4mN8ujvvfJObevsSr5f32BjdnZkeLdlR/MyTRy6gJi8
	v8ULNNlwD6WN5hZfapu//Y5HJv4Pvw6ZdvGaoGDgdF0crk/b0c8SxyE3i+KMNYlubWWWC8qbZaY84
	lCRz3WvwdsSsAjWRsLM3SWCx1hZa+ROTa3BH5ADeImb/1WsBdNb+xpcWZYovUldAGvduSUaVD+/0N
	PK+DFahPndUjYf+Dtbmn9tO7R5TTopCsrkxoNX6s9LrBx79x8BYDgNK0XCl/tE/6e1rm++yPv4hVc
	LvC01sGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6bZ-00000006U3X-3LJc;
	Tue, 09 Jul 2024 08:53:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6bX-00000006U2c-1fsi
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 08:53:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-367a3d1a378so3235642f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515221; x=1721120021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA4aYgkuEJQ+2zt3ir0pQgoFJui8snze/b5Z9Ceeoqw=;
        b=KfNQnr4TjRgFK+/YvnfQYIAjim+4MObykCK7dnmBgWxL+P4HIJLfnRN67LiHT3l2mv
         9BYQXdZRnSwdEQcE6Fz88gNEI0s2pQhGqxer5o5uoR4GVr7ANdFcIa4YLDAmG9YDJyKY
         xZSS71fshz+udkKCwE9ce6tTbUdpLK6jW5PLyyX9dxF3Vx9TcysXGa5McHmPhX1QNihj
         soE9qyHLnkLe3w+iIGkncDVnbTLat1W2XKFJcCLksxSMgIzkqS7DhqUZBr72ZK/2C4Kj
         wlsOTvjH7dyjHQwtSpSS+wx1tBQPLjTrQRlmfxX+uz0S9dMWHPYIEfnn3MzzrRPPs/0y
         UQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515221; x=1721120021;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SA4aYgkuEJQ+2zt3ir0pQgoFJui8snze/b5Z9Ceeoqw=;
        b=utgOjC75RFsmbMgcl8wnWO6uhoxHd2dT2Q3/sSUxWRRNO1VuZKClyOS75w9dFK1O1I
         4IJE3VdQqQn7Ve+/s/cDqT9XV8gIxH//NKySwn6J5GWKDBevo3W9hPcRzCsa1zdXKrtn
         vqnTOf6Ow3cYU/YZkVTybcZiNOtnLCt5/htA1cQj5ZII/ujGx9PDKwk5SI7ulhvn3I9o
         PXMPkrLNYcjvCQYYceZA1rT1DICTGxN0ScVWi1ifwm2X+N+2gpJqm8HavKppIma/Sh5N
         nOTeV/uV1bjTf8tW+VU9wrTylnANuWUWqpOmj1nsY+UM5X8XwP205d7m5qAP9cbM5d6u
         oqCg==
X-Forwarded-Encrypted: i=1; AJvYcCWFGyNOmbBwO7rtpIt82oXcykR0g+UCdlE18FU2MPP6CtH5MVVIi6qVheU2to4LNdMFUpguXCgL/eu9zt37tRg5/o5Y9kxs+eXH+LtC5T9M5mY=
X-Gm-Message-State: AOJu0YwD6v25Q8f5Re86pcOT29lunjsms67Vm5NZbp8DU8Xjgl7fmtft
	pe0Be4bmzZYgOdKMkFENMh8nJLzer0uiQuYdQBMbnF7LcBISu5OCf5QBQ+s24tg=
X-Google-Smtp-Source: AGHT+IGqB81NuLSnCUMTBHrJCIu396Gu/1DlJmDXwuPVOZxJWI5XPrLUGFSWhEfO8pch8PKu4xYm1Q==
X-Received: by 2002:adf:f30b:0:b0:366:eba0:8d8c with SMTP id ffacd0b85a97d-367cead19b5mr1656003f8f.54.1720515221137;
        Tue, 09 Jul 2024 01:53:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09fcsm31353055e9.4.2024.07.09.01.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:53:40 -0700 (PDT)
Message-ID: <a75ae0d7-9945-4e97-a4f9-706b253a161e@linaro.org>
Date: Tue, 9 Jul 2024 10:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] arm64: dts: meson: a1: bind power domain to
 temperature sensor
To: George Stark <gnstark@salutedevices.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 hkallweit1@gmail.com, broonie@kernel.org, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-5-gnstark@salutedevices.com>
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
In-Reply-To: <20240708194808.1819185-5-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_015343_476579_4FA37215 
X-CRM114-Status: GOOD (  10.88  )
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

On 08/07/2024 21:48, George Stark wrote:
> Meson A1 temperature sensor has dedicated power domain so bind it
> to the device node.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index dd5695963caa..86d77f51c25c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -919,6 +919,7 @@ cpu_temp: temperature-sensor@4c00 {
>   				assigned-clock-rates = <500000>;
>   				#thermal-sensor-cells = <0>;
>   				amlogic,ao-secure = <&sec_AO>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
>   			};
>   
>   			hwrng: rng@5118 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
