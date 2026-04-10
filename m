Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176BFE99056
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dnJeedebH6LhNaztaDDQriYcaNS3SnkEfqTE5N6mv74=; b=1Z9KXuPw+PjUHn
	OJ3DVFX8jcauBGCqtOmX/CLqzyoBJyIepvFW1eqOs9UUsV3JDNcr9sk4fEs4CvaVOXxC/CwZGC5Yc
	ZjE5u+CHKigsf1EhcNFi8vmVr0gasIdEqdCpBZutO46X8F5xtI03fWl1WOzUV01F08zNDtzldLYuq
	SJC6WOc17Zu2xzUO2eYNTkBYhhUeOC8Ne9r6za1Tixx+VDulIB+2gwrsoC5ls0OlujqZEgoa8nI1C
	e0VSizC4phyOKF9VRsRgmrxbsDs0TQr3oqey/Z9v4fqnUTJ6PPQ9MAx3C37nN1DKbdhu28KXrVUzW
	nEPwYAqSEbrI36m7TBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7Zx-0000000BrOo-1f23;
	Fri, 10 Apr 2026 08:51:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7Zt-0000000BrNw-44xH
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Apr 2026 08:51:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ad135063so15875515e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Apr 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775811059; x=1776415859; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XflkUukoCSMhqOUO0g2fDV+ZPKs+PxpzityxwM9G4Qc=;
        b=dzqRFbDZ3efXOPuO9WgpiMFAdJ0v9qYo1T9AGlE7x4NJXwBx4jT/oUM9PDxsEGue4j
         COMrcv44cILQp3uMQI4i0/dIt/d1zHMMLtymuN2Me7a/Pbg8JtMGbzGy1DmH/HZjAy8/
         BPq3HodrCaMsIuw53RWPMhGomTqT6bmPHZxEFsjaSbfJF+BVwOc1PTBV/6+9jJtqZA6T
         6uYWjMDxjWaCjVjJnooVvABBvPiS7Beu6l+Xt3UgBoJxF2cTAbYzp1Dw3tZnBk5PvVjO
         BUpMx84/ByWC5axEsGkv+tAALqLlgc3RDNUqK5m3zots4dcTxxE9I8gT0qYJtHtj7NrM
         padw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811059; x=1776415859;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XflkUukoCSMhqOUO0g2fDV+ZPKs+PxpzityxwM9G4Qc=;
        b=P1xztygYTuxTFYT7zXNUnGnlXLopD5D7EidD1HaEe7nmKC67C4Akhq6W6nDThNSdAB
         s/GK2VJTASU0OOqIS4sqlynj3uZOq4e5/vA7QjRJOlst+HuELQPgdGwJzJPPp5hjK27P
         zAD/YOQl/S5yVS3Q5PU92nyHmWTcFXKZJL/57AwfZaBaQgxyXSSuFXME6oyI8dSaGx+f
         v52EOK7gTl3yPWzYQXf2zyrzGSFL8fnW5zBIclqEec4G1T2CexWwzF2DVDPdp2DkImFz
         apkadUGZDUSDvJ8br8pQjjkSPJPRFJUG9NeYZmdBCkk4WzrjFtOVgAmjD6Q9VHZqyQCc
         UGWA==
X-Gm-Message-State: AOJu0Yx4ZDBq3lAZ5CjdEFJfeg+xVnSusRXHTGZy0JXWk1EC+jaxnaZC
	8jpsHtNpIBqoZjdyw3WXUQb5Xdg5wv0TSyUQmzAIoKViirOzHZ4lcHnixtIRuCSNFURwXOxXE66
	saj8J03c=
X-Gm-Gg: AeBDiet0LtaiD3GSIh450CyNB3V4QTD8+6jO4UJu6nABtx1ihBhC7BvaIZjZ3NHpWS4
	lynZci1yqxM4o9Qz0jYC7HofZdR9D5eCjKmXcQgdIP0MBO+cR1UwcsUDEQ07wiJJKzUKURqe4ie
	KSMWCLTtH/DOyhyKmw7a8OcfGo2kyrinNps51W46WLHvTzn6QsmtqEdS+QsYnv0jHDiAHGBSl8R
	79+lkIjsSJBysLtKDLbSU4O+keqRTWUJyVZWUPxvQDFxdU1hSRko9v+uOqC34Ckrzmhuum05yGm
	lMTKLg3mya4vWumGv9pQjQrxjAIIF0TfTI4ZO93lbJe54kx6blehuOm5hcCjk9aNc4sDrTLi5y9
	v2dP+H0ITMnjswpb7CWcTXjjOChnn8WxP8bK/fVJOLedUGycGTQqFHqAVksUoNOXFMJIjEyPffI
	hXLs4TX/+OJWgsYmuew+T8k1pQ95Waqh4raFlyH/PVxVCx+7AwGw+35XUn0JvPePbKAnaJFjmZG
	lHx8kM=
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr21652155e9.24.1775811059152;
        Fri, 10 Apr 2026 01:50:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff? ([2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a74sm6183589f8f.3.2026.04.10.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:50:58 -0700 (PDT)
Message-ID: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
Date: Fri, 10 Apr 2026 10:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.1
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
X-CRM114-CacheID: sfid-20260410_015102_060721_3B82A457 
X-CRM114-Status: UNSURE (   7.16  )
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

Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
for the Phicomm N1 and a couple of low priority fixes.

Thanks,
Neil

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1

for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.1:
- Khadas VIM4 (T7 SoC) Fixes and features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1
- Misc fixes:
  - Drop CPU masks from GICv3 PPI interrupts
  - Fix ethernet PHY gpio irq index for P230

----------------------------------------------------------------
Anand Moon (1):
       arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0

Geert Uytterhoeven (1):
       arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts

Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (2):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
       arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number

Nick Xie (11):
       arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
       arm64: dts: amlogic: t7: khadas-vim4: fix board model name
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (10):
       arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property

  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  10 +-
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 205 ++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 468 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
  .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |   3 +-
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  8 files changed, 824 insertions(+), 9 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
