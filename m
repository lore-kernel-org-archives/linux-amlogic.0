Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFFC624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Z3Hsm4GldwCrtGmNg6esDg8axViI89WEbXEqeSQNEE=; b=b81L8th28Ivw4t2Cu08A3Yp9iM
	OLgDF/tj8lY3dRSSzC01h7gGupt/4zruB3wX4T4MZuWz/HAykvNvqx+Q0YHclR6H9fMpCeg5q5on5
	nUUveKo4c/xEqS3hTopvIjYOmrmGhH4PlQRHvSQHfkpzvkT+aw3fH9vpLCHCT0nUzYNzC+796H7oc
	IqdMk/THGtWuiEvoWp5A+h50MPaRdZCOgHWXHvhgAaFCIpHLF3ftilzwix+2l5A53fso2afoAAKCa
	uNJFMHW+Z3zdqyRgvZiw/zEa3hV1FoVlqDhScW/8CCKlYRn6gZX9lIXdDmXgPTWSrpx+ylCFseVgJ
	lZTkEAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23aF-0000000GvCC-2RNh;
	Thu, 03 Sep 2026 09:18:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23aA-0000000GvAr-2DX0
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 09:18:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so298338a12.3
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 02:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788427085; x=1789031885; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=vEmmgjpaoepZIw+oJMXlNocsCbq/lLAuPcmShnrgVlupYGfspenooSBlyTZB2IETz0
         IEuZVHbM2V5XVwwF8gE2dkpZillqAzY92FSOcEPLLmSA/xNs18g1V5VLx235w/s6tUHX
         D4GcLR/T/RArxpMnGakOvciwUT/xGpyKTouJb8NorEd/bGJmVN//p/YybyF1Jg2gb9k+
         11u6ICW/EIeiRlUUKHRxtjEKU5+/56tIOuPxs53uLvDgSx8sWG+ejV7pYGMnZlXJQVGX
         nLEP+o+jAmDiIv93dK3Ws6l21Me2OH0qJr3HRu7dSA23wmrLzedGOYIyxLNV1IadLrxY
         OqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427085; x=1789031885;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=QRKNs2D9StqRkGXBT5zitPrAZPjYfPGP3TKLDDRKNBI2klDx3XIO/RFlYqyHV159uv
         eRLXIR11VSnZRr3BgI98kzIRZCmiilC0w44auGbJVgYFjIsU7KjVgwawVqXzxO9bQ/ER
         fEbwfmemjpeZCBWEpxd/ygCollHxWJfD3RhKV5Fptwm4NfSCv07D/XB5GXsQTFjVrBVa
         IdbP/DH4ccSwx3cSwB6U173pYBFDlf7WEJTvDk7fmyQ9a7Svuj+ycJZl0Mgye1r4esrz
         ZswPDemcu1S4UIq97A1wu7hjyrn16JFJ0aIr/MWX1PkA+kajnlO/deaKhLdjb8pCdQYR
         jLVg==
X-Forwarded-Encrypted: i=1; AKwUvBxB3fIYcLUa99EHQv6k0Ssv54nKDm0Twm+UyePQ0i+CqvEtx1Ek5mYn8xDl1Q3tNxRpmD+M1FxEVXIUn9+z@lists.infradead.org
X-Gm-Message-State: AFuF++ltj4ubLYf6qxJXSx0euXzW5fldhKTYu79jhwCjqIcjNDR3x6gb
	hJvO67XCYIuKmrud3t1Sd/iC9pafgm/p/e9zzl2TF4BDtnfitFos+xZzLjgT9hZZlAw=
X-Gm-Gg: AYBFou3mHY6Fe5Bq4wzcw1rSDWKvA148V7PTO50Rl7QndP6666EZo/rwpzkA2ojhE5M
	NUZYIZoYY2RTiSUJrqXALQVm7S+pfY8PqwbL2FT7E0HdXVnpidiGh5y9zJ0MInVpUnxKoFUaSEV
	r6faJfuu6YZTx/K7vaHTGhJQZBH76D55ONbqiY6Vl4yKfrQe1RcDqYeqqclgY5TPJ8LYwMS7FMs
	t5gIDZW89jFSmVtvIMC4lbsWfoJ6zH+OMlLb+UK1zI6NfQweklSl0UR7xXuBASxRXMOk9houEEX
	3hlLizbWaxEJe8dPp7TaYTrXR4tZ32cE9w+sLUEmCb7qgSAtzzhQBCJSa32DQlVvOY44u9G5+29
	n/V9ON3HwQe2l0CmumHrjnzmKmycbfdjetbn9CD1KQ/9wyHtTnQi74NlRqBqeuXblekl+tM2vyz
	705hOqjt9mx/cSJ0J7mTVp0DxGcbuaT4A3m1leDl+s4W1ri7IsZsRqv4CXyH+v8hDn/zkxh/wS/
	pAJzOAVBmN4dt5UtQrR5G3DCHdsy1JHDowU+HTxEtE=
X-Received: by 2002:a05:6402:52c9:b0:6a5:f203:ba4b with SMTP id 4fb4d7f45d1cf-6a6832e4e4fmr7309118a12.16.1788427084433;
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm2126098a12.14.2026.09.03.02.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Message-ID: <0668e09d-3596-47db-ba16-0d8c053e74b5@linaro.org>
Date: Thu, 3 Sep 2026 11:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: sashiko-reviews@lists.linux.dev, YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903085901.9CD541F00A3A@smtp.kernel.org>
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
In-Reply-To: <20260903085901.9CD541F00A3A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_021806_604813_FD20746F 
X-CRM114-Status: GOOD (  13.33  )
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

On 9/3/26 10:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Makefile entries are not alphabetically sorted.
> --
> 
> commit 70cc330a6bc43bd5cfd305fe463356587a2e4a7d
> Author: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> 
> arm64: dts: amlogic: add Xiaomi Mi Box 4 support
> 
> This patch adds initial device tree support for the Xiaomi Mi Box 4, which is
> based on the Amlogic S905L SoC. It enables the main on-board peripherals
> including eMMC, Wi-Fi, HDMI, USB, and audio.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 57bc440fa55cc..9f357df5fc54e 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
> 
> [Severity: Low]
> Does this break the alphabetical sorting of the dtb list? It looks like
> meson-gxlx-mibox4.dtb should be inserted before meson-gxlx-s905l-p271.dtb to
> maintain the correct order in the Makefile.

And the name should probably align with the other dt names and align with the aquaman name (meson-gxl-s805y-xiaomi-aquaman.dts):

meson-gxlx-s905l-xiami-mibox4

Neil

> 
> [ ... ]
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
