Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449FC2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cgo+JhmjMsvXIkjqXWcaYL6cNSt73iXn//Nwn0oxZPU=; b=yY3dap8kb8AFbb
	swh9c6r+koC5wE+SfbrhoabvcvTo+1AxpcE9v21nTuASbYT0o2Xz4044vn7fcWpcch74sA33TCGsq
	Y5i/NU3N5rCgbeUqUIMHVwfyxbIe/0ebRUn6W+NaWumFx7igahUkoNRsJglmk5VhussC54U4PnwLE
	HLwVNMNekCdEEJV7T0tj+mn56oUHlPDFd2yhLJzjfoY/arRFpTaz6afpo3Z7O6YqLsGj1rR1OBNf+
	1EK7yNIm/5sssEeP4wUGtoCHDfUaxAKswTxufgo/a8Cv2bg/KP+MsxHmebJaiF/QLys+/SqrtrbYQ
	RE3W8+PuINQJlex7yEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCWg-00000002Fj7-388y;
	Mon, 01 Jul 2024 08:36:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCWd-00000002Fi6-1QqS
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 08:36:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42138eadf64so19966005e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719822998; x=1720427798; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43Jk5ICXouubFnaN+i30n+gCprshHo+KzXIWWkI6eis=;
        b=UMUYKZEscesIdHefeAOE5e+wPQEDTSMEAhMx8Tm+C9gM7Yq5mE8kaAmkjPl0VrA4YQ
         MnjRGtBOkonLZwyG5M0tNyinUJ+XT78JA/dDM3A1YGq6WPwYX+cKakZ1vgi2TYMTQ7Wq
         8aSt6+9KEZcLe8htAy5DoOKHDopSv8bGUWoibiQAk2m+oIwFqw2vf0Pdf0Vi3T6ukfpx
         GJQh7nK3HnQy5qGFSQ87s4G33UbBhjhTs9QNgzsFSrJSUD8D6B0qcXKPTnUEGCDq0d+R
         Q0KEY7m5t3OSuroVnkIUn1GaWUXzUV1aZsn3gYscOcahk/xgo4kQlsewSSvq4mL2OohO
         kDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822998; x=1720427798;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43Jk5ICXouubFnaN+i30n+gCprshHo+KzXIWWkI6eis=;
        b=CFco+LSCm0V2H2n2t3HpbQAiOkuOLUJkyxfZXBOyPBNBOME9i9d653q20fUaT4lbds
         I0frOMm/u4G0fo5UULVcNqfbrylYcN/6rNYUKzbnbPrthob5n0suugdH5R4qTZZlo2nt
         3hQhGDKlB3mxJI6gr34tYTtgRMQYHWdsCqEeR2WJZkJYBT+4+QVOVRyfJqpUpTmFv/zC
         Qxf2mJWUfyKsE/S9bf1Y2u/8Boh6JeV0Z2qWFXuqC5mS6gqIlah3S4UnI3i2vmF1C0A0
         Ps+aRXqDvFhg2c9xYXRicLC2kYGnO/Hp2L3jwIQX6onmwDkIA4dQNgojM+1OFo1kfDhp
         5c+Q==
X-Gm-Message-State: AOJu0YwtoC9Arsvf9yS4TlJY5RsaF5Q18c1MDaNxPwd1W2Wi2sZVYs74
	BIf9dyghnHn3t5eHMJIaRJv+7u1W81gKWXEEvly8dA1S4sj83grC3dHS16k+1j0=
X-Google-Smtp-Source: AGHT+IGQz8F4xDL3eSbOZj3rv4Jkj+ouvv1UCierzK1/V4cOwMD1ZhKY6BHDa5byKSApNt9TwmFRPw==
X-Received: by 2002:a05:600c:1582:b0:425:7616:f0b5 with SMTP id 5b1f17b1804b1-4257a02f834mr32985025e9.16.1719822997341;
        Mon, 01 Jul 2024 01:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675f9dfbdbsm9023940f8f.103.2024.07.01.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:36:36 -0700 (PDT)
Message-ID: <7f71e76c-c793-429a-b0ed-7296553a3eff@linaro.org>
Date: Mon, 1 Jul 2024 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.11
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_013639_429329_186BEFDE 
X-CRM114-Status: GOOD (  13.22  )
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

