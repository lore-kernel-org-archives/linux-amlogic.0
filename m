Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1146EC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 23:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CA1206B6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 23:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Es9AtZN/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C9yVQ0Of"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CA1206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNdAiF54Mhp0mKCN0RSAiPxImFQQTvnaOl/9saJsPeI=; b=Es9AtZN/SGScuL
	FofgMGw5ZVbCHQ3LyBytBt2irgDq4J5vGeVstd1CtJpwpTlEfwGuJLBVQXIAeQN2b3xuzxYP41V1N
	BhtF9u98wMtMtmje/VpItaiOh/QEYFPZYP82fNVMjSxrW3TIBRmmS07oL1kltnlbw/YJfhgyC/+Nc
	xiQhUbqO+4FK1smfyWzaPyK3QM3xUBKfuU4FETSWalU1EhxQ6ctRPGEhXKmezFRVpI/6AtmuNbvw6
	yvREd/vR3XUz80mLBHz9f352XM8Mn+b9aFUuHzKb61vJ1eNOLLM78XxdFMXt0gugojttMeMJG8i2l
	Z00Y+qIfP7vilJWhfNjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUKF6-00054e-2P; Tue, 04 Dec 2018 23:36:40 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUKF2-00052p-Dc
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 23:36:38 +0000
Received: by mail-pg1-x535.google.com with SMTP id 17so8109282pgg.1
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 15:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=J8W6G8wiC+Bf49Cl/7FpgmNUuDAPGO3OR5gkvGfaxDU=;
 b=C9yVQ0Of/+fEBvuFBEgt3vD4dRfLGR0SGYfLp0urS/nkns7zTZEbzAlLCoMpgWPAYy
 8lAVP6FOSac0qCx0YUGr8ccLoAfx4/rh3AnCF8pR8kYoKDja7qrMpPAQfK/oxto3gmjL
 LIw7wm/yZ3icDo8Qewx4l6YfpLQj9WgIwAPAFRfvdRPeMjciYXVeJSMCxXhqkJAyhs0N
 KYkFx8rffM1k7gMNyy2gOyQOYEZZy3v0OsXDuTz+MityiLN1vXs+B4K1zPcHgq/zwxot
 VADGRnHSQK6xuCpkLe4iJv0VCLYp0mDMtkcNIXVlsDOsuV7Qw51V2d3E8XoXGRRDzQ3s
 6D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=J8W6G8wiC+Bf49Cl/7FpgmNUuDAPGO3OR5gkvGfaxDU=;
 b=gALKEP+H1HxX8HNasuVVXn6qsQ8Zo5gZVzUSKdt4sdzzGhgrMbRZQ5qOh9n5wn0Qzc
 AqUG34XixQJ5tpH5DnjxIRb2TEPHCzuaL88ko1HQXOI5+pEjD1P0L724ORdcvxk3or63
 3tfnz+CB8qXvzQknDdr9onZ06TX7gRJsvgNGQYs9ZUpKm0M1UNgNjGfQaFY20sIHHNI0
 8/mI93cvizQxmoJeAaGcKgjW50EKC6SQWcwtcmSMM/tYkXA4HW7o9xX9sA1PQc5kE5Ku
 TflcwxOgky5OKvZIBF0JkMgu5qajX4qE36LepnX8SodbqmvfY8qyA2o35czLCO3hk+C0
 chPw==
X-Gm-Message-State: AA+aEWZoH6ryuikpg8za2QJbjNZEIHMt57NIOLEYwhN1LRAlVROh5QfE
 igDDs3pPEcnMMn+Ia2jyUd61JA==
X-Google-Smtp-Source: AFSGD/XOrS8nWPkP4rsy5eNT5jiuLtFIkgku5aQ6HhTPgEfrW2K4Wv4yJby5cR6f+/4Dou4rQTn5Ig==
X-Received: by 2002:a65:514c:: with SMTP id g12mr18328790pgq.169.1543966585069; 
 Tue, 04 Dec 2018 15:36:25 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id t5sm27788513pfb.60.2018.12.04.15.36.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 15:36:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH] arm64: dts: meson-axg: remove alternate xtal
In-Reply-To: <20181129165451.21446-1-jbrunet@baylibre.com>
References: <20181129165451.21446-1-jbrunet@baylibre.com>
Date: Tue, 04 Dec 2018 15:36:22 -0800
Message-ID: <7h5zw8dfux.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_153636_468090_EBC8E7F2 
X-CRM114-Status: UNSURE (   7.02  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> There is actually no alternate xtal on any of the axg board I have
> seen so far. The 32k is actually generated internally, deriving from
> the 24MHz main xtal.
>
> Amlogic SoC also have the option to provide the 32k reference externally,
> through one of the AO pads, but no platform is using this ATM.
>
> Fixes: 5e395e146667 ("ARM64: dts: meson-axg: add an 32K alt aoclk")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v4.21 (branch: v4.21/dt64)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
