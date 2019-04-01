Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F419BC10F05
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F4920830
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDev2cSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z5RmUJGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F4920830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFxzyzDH+4NLp7ZQ6rvgt2uBtKCBcnpPA3nptx52K0U=; b=kDev2cSYxP2k84
	HWtwylI3GEuFGMFA6YA8e2cxTwu1dlWgcLCXWCyJAF/HRo9RFK1t8H+dmkQG7tRHcCcwQoPRQ/0jZ
	HbxvLQ9q8sYPwYKLFIa6owQDmLqJ2WoRcIVV+2iSQyuSVVxAOGf+GBnpQlhQIk8T36Lb+lON0U5mO
	5Qv24P5tx6misTbEIF8vXhiSXkb4VvqbGpkQXbDlSGN3WSOLmz/tp9/JT9Mck8QNQAqFy09AOe3Vk
	FlG1RsNP3/2HCut5/obpmGLpaDQkYDwa0UB/Wxm6QV5CIvUK2czHyiumgjIRGL6HK3bKlzRqfarMq
	OqxdBpQt6RFBBQgprV/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAxMF-0003rn-Hz; Mon, 01 Apr 2019 13:52:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAx9V-00043u-CN
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 13:39:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id w10so12090633wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oc8x1HYekb0IdcZYL8hP6bRdzWN1baFooyKd73Kx4H8=;
 b=Z5RmUJGtmb7qTx76udQVB8fsHHD3DYHIusPgFoeTYXqPp9yzR2TwtHrsV07H7r8YYx
 0kUnoeBDJJZz9YPTYjc4P+5KHkCKwrPYU1YP4hlBDITChHHnPCW8Dh6j1x8cpDvrwdzg
 jpfdC/kFzzcQnyVVbSLHvXiKb9L2H00uWajZPFEdh6TeUesnWHoSLK3S4/W72P+hSSB9
 aFvZsZTqV5W7eTgtL1OFJvqCdR0A+QeLObXMTIy2SNBjn/niubTnO1jctg/fpAylo0nu
 LYXqM+jrci1hZR6vA2dthuXbS+wrEGlcB0fxUpMFT/5Upoc7hxK5Csgpam3t0gCy0HTZ
 8zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oc8x1HYekb0IdcZYL8hP6bRdzWN1baFooyKd73Kx4H8=;
 b=LEAxuhciX37uiQsdWiWSsVX57DyvVgeX/pyeLVf++dEkKyuUUAdlWQzITGtzT378gK
 kKTGFGjG3nOawrwHMIKoQh2+bFI206RROnEV9Og4S0vzTcKghfCOjYzG0YqDSfDtUVez
 reVbisgf6pCYUX4CAc+4xArv+gb9DMDmquS4+6LPG4h1IWRUJeXiUxQiU/3/u3CWmxyL
 GSc9iT2+4hIijhKNSvX5m7MPC/U7h12D4wAkZ4zXeHWG+ln5WVvqCQlS9ASXIvt5roUt
 YJ7O8tOBoF9pCYCTApDrO0MzKoJLQq1eWEahvolEv9wsn9lnuXJlyWsPV/cU/9Rst4wU
 VBGQ==
X-Gm-Message-State: APjAAAVeNKJjjBTjg6vzims0mZilIlxIl3DgSeog/7f8cptsTNH9LIw0
 bcvGvhjLkw0ZP+IKtn0zrsE2Tw==
X-Google-Smtp-Source: APXvYqzUsqZsG1laQa0TLml/Rkq9W8sHJjpw0l4Nhdd4WKHmQSC94tg6gGk+/lY6cUNFHTeiQfbYwA==
X-Received: by 2002:adf:e78e:: with SMTP id n14mr36113663wrm.14.1554125944137; 
 Mon, 01 Apr 2019 06:39:04 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id v184sm25205996wma.6.2019.04.01.06.39.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 06:39:03 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 4/4] MAINTAINERS: Add meson video decoder
Date: Mon,  1 Apr 2019 15:38:45 +0200
Message-Id: <20190401133845.4171-5-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401133845.4171-1-mjourdan@baylibre.com>
References: <20190401133845.4171-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_063905_554071_1B17946C 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an entry for the meson video decoder for amlogic SoCs.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..088db7d5c4ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10056,6 +10056,14 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/meson_*
 F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 
+MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
+M:	Maxime Jourdan <mjourdan@baylibre.com>
+L:	linux-media@lists.freedesktop.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+F:	drivers/media/platform/meson/vdec/
+T:	git git://linuxtv.org/media_tree.git
+
 METHODE UDPU SUPPORT
 M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
