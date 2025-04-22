Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E8BC369D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThQ+rZtm4sjVwYgWrC7HweY/JUfPMex7RZRAj6BgXf8=; b=dDNbQ6YVVFM7e7rv62eG5IAXfq
	LcvBr+YrpT5+p19TFC4Xc3KQ4uZ1dfzs3yQzkVEaW587aZtgVMafrLSwH78L0eLBsz48uVEi2eINY
	3ZD9jJTO0xK8neZLSPd6UTnZLDAHQEx9WM408kKVGcGjTH3S1lR0G43zHO5c1GCzxwAmeMygtC8Xe
	+OW6zyePJ7tzDnuEFVFyRKt133GxF9cUP0yJMFCi9gbTItQXRXNVFdOoYsWtFI2cO+vmgjO+c4s7B
	5WgQvvYFUhVOe440mbOHcLm5NX444PKP+sUrRgczqjxQJnIQ6yUoTwNrfvEEcREl2zQxStZ92067b
	75+C7W6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78BD-0000000695P-34dG;
	Tue, 22 Apr 2025 07:36:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ar-000000062z7-3Bzp
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 06:58:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39d83782ef6so4041359f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Apr 2025 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305135; x=1745909935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=gky7qy5w1WHFZjCiCglkA+oTiDvmTqLIUw+pajNT8CI7sbXT5PvjAgTrsjEklLBOLy
         EfGpgqfe/+C3uIjPeiNA+ZfmllEQ9zdL1E0HoBm8Talgb2kR5kgN2xtWhMLtZVC3UH5Y
         FrkT3UNa45tKIRSyHuo/W9AeXOp6WCanCTNI29RojKOOcj/FtmPGe7xqZP2hkKrRW7Op
         FvDR4SbEGmq4Whjq1keHquHK8wMR60cP158Z4rZWS3XfZk6r/jW2Nkbje4vVYPc4pVYL
         WN5zgjLOWn2Xtpu4d4ct+2b6cXrbp7qY/ZOtvrR1Cec4KgJemLf4H1gziWASMuqsPa7l
         JlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305135; x=1745909935;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=jDJQl6EBFM8Txb+au2mZZjWwTll7I99n11nZGv3fHrNXTKQGkbo/hkIXkgbNbz/sz/
         cPT+FRYdq1MxyFtsmO6sXGjXwJ2B8vq2vnBnTy3dkfDwdyIZi+cI0RinYWzw6raRrlHb
         72wB2Q3n6qNtlk2BFPQjtGNST58q0E6xofqs1m+TKvXBVdz3RU+ojcf7p7/4+xwQa5DP
         VCKign+hdnuM58y8rvESZ/d/6f158EAS7VK4ljG7+U+uIgmH96DeUHkjAYgAtLSY1FF8
         JiVYbCGUNoTok3hDZpxbAHgxsp/wRwDvwTBbhnpjrQ+qsljDUDqqNiZYrtWixep15Xql
         J2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgt4EdTW9OFUqNgmmZGeTpdftDZ4To5aV+D0mCIdxUAKXI8HNHCgcUQhZg+MGPZVWuEfciXdug2mh4PLjT@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCxDhbJjY8zeLZplDCASktXlxF4q9N3B19tE6K4EuRCcEnmAw
	gf6Z8ANG41iWwHQUWC3MgIqPN5PDF+E0ZCgeAGAfoNv+UqyGfL9YztFozrBYGms=
X-Gm-Gg: ASbGnctI95EARP9x6crjbw0x6XivXoql6B0smcJFd0RS1aDpsVk5tJuJ9Ge6nypmZe+
	boCYwfDZ0XkJ3+45dYic0P79ADHJ/SQQc+6v/Dg+Vb9tJv/FDxO/DB/fR35ZdzURsSopEd8giZT
	f6MVj7T3YIfmh9g+IqKnSrEAzE4qFQShFNe00bM5Br5S+Rfjh33cJ0ahrIs8Xv73XxD99Hr+yke
	Hso35nvySN/Z6XRIDeafaW9kJrmm/rCljKvEM9AXdr81LQdMR35Vn7a51tsY++va/iVcWGawRni
	mCIOnmJFLprb6UYIHwzwOGGyrYS7WLg4gib85/3H8XyUmLcr3SJ0LgCEuHfPSTAYK78ucDcLuWF
	tlrX47NQG+folx8yr7g==
X-Google-Smtp-Source: AGHT+IHbDFXF+5+LP6/HjCP1JYYnUemqwmt6GGZ6W0Gq5gWqraVlFDfoGiHhFNvQf1N0siWjoeAirw==
X-Received: by 2002:a05:6000:184f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39ef9466f36mr12081694f8f.24.1745305135539;
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d07csm14396780f8f.58.2025.04.21.23.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Message-ID: <5c0e86f4-b40b-4f43-a97d-a166f41737a4@linaro.org>
Date: Tue, 22 Apr 2025 08:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_235857_814723_35E98DB5 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20/04/2025 18:47, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>    # dmesg | grep -i blue
>    Bluetooth: Core ver 2.22
>    NET: Registered PF_BLUETOOTH protocol family
>    Bluetooth: HCI device and connection manager initialized
>    Bluetooth: HCI socket layer initialized
>    Bluetooth: L2CAP socket layer initialized
>    Bluetooth: SCO socket layer initialized
>    Bluetooth: HCI UART driver ver 2.3
>    Bluetooth: HCI UART protocol H4 registered
>    Bluetooth: HCI UART protocol Three-wire (H5) registered
>    Bluetooth: HCI UART protocol Broadcom registered
>    Bluetooth: HCI UART protocol QCA registered
>    Bluetooth: HCI UART protocol AML registered
>    Bluetooth: null: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>    Bluetooth: hci0: command 0x0c03 tx timeout
>    Bluetooth: hci0: BCM: Reset failed (-110)
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
> 
> It turns out there's a typo in the references to the untested/unknown
> clock input that made it into the already applied series
> "dts: amlogic: switch to the new PWM controller binding" [0]
> 
> The original goal was to skip this input. This can be achieved by
> specifying a clock input as <0> (which this series does). When using
> <> (note the lack of 0) the clock is completely ignored when parsing
> the .dtb, resulting in a shift in index of the FCLK DIV4 / DIV3 inputs.
> This then results in the PWM controller driver calculating the
> frequencies for a different clock compared to what the actual hardware
> uses.
> 
> Neil, please apply this as a fix for the next 6.15-rc.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
> 
> 
> Martin Blumenstingl (4):
>    ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
>    ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM
>      clock
>    arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
>    arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             | 6 +++---
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 6 +++---
>   5 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
