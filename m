Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CB6C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62802189D
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgy27ZEO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WoMSFH+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C62802189D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZvfJfbx4/0OSyNBC5ItacG8LaBbngJ3+s+Rb8vL+2g=; b=mgy27ZEOJwEbnu
	fNfxgVemO2zg74lkqO1fJmCvqbFqGECHUpbL7J1Z9g4lJbDpT1Ynbh9634583W28yI6UG/Z/YLsS4
	jhmUS70qykR7F5E1gDZAE/RZYffVrLw8if7SiiNjFn8PjfhHbIIFuH1CbK3Jhqh3oqcIeUu8SbYxk
	Xj/q9mHkGjlEN+jaqO0/J6E+cL7BaA8D4bbdL5XSjOGL7LH7DkgjCnkEPglOcNZpLs0OxKtDZuQQc
	Lio3ssXU1rHC0mEguvowjHT1j84iMe8viKPYUkKlrGCOGaE2BMxYItUDOSfBSPQCo7ZXk/W1Ek5zx
	NCxULYQ5A2dXfb8YoRvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ymv-0003UL-Hg; Wed, 28 Aug 2019 14:19:05 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2ymD-0002j9-FW
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 14:18:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id 10so247482wmp.3
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcL3AvqHT7bRzBjlZdaYirVmcHrrTcNQrMrMxpM5Yus=;
 b=WoMSFH+jbYdpYIJW/cgs8flobaRwChKfAONQD4wALEJE4gjSTlGakMSVfTGQDWzyV1
 9rXkwTT5x8+p/jqtsNQq/CI6RgWtLm0uAPtYiaQasGq6yOm6HR+GcHa/TeY97+4J5u6J
 /p+vB2taIXzf7Uuuz10JcpYmv5J6FJ7IeI/ye2w5TOHnhLqJ/NJyhU67GOquPMYWNZPO
 BS9qD7I7a4hyiWR7DiY+U+X8DK8PRSm/gNWUNECJXfVFX0jUVTyTyiQlaxsf3a+enRkq
 D2X82syf5DJtvmSeJydBaMGuD1AbP0YRdlUQeNf0y7wofl19LBruc8DtHC7oN5vd2kGC
 ivgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcL3AvqHT7bRzBjlZdaYirVmcHrrTcNQrMrMxpM5Yus=;
 b=TyBVCxAJR+aAvfLASZZYIdndM6RiOe7+gL0k/1ioAvkcYnEtOPpX3DqBaOMLBludpp
 +H5Er0HDZC2Owwb4U0PHVQVLwVju8PTfxw+57zCBvVzScLCum/sSo1BE5M0LBsH9m5US
 8M3fTQqjnVoG9aoYin+CvXtfr4bjvFSpbeaLZ88GVMCxFQYkRtiDJIuQ1XGIR9ms36ph
 SctfkxteihpMOEO3zz5cxENEAm3HpeOX2xGd0GLuRjMHpH5HuKm7Exweewbhl2aYkyNb
 iSVygpeoL4nMK49az+uW4uqPmrLqt48ZsjC2PJEtvrnd5C5AcUB5u5+fLT9yo41PYAMc
 G6eQ==
X-Gm-Message-State: APjAAAUqHiZrQYev0wX8g+tALUj7Mnxtsg1g4WjT/X4/LkiP4h2bf3Xw
 6lFpRQCI6wBe9aJ5ZchbuiyHsQ==
X-Google-Smtp-Source: APXvYqwn1R9gYJiKlQU8k/I2epaSnpNLgXrnH+gfIwXHbGoEEGtTexblMHvFit2KgcvAsHLnTvr1Sg==
X-Received: by 2002:a05:600c:2487:: with SMTP id
 7mr5302979wms.141.1567001900084; 
 Wed, 28 Aug 2019 07:18:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u8sm3022354wmj.3.2019.08.28.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:18:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Amlogic SM1 based
 Khadas VIM3L bindings
Date: Wed, 28 Aug 2019 16:18:15 +0200
Message-Id: <20190828141816.16328-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190828141816.16328-1-narmstrong@baylibre.com>
References: <20190828141816.16328-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071821_513807_ED9D0150 
X-CRM114-Status: UNSURE (   9.86  )
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

The Khadas VIM3 is also available as VIM3L with the Pin-to-pin compatible
Amlogic SM1 SoC in the S905D3 variant package.

Change the description to match the S905X3/D3/Y3 variants like the G12A
description, and add the khadas,vim3l compatible.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b48ea1e4913a..99015cef8bb1 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -150,9 +150,10 @@ properties:
           - const: amlogic,s922x
           - const: amlogic,g12b
 
-      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
+      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
               - seirobotics,sei610
+              - khadas,vim3l
           - const: amlogic,sm1
 ...
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
