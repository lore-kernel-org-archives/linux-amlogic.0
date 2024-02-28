Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA52C54E41
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Feb 2024 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8zCTksbFHWiQvOsNRl5sxHETaYOGN4oZ7Z4hyJS+rI=; b=dluFUQcV8dqA0w
	ytxnBUERF+cQdyLYoCny4lMc5gmFpPdtb1dlBzFBYMFb0uDxAc8rXja2SfuRTftssVS7zS+QMAYWE
	yKpjqrUZJ0Fy/lSSebpAgwQYVESP5WyhbF+BqyHvZQFE+2kP+hWtGtC1HoiwmEfUT7HDWhFwEcPI9
	D3sd0LI4kLzd2VLJA+l4gb6ssuUAVrBKCrAJZ8PiDkLDcq4yMbCaELcpT79TQT/a7TKtsQcIoRYdO
	PKd9greOT3jK24+4FipqA05dF+TOspPczoxUB57cw8IVjucDKJFIrh1BGCS00vQ8oxDDddv/6L4S2
	rqS58FXFjWCVjmCE5uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFXb-00000008WvM-0Pnz;
	Wed, 28 Feb 2024 08:43:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFXY-00000008WuR-461t
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Feb 2024 08:43:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33d61e39912so2878896f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Feb 2024 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709109825; x=1709714625; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kT4CW5bgai5S/H5Pjq/8kecttIC+Wfzs7FA6PSBU11o=;
        b=r7K3lv6nImNeLegsdH2ShlQudTz6uFZt0VLq5OqArt9vTrKamdzTPUogP82K/WXL+3
         4/PH8AzAA2MTwIARmWPwMhoj5Qgr4k8mtMhHqA2PpkWxPI0GtVgLDH/3l2FDn6RbkRBh
         I6UDTlkobjb5rTRJZTwL4xC1eyeuUy+fJsYXn58xowrZnbiIRqpcEeTpprQUq/FBEKEf
         gzLwSCJn52AymY9Ga66+L43Gy6+O91mLSfN9FEreTvM+c1p6G/FUDw6DkTkpLw4kE/Iy
         8z8omANPjjRCV47kCmYZxCAISIlGpZst8kbqiIl+sN0w20vkJyHWjsGIJ/S2QAXTCe2w
         XkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109825; x=1709714625;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kT4CW5bgai5S/H5Pjq/8kecttIC+Wfzs7FA6PSBU11o=;
        b=D2pRE2qFLV27ditIMfTgkVROs+qvHstzQXTZ/sOEi5/JkOyNYCQAgvMddjgxQPlVbS
         LutMj343BytHwP2m+r5tlwOP94kA1GKa0mQObl/jwa/WoZRhuEP35Yph6c9AoHy+xAEl
         NqcnXE3dyNzBe0A/lKEfNWT2IHT1MobTYoF1A3i33RDGvoSlQMCP0kd+PMAGeAzZ7GsO
         yN4XCiaQPKqXHDntoVHee2ScaNKTMkt6CMu1YljI0C8XLJzJ2AQN+gJkSPsUFBqkKS1R
         BBQ/KxedIgzJp6od265nx45s2dkJYH5EAUlQf0FfrVPDx9QUb/m9y9wRMEibt0iN087V
         joAQ==
X-Gm-Message-State: AOJu0YyIhaAduiiaT4Ory/tfDXT9SJDlRvwtgaOAzZD7OiMQ+V9VBr8+
	JVE9XVSH8NwvGgr5bMiRagn95zD4WRiFxwlUe+wCApnGGe/Rw7ATjUidGc70pJM=
X-Google-Smtp-Source: AGHT+IGNPPHvRsqLAIlF7vdHiF9o7sHKULWJ8iA0/5DSnOvnAkGMwQlQnK31h5EjjzvoTnPO7vg4oA==
X-Received: by 2002:a5d:64c5:0:b0:33d:5350:6700 with SMTP id f5-20020a5d64c5000000b0033d53506700mr12667262wri.6.1709109825445;
        Wed, 28 Feb 2024 00:43:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb? ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
        by smtp.gmail.com with ESMTPSA id i13-20020adfe48d000000b0033ae7d768b2sm13730128wrm.117.2024.02.28.00.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 00:43:45 -0800 (PST)
