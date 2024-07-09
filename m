Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A72C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XPAiVWFxp8leCDvoIi+/DiGtFiWqr8p3NN0nOVXJzQ=; b=s6mt4zNK0D1Wi0mziTldoXxphN
	R0sgMRCUwNQ36JTr+zGXsB4zr0OyDeRR5EyqX0EvX9vvCT6PACBGoNnI40GCOTNLEHYWegTDq7tMZ
	ZZhfdBuD4dc+RL5g7NO7rZy8NHWvpg8REA1F/zrKVEg3EAauWAiIt2ZFYTaFColqphcvuBJwWTpBH
	+uEeg14DObcD0RboVI2DD7zj+6hObd/Xza3qggJAbfpoFqTRLbuXZRHPHm8PIpsfSRV7AJZf8NUJw
	XoZ0AyA4l54bXMtMOyheNid3+dwZsd1RAZZDxiyPYn1Gp4XLXb7JrfmWCa9xImji8l51/i3ghyeHs
	5R+S/FMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6eK-00000006Ux3-2ex1;
	Tue, 09 Jul 2024 08:56:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6eF-00000006UuC-2pKH
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 08:56:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so33276715e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515390; x=1721120190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0hwahxZYKkAntY7nSZhqG+PeUc3tvGbnLo4YASIKqo=;
        b=vp+pe0pd5TNHAww1IERqpHopzTQrHY7I8YrX++nZqwI+ca7neawLRFXcNDYC1lg4l2
         d62XchDBDPk14NIx6X+nWu3L87VrLnwl4tY+WCXidOqgy2g83oYLcDd/vTV7F/3TnpSh
         JV0EJwh7kiIBNoqUB6VeuBkTWV72iSqTa34g/1+lwjCR2AaF5zLMECb6JM4rzJQnYjzE
         eL1DoRLWvUjABcMS6028wL+RnoiUEjLIx9pnddXl0GaZl1ZyYaFtnmnuIV3i3jI7UKSa
         5E1jdHwoFKuiHpovpXxs2YAgT7CN/sJqvSffUuKofgmz3ilta/Oj9m+WfKuG1879pPCN
         tN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515390; x=1721120190;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C0hwahxZYKkAntY7nSZhqG+PeUc3tvGbnLo4YASIKqo=;
        b=Vp4Lgbf1TOLdLc/ycVjZNR9sAaxRgEwMe/lE0iwyNFGXAR0d3XTxiTrv2A5Gd1VgJK
         TLEguZa/TazAQY6lFI57QdW/66ZVzg31Fvw9FnF9ujotl2VgXMugsPWXJOtjyAj/UZjs
         ZU1yZQwstQzyzTjsPwZJq9HKUcFH/xmGTXI/z32DdK0oiENC6gzLNl0e4O5tFsDFWzf1
         oixYO9kHAz0qhLllMQFADUmczYc6yqjosnurufAC1r2LAmSGtu5bwDOxdEsySCgLOkfO
         Ltk060vF3aMV89BUEmCC8YAU//xCZGfo/BAg/KUUyIMFDXXEe5v2TNR7Cqrb25X3bYc/
         N45Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhVatCBusZhBolCo0vza0WBi3Ck8Hp5Eo3Vwy0dgneD0lDOuIe0abfSnU9gm9m7XV039TZphjZsmceto2LF74/9KAPjUC4j9drqGakR4MoEMU=
X-Gm-Message-State: AOJu0YxbOK20ZNDttb8/MXxK8bKaY0DgE5Qs3W/ztsDcldBIvdN/Y+aL
	4Y9V7IjTqlx2tpYzlItmnTRHstgTj5BUpbXMfpvZpG9lI5xddIZlwTNAxxTLv3s=
X-Google-Smtp-Source: AGHT+IH+pSsQ/NA5FKSgzU02yMR4D2uNJf3bG9wR4AQ+eCXp72iV5l7kkMPsoZ7PmUl6dTp0rbwmDA==
X-Received: by 2002:a05:600c:63c4:b0:426:5e8e:410a with SMTP id 5b1f17b1804b1-426707e31aemr13323275e9.24.1720515389760;
        Tue, 09 Jul 2024 01:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde89164sm1953775f8f.63.2024.07.09.01.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:56:29 -0700 (PDT)
Message-ID: <64603a87-bc31-47c4-847c-69c5efcd23cc@linaro.org>
Date: Tue, 9 Jul 2024 10:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/4] amlogic SoC's power-domains fixes
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
In-Reply-To: <20240708194808.1819185-1-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_015631_754190_FF163141 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi,

On 08/07/2024 21:48, George Stark wrote:
> Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
> The SoC provides dedicated power domain for for almost all periphery.
> 
> George Stark (4):
>    dt-bindings: spi: amlogic,a1-spifc: make power-domains required
>    dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>    dt-bindings: thermal: amlogic,thermal: add power-domains
>    arm64: dts: meson: a1: bind power domain to temperature sensor
> 
>   .../bindings/i2c/amlogic,meson6-i2c.yaml           |  3 +++
>   .../devicetree/bindings/spi/amlogic,a1-spifc.yaml  |  4 ++++
>   .../bindings/thermal/amlogic,thermal.yaml          | 14 ++++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  1 +
>   4 files changed, 22 insertions(+)
> 
> --
> 2.25.1
> 

You can drop patch 1 & drop required on patch 3, and it will be good to go.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
