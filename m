Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A883C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4RX+tQhUmQP1yJ1wPsF45e2DduKjVWNpXZa589hvJU=; b=XPmuR4GFi3/sHoYovnlzpICm0X
	VCPA1nKP4NIOn5OHxHpHrDPtzzIdl+yke5IcauPs6AlcWqjzW24Z+MmZQabMZVgpKytureeqkB7jI
	UNpuSmno/LuQpjdLbEaSLZRYH32cTZ4MVX7GbiwnDBwVuQOmqq1w/Vx+rUACG9Iq6Va5twgjR6bMN
	kGE6+OvHDlSxWkHYyyExN/3XNia6aZ++wRN+n8T+VDl5hAO3PG7yCHjManOf/9HnhtylUGhXlf2qs
	ro6kIYq0lb0u3m6zLukA3xDmtHy4MoRJhFipZh4ko5B3hSYL3pVtJy6B1YBmjoCbObrIJGTNSUaft
	zOiEkEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sErCz-00000006OKc-25Fm;
	Wed, 05 Jun 2024 14:01:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEq6w-0000000667X-46f4
	for linux-amlogic@bombadil.infradead.org;
	Wed, 05 Jun 2024 12:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=kMSsD26Ds19NUWWhG41b+9GiSlFb7bQY+XAl878iz7M=; b=d6FOwZrL/fYYrskWVjX3hi/cHf
	sUSz0qQon4n6ZiUsgkC8aEDLxKc2DGN+TTQZ7RSwzhyd0E1FPZjhK8TF4OD/5oF3+UH2cR9F9GT8F
	z5WP5si5To2REeOrN+EI6Y2odGirVUrmP6BbK/V3qTbbSXQrOnl+7C39c/AyJLjumquqLDtRu3cMk
	qaBViLfadsGoqEvm9ws6Qj5sEXPWui4iBwJSpI/IbNSPAibK7aQ3ed4ikDmqoT7ece9Ex/QS11znU
	NYNwFL7kuDezIuog8YFENjnJrYW6fiEG5jVprZCdBhREOApI4PA9QT+SrSOcHAqthRTac9JAUDnm4
	U1zD7Uqw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEq6s-0000000FnFr-2myV
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 12:51:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-421208c97a2so59371095e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717591880; x=1718196680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMSsD26Ds19NUWWhG41b+9GiSlFb7bQY+XAl878iz7M=;
        b=jOta40iJ3sVDTe7+FDZo155RBODPpsWZe2KwGv5VhjKku+deqKByGbJWnts/wuEswM
         01lm7taVPaPZw0/A1B90of8+K2qFMxo5IxsZ9N2nNOwAoc5TjxJtT7xQvE88mv5bv/yc
         MNC2ymj8Pp/4rI18O8C36IJ8vWG8lYYTaODuV1biIq50bTI63I2mIJzgJekPZ9PETpLB
         OvfUi3B28eO8gSaRSYk3ZWAieFA8WV5ZqUvwfiYqCyFygTiCg497vP0jaSeYdyb4QfBb
         byzhttijTmqzx6TGpwaAGPEcqfUg6udmxr2t5wVxGKE3BR/xpzmpY+SFNw5DAIZlkQKU
         e2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717591880; x=1718196680;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kMSsD26Ds19NUWWhG41b+9GiSlFb7bQY+XAl878iz7M=;
        b=rPixJ8zRTjbhKslCMi+k+j5meWzuXlgg4pVKKrzSI0yPthXb2Fviw5iOH9pXVUfvV7
         iSUGu1iY6HJqH40VdEZhskBHNZJE1ciZThGhWRYVy71CMczqZ+2GAuS3opRu4rn/OdNl
         Gy8uqmnJuYKgwmkJYEjPPqpkfvvHphVBx2dDr79GM/XrBuZs6hbUHiBxPZcbDD69ukgE
         LGdgTunqWEvyr3UbIMVcIqXzCodg9UsZBFulY/+Iu5iEFEdi13Udf5+sMFV1/8HpG0qp
         +v5izDljjCV+g2wy+R5slh2unoSxkJxMdeKjcReokfyfzOKLMKaOSZChMKk/DKjGtmkx
         rLAw==
X-Forwarded-Encrypted: i=1; AJvYcCWhjpAsrQn2yM5L47DXPfbLugbx+g5Or6r3cH6CK2ZWtOPEo13KoYmj68SUKYH0VXmns73Ryf1Oy4TRzGjgSLfPgxmhGaZDOhIvBr/QLsuRoYM=
X-Gm-Message-State: AOJu0YzIyreq10eZ8ijX4FVGTVuUYdUGJTJ8N8hP6jgfZR0UsmR55Cud
	9jTnpIUvMHmhoQKrsVghXedk7xIlqNjh+5GMy3r36B4o8pjyuUE5vt+lKnVVWJr66aDyrUdAGgH
	F
X-Google-Smtp-Source: AGHT+IEdw+NjPUC8CNFC2C1Mb6/XwSgh65Ld06+qd5VCa43rwmvBu3mF0pQgK9qPPHf23DP2Q0bRvQ==
X-Received: by 2002:a05:600c:4f0f:b0:421:2a43:6518 with SMTP id 5b1f17b1804b1-4215634cc35mr17452075e9.33.1717591879545;
        Wed, 05 Jun 2024 05:51:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd? ([2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814f0besm21458115e9.43.2024.06.05.05.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:51:19 -0700 (PDT)
Message-ID: <c11bfe7e-e917-4ecd-ab2c-548332a4d22d@linaro.org>
Date: Wed, 5 Jun 2024 14:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] Add support for Amlogic T7 reset controller
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
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
In-Reply-To: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_135123_007128_D047A133 
X-CRM114-Status: GOOD (  11.89  )
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

On 22/04/2024 13:11, Kelvin Zhang via B4 Relay wrote:
> Add a new compatible and device node for Amlogic T7 reset controller.
> And modify the driver accordingly.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
> Changes in v2:
> - Drop the compatible comment in dt-binding.
> - Move t7-reset.h to arch/arm64/boot/dts/amlogic.
> - Link to v1: https://lore.kernel.org/r/20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com
> 
> ---
> Zelong Dong (3):
>        dt-bindings: reset: Add Amlogic T7 reset controller
>        reset: reset-meson: Add support for Amlogic T7 SoC reset controller
>        arm64: dts: amlogic: Add Amlogic T7 reset controller
> 
>   .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
>   arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h     | 197 +++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +

I applied the DT change, could you pick the bindings & driver change ?

Thanks,
Neil

>   drivers/reset/reset-meson.c                        |   6 +
>   4 files changed, 211 insertions(+)
> ---
> base-commit: f529a6d274b3b8c75899e949649d231298f30a32
> change-id: 20240329-t7-reset-f87e8346fadb
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
