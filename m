Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C32C38A2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA69C206B9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBcReltS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C/QuP+23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA69C206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+PfCSsaxl9eF4o0JYz2GPlSUSwzgmmo31mYfH521U8=; b=pBcReltSFHDkI7
	tNYNr14hPis7SZOPG6W92+Bnr1BpyXQOI/aI+N0XIw5Xea552UblYcRnSWGnTDKfemA1nGQiYGqlS
	K4PGGaPtb/lWmi9n7jpENmvkuPF3KjmXWCnUUd76+qobP14v1nitbRBbXd9+rHwxVh5v/wwYp5Woq
	/mnRhcWsvk6Xm793vYI05nXsZAb8gQaOkDSSqqNPKWFTFblaDV3RihyUdoFsd16Vv1dliBvCMM0mp
	IvvgTcTjPlZ5l5ho2cQB5r5r4h+xUwK4i/CR9pvMfb7fal89NXwu34mmNoM/cs9aqp99onR3FzY8N
	3iWbp1z3o91D8EbvX/PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3Wb-0002aj-Kv; Thu, 16 Apr 2020 12:21:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3UQ-0006GE-6S
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 12:19:32 +0000
Received: by mail-wr1-x441.google.com with SMTP id f13so4505155wrm.13
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xKsDuTS/b8pkudrA3+ZTmFYrQeIvG+CZAqBEzqZ3Dc=;
 b=C/QuP+23ba+HpXCW7TkCLHiADtwgSsIdOR+oPFOZVaE0PbyjEC6LrUNjYKBAdOkoX0
 osqaqVpT6Q1dNd1mxwgcNZpfCZeN/DI8hxpCt8iFlSS9UVWYh4ULKdOPKfxGIulRpIS6
 lyrLkbOTX6dZqJb+FGIEPJrhtZu1Ao1F9WyVqkos65EytdXOpDGsXLZ5opzfLUaA7jXF
 iSj1bmTI4mBhMTTHEpqSSVnegz3DAeS+Z/mwDHPAvZf3xUooAjMGKFbcOaF+XvmYit4X
 +lb8e0nVCLjezjWX372sIlwu8mkYooDgi9zmxHRtr7TFWKbPRA1o77sqraWbzrm1aqxX
 qpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xKsDuTS/b8pkudrA3+ZTmFYrQeIvG+CZAqBEzqZ3Dc=;
 b=rrbpnEYElyiSTokKFSPLytKw4vsfZ2g7qxypzwW9Hp0N3jjcwzWIG3+UgXiK18C21O
 Wtc/hfcgEyBuUPBRFohCNVkSk/U7mjbFm3J9/qBmO9TeRgWhOO2KYP3qXTBkENaXmfIg
 izWGlisedKOKQ7wbeQSvETV7lYPibOw4vandY2BLUqEY/9qFCLyrJJcoOqqdNv/btBEK
 isabilqx4TcUx71C0Ibjv/iCdkk+E3mv/O56lc87vB9DtnsPP/cZNh9RPdey061kQrpN
 Ft6o9VuxyLx0tJUsNkWtNZneqyd72xM4iJ8HTuXfhkcaAq7XHmDotEdTw+9WnaVCMxjz
 lQDg==
X-Gm-Message-State: AGi0PuYGHrNUu0X/JgMzjQVQo1ZuPDw1IKaQVcAEyz4JMe1r2UFgJ9c1
 ey8RFGgYtbISk3nUBWDyQnEM9Q==
X-Google-Smtp-Source: APiQypIwF3U+8d9Ho+lglkTrjPR+KRKR42tOySGCFmPymXBHdmMt4a7vmvgcXC21weI5cT/rmadK9Q==
X-Received: by 2002:adf:f604:: with SMTP id t4mr26175984wrp.399.1587039566409; 
 Thu, 16 Apr 2020 05:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i13sm22035602wro.50.2020.04.16.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:19:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH v3 7/8] doc: dt: bindings: usb: dwc3: remove amlogic
 compatible entries
Date: Thu, 16 Apr 2020 14:19:09 +0200
Message-Id: <20200416121910.12723-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_051930_262963_4DB7D217 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 9946ff9ba735..d03edf9d3935 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -15,8 +15,6 @@ Required properties:
 Exception for clocks:
   clocks are optional if the parent node (i.e. glue-layer) is compatible to
   one of the following:
-    "amlogic,meson-axg-dwc3"
-    "amlogic,meson-gxl-dwc3"
     "cavium,octeon-7130-usb-uctl"
     "qcom,dwc3"
     "samsung,exynos5250-dwusb3"
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
