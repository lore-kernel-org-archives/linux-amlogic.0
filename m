Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F91CF64A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Nov 2025 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2NgLNIWwSj6nUY0DDmuX6z6TKtk6imBryLZO1bu2GU=; b=5EoVIYrVsqfcQUC7yrFDJoGKKo
	W2EeVje+RQEMGkVBoYIP6LJUP6GNPDvFD4TNkK6ReTMCOFYREXS7gzw3BGzc5y5DPoH9TDqtm/bA7
	SUthIw6QepJpGwnv7wA9w6TFrHP+umzHwKOYLWOVco2NZfu+3EVcHzRJOSQihsXtTPWNdmjUQhoo/
	TTxIKUJxiVQu49WUyj3KsA79YFEHihePiUGqi5gaCm8vnh5+pH3oKPERIurRuV84T+2yhCF5UmHJe
	hGcd4NghyS+VE3OBO4HeE1IKR5biPWamO4SEKy76lPiXz8CKNX3V+oDWYUm/n4jaEZVKzEcyz9lgq
	4QuDvPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzVD-00000006Jlc-0bQm;
	Thu, 20 Nov 2025 07:54:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzVB-00000006Jkf-0sou
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Nov 2025 07:54:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso313733f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Nov 2025 23:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763625287; x=1764230087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSz2GctBw2xvU5PntnomhhO4auUxq6yMHRLtbTex4HM=;
        b=w3O4uQtKoXn3St0xcnrlw6YT8Uo91ilu44jb4k7UJdNe632E4TOw7X2b1f815ajhPP
         RamLXGVL2ZAjY2Frj/NqpYE7g/UCHaZ8z9p55t8jClLSUCE8tXQsIGolN80Vcl234vU/
         K0uo9wfStzfFrEhghCTZ8yyNvr6nSybRugzigO/Pt2P6nHiXhdHEXBy+xUHc3xsiu+je
         eXaixWPaaRP1qV9TIqhAC52Y7jxaDdCogAjFacnhz+zfsURKQoSU0KNROei7t+LpvJNT
         oliJP6JEm7NLx+IOtzfKmoU8ENRtXchNSjbk1GyF81XxkzB626jgBQIgq3TjeUAajbYT
         /hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763625287; x=1764230087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSz2GctBw2xvU5PntnomhhO4auUxq6yMHRLtbTex4HM=;
        b=S6rDkXii3ZRqPYQl9YWbZ1qqTPRoBd4SIE2CLMcsK6vJNntRIWplDO2N8A046Eb1PJ
         zgebfzhsnv0tr+rWBPKqUv0KOw688pUdPXa0LKWTXjs4hRUumpuLFCPfL/ftyhtMDJS/
         1jqo5F5PXmw7BbESS378AcR/yjvcI303pp4xYOAWIq81GXIAoYb7icDmYEFi3PUaVdK2
         vmET8doWntao6vld4gvL8lhgDlwQ7n2xAv3cXlAIa6MEFBX9PqeVDukgZsI2Gn204vv1
         FPdfkRPKFncG3mMCV/3nGYerIZpL3uAIVgepMaAywq3PHeV1F8RwpjuWpBQIODURjdK0
         Xwgw==
X-Forwarded-Encrypted: i=1; AJvYcCXMx5AAjKcYorexw+OMmQDQpKpMYcetmiAb2fj3RqCDrM+z1lsiF47DUAr4Yj768+aMsqcvwIUGsBrZWYrN@lists.infradead.org
X-Gm-Message-State: AOJu0YymyOMGVE/QJdgD8bTxDiF6KxnMbOFN0NuQWEI1mmJq3xfHeip+
	F7D9uD5nwU9oLCIPyXMgBGITEchW5bGniI22cBeY7GWqT3XENgtM0CA17XRSyNPZ63Q=
X-Gm-Gg: ASbGncvJcF7sq7X1ZyzYFUZOGH0tB4v3ixDNNXjwQkccYIe/JsCAy19zaIJoM7aHfwX
	eErOevQdxApFGx9NxxYsRRRFYTu7FpisBnMXEl/QPMOODtfjeA1c0/T6tI3X6rUMOHk7QMwC8hc
	c6X5fWJHqtXbNbce7KnKc4HZfaEGs9YWiHZ+ANNxJLwh30foWGe+wloy6O1nMr7pEpyCyD+geWe
	PpaN54olTTvO501Qgymit9AeLy28tkWh2BAFK2kZsuWhILHO94M66BqntR530Ca0ZPAwQ0C0Z6B
	Mqrk1wm07/tLGsVxPXDxSeI96aiJIsyQxYOCdY8lgi3xo40CdHUbOBQ7Q7F3Sxe5AfxKcsE0tAR
	Be6FoZ1oo6zcFQa27zkfj1k8O9telkaxQynaAhZR/kgiSdiWBoMPpTAOOrcNyBthVG01LzfLI6N
	lzjBcfov9ePBPJ+iqjxz2iIkGF3/1kIif94rgCJDrw7dUQNgY+22n8q4tN1xCXkVc=
X-Google-Smtp-Source: AGHT+IGZkigYvVipOkjCsohA+H+g4xgNMAhJfXWPt674Fr40MBEpp5RlEgS30L/W6WyTzBeuC+Bnmg==
X-Received: by 2002:a05:600c:35c7:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-477b8954523mr18503715e9.11.1763625287187;
        Wed, 19 Nov 2025 23:54:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7? ([2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b83200f1sm34221015e9.15.2025.11.19.23.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 23:54:46 -0800 (PST)
Message-ID: <d2b2807a-285a-40bb-8aa8-eacba97b1f14@linaro.org>
Date: Thu, 20 Nov 2025 08:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/5] Add GPIO interrupt support for Amlogic S6 S7 and S7D
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_235449_304598_2F16BCC5 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Thomas,

On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
> This patch adds GPIO interrupt support for Amlogic S6 S7 and S7D SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (5):
>        dt-bindings: interrupt-controller: Add support for Amlogic S6 S7 and S7D SoCs
>        irqchip: Add support for Amlogic S6 S7 and S7D SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

Coud you drop the DT changes from the tip irq/drivers tree ?

Thanks,
Neil

> 
>   .../interrupt-controller/amlogic,meson-gpio-intc.yaml         |  3 +++
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                   | 10 ++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi                   | 10 ++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi                  | 10 ++++++++++
>   drivers/irqchip/irq-meson-gpio.c                              | 11 +++++++++++
>   5 files changed, 44 insertions(+)
> ---
> base-commit: cb718411c4c05a4a424c2b73790a1648be97a4af
> change-id: 20251105-irqchip-gpio-s6-s7-s7d-9eb2ce7fccc6
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
