Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48C9C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:21:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0462077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syRTb/aD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iJ+G8Jlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0462077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BVzEBIhj8PtD4hhjS4IlCLMlIYhARblRrLvNh0wCRE=; b=syRTb/aDb5qH98
	1lyzSCIUXwTWfrsEpNZCd4K3c2OvT+xcS/m3nyQxsALeROsnFKraknG+liY/rZ5UxMdznJKByLbYF
	mRVWDh+fspCPw5b0WqEAdKEhWSi6rFzxryJxHQZMOTwZ5w2FmBkZeMDDKq/WG/NnRHFwFWb5ETXWG
	JuoV9qBc2PLdqNIp0loSFYfqfHbBLDwk+FsRLJTeTo96JumhvaNj05/o+pIbAvBzKoU5cljYRlN6z
	af+tkQpl7pA7V9wJWRSiLPoeTVaPmzkKvZmy0S7zg//7GdkI3CZr06pI5KMRZI23UQxgtCzAos1JN
	FuW4z185ObZ+Oh8lkAnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2jqc-0007SB-Uu; Tue, 27 Aug 2019 22:21:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2jqK-0007FH-TW
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 22:21:38 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3so224673pgb.10
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 15:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+QV1lxfro+2xR75kWYH74+2iVl7rk3tcmnqLNLA7fCo=;
 b=iJ+G8JlwHiPuZWkUcHmYZ1wNy1XV+y4WOsqYeulXbySkVPtadrhuD6PODEirTRSnKz
 PcmSWctkTfOPUu2QdZLFCLjZgzPgHst9fW09h2thERpJdEd+shbFxcGg3NxGNiN8VNJj
 j9c6N9CjbAt69F46n4zHU08vNJUrqAYEuBt4Aown2HorEx/NH++awnk3shP7rl07I5Y3
 /uaAKAwkv9sRdPF2Uhz1rrW2zwQt9AGvzdnEJfrhJMjA0hqdBXf2Nq2W9HlLqJNzw2jQ
 HsedPaxYFjjGYIDJ9uW+Nv3LIo/RUfG0ymLrYn+8NxYVgYNYVR14RlELOsfdzTfWzeDM
 mTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+QV1lxfro+2xR75kWYH74+2iVl7rk3tcmnqLNLA7fCo=;
 b=kCQIEqiso6fFWmtm2Q1dwWllda/QFdgpGudQpJW935Z7K8sV9pIycLni14+BHAkYw9
 +b5a6sXc2yMhVz1OHV3EBM40VSdGnMpoZFc9sqtUko4/LU10DSzIHNpklLMRBP1P8CqU
 kSJ6rkNN1X5df+LP0dfv7P1lwft8HVs8KBdW69DGTDMu8vdeNIaCsygpKe/U7Cp23mWz
 ezyd0F7yB8laEh1OuSPBPoqW/sUR3V7uZVvlC8wLe9vNZ5SRVadA7hQkX/NcKmB00Xu6
 md+5kdHg6edG3m6XAgpbh6PlLoeSSdTVQ4wOYduJJNp7lQqCdty8BWh4zGTNkpLGLD7/
 ZFqA==
X-Gm-Message-State: APjAAAVIJfShSSxG4KsUQQWn0nufpWBfLUycNVASYoExpoOKhq/BlAHf
 lrdahfg+H5ezJd6Qe0TT19kgMQ==
X-Google-Smtp-Source: APXvYqyco51mSNQzAaGPYLSKHmnGSAdHb2J1OzexYesNtAuslu1oxLH/YK/Ojv+o6ZBh9nX/zUeuRA==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr600765pgi.377.1566944496183;
 Tue, 27 Aug 2019 15:21:36 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id p189sm306576pfb.112.2019.08.27.15.21.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:21:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH v2 0/5] arm64: meson: add support for SM1 Power Domains
In-Reply-To: <20190823090418.17148-1-narmstrong@baylibre.com>
References: <20190823090418.17148-1-narmstrong@baylibre.com>
Date: Tue, 27 Aug 2019 15:21:35 -0700
Message-ID: <7hef16uu4w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_152136_948415_F26F72B4 
X-CRM114-Status: GOOD (  16.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset introduces a new "Everything-Else Power Domain Controller"
> designed to handle all the different non-Always On peripherals like :
> - VPU
> - Ethernet Memories
> - USB, PCIe, Audio, NNA on SM1
>
> The current "gx-vpu-pwrc" process has been integrated to support the VPU
> and the other power domains in a single driver.
>
> Support for SoC domains has been made generic and easily extendable.
>
> In order to restart from clean architecture :
> - the PWRC node has been moved into the HHI simple-mfd, this suits much
>   better than beeing in the AO RTI simple-mfd
> - a brand new yaml bindings schemas has been written
> - reset-names has been added to clarify which resets are needed, so we can
>   dispatch them to domains
>
> For G12A, the PWRC now offers support for the ethmac memory power domain.
>
> For SM1, it also offers support for PCIe, USB, NNA, ethmac and Audio power
> domains.
>
> The DOS domains has been excluded for now, but can be added very easily.
>
> GX hasn't been integrated for now, but it would follow the same scheme
> as G12A support.
>
> Changes since v1 at [1]:
> - removed open-coded reset & clock get, enable/assert, disable/deassert
> - moved to clk_bulk and reset_array with count check with a warning
> - removed remaining sm1_pwrc in probe
> - reordered arguments for VPU_PD and TOP_PD
> - added get_power for TOP_PD aswell
> - ported special VPU handling from gx-vpu-pwrc
> - added shutdown driver call to avoid errors on reboot
> - fixed patch 4 commit log
> - collected rob's review tag on patch 1
>
> [1] https://patchwork.kernel.org/cover/11106393/

Series queued for v5.4...

> Neil Armstrong (5):
>   dt-bindings: power: add Amlogic Everything-Else power domains bindings
>   soc: amlogic: Add support for Everything-Else power domains controller

These two in v5.4/drivers,

>   arm64: meson-g12: add Everything-Else power domain controller
>   arm64: dts: meson-sm1-sei610: add HDMI display support
>   arm64: dts: meson-sm1-sei610: add USB support

and these 3 in v5.4/dt64,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
