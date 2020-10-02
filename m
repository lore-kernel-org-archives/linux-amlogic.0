Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71731C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41B2206CD
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u59M5mEs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E9JJvLMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41B2206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bQyMRJpiiIR0Z0Y9UjlVZ0CmgaheFmVA7UNA2E54vrA=; b=u59M5mEsl6/HwQXoNHVfmjFRV
	myJgjULSegjwDxmh3D6e4jg08RRZD+F6FOcmtLPmqiaEkXorsI6OPNkVlMtYrf+gEJpytzQmqPgMD
	lncv9h2jAmKEmWw54M2hwcG/4K1++B7dDe9EWW/uYwgy+rLq/9esLHAVfQ66IwZ0f4EJ9reENLHBm
	ts+uTeTjH38/iBZoUXAiAAAL9XEGPb6Jo35iyk1EjQBPUtTPyYJxFZJ5bM6QVKHlBfa5OSxtpOzCW
	9fA5obBzZRiUBmW5VKOyxhsYpQCbO8koPh8czMC/qV826xW/ufVa9pshoInxoWPN1ExGjnszPWQtl
	LFspH6e1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQ9j-0004z9-OQ; Fri, 02 Oct 2020 18:51:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQ9e-0004wl-4K
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:51:44 +0000
Received: by mail-pf1-x441.google.com with SMTP id z19so1884275pfn.8
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3q5K3L+YoOnrFYFn2V2zaxlwZMcevW9IDjtYQos/JQ=;
 b=E9JJvLMvVOS1W0AlhJ85n78PJzP5/BIKoHNyqHaoa2V8Y+jLVUcK3KYssVUGEMu4oL
 m2NSA3KLlzF1WeWq0iegvthSjOqxSogfcVfjI3VXJ4nKai1v7ZRWtcl7HtZQV+ZUY2SI
 bGAwAYqNydviGjdnGXTuBpQ6tWuqNO3H9GUKzWCyEvEfI1clUW6bSHx0bRKa9UAsKkcV
 cVziU7KCyoB8hVPbSTtxr1z98YSC3YP+EW7jSknzlueTTolL357ddD//DCMAxaNAetTT
 0DbE1IJohoGdT7tFDSlyB2k3Jl60xmLGMywKM2ptmPWxXt2nT3M5WLji7qFJsQRrMo4T
 NxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3q5K3L+YoOnrFYFn2V2zaxlwZMcevW9IDjtYQos/JQ=;
 b=Tb/Wu74JG/efdV0dcG9FtJTuFDa//Y6GHnCmJG66dneA8YO/jmSQG1BUFMpXwZqUMB
 GHpEHXU6uGsswkRw/V6hw8BqEPDpTWP2CzV1b2AkS5M7iex9eQ+7XOQIF9uKiVK3bkPX
 wMJzFQfR6cWMEd5gTk0DHnWplQ7pfLVZqCKkqGpoVRpgTGNfWha2xfoED+MKUj78T+RK
 NlJXBLFgYcwEeq6R6qQYYB7VsFUekHqD0gOSQ6pad8X69t9mZUfh//7MyWxPMfiThZea
 ttS/zeHgGtIogm0C9nWrfcZUK6xmeZZIpsqfR54/Bda9aCp8U4vdAM3bgm5fwr/eVg5l
 FFmQ==
X-Gm-Message-State: AOAM530y3zNDFUt3Sxai+tw8J/MDl9qWxmnTuMvxGOyk8kEC6SYLRpvZ
 LUpbIGcQLBFljVLemsJyXH9z7Dsf8mLxXPZX
X-Google-Smtp-Source: ABdhPJxO048OYeo0qyqo36NDdaDJkIstmnKSpS2FwEASs9UYebeUGxjFE7Az7NnODd3qok+B23segQ==
X-Received: by 2002:a62:7d91:0:b029:13e:d13d:a061 with SMTP id
 y139-20020a627d910000b029013ed13da061mr4256061pfc.39.1601664699826; 
 Fri, 02 Oct 2020 11:51:39 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n2sm2592796pfa.182.2020.10.02.11.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:51:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12: use the G12A specific
 dwmac compatible
Date: Fri,  2 Oct 2020 11:51:36 -0700
Message-Id: <160166469102.35184.724638054812070881.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925211743.537496-1-martin.blumenstingl@googlemail.com>
References: <20200925211743.537496-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_145142_203627_9981798F 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: jbrunet@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 25 Sep 2020 23:17:43 +0200, Martin Blumenstingl wrote:
> We have a dedicated "amlogic,meson-g12a-dwmac" compatible string for the
> Ethernet controller since commit 3efdb92426bf4 ("dt-bindings: net:
> dwmac-meson: Add a compatible string for G12A onwards").
> Using the AXG compatible string worked fine so far because the
> dwmac-meson8b driver doesn't handle the newly introduced register bits
> for G12A. However, once that changes the driver must be probed with the
> correct compatible string to manage these new register bits.

Applied, thanks!

[1/1] arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible
      commit: c0c6f8e527a652d4785cb38ac82be0c95913349d

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
