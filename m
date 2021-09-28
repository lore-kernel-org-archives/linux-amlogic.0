Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBA7C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 23:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479C361368
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 23:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 479C361368
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXnA1m0YzlY9H9m3TGjMc3H6kSB7UugxOB+FQZkVvoM=; b=TAwgqc0W4dAQe4
	YGAmKYuWKxM/QmMUMDMy2YjM3MmaXkQtsuKrTu/oRJvluJQj7G7bobzblf9bTlrMTcsbXWWRRSKri
	9GE67Ba2HdBZ4WPDFxUR8Q1MmIK8XCyGV75+PCrEmlMnkS2+0+k9uuaNF34q65oXyFwQ1HUBxwrEb
	LFjxnwkdP5SwP5uPal3YtaP2DpCi2dVcmIQhiLEJ3G4QgWmGWmfgv+TTHHTsGwdTWlmycdZ5V9uRP
	FfgMSih0o2Dst1Y/zkSV56LJpun3u94+o0Du5SIL8e5v9/b3G94BNho1MeKS1SJKqdUbCIuBlPA8b
	Oa1X69iPNoauJGmRJZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVMVx-009IRE-So; Tue, 28 Sep 2021 23:27:57 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVMVs-009IP6-SK
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 23:27:55 +0000
Received: by mail-pg1-x534.google.com with SMTP id 66so293722pgc.9
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 16:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UW/aPYuyLtT3YksmTjRLPV3v7TvHXeedKMA+JyjT1Xw=;
 b=pW7FKmKyda+D6uWULpgvmJlmtp9o5p4CJ8lEcmHO+P3STFdOB6g5wlE4M0p4zxKJfM
 YmBXxjkjjgO65dlaY5oF+FP/iEC3fZJUjsP/LPLqF5wxMxMiyqnRe1kRbg6zWBnjC0Pp
 3cEh3WJYIsr9AKZv8I9P8Ohp7nOxkZl6iDHmGq4LhH3DenADBOguLUMeeS4f6tAKXmpd
 OobFkxwpJrYSz6726NQo+UV3QuGIwW6WB7AXHNT1J+OrrOh0Q2T8gJVu1oxGjON+Zb0Y
 UgoQUZ/lP4Vl5vutCUp70NbfBXWib2lVLwZe3E5M3JEyBhsSzIG44qUKkbw/N9zO03SK
 c9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UW/aPYuyLtT3YksmTjRLPV3v7TvHXeedKMA+JyjT1Xw=;
 b=l4ZyAe30TojBtiPUn9s86XeAMcB7NvWjgQFSnIvONWvUDtymjVfft0dkIOwcMhO8mL
 j+y018bCn9NvjVh0uckVCpXsH+t77t+n4hOtAisRp0SlgxRGLErjrwwBJJVuL0JKfBSH
 JkBvFeOiHyOzOnOCHywvgOg6rpipfZQDVpGteALdLrCQ+a0lcqCgkW/1AVYG8DTQUQtr
 SscejL5+8LYPn7nPC4XNMjfbghO3apvi4QyWcv/kddjx7lC5O1InNxOufFK4VMsk97RD
 HQavmmMdlUME87y0+tpk15SNhNUu22M3ml/WeOlErlgJ9woNC1L7tVVgTKoNa99/fcd3
 HsDA==
X-Gm-Message-State: AOAM5338zAz3z2VTLo/5ELMwHSs4HrTpFvMd11G7ujD/z0LxMrgZn/ua
 YxzkQgQe9B/td70QTmGbQ7SRxA==
X-Google-Smtp-Source: ABdhPJxiY3bgggHm3kAeKAzoIrjUenbaCmREsqN+Y/N61Nicv8zxRfW7J3iZdh/U0pFnlJfW6ekXog==
X-Received: by 2002:a63:d250:: with SMTP id t16mr6913292pgi.95.1632871671291; 
 Tue, 28 Sep 2021 16:27:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c9sm228016pgq.58.2021.09.28.16.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 16:27:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 tglx@linutronix.de, jbrunet@baylibre.com
Cc: lee.jones@linaro.org, saravanak@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
In-Reply-To: <20210902134914.176986-2-narmstrong@baylibre.com>
References: <20210902134914.176986-1-narmstrong@baylibre.com>
 <20210902134914.176986-2-narmstrong@baylibre.com>
Date: Tue, 28 Sep 2021 16:27:50 -0700
Message-ID: <7hpmss9t6x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_162753_017554_539D93F4 
X-CRM114-Status: UNSURE (   7.77  )
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

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
