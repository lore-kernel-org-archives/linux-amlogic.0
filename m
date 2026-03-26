Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D3A10A62CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGjXHY835T3U9kXRLfQy8qK2pQQDKb/hVUQg676/qzY=; b=iD7/FAHZtm7P1g
	xlGkMcJPZctz7TGgbnWlZxeyRbIGW8vWDw9vouVE1UFj+xbUK4oloXiD8ZOVXSrQGtB1O+v8iSn/n
	WDMsNnd+8qQghdXKW00PLgyJz7qz8GC2GhwCoiDuym0CnmsIG2hySqQ4SxeOpyXR+KyyzqAyAI/zB
	ikpSfvZH8wViVIvAHUgY77WA3KSRkfn/hOCfRCpKnNe5XKFq9wAQ8mKRjA8vR34Oi24qq5wLvQ8vf
	NxP7flFOzDirVqu2cT+U4v/+c1d6aad62U9uR6En00i0iR4o9FdkWsV9zeUpoMOxAtkcGRFZwIiTK
	Ody7meByqSaqIuKRU+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kTX-00000005WQj-212F;
	Thu, 26 Mar 2026 13:10:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kTV-00000005WPf-02Bs
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 13:10:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486fb439299so9044895e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774530611; x=1775135411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5T/06PnZQDDMs+KvURgz2r0ZPGg12B/UFXU9prTTL0=;
        b=kajOSXbcNnoy6lWY+/j2FRrQb6+rC4imGjzs9J+MLOpbDF6+xGQpnBtoZb5/eZ3zSg
         2vkfVC45Q4QmZwm5qOOJdw13Sy3uce0zVVlQKdCkOw40WaNW++tu2a9yZ/t3IeF/+iPe
         Rk2YhMCCPY0qZ8bvduj7qpdlaEP2lbcSUC0D1Rk3uOLfiqIdTcsYUi+vq89Q7LtlJ9kY
         +xmBSzj2uf848DGeaBoJnwZsrt3cHCxp+vv88o7Fthkg+La2nJcGIlOciTAU5nfCA+Hs
         A8Efkp3BeIQhOptbcd9hSQrJpDC9xblZbesROFysjMuFP/BhVZOoiK2sFeUHEjVv161D
         AUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530611; x=1775135411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5T/06PnZQDDMs+KvURgz2r0ZPGg12B/UFXU9prTTL0=;
        b=pzdm0wuO/ytPW5zSQlEo3JOlNP9N7AUIa/pBZfkaKHMp1LQIRV/UAnWTJ/msHFZnv0
         iVJ2tSp3Yb0z0yUte4G/nOy+Q1+DtVcqig+CXO+cPTfZuL4eXweQGd011OacW11eXsQ0
         /wteBE0RTuo72E0OIM2oqWUgj+YC90/btN8peyoqqptzF0wDUEuOw6nUGnr0ywY7WAGl
         Io6yaIhDdpkzWl2sA1VIE0MyQgQJj3SB2QKqLkNTTanvxxDQJYoCQRoW5LK6pvyLisXw
         Fbv4xh1GuUeOWjCzMcTJaWhx+xlF37vZ8jc76pebw7HxGr8LAAun9hfdXdAT6OlIejld
         RBWw==
X-Forwarded-Encrypted: i=1; AJvYcCUb6+GqZrQdxLOTUSWFyIuSkboslApVaHPpXFF3cPlY/CETRD4Md/w7jnMRfhZtIBKVjVYD8edTVhFwAMZ/@lists.infradead.org
X-Gm-Message-State: AOJu0YxhqyYlHHofsGsiy0dONqjeK8scd44N0A51XXosRwp3tk49tQ2e
	l4Kr4nYGKP3gHdAmm2Rx23Fnr3k8rHL7bZGDNFcmIWrPNUxRSEMpnowtXaHATNNvpLk=
X-Gm-Gg: ATEYQzzlWRnZWiUuOVwhxO2UqztGStc+cIk9tz0UP0+/RHeTIwZGCA701UNAhh4u0hL
	dPGpmyCHgrKMYRhUsES1/KiIm3b26ii4nrIMHFDDVSlCXu208JzKJ2strDhvzEt30OImwp21aka
	XxhgSzXRV0xCRkSrJCwBGmgOIT0UbEL7jpKUKigKNngBJbTYCBOknHO2qEMgtmpzyxW9YU9Olw+
	2oNZLpe2SQEZYTAx56QmShEjWFU/wtEW2JS3aTMfGycOvptLkATUJxfNo0zcNkmcmIQSBWJQnIt
	zp1zb71FTOiMNKxYOyfpKavvcIeP71H18WElbuH5AmaoMF6ASMnYDbpHYiKMmlZG0iVohw1db5I
	mahm+zpy/6evuvrl0ntQ8F9hjJIxmKjbi266zuD2aoVonhfDlXScza65YPzaXfDZ/7dTt2pj/LY
	iJNGW1FzAHqEm8a7otBT83RiHHb0lrEsXqIgjakbgN1zniVCimZyWAkvhDAti3kdWaWp4o6lnyk
	BjIaHw=
X-Received: by 2002:a05:600c:620b:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48715fdebd2mr120329765e9.11.1774530610950;
        Thu, 26 Mar 2026 06:10:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c78bc2sm29702165e9.5.2026.03.26.06.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:10:10 -0700 (PDT)
Message-ID: <c54566e1-f0e2-4584-bc4d-484ebfd40324@linaro.org>
Date: Thu, 26 Mar 2026 14:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO
 support for Khadas VIM4 (Amlogic T7)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <177453048347.439230.1647215482099213609.b4-ty@linaro.org>
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
In-Reply-To: <177453048347.439230.1647215482099213609.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_061013_063557_DEF4F105 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 3/26/26 14:08, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 26 Mar 2026 10:59:11 +0100, Ronald Claveau wrote:
>> This patch series depends on Jian's SCMI clock patches yet to merge
>> https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
>>
>> This series adds device tree support for the MMC, SD card and SDIO
>> interfaces on the Amlogic T7 SoC and the Khadas VIM4 board.
>>
>> The first patches add the necessary building blocks in the T7 SoC
>> DTSI: pinctrl nodes for pin muxing, PWM controller nodes, and MMC
>> controller nodes. The amlogic,t7-mmc and amlogic,t7-pwm compatible
>> strings are introduced with fallbacks to existing drivers, avoiding
>> the need for new driver code.
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)
> 
> [1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
>        https://git.kernel.org/amlogic/c/fb69fa2cabc68da247bcc0bc99a14dc857b16842
> [4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
>        https://git.kernel.org/amlogic/c/b1e49f6c1ac15b2c947bdb1d22a82b823de22d27
> [6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
>        https://git.kernel.org/amlogic/c/60eff75ac67bbf5445bdbd2842b0109ac591441c


I'll pick patch 3,5,7 & 9 once patches 1 & 2 from [1] are merged.

[1] https://lore.kernel.org/all/20260326092645.1053261-1-jian.hu@amlogic.com/

Thanks,
Neil

> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
