Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF643C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmqSmgDXujVmLdOIWMe7fm4fNWmT2m9mNxf3jvi3JsE=; b=zTaeMsDwCCvo27otSfet32bhOC
	iXJhFD4/NNuRlEcx6G4gJQo5u79YuCloJ71QGAolp3pu245I+OIN96kRj7nW47VCDiZqa+QoQtTb9
	SWq3+QZNSLUelZ52GUykv27bmi8eLV5PPbn3XlWCWzu6yr491N0GoxqTUPfR1wUhKoor0zelEDxpZ
	xUGuO4vf0XtR7VV6eyHcFMaoHAnh81QaV53btO/XueiTB6UjIl5YxDRAwHxOzpGtYSGZ8j7UWWTuL
	AbVKa/u2fA06VL56oKlz5WTHo2MrunnOOKKSgTsQ9yer+vV9Iqffk0AUk4udbcyG1XpX/UE5wKg6y
	f0pN5k9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGiP-0000000HGAT-13ws;
	Fri, 12 Apr 2024 13:13:13 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGiL-0000000HG97-31c9
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:13:11 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2da01cb187cso13794591fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927588; x=1713532388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtuLBfdgT9O7IxnW5LngiuzSdf1ZJSvc18BOhG86MJk=;
        b=Uv3vpudoJUndaJ7QAwSpBl0jBUngjYn7evxQ/zRqu+2EbAfR4pQT8pEwZ/k3l9Gjmy
         X1hUK3r86EKCIgq7QeGaacspipGMlcE1sGk9JXSMpyyrptQ+KMBxtIGqKvF2yPqKLPBr
         uMKVKPQdhVIxDK9tsZqPwkDtxtyJd1wHfOE/67HX4RLZhl1OONEAknw5aiQahevq+Wdy
         vAXfYoSWwaovMLAqj379rbzD4qrlVeW+tKVsdAtRPlwzO3UU7aLN52h11DDxuwIvlpog
         YmiWCnuQWzw7J9e1GhQ4qLvtr5E+1hO0+ofnHjjq4sRGQfl2cl6+fkrxJ+g6bT7zkDZn
         iWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927588; x=1713532388;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xtuLBfdgT9O7IxnW5LngiuzSdf1ZJSvc18BOhG86MJk=;
        b=UWcV5F/zNXtcucpafUJl+kkdhtQvdxyiC4oQWlahIpwwJP/kx/tEs9SYoCyMBL0kAF
         yIGmbMRgGzEeTLkI1l4YT2b8YeXTz+vm964Vj2yI8ptzDwJyJd/T0Hof38OaLSzx1/Kj
         18hwtrfeeMmDe0jtFYrKBiNngjZW2vIp66JxrOjMyWXsFBqpOthaJ9nHNPRufcmm6EJV
         O3nKENJb7to6OBbvDXOWSW9tHHI0boX8gQ7TIMh1hxyVhojUjFnf+iEHVLD38/YIsAfP
         6XqTIbcmzKKdyp71/w7ZRL5GceafRf4KJcj8rCjLcBqJQEgazC/v7cAWB+EANswOo1ps
         yxQA==
X-Forwarded-Encrypted: i=1; AJvYcCXO0Kbqn78xMKNmw97SE8k/Uxm1XYn6+FaqJF52c40LfjIpj4Ko97l1AUFue+k0kvubV/6VWAbJrOHfSkAtEATCDSL89tBrQeUzQMVylhehdO0=
X-Gm-Message-State: AOJu0YziYZt99aFgqhZtVnb3tCbmIhfQhUkO8ElqeGDKCYIS/FA9ixWq
	RoqlhpsiKVRjsUhSysEXgEcnRKhYeP4qavd2VqQRf+l0CNC8aBEjsEAYmp/IWVg=
X-Google-Smtp-Source: AGHT+IHFNhjOs9W6uuEXESacXfBAgAM2gqmrbmOS0xKW8DUuzebaRbsNb1d/ydZOoh78gSJFpe63/g==
X-Received: by 2002:a05:651c:19a7:b0:2da:6b4:8b19 with SMTP id bx39-20020a05651c19a700b002da06b48b19mr1887093ljb.36.1712927587790;
        Fri, 12 Apr 2024 06:13:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121? ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c4fc400b004170e0aff7asm8460789wmq.35.2024.04.12.06.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:13:07 -0700 (PDT)
Message-ID: <1a94a14d-cdcd-4764-a5f5-3224258165a6@linaro.org>
Date: Fri, 12 Apr 2024 15:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] Add support for Amlogic T7 Reset
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
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
In-Reply-To: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_061309_770396_0588F44B 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Hi Philipp,

On 29/03/2024 10:17, Kelvin Zhang via B4 Relay wrote:
> Add a new compatible and device node for Amlogic T7 Reset.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
> Zelong Dong (3):
>        dt-bindings: reset: Add Amlogic T7 Reset Controller
>        reset: reset-meson: add support for Amlogic T7 SoC Reset Controller
>        arm64: dts: amlogic: add reset controller for Amlogic T7 SoC

If you could apply patches 1 & 2 and prepare me an immutable branch, I could
merge the DT part for v6.10.

Thanks,
Neil

> 
>   .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +
>   drivers/reset/reset-meson.c                        |   6 +
>   include/dt-bindings/reset/amlogic,t7-reset.h       | 197 +++++++++++++++++++++
>   4 files changed, 211 insertions(+)
> ---
> base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> change-id: 20240329-t7-reset-f87e8346fadb
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
