Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECC3C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E0522DA7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTzxiFpg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="edBJe8t3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E0522DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOlChgr+wH+/zx+GoKvcVVLVo0mOd5QuzC7gj7rh+OM=; b=ZTzxiFpg9HDM3R
	Xc5zqeCjgFfeaDLzKJBs1KwBiws39lZVQBBredAS1wN3EcLsHb7PP+L0yApmk4yTRykfunVCJ8xd+
	YO/T5k0V2Q25ssflBIcsoVF5LMNo3cQph+x4+72ZGs0KEEINKxQjChVUr7G0hBQdMo0ynurbAOb+R
	VEIrFesnQ0GEA2AWByf5ODGp249zcUSI5zJyiJAacq6V6nwLPgcdBvIb6fZ/GF5MgXh48IUnoaAf4
	PX6YG5nkNjCkDBpQWQS3g6Cjm24JLErN6cm0BDFKaReZOiZBOPMfSHI04SyJyWaTF9AvQ80fTG4W4
	mGf/m/M7dQHNjr4BP7mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Ala-0006Xy-Nd; Tue, 20 Aug 2019 20:30:06 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AlX-00060M-M1; Tue, 20 Aug 2019 20:30:04 +0000
Received: by mail-ot1-x343.google.com with SMTP id q20so6327207otl.0;
 Tue, 20 Aug 2019 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrGQupHWTyriQoaaHMHBYejqwnStP0bo0yYGdWFV+8Y=;
 b=edBJe8t3FW/Ho/MATx/w0v1bez6U7GmZnIcPcVp9+mW+Tzq86GVrTaSENPffngf6jb
 9HDiD6txhBfdHAwt9VN0/XwirDey+5QP5tCWAo0j22c8TCaK8ttiyoDOVwlfjqt3M6wC
 LidmZUfjey5NtpxfZMBvlYjPH1tg+pxIMZLqXYJN3oqfPNi+Br5wpSgSlFJku/EJRDyF
 Wm+T2nacUB3igFUJUGJofvMR9uRHxPDFIdJrruUoNx8Ot71WCS0egiKRP/AwV1J9tDUJ
 QJejL3RBsONA5pWHr72npq2v7Al90GangRz5kCzdwW5hW7auR8JgA9j8G/2CtdYn3coQ
 2ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrGQupHWTyriQoaaHMHBYejqwnStP0bo0yYGdWFV+8Y=;
 b=t8vvkNroknPaHfKOb3FwiZGorOUORa6oGNEtAbzNrsDbm7a5tYxuedVCCSfyzDoCBm
 KyE2LH5r7U4gZvxLFiFGokUwm2FYwpH+riWh8wwXqwfShJYwEIlBIBL5PvMAzLl8NYgZ
 hI0pjtKBwG6gm90CP/jmueqj2bWjo3M7qgPmEHb31+kuQiOZLdoHDLnnMmSnZsH+mG1k
 i0GEqDY+UlsLQ1B6WdayYO5OCs6hkqliHbVq2QRESlrjqlT1a63X59BPuzlCRt3dzIs8
 xnlhmTs1+d25G+WrfZpkrnjt18DbNHljXEMT2fOrvdxLuUzfsUOKpTKnG9b1JbVdU22+
 o1Zg==
X-Gm-Message-State: APjAAAXcF6V7HdH5VCr6tZ6CMO2JaCpI4flqtV+XzpmxytdkkFCDwH1+
 lmMFBzOVUR6Ryy1i42qX5RughCqkzrpG5DdlsdOr0088
X-Google-Smtp-Source: APXvYqy1Lo7z783U1wJS86qYzKMOflQXpO+kzDeScKysRwtKbWufBka5KHmUWv08D7nxtFGp2IQwNA1COCLc+oBL5gY=
X-Received: by 2002:a9d:604a:: with SMTP id v10mr23610019otj.274.1566333002946; 
 Tue, 20 Aug 2019 13:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-5-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:29:51 +0200
Message-ID: <CAFBinCA73WmyzmwY8uooMFdRCP4iGGZjaHjTU4q_6oNnZrkWqQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] arm64: dts: meson-gx: fix spifc compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_133003_731318_35ABD6ED 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxl-s805x-libretech-ac.dt.yaml: spi@8c80: compatible:0: 'amlogic,meson-gx-spifc' is not one of ['amlogic,meson6-spifc', 'amlogic,meson-gxbb-spifc']
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
