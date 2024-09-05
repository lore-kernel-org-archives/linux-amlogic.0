Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BECCD5BC0
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=udDZNKT25gLDpGNLTpqh/rjzWORa7vWVpEtwMh9xZ8o=; b=RDrWXdcAqBTXdY
	N6mlUoEG7UK5SH16nG6/04iBvHfXmK5Bik9mBCEJG2IawjcoHSJuRdD7DNjZQEeTRqgoXct8c12qj
	O689dqjXVhVhu/OHydaBQ4p3Iy6MP8XY1hfueOycLO5tY5iUAmugAyTRU7mUjps3Sn9BR7ykKcd2o
	fOgfXh+nMy4N7xvZo2SB2v2m7VkXVB1w4D/dh9FZXbQgJVxmjxhoNket1/gUs9IH6TGiZ+a2OQtEc
	m+hFpGkmCYwUUnb/dbS4ZZZaLkh4pdSNljTU3NWt0p09C1M1RzTx0qa5OTiHOy7p5Mzjo+uQpTmO/
	thlWarFttNs30+x56r+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smByz-00000008QOF-2EZY;
	Thu, 05 Sep 2024 12:53:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBwR-00000008PoW-2nIf
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 12:50:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-374ba78f192so408199f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725540626; x=1726145426; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=221xxfyJ53mX+6ACnkwXA9o5xP4GeLc1zCb9rE8xus0=;
        b=mDalFSNF20hbTJovLttBIH3maC660/4oOP4oVlJjLiuzfSY6u1bt+M2aHU7tn/9u+u
         BiHDVPAqV/R2PGsAfiLrCgxWhkU5x4lSHGhoG5ndMD6rDJc6isipDIjCcf+g7oiw/YFo
         2nnxmL05Qln/F4JP7QTCDZYdh68wsbd3NLzBfsEeonyK7tsAga+oo7DMkE9UBLUgJ6IX
         TzXZJXu75c/nfbyhWND128E6DDGf0FkUOL6jiz6kVr4+vW8jjEN8GBjUbxhagLimh3k6
         /FoyVcTqdV0wtcBK8VEilhKz86G77UnFnloLR67tFLl1cwpdUW/FOyyuiLQoqIGtewry
         X+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540626; x=1726145426;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=221xxfyJ53mX+6ACnkwXA9o5xP4GeLc1zCb9rE8xus0=;
        b=XxD/7wfKE5ESbtHQaszQO5q8l7OJPAc8X/geS9Kr4rjvFol8gPCvw/FvWy88+W9hvk
         LB4jsJ3WElnI3APA57NnIN763GpMxfd0VZKJc1f6xF8s6GP3WVsjk//qg4lm8AdK5Qub
         WeO0gvrTSt7pAAXvRJhgUmgDeArN1xggcjXBP9iFiVXUNb2ZIuzq0kjW3Ks8AO8XLs3l
         KzUhupWqT6QtLep555yX/upMm0OhGZAywTK061Nf9CAUPe0ewK58/m1tW4FbG8jvrTKN
         mDW4Wk3HSAJ+tb/rQGwt+QKwrd0ILLXed4jiqdjQG7dndFCYE3UQQoeICSypO7nlY2yO
         xdIg==
X-Gm-Message-State: AOJu0YxRlsz1uOuUbhcE797wwWsSDnWAaTXMKTDZ0kIiwc20Qs3PFxdi
	4uYB7r3PuIucN+itgQt3ueiTiKmK4BR1SukbnKLaVR56z/F7erhXrBVx89ecTNE=
X-Google-Smtp-Source: AGHT+IEZsNslNpypB9kxXEMsFiN7AqhU9MSx8Ef7Bti53D03NKtmUuatWvhEXto6adQ8opjZAHKXug==
X-Received: by 2002:adf:fc08:0:b0:374:c2cf:c017 with SMTP id ffacd0b85a97d-376dea47344mr4489797f8f.46.1725540625727;
        Thu, 05 Sep 2024 05:50:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52? ([2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bde83ebdsm14630059f8f.48.2024.09.05.05.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 05:50:25 -0700 (PDT)
Message-ID: <cc8fb460-5ac0-4b16-8490-8ac9f89f1b7f@linaro.org>
Date: Thu, 5 Sep 2024 14:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.12
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
X-CRM114-CacheID: sfid-20240905_055027_754401_951FFAB6 
X-CRM114-Status: UNSURE (   9.61  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.12, with:
- The final DT fixes to solve all remaining bindings check errors
- Amlogic A4/A5/T7/C4 & S4 base peripheral nodes
- New Amlogic C3 AW419 Reference Board

Thanks,
Neil

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.12

for you to fetch changes up to e202307b75660aad42fafbb0d3df2c9dadf019ec:

   arm64: dts: amlogic: gxlx-s905l-p271: drop saradc gxlx compatible (2024-09-05 09:10:28 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.12:
- New Boards:
   - AW419 (Amlogic C3)
- Power Controller node for Amlogic A5 SoC
- Always-On Secure node for Amlogig A4/T7/C4 & S4 SoCs
- Amlogic A4 & C3 hardware support:
   - PLL, SPICC, NOND, SDCard, Ethernet, Watchdog
- Final fixes for DTBs check:
   - add clock and clock-names to sound cards
   - drop saradc gxlx compatible

----------------------------------------------------------------
Huqiang Qin (1):
       arm64: dts: amlogic: add watchdog node for A4 SoCs

Neil Armstrong (2):
       arm64: dts: amlogic: add clock and clock-names to sound cards
       arm64: dts: amlogic: gxlx-s905l-p271: drop saradc gxlx compatible

Xianwei Zhao (10):
       arm64: dts: amlogic: a5: add power domain controller node
       arm64: dts: amlogic: enable some device nodes for S4
       arm64: dts: amlogic: s4: add ao secure node
       arm64: dts: amlogic: c3: add ao secure node
       arm64: dts: amlogic: t7: add ao secure node
       arm64: dts: amlogic: a4: add ao secure node
       dt-bindings: clock: fix C3 PLL input parameter
       arm64: dts: amlogic: add some device nodes for C3
       arm64: dts: amlogic: add C3 AW419 board
       arm64: dts: amlogic: c3: fix dtbcheck warning

  .../bindings/clock/amlogic,c3-pll-clkc.yaml        |   7 +-
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |  14 +
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  10 +
  .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 231 ++++++++++
  .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 260 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 503 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   8 +
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   4 +
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   4 +
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |   4 +
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |   4 +
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   4 +
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |   6 +
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   4 +
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   4 +
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   4 +
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   4 +
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |   4 +
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   4 +
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   4 +
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   4 +
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   4 +
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   4 +
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   4 +
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   4 +
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   4 +
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   4 +
  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   4 +
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   4 +
  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   4 +
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   4 +
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   4 +
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   4 +
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   4 +
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   4 +
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   4 +
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |   4 +
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    |   5 +
  .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |   4 -
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   4 +
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   4 +
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   4 +
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   4 +
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |   4 +
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 145 ++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 136 ++++++
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   4 +
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |   4 +
  .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |   4 +
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |   4 +
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   4 +
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   4 +
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |   4 +
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |   4 +
  61 files changed, 1511 insertions(+), 11 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
