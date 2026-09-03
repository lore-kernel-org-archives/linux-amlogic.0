Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B94C61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCZja8IkBG+lwyX7pvL7jpnv1EcKCWVqjkvTcSV1UTc=; b=1Q6Ny7Pfn1OErbQRTGIqkzu2tn
	BJny1hp/u+kaOnxjw8VPT4BK1bbeqdvQMqERMNtk/kAHoFVEqzw67uz15920O2ZOanMxdOa80ujTo
	Jvw8LsJnsrZNU1m1KP0Lb1LfXW2IPsATvU9wvcAn1YDF7wzG/UDOCBByYeMVGdEkkTgUSK8kSpnLs
	BpK5oJfHtz252zy0vqq9wYdteiTn5YIV2QZmNjl7/t25Lta9OjR9w74lAQDFHSGxQkUPcY6URfURo
	xo6m0bZct1i45S/vtrjJDuc78yvTuH0FutIHNA6DDU0HUM4gVPIts2cYsZj/F27J+Ewvy+RJphWgs
	wQtcpCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Il-0000000Gi2t-2bUw;
	Thu, 03 Sep 2026 07:56:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22IU-0000000Gi19-2yA2
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:56:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c169ae1cb26so128665766b.1
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788422145; x=1789026945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xj0hdLwrmyHL6c7YnPWMjD7qJG9gRauJwyChCEWJXc=;
        b=DNqYo9WqI+5ay9uQJU6iPpF3BbeRBjAWCmH0dwOs+E8t4zFRyHPBLaRohggnSpuEZr
         yutvP0KfsfDQ9rkmZy6sc8ukUeoTK4MC6G5pAe8IEaRW6TMknQAHEdhQLz9xk60O2wqz
         5qlKd69IfsCdnUNeaQDUNwre59VrNQoH6KhTX3oedPTnpL714OWQJiv34YPh8xfbgfyj
         Z3VPDrwW2JkZ1OhyE+A1wUCVFDL//dI8pfaK1yUsT8QR4Tu1lHpNCkZpM5Kxv5GgS18T
         ou3Zi9SGVljoXBDqDGbIKnJA8DQJIQ1mhZu5YLY55kI+a/Nm6J2oUZdjW8T8pfqFZSv9
         QF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422145; x=1789026945;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xj0hdLwrmyHL6c7YnPWMjD7qJG9gRauJwyChCEWJXc=;
        b=r9XlAWUJ4Mo3pBNlJPT4BGxj6EtPkvRAY+lHzddQFDx/UWCdxHy+cOsL6MNG7YZUGZ
         dLxYY+oLYHaEa3KUpCH0kPdUFRnMX4HsXznwMCCy8GOwkUDjQsOxY30DVvtw+GGalGMa
         A9TpTcuXBxx0B+B04ci6wCWiNgkhsIHhxLeZJiXItR4AOFTcRbw2sPwqsoy87CyvRnbO
         Irk9XbZEb9oFbUNQ0OW8DrZDCIzXT0Kf+v18DDznVxGZdxVjvOPeywXxSRRmj3DcjhdW
         DIpvzTB5tKbfI1F15efNfQW36h0X0oY7FFd1IHBKP3wCBCbShIrBflkAOR4C14SglOoX
         AO0w==
X-Forwarded-Encrypted: i=1; AKwUvByYktd8A/r5b9oRI+bK47D4Gsv0T9QFbUpuua/EC6ciSlEp508BHyHpcwfrYLN7jR706ZhRJTL/uP/iNrHt@lists.infradead.org
X-Gm-Message-State: AFuF++lHxTEsD62tT7XVKy2+jKsxkjMGe4pYCZKprv5pLYmuxxG04aCo
	Uz8RxkfeeD/zXfxTrsfgH09bFxKGpPhbQTVK39oBpsOKjxOrTIyLhCDFRoYwd4aLlpQ=
X-Gm-Gg: AYBFou29wfYs4BfaFTYtg/va8W3+TmSgQfGDS55yf+NUIlLnbHE96msfut6lPxhqy7p
	cbkEX5L7oKxxvzuRzhD/zcYz0dJB679M5UjE4+Zc6HOHK8i/cqP98k9dEvgXIfHQujc/hCpCJIh
	VxqQSnCvDc4HExNhLr3jEj/PtySLpzeqp5lDukClz8NJkUrMTxQ/t/TziQObzNcjLeLihXUnUQF
	dCRKwSQ3dJaqN7RIDonqrtNA6e4LLa5fJ6NVMtRCY/h4jJnPS5esANlwlxGW5fmtCpDOxxmwVjY
	VzndgmIv+aoPL/21ioAbfZc5OO9Eo0oWzE8bXTmIgv9WV3YJ5Ti2crzIVW8XwbIkLnMvgJrSuO4
	6W5U9176zwJ77HPj6hJWfdQyNv8WyNn/eEEp4jgaRFgQq4FbJYd0uOGPvlgXuHJD8lbmpgBu6UE
	9osBSDk9tb+i2V8CkSfJSWTv9Hnq78dFtnln35SXpDCX5rT31E1wD5HqmAwSdi5CS6uZGWeZKnk
	Js0DAuq6dVUNK/ZN1IfoYEkgW9RaY3NGVbQR6kM1b4h
X-Received: by 2002:a17:907:8323:b0:c25:f7dc:2e0 with SMTP id a640c23a62f3a-c25f7dc0985mr48592366b.33.1788422144446;
        Thu, 03 Sep 2026 00:55:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0a9sm61359166b.1.2026.09.03.00.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:55:43 -0700 (PDT)
Message-ID: <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
Date: Thu, 3 Sep 2026 09:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>,
 sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
 <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
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
In-Reply-To: <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005552_522588_EEBFE779 
X-CRM114-Status: GOOD (  14.15  )
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

On 9/3/26 09:49, Raspberry Kan wrote:
> First of all, I checked the device tree extracted from the stock firmware, and it explicitly describes a third pixel processor (|pp2|).
> 
> The original vendor DTS can be found here:
> https://github.com/Raspberry-Monster/MiBox4-LibreELEC/blob/misc/mibox4_gxl_tf_2g.dts#L10
> 
> It specifies three pixel processors and includes interrupts for |IRQPP2| and |IRQPPMMU2|.
> 
> I also verified this on the actual Xiaomi Mi Box 4 hardware. Lima successfully detects three pixel processors:
> 
> |lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0 lima d00c0000.gpu: pp1 - mali450 version major 0 minor 0 lima d00c0000.gpu: pp2 - mali450 version major 0 minor 0 |
> 
> The corresponding |pp2| and |ppmmu2| interrupts are also registered:
> 
> |GICv2 200 Level pp2 GICv2 201 Level ppmmu2 |
> 
> The driver then initializes successfully:
> 
> |[drm] Initialized lima 1.1.0 for d00c0000.gpu on minor 1 |
> 
> So this particular S905L-based Mi Box 4 appears to use a Mali-450 MP3 configuration rather than MP2. I have not observed any initialization timeouts, reset errors, or SError failures with the third PP enabled.
> 
> As Neil mentioned above, the Mali GPU is already defined in |meson-gx-mali450.dtsi|, so this redundant definition will be removed in v2.
> 
> Thanks for the review.
> 

Sashiko is right, is it _really_ a GXLX you're running ? The S905L/GXLX does not have the PP2

could you dump the soc info ?

run:
grep ^ /sys/bus/soc/devices/soc*/*

on the device running mainline linux.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
