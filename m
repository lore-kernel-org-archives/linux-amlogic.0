Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E143CE7AB8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U21PHHBRuo3s70YiFNMG6ClZVP51M3RkmaplZllDiWg=; b=Phm9F+KQ1UZyND
	+D10RxpjpbzLr4BCD9VI0YQFkouxNFd5+G34kxML9VwBi4XPNLmoUGXf3Rp5eaOxF4fO5AfLixhAq
	SLvK3rg08PB39cztdUg/rnFZ/cJ9L0tysuaGqFvOD8vf64eEvH6hR2RJxDXDR+Yy33ugweIBEPv8b
	2SJQg3LDuCKE8HiAS9lM/ebvif32MVWrFQAWB5uCE0US3jI8ITsDtZkyaVWuH+zWYEwqLnXMo6wpg
	OZG13TaNYR4CubCljEw0f7qxU3WNIS4ALBZ0gTje/rF33FPtK6oNbdYVxaagzMbE+GjUtlpoMhSLl
	O7cTbC+KB+EGdQ7GJGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTC1-0000000B2zi-0HHI;
	Fri, 06 Sep 2024 07:15:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT17-0000000B0Ix-0NGP
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 07:04:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so12542125e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725606263; x=1726211063; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmvQ+Tp6rwj8ytkbPRHE2L4V7NjEhAGYliO1vaPNhGg=;
        b=lBOd/ajR3FAu/Z9BspxbNCv8EGA+cO8F99oECNZqmZALisgsoiN0EBsmLHT2ySEX/a
         rxROG+hwxjpUPdRidiwpWgjjgaHrvKAFX5JiJeIRAHuipo8t/h67w/ufWJb8K5BUGzWe
         aqynRw7dXN4z/xV30crXecM+mWtisWyVgjchJsM3Cx3FrR/EmXRuA62D8CAz5fNIDGSp
         ZP28mDVvawE9MK8W8gTFCsITvCDXlhwvwKsuPdKygbOu1sq25vEseP1fVjUM9lli70lo
         Ye4SK9qu3CsQ5/8dTp03dkSC3Upx16K5qgw/IMJWE8pKv+48HS4ghWXf1NHJjxjjlrp9
         bwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606263; x=1726211063;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmvQ+Tp6rwj8ytkbPRHE2L4V7NjEhAGYliO1vaPNhGg=;
        b=ZX3LsTRuGTla3wq86yg8dNYV/5f6ugfp4UmvfVDyZLLcKTX0moRto7kw8DXENjMLgL
         lJivF7300o0FdPQlkH4Vdy8W7dLqdnp+pG0ONGk18E8LkAGEwCT08CavU/gR1TYJ1DNw
         2GyR+sivcwNW9OliAyPlK/rpLXvfpas4fsp9MQw5am4WYU0J1FvDdwddRTMTWnx0yDKZ
         orsvjDSsk0ZJB2J8HALdal142AF4auslwzEB5uTTPEWeOwQCU7SYsN48OLMX6SBkxoFc
         kxYRvCSkYNoOBx12j9SyFk+h5trdA9FfgJzECDYs0RUSxVAuhpHCvDAez5mvvCxxZjP7
         2LcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUllnZKQhGIvVwLUP1QRue8imfss9kxj+bs82H/7yZLUMmtWe9C4QsKiZiD0jmY8Z1f0M45zL+H2AwbENSP@lists.infradead.org
X-Gm-Message-State: AOJu0YzK9N6jNYFWTvD0mkjqbY38oWOaQ6k3y5j0re+EjSDUF/dJo0bB
	cvNcRch63eI8GIziKspnrRY0wmIVskUQ6SCep/WixJ+Z/APaEI0SEkGGCw+L9R4=
X-Google-Smtp-Source: AGHT+IGlyWHVSEWro5k26v/9BbprNSe8PT6hvmfZpe/tLbwFZ0rhCf+beAnjTByheeKXnnumuvMrBw==
X-Received: by 2002:adf:e747:0:b0:374:c847:866 with SMTP id ffacd0b85a97d-378895cb1ddmr1033472f8f.23.1725606263243;
        Fri, 06 Sep 2024 00:04:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c70d6sm10465345e9.5.2024.09.06.00.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 00:04:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:32 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 09:04:01 +0200
Message-ID: <1jo751qn4u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_000425_154167_FB92D9B3 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> Some PLLs with fractional multipliers have fractional denominators that
> are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
>
> The hifi_pll for both C3 and S4 supports a fractional multiplier and has
> a fixed fractional denominator of "100000".
>
> Here are the results of the C3-based command tests (already defined
> CLOCK_ALLOW_WRITE_DEBUGFS):
> * echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
> * cat /sys/kernel/debug/clk/hifi_pll/clk_rate
> 491520000
> * echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
> * cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
> 491515625       +/-15625Hz
> * devmem 0xfe008100 32
> 0xD00304A3
> * devmem 0xfe008104 32
> 0x00014820
>
> Based on the register information read above, it can be obtained:
> m = 0xA3 = 0d163;
> n = 0x1 = 0d1
> frac = 0x14820 = 0d84000
> od = 0x3 = 0d3
>
> hifi_pll calculates the output frequency:
> calc_rate = xtal_rate / n * (m + (frac / frac_max)) >> od;
> calc_rate = 24000000 / 1 * (163 + (84000 / 100000)) >> 3;
> calc_rate = 491520000
>
> clk_rate, msr_rate, and calc_rate all match.

Thanks for the detailed description.

Is there a possibility this applies to the g12/sm1 as well ? HiFi PLL
has had trouble on these SoCs since support has been added. It sometimes
takes a long time to report a lock. So long we consider it a failure.

There was no such issue on AXG. If you check DT, it is the reason why
AXG use the HiFi PLL for the sound card and G12/SM1 does not.

>
> The test and calculation results of S4 are consistent with those of C3,
> which will not be repeated here.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (4):
>       clk: meson: Support PLL with fixed fractional denominators
>       clk: meson: c3: pll: hifi_pll frequency is not accurate
>       clk: meson: s4: pll: hifi_pll support fractional multiplier
>       clk: meson: s4: pll: hifi_pll frequency is not accurate
>
>  drivers/clk/meson/c3-pll.c  |  1 +
>  drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
>  drivers/clk/meson/clk-pll.h |  1 +
>  drivers/clk/meson/s4-pll.c  |  9 +++++++--
>  4 files changed, 28 insertions(+), 5 deletions(-)
> ---
> base-commit: adac147c6a32e2919cb04555387e12e738991a19
> change-id: 20240904-fix_clk-668f7a1a2b16
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
