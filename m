Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0700CDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dW9uvAGnENO9Vm2D/oCKWcJXKCnRjbN2X45tEFqduEU=; b=Oy4ylpUnEBItcx
	ee2XVLob02djrKbmsvEKcXZ76axjKJwBiWmbOm53dFNIzoNjiFR5dmJnzPbjFbMXoYc477J3p8IEA
	kxyE9/mKUMRuZalTK/hUkvWk8KZzaOub4V1bIi1YjD1lWoJTK+lIT9GHJIrx5yxek1qUG+nvgRBM/
	JHz6HQhzZhji+vvwky5wxAExHm5FVRPnklCzJsWNDa7AirpdoLOm/rfdWoKGtpBs9Oi6hZye+tnIu
	c5sVto1Dy0JIGMEzX6x5IFGUFudKWRFcjWIo8nY/ljbngCulmx8FIBEvxfT1IZ8WQ39xIDnye6Gew
	kYnoVutVigFWPe4TKOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ9j-008s7q-2O;
	Mon, 16 Oct 2023 08:40:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ9f-008s5q-2V
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Oct 2023 08:40:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405417465aaso41495785e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Oct 2023 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445648; x=1698050448; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UcWuUZM8+p3HcLlQfoaT/bye46PVROxoSbbOHkcbzE=;
        b=EXiigQqUq4WMhSl3n2q624ZxAGQvRjzGQsMp+GwjGTVXhIWVy55VXV8d7owoJhYuqe
         47uIDE8EPTyPP/Sac7NLKLC6b+PzlF45CoIopkIHmJK9ldR7jv2H8NUkdOC2S3MaKGM7
         EM9NeiwEaALxWfR0LwcrCwVnTp7DHyLThgTx8t5fu8Tbz+X8rjyBee+gE4swDTs4cx8y
         eCPQHK7Ppvyk0viwjHnkO7ZnTn+QevpSyG1+1GCtF7LPTmSPGm9jdGp9aJAFmAZiFaia
         NUbhffiwR95WiV+LCEHV+FsZ/R/xUPCYA3/9TGurpXRo1Fl8BSt0LXnAz8vvqHJvG9Ux
         xbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445648; x=1698050448;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UcWuUZM8+p3HcLlQfoaT/bye46PVROxoSbbOHkcbzE=;
        b=NyMu6tNgzQSqDWunAicmKegNoiT5ozsLJ5lXLImJ9D1J08o2THfNFIpUpIYs7Nye/K
         4cKJCpNz+goGcM8///ABqahAcvrk4ujbGnqp2TU3PBjOeIKY9O8a0NGdR15VyFTRvVrA
         lthz8okugwa2wt7hPtcDopqErtZ/IIT91WggGJIODEKhW5ujPZ+O02YAifrzCwnrMWk0
         QHhfk5ovh/voEmLBM4C8tOkpOm+vnhWB9xcQSy8cPxv0P6xTMNdGJFvzrtgOjhsAShtK
         yU3eCRaT3Fkc3UHLw+nilKipCvbrr91IRbPNegwJcHY+BiMR0MOyZYsp+cufHo3cm/sR
         4blw==
X-Gm-Message-State: AOJu0Yw3e0dPcb2gUQQD4TfgmvVNHOgdyP0Z1ucrmDGrQR95NALEZbw4
	BJX7iZrErHs+aWvDIx50I1Agpw==
X-Google-Smtp-Source: AGHT+IF1vtPzMqR2x0FMclW36S55OZY3Pajjd5WNGqVHY5t12WAkO6ICGAq+Wxt+RnIzadR2xUzmRQ==
X-Received: by 2002:a7b:c854:0:b0:401:b53e:6c3b with SMTP id c20-20020a7bc854000000b00401b53e6c3bmr27462213wml.6.1697445647919;
        Mon, 16 Oct 2023 01:40:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130? ([2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405959bbf4fsm6463999wmr.19.2023.10.16.01.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:40:47 -0700 (PDT)
Message-ID: <2e08bd06-09e0-4352-8207-bc3b5d26fba4@linaro.org>
Date: Mon, 16 Oct 2023 10:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic defconfig update for v6.7
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
X-CRM114-CacheID: sfid-20231016_014051_811777_216B9641 
X-CRM114-Status: UNSURE (   7.21  )
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

Here's an Amlogic Defconfig changeset for v6.7 enabling drivers that are
used with most of the Amlogic based boards:
   - KEYBOARD_GPIO_POLLED=m used to support buttons on pre-G12A boards, the old
     SoC do not support dual-edge gpio interrupts, so we rely on polling instead
   - KHADAS_MCU_FAN_THERMAL=m & MFD_KHADAS_MCU=m to control FAN over the MCU on Khadas VIM boards,
     those boards have an on-board MCU that controls (in addition of boot stuff) the FAN pins
   - MEDIA_CEC_SUPPORT=y & CEC_MESON_G12A_AO=m to enable the CEC bus
   - RTC_DRV_PCF8563=m to enable support for RTC on most SBC boards
   - VIDEO_MESON_VDEC=m to enable HW Video Decoder
   - MESON_DDR_PMU=m to enable DDR PMU perf driver on G12A & SM1 SoCs

Neil

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-defconfig-for-v6.7

for you to fetch changes up to a23bfeda86239d29f18a149a7e658cc3d4e5ef8a:

   arm64: defconfig: add various drivers for Amlogic based boards (2023-10-13 09:40:32 +0200)

----------------------------------------------------------------
Amlogic defconfig changes for v6.7:
- add various drivers for Amlogic based boards
   - KEYBOARD_GPIO_POLLED=m used to support buttons on pre-G12A boards
   - KHADAS_MCU_FAN_THERMAL=m & MFD_KHADAS_MCU=m to control FAN over the MCU on Khadas VIM boards
   - MEDIA_CEC_SUPPORT=y & CEC_MESON_G12A_AO=m to enable the CEC bus
   - RTC_DRV_PCF8563=m to enable support for RTC on most SBC boards
   - VIDEO_MESON_VDEC=m to enable HW Video Decoder
   - MESON_DDR_PMU=m to enable DDR PMU perf driver on G12A & SM1 SoCs

----------------------------------------------------------------
Marek Szyprowski (1):
       arm64: defconfig: add various drivers for Amlogic based boards

  arch/arm64/configs/defconfig | 8 ++++++++
  1 file changed, 8 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
