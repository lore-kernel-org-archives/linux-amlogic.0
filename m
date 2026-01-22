Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75591D3EE66
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jan 2026 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SccViAxGNFij80UpzQxZYCcWd6O5iaRAaW+Jj2imjOk=; b=xQzBsHizId8vEH
	t+SSiDr/Pqzg7A95+Kr40rsJk9lA7s0rIkl37KpmNwYgw8Ajpm+9cgw5StqzkiYlPXLO0KR32sUfw
	ZYizs0LrWWW0BvGysTfOAIb3lO6qA1PQ2nMUA44cPCD22utEYzTg35V+7vJbKGpkudcD612DhBToA
	grfkxGZdiA8yW8kYjwufNPfxvCYpAwD9uDFtdJK8sOgbP0lSSfPBWQV70HuBVl53AWvx1gxwOjDcf
	QIPg47KAhvwDdeD8A1ShktYaZs77sv8F/flnK6YtrNo+YIRdHMsQUdd68EFzkg1TK+9W4vFgMK977
	ltyPEYLkcVjat/c8hj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw68-00000007Gra-3eG2;
	Thu, 22 Jan 2026 14:55:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw65-00000007Gql-3yx9
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jan 2026 14:55:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so12002695e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jan 2026 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093742; x=1769698542; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=IawpaqtPMTqH2N3/kaVof7UMNJe7iIZM7cLuXbBqIPrDN8zhRzPX+R3zdxZj8Dwdmp
         07nT0J+7LO8uaA9cUbxlkEhWZHnTtI3qWM36aPgsnRVh6PQm1cQVb3StjuY6D9PicSn2
         yrFgxh2idk/F1AWayn+NyhRRsq44qyuwbDsImvnBBcsJUIe0VmDj3RkOjxBqvTIuWd16
         Jj+n2QGbzMO8bPDmAup2fwn68XBxgbMERu9uDuU0+3jf96IB8TEUpLyIbZSPg+sCQSO4
         nYMbAHC4rjYoXJ1kanVyR0zi8VM8A2zGasndl9q0/yNgTusPqUO55gkvoGvbPZxTtRky
         bAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093742; x=1769698542;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=NtRUmUNeWSGPYGq82IjclG3h/XERqzMCLN0iKa5z5/4L57h+eo5k9dL0CuILHMVFp1
         7bPKpnKKFVeTnOE0w62yaJIeu8wadDzjIiS5lFHtW1FV7YZgxRHRfyQaEHxUmLEt0ykD
         xSt2X70Sw2LVMdDvEpXm8mn0gzT/64DxEOkEyrtpxNCVv547rUrqPdyJRnOvH/jhLlJK
         pEMxQ6/morQ/A0bGP+1IlxlYqqZnOm3MCc14ZZoxrEER4buP4+GN7tA/CfKcKUOxabpB
         Qag23H0c/8M65gBpYhd7FyfalEJCkNQIxKCJ+TCFYec5JEDJ3FL63Z+CRDHxJrjOUQLj
         h1eA==
X-Gm-Message-State: AOJu0YwkQKsrBHiPae+7B4I/s05dehsh9DjW85gijns1HZUzeX0WaB5E
	Dzk4N7eIunlgO8S7/L+KJvWOX+Noo/B/XWRhHhA2uGBYVFbpgd4NUEtc6vfAflP0rfY=
