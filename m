Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB91C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLBNdPObUuQwiV6uAEaqwl/wiYTJQ8qKVoQrbQgnNOA=; b=bNYd0GKOtgftm2p2vhVmFIkspX
	gCW8qW2p0IdVOTpMD3ty3ky6FwldNlogebIIGVayOQekzzrJd3l8g/CR7vjSWSxe1MkXb9ji5rPik
	mbF0SZQpB1359+zhMstfmWdrea69OAdx+1Xu4zzv5PcBfRERwfeV+fjz+MZF3DQLHmwvNDC60SyOI
	vAmtBPA7SSnQy/okzrVsHD9aryBnSo+zVlHKltdlpFL+5sxd7D405yUB+esdfByw5djjO9mP5AS35
	IFejiOqOy6kiK4bY+2DZiSjw/IdSqvWdkDbLfi3IWFarjx/WkxMDc5r7a6Vu6CIq/JvmlYbXG/BF9
	N0J9XXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjQ-00000006KCU-0xon;
	Mon, 12 Feb 2024 17:04:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjM-00000006KA3-0UJE
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:04:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-511831801f3so2117988e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757470; x=1708362270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpVBBewFGDwGECMyf6BaQS8jCWBfVHOl54L6nH1QITE=;
        b=Rj4E2pjIu+a7qrq3x7FlwQjXvMsWdeVrZyaZ4QXSAK1Aj/2wNWBA98toB3PSpjuOXS
         /JPsZ0zCcJBwVul3Qv/+HGLUcL928S0In6tgkLGDqv5lQ58bgpYYtoUzCpoW3yls0q4K
         insmmUR8ApeQ7U6FQnQjQ+IHXl6ZS0MF+TmeD81VtvG66ni/Nsq34Z/U1N7XSW8+rszV
         teMDV7GQIGbH6LMFMMkN271QGcbiGwMcYcS2ZMYSmJ8M+hI7KliFncEtReKBhXeVormQ
         iDPzyKUie5Ur3I5ZNU9voI6HV80rpcTO/Rdi1FNsW0S4L4gR+6dWtNY1kVklDdXVMbAR
         dXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757470; x=1708362270;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UpVBBewFGDwGECMyf6BaQS8jCWBfVHOl54L6nH1QITE=;
        b=GzcKR9W4rpJt1Y+8HzDV2Cnh0qxa8+FIRRdsDNQqJORPvjuBQQOTBaxRD80TexY+bt
         lAmG42GUlPoy2wX28F1hCoWuaorEhh9lo/XoBVc2/2ne12BL/AD7cFff1thqN1NiA78U
         mKHDJdmXMBwDZZAcQ2ugtA2AYOHqV5bj4/bi0wamtXpTIXsBPGWjcXnETKTGcmScVQnN
         XPLzOcRuy1+EL4DIBW5qcBI1R8qoeOVrYY+TbmwCH/XORdyPmt89lbNQDmz4uL5VNgoC
         kw8WXhJXWY3ws9a73r7ClCC1nsfLvHUPM+5OGnL6yfHwZl/Rz+upDqvFwOc0naewMEry
         AFGg==
X-Forwarded-Encrypted: i=1; AJvYcCUTDiOYez1T5WhYSP97NEQ3KTsSDUsYDLBUabJst3xz3Wl3Qt8RSs/BzMxA+ptbHtwuj93edA3Bls881OY2eSgbu95bENXCI4HYPYb6ILd/DEc=
X-Gm-Message-State: AOJu0Yw9uwwqDxPbobM6Gdm/Rt6+1yeuDpPGE1n0CJnvlbJyCrEESfdg
	lEZlnac7d1PXqC/jXe9vpaL3Riq5JwKbH0y1eg2Bc5GymB3PDOCcuptwXXmTnk4=
