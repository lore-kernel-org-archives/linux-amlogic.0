Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CC3C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72AF21874
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSlE2Psf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bm/wB0Ya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72AF21874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5iYcCe0pPEJVfqXClEgk1HJ5Mg3dwqSFPfe+8/p1bJ8=; b=cSlE2PsfjZKspL
	+Hi69F1OgYxaBDH4XEs/inBugG7bDxyaUcZ4GXhcmLBzyUIKDVxn3sl6XdwLMXL+HiNlDLnChuqx2
	si3l9bjoE1iggwAnM351m3eurCRxGedG9W62uujNU1ijsqsQvfs+sSdW32jCxm/HG346XWbu6+FU0
	oWjnNh4G+4hdkIw17582IPjqOsaL2yfTJ17Eqk/v2ZHYaveAcQeIXAx4jiPjQe9gmu85FySa20KEK
	lwjYQmV8ZloH72QLf4zz83ExEb89vrdmk6KHKppaWwHPw3eEJTZLdpYFTHQl9WAlUxWRrl8MWdNwy
	ojPm7SEtof3CU4o05CKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3N6L-0006gc-A2; Thu, 29 Aug 2019 16:16:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3N6H-0006ev-AQ
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 16:16:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id r17so4509982wme.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWCn/aI8becgibBgiWeAnHIhr/fW5iSwk5vO24eMpyY=;
 b=bm/wB0YaVcjT6w+zuY98KSFu6eCxy17zcKSZfLHIxBTwUrXyyW2KOJqQS6th1ahwRF
 ojaAQ209ayGc0lkbX8T+55UBIcbASYkszecXN05+Jsam8Xin9ZoLp2Bt98D2AiJ/sT4d
 0YpOHmc6CjAuOrLH6sgrGij+fbDGgzKc0FsN2FEgazKPZUFBVWrNfvPvRW6Dhe2zGldp
 iCc4I7KyPD4R+HWg+q5i+MBZ4Irbw3XqmcJvQvwVBZQJebe2Mdd36DDrvR5TVC1dtQOc
 ab3jt08/c/ulgIGxNqpZm0wdQLuOzx2PV5tiFdBWyfuD/kZ1GCOCpa4aOI9IVKKTvyJy
 G6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWCn/aI8becgibBgiWeAnHIhr/fW5iSwk5vO24eMpyY=;
 b=NLwanuPpfHDS3RwS7BCY887cTh+9AQBxTkInfYNH0tn4m/FX/yHBoOOWhJAnxrz5W9
 CvCcQgE4D1bwxa1NxDFsymGwIMScDT3PBMNpdLtOp59P75GKjb1A3e1PVZwv1wXjBOoJ
 GIwFdgarNqm1GSoeXU/rxV3bk0dBZg3tYVULdxytF38A65F+DT/R/+Z8N09O/TYgff3+
 CMHu83Wo8R7rX+TLSaAw33sLmFXWRF20WPzw5lnu+0Wvxyonc4PycVazP3/0SWr5utXj
 W2dAGJ/tZgKfIZ90DYoOQAGRsXWwMeRJjzEs7fLrxtcFcVNH9Tx2P5IFvppb8iny0BO3
 1GQg==
X-Gm-Message-State: APjAAAVOYrlbKm/bjduDEcHNmLt2wQL6jnr4DpI6Sd23p2A+h0B/KjOj
 ndOA62xWc5hThSDSLqm5EyZTWxFgGW4=
X-Google-Smtp-Source: APXvYqydE7PJ/qjqc2ZeXlyG8yavTZbBpvs1Q31Mh7laIOnhU9ePQ3Djq1ddTmF/W6PTlWyUyZP8fw==
X-Received: by 2002:a05:600c:245:: with SMTP id
 5mr12118923wmj.36.1567095399634; 
 Thu, 29 Aug 2019 09:16:39 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q13sm3915424wmq.30.2019.08.29.09.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:16:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] irqchip/meson-gpio: add sm1 support
Date: Thu, 29 Aug 2019 18:16:33 +0200
Message-Id: <20190829161635.25067-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_091641_386954_D4F4EDEF 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the new sm1 SoC family in the Amlogic gpio
interrupt controller.

Jerome Brunet (2):
  dt-bindings: interrupt-controller: new binding for the meson sm1 SoCs
  irqchip/meson-gpio: Add support for meson sm1 SoCs

 .../amlogic,meson-gpio-intc.txt               |  1 +
 drivers/irqchip/irq-meson-gpio.c              | 52 ++++++++++++++-----
 2 files changed, 39 insertions(+), 14 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
