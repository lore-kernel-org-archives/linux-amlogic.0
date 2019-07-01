Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BC0C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:49:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E51D208E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/HpVsQW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VFZrfRQ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E51D208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejQECBv7dFXP5eLnbLZo1/LMcrMC/4tYXoXMNhJrDOA=; b=K/HpVsQWSOkhQI
	J/ZN3qnxAtwhMDy2LcPKychojW4fv/XAAgf/akNnEmcAVRd8w5yiKGedzcxoYGoMuj4jOvjPpjpZ4
	VX0zKs2iX7x1QcwxPDDXSU91leUcy9Q9sgK+f5zYagnYzUIJiAbNz832KnqPKTfjs33EPnzSQCdbb
	Vjt9bo4kJM0uYdgHRzGHwhLbwnOjwRmIKyxf8oF4KeQomH2xpabF8xf/mgBZR7ufQNcKSBKMOtMmM
	90J0/x2W7hN7nOr5nY1D0WYSmYgXO95pW1Id/WAw6sZ5nrBQpeDCxpFMXc1nFAa4pY4IaJZYYzw6F
	3EedUf8Mx3EUQz4fpvzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtsQ-00007b-Fp; Mon, 01 Jul 2019 10:49:38 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqP-0006fU-10
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:37 +0000
Received: by mail-wm1-x342.google.com with SMTP id s15so15357194wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHTJ257kdPP2T0j92u2xSaWnQO7aRf9hGbv+c9l6pxM=;
 b=VFZrfRQ1F0iwy+14EMyBHVHHM3dPYVsVYIq1rXoHN6fFnW+W8hmKNQ7soUw1ak0be7
 4691jHA+qEJU4qfw4xoKufSACls4wAxo2FRRQVWIWBM7kb4Wj0WVCiEeYShwaxUqsK64
 djk32jQQkE4bSOx0OpOS//c5qraxGSmseV4lHJXwi/MvzyH4LnhqDOOditZlNZNoXw+J
 ym+9OuFBbWTsqLWsCo9ZKZl8RqknErs3PoeM37wlrlDbdVgGMG+iU466lGUkQzPHmLAg
 WtPtyfs+HUNdr1nXtcRYNMNEUQ0DFJ2gcSUdyvShP+rk+nIAqthppc1dQgVk97n61bum
 +elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHTJ257kdPP2T0j92u2xSaWnQO7aRf9hGbv+c9l6pxM=;
 b=DtgymdQaIpFG1Vu5Or5gEO+pXHLZiyaTG3BDolAQPaGmHy/7yUUtLbUBsj8JlTR4n7
 OpDx76y6Ou1blytugoHrgE2L1SoaCQ1FY1nLKrMzqE1d5MdBFvqgV0F6BsVhFZiblp5T
 PlUl3HtWQbPFQpPJ4z6/Wme7J00gOszPJICqOYm7HZi3KXd2EBEucemPHlbfQPxQqdaP
 S4SwPNWiMlYJfozrwwcYSLIu3gKDg3EXuFZ9hUEYtqryYc2L4tRUNNWjwO0xNwVt2qkt
 b5VQHFRl7m87QrdDXLggRMWyJacyg6E/Wr8+yGZizFeo/+L/jvWILlxRDyKzvAd25jmC
 /wPQ==
X-Gm-Message-State: APjAAAXskDyAgBoqDV1s/rMJLlYO0q29trZ6XbDzvLc5z/sN6RRqWl7C
 JlWco1GKoJTvOaacib25fVWr4w==
X-Google-Smtp-Source: APXvYqxo4flzhYOz0OrHaqCdbrMX3sdAJGvFI0sixUo7zYPrRJ8p4Kl9rrP13WwllpyHoZzl7aNzDA==
X-Received: by 2002:a1c:9cd1:: with SMTP id
 f200mr16321534wme.157.1561978051524; 
 Mon, 01 Jul 2019 03:47:31 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com, khilman@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [RFC 07/11] dt-bindings: media: meson-ao-cec: add SM1 compatible
Date: Mon,  1 Jul 2019 12:47:01 +0200
Message-Id: <20190701104705.18271-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034733_187500_7474ED4A 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add AO-CEC compatible string for the Amlogic SM1 SoC family,
a derivate of the G12A AO-CECB controller.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/media/meson-ao-cec.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index c67fc41d4aa2..ad92ee41c0dd 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -5,10 +5,12 @@ to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
   - compatible : value should be following depending on the SoC :
-	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
 	"amlogic,meson-gx-ao-cec"
 	For G12A (AO_CEC_B module) :
 	"amlogic,meson-g12a-ao-cec"
+	For SM1 (AO_CEC_B module) :
+	"amlogic,meson-sm1-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
@@ -16,9 +18,9 @@ Required properties:
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
   - clock-names : from common clock binding, must contain :
-		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
 		- "core"
-		For G12A (AO_CEC_B module) :
+		For G12A, SM1 (AO_CEC_B module) :
 		- "oscin"
 		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