Message-ID: <1937f5ef-5d76-4259-931d-523c0e2f0a91@linaro.org>
Date: Wed, 28 Feb 2024 09:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.9
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
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_004349_117460_EF028E0D 
X-CRM114-Status: GOOD (  10.89  )
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

Here's a set of Amlogic ARM64 DT changes for v6.9, with:
- DT cleanups
- various new hardware support & set-up
- Amlogic Bindings unstable removal
- New board: Freebox Pop Player (IPTV Set-To-Box from Free Frnch internet provider) based on Amlogic S905X2 SoC

This board adds 2 Overlays for each Wireless chip variant of the board.

Neil

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.9

for you to fetch changes up to a3b7554ade36436bbbd52b058207a31dc4224e36:

   dt-bindings: arm: amlogic: add Neil, Martin and Jerome as maintainers (2024-02-27 14:54:32 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.9:
- New Board:
   - Freebox Pop Player (IPTV Set-To-Box from Free FRench internet provider)
- Add reset controller for Amlogic C3
- Set initial rate for the NPU on Amlogic G12 SoCs
- Set initial clocks for USB on Amlogic A1
- Initialize Amlogic AXG SoC capacitance
- Drop unstable remark on Amlogic Bindings
- Add all Amlogic maintainers/reviewers on Amlogic SoCs bindings
- Cleanups:
   - T7 whitespaces
   - Underscore in names

----------------------------------------------------------------
Alexey Romanov (1):
       arch: arm64: dts: meson: a1: add assigned-clocks for usb node

Dmitry Rokosov (2):
       arm64: dts: amlogic: axg: move cpu cooling-cells to common dtsi
       arm64: dts: amlogic: axg: initialize default SoC capacitance

Krzysztof Kozlowski (4):
       arm64: dts: amlogic: t7: minor whitespace cleanup
       arm64: dts: amlogic: replace underscores in node names
       dt-bindings: arm: amlogic: remove unstable remark
       dt-bindings: arm: amlogic: add Neil, Martin and Jerome as maintainers

Marc Gonzalez (2):
       dt-bindings: vendor-prefixes: add freebox
       dt-bindings: arm: amlogic: add fbx8am binding

Pierre-Hugues Husson (2):
       arm64: dts: amlogic: add fbx8am board
       arm64: dts: amlogic: add fbx8am DT overlays

Tomeu Vizoso (1):
       arm64: dts: amlogic: meson-g12-common: Set the rates of the clocks for the NPU

Zelong Dong (1):
       arm64: dts: amlogic: add reset controller for Amlogic C3 SoC

  Documentation/devicetree/bindings/arm/amlogic.yaml |  15 +-
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm64/boot/dts/amlogic/Makefile               |   6 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   7 +
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   2 +-
  arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts     |   2 +-
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   2 +
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi |  30 +-
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |  16 +-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   8 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   3 +
  .../boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso   |  31 ++
  .../dts/amlogic/meson-g12a-fbx8am-realtek.dtso     |  21 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  | 462 +++++++++++++++++++++
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  12 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  14 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  16 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  14 +-
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   2 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  20 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  10 +-
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  12 +-
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   8 +-
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   6 +-
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   8 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   4 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |   6 +-
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   8 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |   8 +-
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   8 +-
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   8 +-
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |   8 +-
  .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |   6 +-
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |  12 +-
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   6 +-
  .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |   6 +-
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |   8 +-
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   8 +-
  .../dts/amlogic/meson-gxm-s912-libretech-pc.dts    |   2 +-
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  16 +-
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |   6 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |  10 +-
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  14 +-
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   4 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  20 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  12 +-
  46 files changed, 714 insertions(+), 195 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
