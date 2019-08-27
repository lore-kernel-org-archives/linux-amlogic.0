Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AD2C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE45820856
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQkZCamw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="erWudouu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE45820856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX7OOHTcjWtwujIil5E3bbMGH4snqHG3iUDoVSSiSTo=; b=nQkZCamwf5RF9i
	FiC9rXW2eRfdySAj5d/W25kpIdw1/xGtEt5ebmaSjpM9rz6e1b7B/h5GK7S/zGsunelLmv2aP4SaP
	XyrXyMWyN399Ruy6gWKviNaGLeL+HxITMGB+pFiwq6dwmdmLHL2KcQwzt/dH3gzw1bz1lSwmlzTmr
	8KUGMG5lWPH3JxAfgUpVX8byOKvFVzC+XITvmNs0VqEap5ZoSL+bDxB9Nsr59i6zlZbRBgFhlH42a
	N/duMwWsd5oXwDeUmynyR+ea3vXqAPwhXtpjxXZHrnD9/i9r3xJ/4CP61eY+aeYOzUK0Kgqcvr2SU
	blULMAWu9JTyMJ9+r9Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2k3Y-0006lW-1f; Tue, 27 Aug 2019 22:35:16 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2k3V-0006el-57
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 22:35:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id w2so325890pfi.3
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jdwDMeG5Gy8r+selbq8n2uifwalgXCtHNkU64dqsTgM=;
 b=erWudouuqQ0Yh6EkCEe6Xx4WugJd7xm8WMPsfPht6ox6w5IPtS+q29u/A3mTFBZEJH
 LTadr2zS+89ffAaJDt+4ZaeHq8EO/BwyhyWXOdmun2Z48Yuk1NzOGRvhk8itUKqyW9qk
 8rG/O3+euT/5hvx3SWA9cke3mhhXIEApT0fnMlDy94G+6fKTrakyFJ3JCZVaUG4VOXMI
 ayIIGSg+l9SMXi0NnVNxx8fPKRwgOJgtg1MbMsNqzMyqSr+MwJqxSrGpYN3ymU5ZFb85
 Q5vtcLg87ILuyBPxJBjVphvQZOQQRva8uBM4Q4mSwXZIJkpT+0bi4iFCbPRlNeCjvbpq
 hNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jdwDMeG5Gy8r+selbq8n2uifwalgXCtHNkU64dqsTgM=;
 b=sADcnPzr2LX2BuDoYnQABGu4C3XIJm2UQpDs5H5ZSm8sWZc+/VlyRpqd0oV7Hf9bGe
 l0Wn8gWpOnQQoqEy9MGg7SOh4pBW9tGMNK2GNYmGUtEKmH+kJnPfPCd6YQicZQfZU4PV
 Bnt3mwrYLLdJsq/P55CJipaMu4GnI8xfyYQk/19oP0rm0+gTABV8rWAyk9NMtYb0f+VG
 9ndxJJfApeVAWqLgu3Kg7BumcIV7Qlp+h0LZ2VcUsH1YRV8As2SVb1P9twJoezuxz07/
 NwmfwDBW9zPqkeHLXlpAx4sbiL3i7K5KtGSCDX3peNrjf9hFBVnRDZJXYm/Pfs8UErHU
 5Nfg==
X-Gm-Message-State: APjAAAUsFgrEuEJWsN8Y/JQsiyhqWKtaaEAFQa9H0dbCHYO1qLMMzzuU
 Gp1oNzu7zOkdR6FAH4AIBxD3ugU3WFY=
X-Google-Smtp-Source: APXvYqxRh6iZPF7EBcmWzywBoXlbYwRouh4Bcrsl9kudC14pWnkhfyepcM10JRQLzhwAV0ZpX28itQ==
X-Received: by 2002:a63:3009:: with SMTP id w9mr737348pgw.260.1566945312087;
 Tue, 27 Aug 2019 15:35:12 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id d18sm364839pgi.40.2019.08.27.15.35.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:35:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <7h8srexw1i.fsf@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
 <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com> <7h8srexw1i.fsf@baylibre.com>
Date: Tue, 27 Aug 2019 15:35:11 -0700
Message-ID: <7h1rx6uti8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_153513_263872_89CFC73D 
X-CRM114-Status: GOOD (  11.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>>> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
>>> enables DVFS on the SM1 SoC for the SEI610 board.
>>>
>>> The SM1 Clock structure is slightly different because of the Cortex-A55
>>> core used, having the capability for each core of a same cluster to run
>>> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>>>
>>> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
>>> with a bypass mux to use the CPU0 instead of the dedicated trees.
>>>
>>> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>>>
>>> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
>>> G12A only a single version of the SoC is available.
>>>
>>> Dependencies:
>>> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
>>> 	but is not a strong dependency, it will work without
>>>
>>> Changes since v1:
>>> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>>>
>>> Neil Armstrong (5):
>>>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>>>   clk: meson: g12a: add support for SM1 GP1 PLL
>>>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>>>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>>>   arm64: dts: meson-sm1-sei610: enable DVFS
>>>
>>>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>>>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>>>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>>>  drivers/clk/meson/g12a.h                      |  24 +-
>>>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>>>  6 files changed, 697 insertions(+), 5 deletions(-)
>>
>> Applied 1 to 4
>
> Will there be a stable tag I can use for that so I can apply patch 5?

Ah, I should've finished reading the list before asking.  I now see your
clock PR.  I'll use this tag[1] unless there's a different one I should
use.

Kevin

[1] git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
