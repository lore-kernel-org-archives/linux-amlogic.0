Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB6CED274
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I2RGxmrJviGeMHOezy6NjmVl/8Zt96S6kTmElSBngs=; b=FxXZ9EFe7QZNQUMAVpMXs9wjdg
	U8nCmwBRUC+15zUygcDScOoErOXj2uPwE6zRL8iUTy2qRod2CLKRRdGxmUOcVlMskz8V5QvIXvHcu
	fI8La5Cy3Ma9AZcYOK5lkwmxqiiq1M90Qn3Nb7Riza3i9XA5vVFUtC1HzFcVWg79/1qFXBf7iKBBB
	U+f8yL4oN8rY67sOpxVjgf1XqUrmwq1NVgQ/Eg+8eSrQ4HZ5qBeM4awpJJyhGWGmAOvsl0HYX18fg
	LCfzf4vMjhoqE8kuufrzb/MpUJav3pBWbLYFRN6QZZ+oyUv2hEc6x29NBhXUdoOvD1EyJkFzwBbpE
	rGV83Rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lO-00000004ohq-0aW4;
	Tue, 08 Oct 2024 07:36:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4hT-00000004nbj-3wos
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:32:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37cce5b140bso3640257f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728372726; x=1728977526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQ3e9GN5oT4dEQ5C0dmBdYvJDkmnHPy8M4gnBpGOCuk=;
        b=nEu4og1yjQwdOGSisGwKItRu17XzKuRsk8RjKwU2b9hbjHdZxHTWxz1Qnk2NId3rwf
         WEtA01Iwkv6eKOvRSPqhtUKS5UCleElDMyTfKXXfPTjVYnclOCtx5MGOvo3Ha1q32gmK
         RA1Wu+cr091zopynq00BBnDinDPLgq/6GNjBhjPYM7xipO3Zo95oCJS//MP3mTNsD+9d
         W68TtrKxg1SGrmgi9wvcI3JcLBV5MQXV4pZL+hVXsdmHMgB7Qc+N/+5y9St8a5QW5yd/
         7aXhW97W1PUZFlZFsPzT8ry8ActXFkbj+Hra69Qb2/CE2DJqiOaoODZgLUK3xGjJohP5
         ZdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372726; x=1728977526;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQ3e9GN5oT4dEQ5C0dmBdYvJDkmnHPy8M4gnBpGOCuk=;
        b=gt3VzDrnlWLsIEpUqzUl+bu8ZifLBp+Ugtp9DdOdyHC5UcNrq5szBGfrTllvrICB1k
         /3JHohetqj1jc//GgQu0+6aHHUsm6mUOp2Bs4TQfodqGLzkktYXVB28jY2UEAaZ1VlyZ
         59XeYlmdZUA9Fg3fd7TEMoGITEErMqzvPVlt+VNMGBZaSbMHlxw1FIJNrv3ANqChS4Yf
         F9nrKXFDHkLqp+gjaIibOWnMDVeEFiUwWVbPOwXsplX6ZsHUNeP/nL3DnfG8X4VX7Own
         P/qFIcCsZShj9KrR/Y3lAQUC3GpTicaU5DdwudfuOE9HWZwLqKmTYR8WbW390HbWWD7s
         Ld9g==
X-Forwarded-Encrypted: i=1; AJvYcCUeD8siOqAtWglrSH7jVfhzHVpSpRqvykH9FJp3z859qF5oIHqmnG1cRDj63TZ40O4fu0kbIBqy23zjsA6y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9evaTMXOEtZ2aUzUAhl+nCTc4bLiLfHer3+8zIdbNxjXNyOGI
	/TZf1VbcVI1qQ7ZL/h1Einh6Gc5XbMLTMO5692XY6MXeiTPr8Rj7HI9cU4225wTuQKcBm5F1o2D
	5ytI=
X-Google-Smtp-Source: AGHT+IFw4OU9sE129MTmVQZwtzejQ0K8o1Icfq6ZclA5XHOehCJfST7Ts2N4ivxajAWQ0s1XGFzZrg==
X-Received: by 2002:a05:6000:186f:b0:371:8eb3:603a with SMTP id ffacd0b85a97d-37d0e77a468mr11072487f8f.27.1728372726453;
        Tue, 08 Oct 2024 00:32:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d169733c5sm7380859f8f.110.2024.10.08.00.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:32:06 -0700 (PDT)
Message-ID: <de6fda94-c8f3-473f-a3e7-f6d7f4192cdc@linaro.org>
Date: Tue, 8 Oct 2024 09:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-aobus:
 add reg for aobus pinctrl nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-gpio@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
 <172831694232.937294.6889037408108312834.robh@kernel.org>
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
In-Reply-To: <172831694232.937294.6889037408108312834.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003208_062032_19FB2B83 
X-CRM114-Status: GOOD (  16.69  )
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

On 07/10/2024 18:02, Rob Herring (Arm) wrote:
> 
> On Mon, 07 Oct 2024 16:16:25 +0200, Neil Armstrong wrote:
>> While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
>> reg property for Meson8/b aobus pinctrl node was ommited, fix this to finally
>> pass all bindings checks.
>>
>> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.example.dtb: pinctrl: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Right, I thought I tested those bindings, but seems I missed something...

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
