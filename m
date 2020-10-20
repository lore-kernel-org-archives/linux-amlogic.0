Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A6DC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 18:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536B420BED
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 18:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vVwJovoz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OAUsMyid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536B420BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmHvFAsm6HvOtugTO2PW8Ows21zOcNh20+Dtd/NeLNM=; b=vVwJovozpBr9olL1jfP0ClQ2F
	LTOMtBYcb7Z2nlPERE/uN28VcMNpLk+Z1mlLqP5FhbIbdTa6T0TR0zUCSp4vL0aqix+rKo5tzSh8W
	VqI4uOWP93nUTuCMu3D2d6k8YHiXmexaV0dWm3D7PaujdgVWQQWZkTNaH/If2wurhES6/GqL4bCeb
	TWHJDWPpi9HzVAB1WxnnfxMliMP0boYKBw3+FOAKvBjRhvf1DCnfTfIypgYgTFpPmRMPYqJWUJgh6
	zQzYenHXn7JhoHJKGW440potkLTWTZxWoXAlT/xLn456mvOYgGH/+SsKixMyXF7mkG96qh6oWLLGY
	mSb9c3iog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUwHz-00038K-QW; Tue, 20 Oct 2020 18:23:15 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwHv-00037L-HP
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 18:23:13 +0000
Received: by mail-pl1-x641.google.com with SMTP id w11so1450528pll.8
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CGezKt8+BAuUHnil2rfwxd3Pmi+sSBHeojI9UUx5xrg=;
 b=OAUsMyidsIALp35M4Ul9aaHprY/IoitbkhQMJnLoTxMgoAUvC8SYA403Ml+x0KZYNC
 wsrkfQi8RGqUrEgJ7eJv95KV5fuFTsOv6nTVh7qz2yd3nHH431m4w5VXbHMxkSxRz1S4
 nZEFLMbVrgpVn96sqtaxERVn53hv0FEwKORJFZsW/hxAVdAH/NnWoaHbGzvL1C1xNaIe
 vyQ+WImL69bCtR/Ucn3GmIDZu7T8UZyHwJgzxRh4tf32u2Toquy+UKmexyKtBm7Q0blE
 tO5hS//Ln8XLFANDXI/zFozi3hQ5iVCzwzPTwB+/yMZkB7iGKH/T2JapvERkPTyN0rSW
 2mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CGezKt8+BAuUHnil2rfwxd3Pmi+sSBHeojI9UUx5xrg=;
 b=EIqTChgVYwrBlUQv23Okjxt5Yu8iit72EYKlG+vjMsl9apcGFQrfDJD32vHD7xQcRv
 IWVbDlV3rdqfvtgPuzOmRsYhDKCQMqVRYGN4Xgc9GRVR3hL1VQOFsENKGndjofJiY5v1
 nLd8RX2gRt1yyDNAMstxFJkXPILTHz5PwxyhZIYW0oxIBXlWf1t3HkmWmde8I32YP+Ww
 eP442hFo81YE/YJuE2WtT8+79tvWdWzeQhVUoZzrVFj4I54V6coReqs39NbFSxGWYNt4
 Eoi5u22U5N6t0jPOLwUFWa7AnIrTKFeREowCKvLDZ7+BumQ83ZkyK6UBPKnUyNQZeJaS
 k9EQ==
X-Gm-Message-State: AOAM532fBlX1lBkGHjePEw6nwguIIb7xdrguVo0BWbuyM2n68rr8vz2y
 1rWNxaeW6eMZdSis1r5Xrvegag==
X-Google-Smtp-Source: ABdhPJwJP/QHntOT4Ht2WctrUeVjfJBnner2IqBs3k6WUAjTpDxRuiWt9Ns5DdzA5YrNT1JRsVME0w==
X-Received: by 2002:a17:90a:bb08:: with SMTP id
 u8mr4090034pjr.227.1603218189255; 
 Tue, 20 Oct 2020 11:23:09 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w16sm2860558pfn.148.2020.10.20.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 11:23:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
In-Reply-To: <20201020072532.949137-2-narmstrong@baylibre.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
Date: Tue, 20 Oct 2020 11:23:08 -0700
Message-ID: <7hsga8kb8z.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_142312_283693_FAE79C4B 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to reduce the kernel Image size on multi-platform distributions,
> make it possible to build the Amlogic GPIO IRQ controller as a module
> by switching it to a platform driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested as a module on meson-sm1-khadas-vim3l where the wired networking
uses GPIO IRQs.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
