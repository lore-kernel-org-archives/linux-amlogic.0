Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE5CD5BAC
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OXPXCAEA1LRKAzVZni1M+PZQ7ffGwj9zigdPfE2XUKA=; b=sDeV5S1n3Xn8zp
	p8PrcHDYI+U/vTz7+ZBXRT/sbvec+VsOcyc+3Sthb8nlzkG16qkfS+iry8x8cokH2XtJmibBusYhB
	QlEZpmqYmuf1v65JtQO4CIjEe/j/gbrFnu8HIxYEFCka77UKBbm6Bbiq4azZl6iHWV5kblr1J8PRn
	SYWhGCrthBN3Ufp09xBbIyOtQuxOvq72Or1UUvCdnqGUO/CyGut4LVzUJ/rU4MkzeWdFRlloyhgCL
	m7fFQxBzNYVRa2VZVmXwGBmzH8zeWxLWbU4hRPYepy2RobJ4RpKfF/GyVHmOS9SFZi3jq1moVftEB
	SojeuS+hUI9D1HbA+Glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3JM-00000007qd5-2WWo;
	Thu, 21 May 2026 13:19:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3JJ-00000007qbv-2zka
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 13:19:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48fde648a71so44120165e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779369576; x=1779974376; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=uSAWHVyuGMKh+TwJu98tXuhiSRgIJUV2ItVUWoUV12nfTiet9UDgxWcC8PsaoAbZ91
         Tf4/qFzjcn7eR415knUz2mhBafY/OFARr+chEvjh1qDwfa+nzvGtu5G1BHmGvbfK9Ue1
         BpBqsciLc61vcbQ374UWG8iGI+oHlTO+1kEGgVbRn0LlLQuL1/yJwVekuCaPV6j4FydQ
         NTaD3K1ZjLdJWX/JOrI/6QLmfcv2rdjqblYd2SPL2Vzr10b20CAJdJ+91rLZUhQhZ2YF
         hmGOgP5fVTF8B5P1WYbq7b23FFbhD45SgzQ9rpiqbGPHDVBsVj79i4hRThb2MWS/tXA8
         INuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369576; x=1779974376;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=RAUGou8H1JaeVvufJ7wHYeWY4rvJax+IB4r9i7KGe0I1UpVNUPSX3PnHzshNeZEweU
         quGlFZD2sJtLcJrocPHzr4UCPSvpTwk7t89JcnGm3UHBg7kBgz3jViIwka6gizCyMhNK
         IoYEuK1OKZtOspmb3TJ8gZZK4TR/crupVjp7DxTmFR87QEGrnizT/Qzqb1wPCYQPvFKL
         kA8i0V0N8M76FNDdOVFwtdWBOXzJjKIZkwcNiCjKoJEhFPMbURqLKnIrL7KGUCkPZ+Ra
         elx2lwz58+HSkl1revhlU548eUmxaRHHnzB9LzIhQq45lhkJuMtV/D2uOvV8R992xqUR
         ENoA==
X-Gm-Message-State: AOJu0Yw4Et/sOEs+LUq0zvwg7aT24HOo1v/iQn2nU08vOuULdrjxO+D3
	4EErvBPLlUS7NGIbYKpbz19oyJEm0nWctEIs8TBFhPhYscXYCkgJyB2xMgiPHGeWKEJQdyiBqt9
	GwILF
X-Gm-Gg: Acq92OGiM/AW5xVKkIC471DSWlOURqr9vROgWaHKCakIDYGyih8bpIJ+EJmweQz5/5L
	TMDQvRCZ+q6vPYgXmhNlndc+eZvvaHZpWg/ZIAmriSZQOLAnGcH8HG48n7f4SOHrx3wWhHNUrQt
	B01y5Qj9g5Ix3i11bBnzf9E4MI7Cs8wH6qXS7M7CCqYsi72/pQ7FRbv4Zii9Y0GLj6eFX9RNnrQ
	Q+aRCqbTgCvNflUj5T/t4yb0k210JdEcedxzq1xIOCBv/f7DYqd3Qztq/1k8+12rOIXFkjAZmfC
	M5upapVCiriKoluXm0y0GgkcaXuG6IQBscwmtzLIH12sLa/dg1yAq29+ssRc8K32CmJOllubakW
	xANp573MEc3ADiuVTKgxRr8MSXKhij3NwIA15fUb1jIIfHAOIY2fgdbDLkVPZid+8BYDCsd2rdV
	ZRXhgdzAccVy91fneDXf1GerXkZqS7gSJ7fshefNrzzXfHStkZ2zhPrsu42q2yLoCIQWXQSTZpP
	tTedRM=
X-Received: by 2002:a05:600c:46d1:b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-4903d3d823bmr15928265e9.12.1779369575712;
        Thu, 21 May 2026 06:19:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b? ([2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm3169586f8f.24.2026.05.21.06.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:19:34 -0700 (PDT)
Message-ID: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
Date: Thu, 21 May 2026 15:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_061937_783680_EC2B33A7 
X-CRM114-Status: UNSURE (   6.53  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's the Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.

This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
`amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.

Thanks,
Neil

The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-arm64-dt-for-v7.2-v1

for you to fetch changes up to 43e6ece01ba673c3bd8dd1638bcd93827d254b3d:

   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-05-18 16:23:29 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.2 take 1:
- Khadas VIM4 (T7 SoC) features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
  - PWM LED
  - I2C pinctrl node
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1

----------------------------------------------------------------
Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (1):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node

Nick Xie (9):
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (12):
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property
       arm64: dts: amlogic: t7: khadas-vim4: reorder root node
       arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
       arm64: dts: amlogic: t7: Add i2c pinctrl node

  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 215 +++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 482 +++++++++++++++++++++
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  5 files changed, 838 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
