Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB92C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 11:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCB320663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 11:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JViUbGoF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x3Nyybdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCB320663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux4cl/ZT8N8OlKofrQCuN/igieAHCGT+7Ee9eUkysXI=; b=JViUbGoFYhakLe
	QKIQ5A+9QpwTXAIROBAzFqtAErngJw9tT/Xk/ucWkVk+S0sFEU5iImWLR3U3bVksybk1gM7E+SOmI
	APQhiP9I+xMQdw3z+Hfcz36jfp4amGB2EcGfnsv+RoY1Es3JCNbPmIdXlhruNBIEODPJwjxoY0It9
	jUpr16BtHwDfRru9ZgixK86tO0rnh7UpAIGw0wiHjTrVMfr9mQw8iz4Cr9XZHu9LPVMy+ugU89d4y
	9f9FvqQMhCtMYVp3hr24WKQ1YaHwh6F0EHg+QYsiPcMoIymEMG4pZCoymC35ue4yJm281pBFoWkQ7
	r5d8l4yVHObwfpbB/22w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lWZ-0004KG-16; Mon, 04 Mar 2019 11:12:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lWA-0003la-Ig
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 11:12:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id n2so5062116wrw.8
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 03:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huYYvdEpFxCFjP75DhKts6t3iRU+/ADtXiPr1UtrObc=;
 b=x3NyybdzJeZNmlrkI6b1h6t5/pU0Qvi5aheMzAZWqllJETTK6ngS23tCUgH9osrPxe
 w/o/zUgNwIs6x9JQlRsa2UoXcpN8mK1nzw4vYDxN9Ue2oS3+8F8DBXHZeCYhPgZEGkRz
 rDNgHobNe0eycGrwuHDyzfhFI90R4MuZ2sR9cqCYhV2C82nicP1JOsAh4ZNa1wPVPhId
 8LPH6BqydtaF8uSs35hWwGW7D5rci0FS4dTxgIB0cHaMybLB4IWxnkjN3mdPRumXjcTS
 XmrF5R3DVEg+d1xMCci5o1vqeoTTUdBuMGj7bZpQxZOXmCrDdkv+3uMrQ1IWxxCVEfTg
 WkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=huYYvdEpFxCFjP75DhKts6t3iRU+/ADtXiPr1UtrObc=;
 b=BTQCSEk9nvZEad4j7ifOBVqfYiGZL1kZyFliKzoSeaum7no1X8CTRsKFRAEoDaUIbk
 n0BrCEZH+pWZSe+rszYufQZU16A6ZFYPBlJgJoipb1pEFRk5OPgSU1KsvLfsHBZMGTqw
 evtFVxIK1BlPy72Tg7L/+jDbUlcvv8D3d9Nf/wz6mMMoytSPsfnkDmjXYhUl0ClwO0Ib
 pOfqNJWNtHKBqTrqEmFyXQWswzv4yMI/XPvsLqIxxntncrrHXxKeDIVY+xLGyLIzzsPq
 yRFY0LVNa1i2pZdFc92FpQ4dZYdemKcgCJzZiTWaT2EC/hM37LCY3LsblUVE4rJQr20k
 kt7A==
X-Gm-Message-State: APjAAAXBaZ3UF1hGjwci3AhSeLI5NZYk868Ki9jSGhpcMwkVV6Jls3rc
 EqLg5ZKUwmW/ObE2rep9xtsNSQ==
X-Google-Smtp-Source: APXvYqzzRcU1AKZO5QNzCT9OrAGawWovvqVZkdbXE6YzUzywV3OWLgRwpwFEt6fmVR1TUnXthT3qVQ==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr12067852wrx.258.1551697940971; 
 Mon, 04 Mar 2019 03:12:20 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x22sm37727402wmc.19.2019.03.04.03.12.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 03:12:20 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-iio@vger.kernel.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: document the Meson G12A support
Date: Mon,  4 Mar 2019 12:12:16 +0100
Message-Id: <20190304111217.882-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304111217.882-1-narmstrong@baylibre.com>
References: <20190304111217.882-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_031222_641211_CC228928 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the documentation to expicitly support the Meson-G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
index 325090e43ce6..0d134e0ac600 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
@@ -9,6 +9,7 @@ Required properties:
 			- "amlogic,meson-gxl-saradc" for GXL
 			- "amlogic,meson-gxm-saradc" for GXM
 			- "amlogic,meson-axg-saradc" for AXG
+			- "amlogic,meson-g12a-saradc" for AXG
 		along with the generic "amlogic,meson-saradc"
 - reg:		the physical base address and length of the registers
 - interrupts:	the interrupt indicating end of sampling
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
