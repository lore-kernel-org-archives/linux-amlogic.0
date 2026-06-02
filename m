Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFBAC5DF71
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cAIkhvpEKRruDvFhHMY6cnN4nHseLl0ePmDwTZxl7M4=; b=tZHr4wP55LS6Vs
	yQRazKQL+wjObvVxUfGkkljM4I67C5FoKBFKeLqlFYZf0pFIGlwySn9E6aHJ2a5JuwoSMDfiAKcjC
	2vt7u/FBXicR/0LD86ZKwtf50mVFcLUaOyxzwSIw1u5k7wLW/3r7sFsUMbXDAviC4fvyigPg2Qz6U
	7oHOeP0ZMqSh5Oh2M1LsyMq4PVCAXFyfm+W+bTvwysFXg8S4cQQsMGl4IjXehhYjFDl8+AysnS5g+
	XBK0PAtFNvZR6EzItzmmeyR+3Jy4b+NVvlvThqpEv2Szyo+Ir5kgWGrqKakHBLSQz7y+W/d21fK67
	5aPc5TFHHBKza2TNLlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJvo-0000000CVh6-22HK;
	Tue, 02 Jun 2026 07:53:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJvl-0000000CVfl-3bKl
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 07:52:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso98990495e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780386776; x=1780991576; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jx/6Xb8+7JpGADIReL9AI9hs8frXGu+k1KWWs2BVpLs=;
        b=rNNufbsg6tXFI5cMu9kAP+RJgwqOnv1t/7k/7KoIJmVA28Uba6cg7DEUOithsWkDvx
         k9CfK6uhYgiPsNqLVgrvhmExI0gl/bZcOf24jDG3+Oh0LJ4vp0uzmLODkMRUk6jlT4M5
         zbtjpNkXfgVFaK0lTe2XYVWB+7W5uOvcx8whyhfcKkw0/OkLRe3f4Z+N/BPdZpDwt6Hv
         8fT+AbzZS7ROk9ckCKj2GoirmaG434vi2oFThXaMznP74GBgZkArF8Qmq+CWLNqijch8
         iBseHu5N/LzzIc43U3wJap2KO5MNEOPWiK4OMTBwr2rcSDgZuqYEmSRChs1x1qTwBnGb
         WHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386776; x=1780991576;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jx/6Xb8+7JpGADIReL9AI9hs8frXGu+k1KWWs2BVpLs=;
        b=kfllqYyRNbXaD209bg75dVWXqyRhkzrF7FkkHfA9698a12IKEMMilVs7lxaBdechg4
         aoOXxp4JT8Lsx/eHNuUTWC21xdXmZEMqSGniQtOtBaVeQJ+mN8dAYTmZPLXaQ1UZepdY
         R71PNRSkN9054bb4d5ijiG3/Ig9MoC6PG5S6TIgYk08AE7qZI563AtuX3ag72oDhih8C
         AZkYRRzqSNd7HfHJDe0bgXja+I/z3Jw7rD4ZpxCA9CABjWiidKf+XOhI22W+iRCLl4AB
         kbtbviGCFI8eXQwNVddzIwvjo4n5IujE2fntawemF8I7Q6HKFpHM5C4c9qu2UDML5qVR
         Deyw==
X-Gm-Message-State: AOJu0Yw3vSCduDOxih/t3seRlB6btCGC2eurLW3baFixU8EwzRtIcpHX
	b2XzCrZkpyAJLtNhmNrHPWB4eQjfZEiZNqiVl+FAm2MLQsGw8LocqYjv30Cjj9oInGU=
X-Gm-Gg: Acq92OGIwdxoP8iw9r3PGhTvFVcGrkK0Now2XoEgCxV8Vq7JNsTJnL4+T9eB/PpJyHf
	4dL5nM8EsU/grmp83wZb0ivuRgVxB0TEJ4T0gTvUq8TxeO0sLoH5602D+9+iRqWsyM0PXaI391L
	kylp3McEt9PTFMUcrj+SV5tlqe5WrqsAQ+RRfvTsHILKzw5IKiK8oo1xeuAeCkaLOCgpTIFafhY
	LKWHRX73/rLWCslikDVqb5nOLTMDCTeYoj+76vl0HzqGn8tWcxO5wLhxdgnE68/H4tpLzWXhH7H
	94fVVDmp0qawmAX1Mavemmqy8iQtNetgjSAaWpqXgxoLWljn38lWJJS4g7I9W7De92M7jkLdPSe
	YlFzI38U1hH/JJUZTPVvLmONiAv6dgRezxQa8Aqdc014XKlbMG/PR9oG8Is1R9+86u2hU/f8c4p
	tvShdeWe5oHzLc/S0wVIh7hCgoM5Kt9gFZzRvE8MIu1tjnNVVNjE0tpvQ/WKwrR2sup3GnnEImN
	papjNDQnge+qIz1WA==
X-Received: by 2002:a05:600c:46d1:b0:490:a7ab:bbe3 with SMTP id 5b1f17b1804b1-490a7abbd7fmr191381215e9.0.1780386775846;
        Tue, 02 Jun 2026 00:52:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:13a7:124b:487c:e2bc? ([2a01:e0a:106d:1080:13a7:124b:487c:e2bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0da5ae2sm44609215e9.0.2026.06.02.00.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:52:55 -0700 (PDT)
Message-ID: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>
Date: Tue, 2 Jun 2026 09:52:55 +0200
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
X-CRM114-CacheID: sfid-20260602_005257_946356_37E698B3 
X-CRM114-Status: UNSURE (   7.34  )
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

Here's the v2 of Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.

A bad "Fixes" commit sha was introduced for a commit in the same PR, I squashed it with the
appropriate commit and dropped the previous tag.

This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
`amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.

Thanks,
Neil

The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.2-v2

for you to fetch changes up to eec0722a5cac08ba995847c8eb63118cc708560b:

   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-06-02 09:49:46 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.2 v2 take 1:
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

Ronald Claveau (11):
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
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
