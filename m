Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4303F8FA7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YqKsUTK4XpUGHR7Vj16bLRtDjE7hxC/XiFkDVt1ki4A=; b=u44rZ/ZZTs/6Vp
	xRY4KLUMmAUIEb+xCiB9A81KwIqKpysUMM69r2HejEMuGMMT2sVZUgyuJL4IN5b81gmASisD2YRI2
	YQ04EDBKCnBmm9nEeeStmt/ewuvPKjKwUg67qrp1dplPFG/E0qFihzM2v2F0xE0BFC40wAA4SGWqG
	Kmw698YZSodM+BroRkK0fRh/HQbOqYp3OVfM7vh/2b1Ogml+jkOryPBnkBQ2hsW1m5+vaiMTeTw7B
	bvXvZBnIbL0BcctqIoX7OHF3mnu0MwlYCZYHZi3QR+sks2T3gDmEL4Uc5aYnGHhlB8hcxqQpEskqz
	x+LOBYLLT4PGVk2VW9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBWO-00000008hFk-3c9o;
	Tue, 21 Apr 2026 13:52:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBWL-00000008hEF-3K4d
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Apr 2026 13:52:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso17522015e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776779527; x=1777384327; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZ1Sn0x9mZvYh8gn/3N1aTOHuBkEI82dIz+RlHb/0fE=;
        b=Qw6WzRJD5HpxEfEeEbMq5MdCMK1C328Zlg9VpRKl1iy1FyM0QQLiJnE1/URanUz6Q+
         cmYWiu1RpYdWkI1o0uUtwF9ZbHDdoymB7OK9eUOHXL6LR/d5yqLD3azCBwpl+ur5TQbC
         xCj4pGWAXmxp4Iv8XwHGb2FPSCbS0MJ0BkfleAYgIC/BZOBUEHpvNx4L5HKeD1WI8auy
         W88w+nMsbfu3uSyVM7O3pWp9L4SqgXQ/s0j489J6ZnhUZXw+XcH8AWLOjwcVVHaayNqO
         DsR7ITvLVUk8/LzCxTTl+6zGr0malJJRmb7LENcEMGN+XZG8guaS808GSEQm6S0I2u4n
         2pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779527; x=1777384327;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ1Sn0x9mZvYh8gn/3N1aTOHuBkEI82dIz+RlHb/0fE=;
        b=mUTgADn9tOnZ1/yJHa5dJFkXsdWRykk6Sxg9uw9Xv6sj8x01WnkhQQlExD7SeHz7uh
         wmNFUA+75IJEwxnigAToDqN3CqszlDgpU50xs7hoq0QRYGCqfSeDaGAt6UA6M4UtTeZd
         RjLP2LiKezNJgMmuPVTySJML63FoDdMk47LmhEEalukhSnMrRFHILcpRS/B6IoxGbcLu
         ImdYUzqRmyJIf/UiGeAJ9UHXhhpvJHxfndInnai7elbs8UGXGkJ1vfrC5vVu+22LF+15
         ELdTvpW8A3I7lAmgqpUsKzCkxk2M37AgwTAZzTfgFuCdkk2WE1NZA7e3Hgxa0S5ZGT2N
         LBXQ==
X-Gm-Message-State: AOJu0YwOr9XHOZdzhv1P5WCx3eArmK7UgAh6jY4OEhSIHd3xaGiTeXEM
	GJN9TlkkAyvIdCmPPe+2d+Q4Qb+xd9IEmQTP5l7xpabUi2w/eN4oZPSRYviUkRFs/Yk=
X-Gm-Gg: AeBDiespBMsrBeGtGlgHZlCoujsLbCBHVwtirhhyFR2sVn7SWFZQz+P+pJwzH+FJIGq
	Xmrva/BT0o2DfF6yz5RntvC5NquzD+1UlISSUA6MQYB0KyonGlgPEGqbnrnjOoNPKZA36oQ51rz
	SiaQnFaCdBlLYU8/MHQGLbyudEcdcld9Fh+2i/LC+5dKIbvoBOcsaY3TaX0AyGneUpYiut+E4YK
	6p9XTuYir1xwhnp22Bgyb+orC00zvZ1rTab+Vd5sXIClFFWG8Fxy80oUVd92oABRPtrQJJX7n4H
	KdNgg68jDPP4wvaBTMy8BawzpW2mbyHjR1Afg8DZax3vx0V0uExu4doeg1G/U0cwzY6Xfb3CAgS
	u4Cl9kwqQYVBTCbivBqnQ5pDQZjsN894nLvtQlDZQjpDANwl5+yILJAFi+GqxvN8/WdbJUVUxnJ
	IK88v6wFap9Qv0hDUOIKWmtYWfjisjMpEouKhYr1AU4ZQ+FYE9BFpspg8rir4EWVcmn+j3cHfrh
	/lJK6RliqexDzX9mw==
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr249304235e9.25.1776779527194;
        Tue, 21 Apr 2026 06:52:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d7c:c818:d959:1c48? ([2a01:e0a:106d:1080:4d7c:c818:d959:1c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm235882855e9.1.2026.04.21.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 06:52:06 -0700 (PDT)
Message-ID: <536207a3-64bd-488f-a8cc-d61560b82ad6@linaro.org>
Date: Tue, 21 Apr 2026 15:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT fixes for v7.1-rc
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
X-CRM114-CacheID: sfid-20260421_065209_844015_5897478D 
X-CRM114-Status: UNSURE (   7.10  )
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

Here's the Amlogic ARM64 DT fixes for v7.1-rc, including a bunch of fixes
for the Khadas VIM4 and a couple of low priority fixes.

Thanks,
Neil

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

   Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v7.1-rc

for you to fetch changes up to 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

----------------------------------------------------------------
Amlogic DT Fixes for v7.1:
- Fix ethernet PHY interrupt number for P230 reference board
- Add missing cache information to cpu0 for Amlogic AXG
- Fix Khadas VIM4 board model name
- Fix GIC register ranges for Amlogic T7
- Fix Khadas VIM4 memory layout for 8GB RAM
- Drop CPU masks from GICv3 PPI interrupts for Amlogic S6

----------------------------------------------------------------
Anand Moon (1):
       arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0

Geert Uytterhoeven (1):
       arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts

Jun Yan (1):
       arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number

Nick Xie (2):
       arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
       arm64: dts: amlogic: t7: khadas-vim4: fix board model name

Ronald Claveau (1):
       arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7

  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                   | 10 +++++-----
  arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  6 ++++--
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   |  4 +++-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                    |  6 ++++++
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts          |  3 ++-
  5 files changed, 20 insertions(+), 9 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