X-Gm-Gg: AZuq6aKirzzTZIN/MhTm8KBFF0uZOfs0XAZybjNhBusL0Ubb6tqM2ZfPEZ4jawR2ScM
	u8GLbut3PmZhrJ0VWjTW3bjDBXuqX1mlhd46ghQszLwbbdh/vV89Hqk6P7VuL1L2Qm9ayHyEvAq
	0o35PYjtUmeuEETcUqB2tUWc3rfciqvlEiNlBF1BTWiqk1OjQcsYbUWJEDGXH2/Bw8NLsfoP+PM
	Sv3tmrwxIbyA3TCeJQc0GphSgNuA0H4CalC4W76lVWcvi7L2wP8iykFWfA4BlTFtfgNYGtilu4o
	JaHYdWl6pnxWe1UQ5Xo9WgAqJJQNuFN7z6JOSTvEC5l2ocX/FQqf49A2gK1VDtulkJnfccAPbKc
	DXy/yPQcPu8g2MXqI4iY/OAp2s5EK6kGAjxvO4VdedOl1/c+vpmL3Vc3eRnyUbmDkzk83xs2rLh
	jjYCZ18BlQajIC/v5KF363psWfrW2W3864ojRoSBViZ+WFp/q7Gxxrf7OMGd7CDOQ=
X-Received: by 2002:a05:600c:4f8a:b0:480:3c28:838 with SMTP id 5b1f17b1804b1-4803e78ffbemr143482445e9.8.1769093741349;
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804703b90bsm86876285e9.6.2026.01.22.06.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Message-ID: <68dae86d-5c72-4f22-bfb1-1834c47ff0e6@linaro.org>
Date: Thu, 22 Jan 2026 15:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.20
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
X-CRM114-CacheID: sfid-20260122_065546_060932_392F6A15 
X-CRM114-Status: GOOD (  10.62  )
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

Here's the Amlogic ARM64 DT changes for v6.20, fixing proper clock
assignment for MMC accros different SoC families, removing useless nodes
and various cleanups. Finally adds support for the Khadas VIM1S board and
enables NPU and the Type-C controller on the Radxa Zero 2.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.20

for you to fetch changes up to 854583f9992671411bad28bd8a3867afba7cce77:

   arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface (2026-01-21 17:44:08 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.20:
- Cleanups:
   - Use lowercase hex
   - Use hyphen in node names
   - move CPU OPP table and clock assignment to SoC.dtsi
   - drop useless assigned-clock-parents
- MMC clock fixup across multiple families
- Add type-c controller on Radxa Zero 2 and enable NPU
- New board:
   - Khadas VIM1s based on Amlogic S4

----------------------------------------------------------------
Eric Neulight (1):
       arm64: dts: amlogic: meson-sm1-odroid: Eliminate Odroid HC4 power glitches during boot.

Jerome Brunet (9):
       arm64: dts: amlogic: drop useless assigned-clock-parents
       arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
       arm64: dts: amlogic: s4: fix mmc clock assignment
       arm64: dts: amlogic: c3: assign the MMC signal clocks
       arm64: dts: amlogic: a1: align the mmc clock setup
       arm64: dts: amlogic: axg: assign the MMC signal clocks
       arm64: dts: amlogic: gx: assign the MMC signal clocks
       arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
       arm64: dts: amlogic: g12: assign the MMC A signal clock

Krzysztof Kozlowski (2):
       arm64: dts: amlogic: Use hyphen in node names
       arm64: dts: amlogic: Use lowercase hex

Martin Blumenstingl (1):
       arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi

Nick Xie (5):
       dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
       arm64: dts: meson-s4-aq222: update compatible string with s805x2
       arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface

Ricardo Pardini (2):
       arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
       arm64: dts: amlogic: add the type-c controller on Radxa Zero 2

  Documentation/devicetree/bindings/arm/amlogic.yaml |   8 +
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |  13 +-
  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +-
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   9 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   9 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   8 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  13 --
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  24 ++
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |   1 -
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |   1 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  12 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  13 --
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |   1 -
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   1 -
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   1 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  12 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  13 --
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   1 -
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  12 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  51 ++--
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |  24 ++
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  12 -
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   7 +
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   1 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   1 -
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   1 -
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   1 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   9 +
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   1 -
  .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts |   1 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   9 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |   2 +-
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   1 -
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |   1 -
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   2 +-
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   | 259 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  13 +-
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   8 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |   1 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   8 -
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |   1 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   8 -
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   2 +
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  12 +-
  .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   9 -
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   8 +
  79 files changed, 442 insertions(+), 247 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
