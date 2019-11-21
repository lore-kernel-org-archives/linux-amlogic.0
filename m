Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EB0C432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 23:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CEA206D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 23:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kc8GFEpW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dw/zbwX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42CEA206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBIg4wLgz5x6iBlLnUNt/g0hL8BIVfKSn9s6wdv7SC4=; b=Kc8GFEpWoAKD01
	oZiCnrPWy9Ff1CsxzERRq6/uRgPU2zLYH/MJikq4ckK1EM/yztzxHwhb4cCai6klIiDRs3vODMrRR
	M7dMezGlH1vIiIqJdjD3LeaEISIUMnp26s3cWjn8nn2oq5aXsE4IqIQOoYzmXf71EjnpStmWLsOkC
	UeK7HCGW59l1Ucx7UnsA9CTRICn0bbzFaXYJwkeJWd+AnkbBI9qIEH4GFQsbS8JHmdUuBVD8Isyeq
	Ny5fx2I2vPC2H3WgVW0oVybyoZnuabu98/4yrUpH4uj/PvHCLVnzCLmkUf3r5ydltbE6x3gBqR3Xt
	FhIbC9ezFi73DStl5nfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXw9Y-0006WQ-1A; Thu, 21 Nov 2019 23:46:24 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXw9L-0006NF-Q3
 for linux-amlogic@lists.infradead.org; Thu, 21 Nov 2019 23:46:13 +0000
Received: by mail-io1-xd44.google.com with SMTP id k1so5722023ioj.6
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Nov 2019 15:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=sRD24CZU3AA7e2Mtg/NoNBcTmeTnpOy0Fn8hZegqJhU=;
 b=dw/zbwX8lizHuxbYkQ37HvOTPMHVT1O74unioWCCsP5FWziIY32mR9aVshQjoffH0T
 80d1AP0tQOVmnjweBlGc2hW70TiBfDcfyxPn+R/h1Ec1uToFhEK3rjblbH5zBDKXjcJJ
 EwqwsPUj/n6Zja6eLxu2N/HsgurnGu+Eav6SlPkUVbXbbQgxsgJWqzyZlBreG9tEeUPL
 zQgwz8+R42jKYAHNV+uVlpvntohxWvXoV7F/EXkhFsTnGAhVJP4Dh16H5FIbTVMr4XCW
 Tl5HJeNYtHd9ZaiEk60UiO857HQbqySBryM0yXC+BASU1t4b56s5PsnQQvgAKISojrKC
 DCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=sRD24CZU3AA7e2Mtg/NoNBcTmeTnpOy0Fn8hZegqJhU=;
 b=Igjjx/VNh9mSkNpeyi4wbOE49Y4+ulv8c6WpwP+t6V6QM5xuvPAADyNk0g7mNB7A4L
 ofFp7waZYqrSQ0RXtPDTeICxduZx3LWfpaQrqDl0ebrg9VLr6zR7mUb/xwsoGIxhTU3S
 nRpFrcg8lHYodPHqSV7H+LQBg7wy7Zk5+TDDBhHI2xz3tpun+66R09q6Ry9kMoTE5SxN
 7vd8Zm+LWri6ZOI0O50YFL8eQV8df2GM9nwcgQm6FxhG13xhnzcCNb3ZakGoFlNAvAgj
 l2FNkqIGOFQMj1lvjt3m6PbqjeVD+53g1sVgXgE7DLYaeaF5pslIY9rt7my5iKCVqfrp
 CyMA==
X-Gm-Message-State: APjAAAXlabFykOssLCDRe/363ijGKmG0mqpedIFrddUujEP8xsNnb26z
 St4Vqmb3aYRJCx+jTk0BS5KZgg==
X-Google-Smtp-Source: APXvYqylVPal8XuHdeMGWRQk4bl4C77IYa6VGNLsq0lu8kumK0eFdylj7srKX7AWphuL35T0EhGFQg==
X-Received: by 2002:a5e:8b4a:: with SMTP id z10mr10230626iom.200.1574379970746; 
 Thu, 21 Nov 2019 15:46:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h22sm4217098pgn.78.2019.11.21.15.46.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Nov 2019 15:46:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: meson8: fix the size of the PMU registers
In-Reply-To: <20191117154154.170960-1-martin.blumenstingl@googlemail.com>
References: <20191117154154.170960-1-martin.blumenstingl@googlemail.com>
Date: Thu, 21 Nov 2019 15:46:09 -0800
Message-ID: <7hlfs8n67y.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_154611_846460_20957303 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The PMU registers are at least 0x18 bytes wide. Meson8b already uses a
> size of 0x18. The structure of the PMU registers on Meson8 and Meson8b
> is similar but not identical.
>
> Meson8 and Meson8b have the following registers in common (starting at
> AOBUS + 0xe0):
>   #define AO_RTI_PWR_A9_CNTL0 0xe0 (0x38 << 2)
>   #define AO_RTI_PWR_A9_CNTL1 0xe4 (0x39 << 2)
>   #define AO_RTI_GEN_PWR_SLEEP0 0xe8 (0x3a << 2)
>   #define AO_RTI_GEN_PWR_ISO0 0x4c (0x3b << 2)
>
> Meson8b additionally has these three registers:
>   #define AO_RTI_GEN_PWR_ACK0 0xf0 (0x3c << 2)
>   #define AO_RTI_PWR_A9_MEM_PD0 0xf4 (0x3d << 2)
>   #define AO_RTI_PWR_A9_MEM_PD1 0xf8 (0x3e << 2)
>
> Thus we can assume that the register size of the PMU IP blocks is
> identical on both SoCs (and Meson8 just contains some reserved registers
> in that area) because the CEC registers start right after the PMU
> (AO_RTI_*) registers at AOBUS + 0x100 (0x40 << 2).
>
> The upcoming power domain driver will need to read and write the
> AO_RTI_GEN_PWR_SLEEP0 and AO_RTI_GEN_PWR_ISO0 registers, so the updated
> size is needed for that driver to work.
>
> Fixes: 4a5a27116b447d ("ARM: dts: meson8: add support for booting the secondary CPU cores")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued as a fix for v5.5-rc,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
