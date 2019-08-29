Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEB0C41514
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDEEA2189D
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7I/y2PR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iUy5GOB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDEEA2189D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeylWwWq7Esmw67YP/mekXltMw3HW4kILz+1RFSDJs4=; b=I7I/y2PRS/kcAC
	TicOL9OXhh6vYqyoze8+BiywEcm9j5AVvXydmRxa51oItqMLv4QXXBdWTxPCAP62G2SE7Fi83kehX
	QEJm3DWZNtfZbGx+j1K9QioHk3JDA/kAKNr6nPxAxZHnBfJkT9IeR4Ej86XYa0GqBfkoNKD+7HHlo
	E9+wYHplDt+1pChaKYbJ0M17loTi4tPJLFEVRCSGxBfzMFz1UpMlTKhhHV2BhX4gtHK6M48zhkFJf
	nQjs/WvvgndmteZ+WwIDrhgsyZVXTKh9nKBj53TmzlhghX4nyGsxvQ7BagetgkMr0Yj/CWKq90w0F
	K3Om18LUfZiRsmbQZzNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3N6M-0006he-Ho; Thu, 29 Aug 2019 16:16:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3N6H-0006fA-TZ
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 16:16:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id y135so2422979wmc.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRSXXM/9Hjh3g9tVzGv7Uh9K2mMpn/F7sp2YRf04TcA=;
 b=iUy5GOB3ydrfuUnBvxT0tgXebasbWCSqGhJqfY56RSa1bYiL6CrKIwTIGnjL9N+9V0
 xNWVb1yd8ku2sgZdEh4+UVeKVpLO6IebJPqa1VdcThqBj76hW2CO5SGwA1TSWiOLUKfc
 2I9J80oDABJi/ub5Ee9F1swJWC6OJMeCGJppcKQDkzN1oxu0XlWjkqsAJouNwC3eSaOq
 uXzxgM/xeh9F1v610PmBCiyn2ERPOM4eaJpGNByq/I6o5SERnIHEYHH/eqqNBqmVcklC
 FRcXpd2ZBj6QQg7btuMBudGmHlgZdZgfM0So3yd+rHTqnTHb3hNk42jdUpNsL7/wzwix
 Umng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRSXXM/9Hjh3g9tVzGv7Uh9K2mMpn/F7sp2YRf04TcA=;
 b=fgevj19FWLov1U5mAWw5WaTaW9b6gmUqQWqOs/0emhz0pYK4DruGGC48NSgoYdOVJ7
 KyaWdeIuYpXlRo89sG1yS5E4SK+6T1eOTMsaIjfaS4naoxx29RF3P1pSuyp26J2TcxsO
 aQICSflNBELWYyYoFylh1h0VlpqRtXELXMDNBbXQWBDO3qKNZGZ/kihLsdxJKf8x+vIl
 9uHc/L6m5Dq5LAZdLYg/t3LU62XtqXXYtHKp68t/7bsumQa/3OsiViFNUQaqAZzbAnMY
 rvfPAPGjFRmHnnLkTeNSsVfS8kF8E3DTTUxZs72Q/P9VfuJHR1l2K4zabovezjM4uB58
 +SqQ==
X-Gm-Message-State: APjAAAUTBbA6dd+35GzrJd3v+hfMe6jTIasnIiJbiXznwwVHVNUxiqEj
 f1PGdsmL7X3bO5uB8/QUoz78kA==
X-Google-Smtp-Source: APXvYqy5A2xGzz3+Z5BYXuI0TCEvUQNi8cgwHdW5HQMj/N9nGUuBDXTkjcWNpsSQK93sO6clm8gUMw==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr5053414wmb.118.1567095400557; 
 Thu, 29 Aug 2019 09:16:40 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q13sm3915424wmq.30.2019.08.29.09.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:16:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: new binding for the
 meson sm1 SoCs
Date: Thu, 29 Aug 2019 18:16:34 +0200
Message-Id: <20190829161635.25067-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829161635.25067-1-jbrunet@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_091641_954504_A43551A4 
X-CRM114-Status: UNSURE (   9.62  )
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

Update the dt-binding to add support for the sm1 SoC family in the
amlogic GPIO interrupt controller driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
index 7d531d5fff29..684bb1cd75ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -16,6 +16,7 @@ Required properties:
     "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
     "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
     "amlogic,meson-g12a-gpio-intc" for G12A SoCs (S905D2, S905X2, S905Y2)
+    "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller.
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