X-Google-Smtp-Source: AGHT+IGlghCkGSZTmo15kiwjITVtJrGjlps+XopVZRYEn4/YxL/osIRuW77BmDM+FKpARmsxQAYtsw==
X-Received: by 2002:a05:6512:238b:b0:511:5e79:87bc with SMTP id c11-20020a056512238b00b005115e7987bcmr5203859lfv.64.1707757469763;
        Mon, 12 Feb 2024 09:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCePMc5ao1q2hliW7LqNDgMrdc0qpPSK+w/9j3cXxQRj2atj19TVtvTbtRPTmecwP0Zqt2RdUC+isVTF3PNCM/8V9/MPLIYCpUVC6e9yHArEcySV05aC5lJbngcTTzwyiR5XwP3KFTOW7W5nh3jrIiGA4MY08u508tpkOet5ONUOI+GgJIR0yqEZOs+T1CZGsbZg96KfZht6vKpT2sMOcsxRWMsfMlGp4P78ILJcKjk7nQTNG5oE1Cvx8mgA2q8MrVqeatZrSg0RR6dVVJFSmN3HeOtKsJvSevQmDTLgtfNnv1qH/sFrZxmHBMv02OmombzYcpub0oTLR5cWcjLRZxFJhXvNU6+FS85J6XtRtbErJenguRJzb9wKdcPwH5wxnN3k1LhifpEeiy0+sc8Uw20WNtbNsWCJw+R/W+iEZy2VFQTbkdFyzU/GToGfVRKyY6hO5QY6xCWI7iNqlKuMRyKEI+nzwAZ9TGnh5ypk+psaVRXLf7DgywkBM8RaxjdD27ug3/96SUisRMiZJjJKjWyIPtsTMWGy7fba+BbaCVXCaDluEP267WppMiVe8HXKGI78G4Q/Pyf+DacbfcjneeXVV/o+ZduGn4
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm2462229wmq.34.2024.02.12.09.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:04:29 -0800 (PST)
Message-ID: <6e7c9f54-1a75-46fd-867b-ce952417a903@linaro.org>
Date: Mon, 12 Feb 2024 18:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090432_246819_556246E9 
X-CRM114-Status: GOOD (  16.19  )
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

Hi,

On 12/02/2024 14:50, Alexey Romanov wrote:
> Hello!
> 
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> 
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> 
> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests [1] and tcrypt module.
> 
> ---
> 
> Changes V1 -> V2 [2]:
> 
> - Rebased over linux-next.
> - Adjusted device tree bindings description.
> - A1 and S4 dts use their own compatible, which is a G12 fallback.
> 
> Changes V2 -> V3 [3]:
> 
> - Fix errors in dt-bindings and device tree.
> - Add new field in platform data, which determines
> whether clock controller should be used for crypto IP.
> - Place back MODULE_DEVICE_TABLE.
> - Correct commit messages.
> 
> Changes V3 -> V4 [4]:
> 
> - Update dt-bindings as per Krzysztof Kozlowski comments.
> - Fix bisection: get rid of compiler errors in some patches.
> 
> Links:
>    - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
>    - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
>    - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
>    - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
> 
> Alexey Romanov (20):
>    drivers: crypto: meson: don't hardcode IRQ count
>    drviers: crypto: meson: add platform data
>    drivers: crypto: meson: make CLK controller optional
>    drivers: crypto: meson: add MMIO helpers
>    drivers: crypto: meson: move get_engine_number()
>    drivers: crypto: meson: drop status field from meson_flow
>    drivers: crypto: meson: move algs definition and cipher API to
>      cipher.c
>    drivers: crypto: meson: cleanup defines
>    drivers: crypto: meson: process more than MAXDESCS descriptors
>    drivers: crypto: meson: avoid kzalloc in engine thread
>    drivers: crypto: meson: introduce hasher
>    drivers: crypto: meson: add support for AES-CTR
>    drivers: crypto: meson: use fallback for 192-bit keys
>    drivers: crypto: meson: add support for G12-series
>    drivers: crypto: meson: add support for AXG-series
>    dt-bindings: crypto: meson: support new SoC's
>    arch: arm64: dts: meson: a1: add crypto node
>    arch: arm64: dts: meson: s4: add crypto node
>    arch: arm64: dts: meson: g12: add crypto node
>    arch: arm64: dts: meson: axg: add crypto node
> 
>   .../bindings/crypto/amlogic,gxl-crypto.yaml   |  43 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   7 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   6 +
>   .../boot/dts/amlogic/meson-g12-common.dtsi    |   6 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   6 +
>   drivers/crypto/amlogic/Makefile               |   2 +-
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 602 ++++++++++++------
>   drivers/crypto/amlogic/amlogic-gxl-core.c     | 290 +++++----
>   drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 452 +++++++++++++
>   drivers/crypto/amlogic/amlogic-gxl.h          | 117 +++-
>   10 files changed, 1183 insertions(+), 348 deletions(-)
>   create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> 

The overall looks fine, I'll wait for further comments on the code,
but the DT looks ok and I didn't find any issues code building
or DT bindings check.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