Here's a set of Amlogic ARM64 DT changes for v6.11, with:
- A bunch of DT fixes to allmost solve all remaining check errors
- Some SM1/G12 SPDIF & HDMI updates an fixes
- Amlogic S4 PWM
- Amlogic A4 Power Domain
- New boards: OSMC Vero 4K, Dreambox One & Two, GXLX/S905L p271 Reference Boards

The PR is based on -rc2 since I merged Ulf's immutable dt branch for the S4 Power
Domain DT changes.

Thanks,
Neil

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

   Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.11

for you to fetch changes up to 1443b6ea806dfcdcee6c894784332c9c947ac319:

   arm64: dts: amlogic: setup hdmi system clock (2024-06-28 10:10:42 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.11:
- New Boards:
   - OSMC Vero 4K
   - Dreambox One & Two
   - GXLX/S905L p271 Reference Boards
- Amlogic A4 Power Domain
- A bunch of DT fixes to allmost solve all remaining check errors
- Amlogic S4 PWM
- Fixes for:
   - SM1 SPDIF compatibles
   - Bump G12 SPDIF driver strength
   - Add power domain to HDMI TX
   - Correct HDMI TX clocks

----------------------------------------------------------------
Arnd Bergmann (1):
       arm64: dts: amlogic: ad402: move thermal-zones to top node

Christian Hewitt (8):
       dt-bindings: arm: amlogic: add GXLX/S905L/p271 reference board
       arm64: dts: meson: add GXLX/S905L/p271 support
       arm64: dts: meson: radxa-zero2: add pwm-fan support
       dt-bindings: arm: amlogic: add OSMC Vero 4K
       arm64: dts: meson: add support for OSMC Vero 4K
       dt-bindings: add dream vendor prefix
       dt-bindings: arm: amlogic: add support for Dreambox One/Two
       arm64: dts: meson: add initial support for Dreambox One/Two

Dmitry Rokosov (3):
       arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
       arm64: dts: amlogic: a1: introduce cpu temperature sensor
       arm64: dts: amlogic: ad402: setup thermal-zones

Jerome Brunet (5):
       arm64: dts: amlogic: sm1: fix spdif compatibles
       arm64: dts: amlogic: g12: bump spdif output drive strength
       arm64: dts: amlogic: add power domain to hdmitx
       arm64: dts: amlogic: gx: correct hdmi clocks
       arm64: dts: amlogic: setup hdmi system clock

Junyi Zhao (1):
       arm64: dts: amlogic: Add Amlogic S4 PWM

Neil Armstrong (13):
       Merge branch 'dt' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into v6.11/arm64-dt
       arm64: dts: amlogic: meson-g12b-bananapi: remove invalid fan on wrong pwm_cd controller
       arm64: dts: amlogic: move ao_pinctrl into aobus
       arm64: dts: amlogic: sm1: fix tdm audio-controller clock order
       arm64: dts: amlogic: sm1: fix tdm controllers compatible
       arm64: dts: amlogic: g12a-u200: drop invalid sound-dai-cells
       arm64: dts: amlogic: g12a-u200: add missing AVDD-supply to acodec
       arm64: dts: amlogic: axg: fix tdm audio-controller clock order
       arm64: dts: amlogic: c3: use correct compatible for gpio_intc node
       arm64: dts: amlogic: a1: use correct node name for mmc controller
       arm64: dts: amlogic: a1: drop the invalid reset-name for usb@fe004400
       arm64: dts: amlogic: gxbb-odroidc2: fix invalid reset-gpio property
       arm64: dts: amlogic: ad402: fix thermal zone node name

Xianwei Zhao (2):
       dt-bindings: power: add Amlogic A4 power domains
       arm64: dts: amlogic: a4: add power domain controller node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  10 +
  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   1 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm64/boot/dts/amlogic/Makefile               |   4 +
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  10 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   3 +-
  arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts     |  45 +++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  16 +-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  24 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 438 +++++++++++----------
  arch/arm64/boot/dts/amlogic/meson-g12.dtsi         |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   2 +-
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  14 -
  .../boot/dts/amlogic/meson-g12b-dreambox-one.dts   |  17 +
  .../boot/dts/amlogic/meson-g12b-dreambox-two.dts   |  20 +
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      | 154 ++++++++
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  24 ++
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  10 +-
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    | 199 ++++++++++
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  10 +-
  .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |  51 +++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 199 ++++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  44 +--
  include/dt-bindings/power/amlogic,a4-pwrc.h        |  21 +
  25 files changed, 1048 insertions(+), 276 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
  create mode 100644 include/dt-bindings/power/amlogic,a4-pwrc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
