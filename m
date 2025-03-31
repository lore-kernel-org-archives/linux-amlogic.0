Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3453C36017
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNumMhQfJGjvq0CAo3HjwpCV74OFATJOFktx2Fe2qqE=; b=UjWh+MfUHXMlnpzCpGOx46vyS3
	htRxWdS5fXi6MWZ+fom9Ib2fFhc4F9kD4fq5aCO+Rp6a5sGzJHoZpY83DXhuSy+4R+McT/vVQL93w
	z6kVO5qJcWYcVfcYhKf3CXBQRtwfCsj/CIFDncNksHLgBVKX+/5PX4rBN/onOUMZhcqnku3iFPGBp
	eojBjOGEYwy8qvZiNFDokopJtDd8Dy57yLQYe3C6aEqeZvhLuSQK86QshJJXQeYRwxbVvT+4C6jbi
	DQnOcb2HgDspQ5fxBVbd6OMYUTuEv7cLK99Sx29GA0Bi4d/RRtB1rM/COOjshkDNUDDckxcW/V2QS
	PlUBudGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8ss-0000000H7sD-1vFq;
	Mon, 31 Mar 2025 06:44:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8qV-0000000H7WC-149C
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 06:42:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2666937f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Mar 2025 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403325; x=1744008125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=CsuatGshyUHFg6CPczwYepKIatcSJgd5PBKzWoH4N+ZGyZ9b4bicjlhXIe+D5jF4S/
         AnRM4KbNTQxFNIfel2eCfL4kX5itxZSSBkg/ZTmHgAMdtW84FSKvd1jkeW78Kz6KOPSm
         H8oQWhLADeuinUiFqqnNaEztU5OKjugH58AiHcDtLiPGYyGzOWzHPYLNxzT9X+SS9fIW
         Q2NtcPjLmMvknUv5BiNEe8b+7RaoOgBZVP9ruCwsGV5pa8IhkAOTPmEvfMqJNrnESiLY
         5KPK0FOUHenbH2g/SIZcNS6zwJ/frhk6X+MufmM7HqR9ES4id/ZPDtgPgZg/M2EkkpwL
         PdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403325; x=1744008125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=kb+yNyuDAsa04r0Fy+J98lZ5sd16yaCMbETVGbeETLLO/ZIMV/Iur1P4e7ubbbxsTq
         QcimxheFayevSFHnV7db09xsvZoM0wlqVa6/9+TSU5PUD9eIy7yluN4a+salcTrX7neZ
         3dPrMJsdStxjYbBz+LkZbYKV4CHlBx862kYj8OUEUdVJ6FJmoGvwbPit2NW13MZctd7R
         D4WWVUkoELuvA5B6Z7/V7iQQ5vBzDAe0cXmElRGcvNNL9vgeZCRvb/3jGFsS8ju969DX
         yFB6r00Nh5SlZqrOhWdv/VFOsMCvWIG5ONVOpdgxZRwFbk1FIF4MSKLSvEBJC5vUYuZB
         fvdg==
X-Forwarded-Encrypted: i=1; AJvYcCWsxpAjVhOgrBhzUREgYTghScsoo1pHNZ9LiAhIwy1p9kI4JVeM5tZKQ4k+8OCdAw4bswzTk8PnMTw/pycP@lists.infradead.org
X-Gm-Message-State: AOJu0YyIc1WlssDfDzjqU49gon++bxar7an2atb/sbxSZu5Maiv4+I0f
	sGe+fMOb0LyAU2np6qA7I10EYmQe/JsHq8ORdMWNup28Kotjf9zFpIEypaooF/8=
X-Gm-Gg: ASbGncvWoKOVRGC4ViamK+jaZIFjsj+8CzhzI++p5nAsuX7/0R4+agZjcQIpEdw7WZ2
	ADD++zBfXbM0pQppA52a+/SUDEm2yI98fsPoPyeWdGHBTqRfxvsme8zBEbrjU91HFvwaSEhBujP
	bGXFfvN/fja7VjvQWlHBQYdRHCJXF/NkGsrgMDySg1gR1e2StC8p+NxhRDB8e3j6IRvP1qaT96O
	KA77EGCzCerB/DQL/0NCtBczOK1Cq70DEylRuMAHQSqV/I/gdm0tm8F1WTsZ3Y0NwNw/FjFO8rN
	MBJl/iw17DbcGyK41M+xuGQjbwbV60QD+kXLdLaikYCMDwefmws2qNntRAdJ350k3Teo1tvbskw
	5knahiMcoL/TuUFMZSvEm7H6JxN8=
X-Google-Smtp-Source: AGHT+IFaaiFJvSkuFgpzRjmFl4ky713HsFznh//e5XklchpgjCOz6VUhATdj7MkI4kwAKPb/DPGB1g==
X-Received: by 2002:a05:6000:178c:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39c1211c8f4mr5516473f8f.49.1743403325590;
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccf0a9sm111590335e9.17.2025.03.30.23.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Message-ID: <04c47466-b1a3-4eb2-8f28-95faa29ff45f@linaro.org>
Date: Mon, 31 Mar 2025 08:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_234207_304136_5DADE8D5 
X-CRM114-Status: GOOD (  17.94  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/03/2025 19:58, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> Testing on an SM1 X96-Air shows that pull-ups being enabled on UART
> RX and TX is actually the default (either set in vendor u-boot or an
> actual hardware default).
> 
> This series enables the UART RX and TX pull up resistors in the
> default pin configuration on all supported SoCs.
> 
> Testing has been done on:
> - GXBB Odroid-C1 on u-boot by a user in the LibreELEC forums [2]
> - Meson8b Odroid-C1 on Linux (with vendor u-boot)
> - SM1 X96-Air on Linux (with vendor u-boot)
> 
> Please include this early so the various CI systems can test these
> patches.
> 
> 
> [0] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195481#post195481
> [1] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195667#post195667
> [2] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195674#post195674
> 
> 
> Martin Blumenstingl (7):
>    ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
>    ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             |  4 ++--
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         |  1 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 12 ++++++------
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 12 ++++++------
>   7 files changed, 27 insertions(+), 26 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll apply them now so they can be tested on -next for this whole cycle.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
