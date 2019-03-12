Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD49FC10F03
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F4F214AE
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWP2jdjk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D7cUhY81"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F4F214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uezR+s0pjsOG6KTL4T7vu2l+t5kJ85hx7GsZzHsFKk=; b=UWP2jdjkMpEddF
	54v+v944qoQZcImkuWaB+yOe1ST/o5aKsThY7GzPEY9LOdNpycQxuM5pCAu4XtUUvP/NQAOpXpS2M
	vq/5ZFGAxbEosWXNx1nVwD3x8i1bkeI+Kz5l4u9paGxuVolUH6h5uLpt5UFgFX7L596On6jWi/Y9b
	x8vNo8YOGPIjLvroPJ8gsjr+sGZZ2p0Pu5pOUI+7yCNA7uFfe0mTlyro/wSYt1q7eZ+/IpHWsvGqS
	1kN8cSFqCCgXGjI68K3ijGVYgs7vcsZjUwbs3tAsbHppJjSDo6mB2yPJEA/Q/RnomawVN+jTEWYRq
	mPr6+oVpAMk2fCke9/pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h416Y-0007JR-UF; Wed, 13 Mar 2019 10:27:22 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h413f-00032f-NL
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 10:24:25 +0000
Received: by mail-pg1-x543.google.com with SMTP id v12so1217012pgq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UjIkLDF+WPlQwj3k/SSeB4jZh/jn2w9+5oluq0KnIUs=;
 b=D7cUhY81VVg8b5cI72uuLyMu/I0u4rPjDpmIgRiXo66lt2wY4Q8p+ac0J32Hi5oD1b
 n9x7imRmVjkzMu5YkGZMv4n4I/tRbEAamoWvNbymMmcO3D1SlsSiDQanBX9h1v8bhmKG
 JCiij8MlXbO/2OmQvuSgYbFBlzTB1Rld99b+f4IXw7mvCdo6iou221Wqzdy2nuLsf8FI
 Y+XyXrwCi6+hXZLEsrQ+A685yMGnakU8O0AjnYUy1hG4CqZ6xJ7JErevPlobUVSphUwg
 qeEwYpMFWN9Am9T86VnCj2vGmqMupCXEB8lGlVep3uoootcCvqU0DRCFP0wteC3e9/Lr
 /Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UjIkLDF+WPlQwj3k/SSeB4jZh/jn2w9+5oluq0KnIUs=;
 b=kNy50ln8qjR+fWYBY3pwRfYIS+js0HA+q7WUqOSYiMtjr2CL6EFYhM5t3auG0ubTbW
 OI/ZNSWAfFIbNfwDF5cIlt+xPKMUKJSusF5stfPmQAhTk2rwOp2VtsoYEL9k5aqKJYbL
 US8G3FSGRIxdYLfgAAk5TkSuU9jngK/MYuCFQ90COsWsoIueDn8YZbSR7YI4fbtTwCdF
 Lc/9oz3HOOKgFHCcVKEbinSuBhujvKJt0y5dEycVCKP2b0EoLwUV/UfDSSsCFQs3iyZO
 liO5FAokdjEFBSECMnsEx+T5WQGA0d/ykhxZkS6KX6Rjk655d+hiEkq46hyl1eXn7spc
 rcQg==
X-Gm-Message-State: APjAAAWMfHylwtom1uKrpOD+dkFt1UUiIbYvonAXb4pdCZ3FX9WKMcvN
 s9dzjKAV2LMQB38SZ2bpUrsVRQ==
X-Google-Smtp-Source: APXvYqziQRiTJeiwGTiIRDq9NYpwFOikItHR6HFTIuUY+EDHlVCfxIGM/negzlpNYOslqFYPlyWr0Q==
X-Received: by 2002:a65:6489:: with SMTP id e9mr36608788pgv.260.1552422325658; 
 Tue, 12 Mar 2019 13:25:25 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:1daf:3f96:9f7f:33ba])
 by smtp.googlemail.com with ESMTPSA id e15sm4545527pgk.30.2019.03.12.13.25.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 13:25:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] arm64: meson: Add SoC ID detection for G12A
In-Reply-To: <20190307140147.22047-1-narmstrong@baylibre.com>
References: <20190307140147.22047-1-narmstrong@baylibre.com>
Date: Tue, 12 Mar 2019 13:25:23 -0700
Message-ID: <7hlg1ju9fw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_032423_979360_C053C753 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset :
> - Fixes the package id detection for S905 variants and AXG packages
> - Adds new SoC IDs and Packages IDs for G12A/G12B, and S805X/Y
> - Adds Add AO Secure node for G12A dtsi
>
> Changes since v1:
> - Added G12B S922X package ID
> - Added G12A S905D2 package ID
> - Fixed patch 2 commit message

Series queued for v5.2.

> Neil Armstrong (3):
>   soc: amlogic: gx-socinfo: Add mask for each SoC packages
>   soc: amlogic: gx-socinfo: Add new SoC IDs and Packages IDs

Applied to branch: v5.2/drivers.

>   arm64: dts: meson-g12a: Add AO Secure node

Applied to v5.2/dt64,

Thanks for all the new SoC detection!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
