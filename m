Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D6DC10F00
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78EA2075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M95cWz4K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DB5B43lV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78EA2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/86G1RH8Oj5JP/E4fOo93B457S+k5yjtRk8+IOKStsk=; b=M95cWz4K74wEp6
	d7PLWl0mboNaQQkqi9LwdJRFHWXepqW9QXN25iCnN6L2/+rpG+IJ9XLYoFLQWb5sK4Bay2xEQ9R8n
	3SjIdNnzEQ0YpWbMJtOp37xNXyrSLvmlTZBMLHPqcJQhCSuDyssvTmak+lz6P/zZsWqiqWBHZSoRn
	WKrBHDWlBRxUFmbdDLvppFfGNp8RnQZsKY7mUapaKKyGeFOSkrrkno+7ZN0CNmX5pbuzah7e91eCL
	b0F6w2g+x4USqKNMMazLkTFWNpL0snZ7XDOnmpc8cCDmRmB1gqn26eiDgUv+sbHH1R9d3vehtXd48
	oR/u8pJgd7MNT+ZsyW2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95sB-0007ze-6u; Wed, 27 Mar 2019 10:33:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95rt-0007ep-Cp
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:33:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id s15so17868338wra.12
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gp5xnfcYqxDRaQuohb65UiVl+ealJY+xKv+LZ1d7Q3s=;
 b=DB5B43lVarscconbHiOQ++cbHEiMgH4cV91ofWi+0UHqxqHQcKEi81JzLPhTyVWoGh
 rti8A5Un7bw+jQBnMhxJnb02T/ol9to83PpCwlOTC2cXYm0fWZzJaGd8n/ZeRtmQAOYz
 /UADmMLz96Cjby6iBOTcm6fzbWxEVf5SNqBarptR5n1EtvA6czlhEI4ZsBsg6t9o16bB
 uHy4cm0cvcj4zQuuOJYLieZOpmOuwHOxw2Nb+xwMbYK5s0KVP4bfV4jh1574GPErICtz
 Gdit1eLiMh8e90AdeEulAM4wpARIYHKs3RxgwzWa0ATvY7v84pRNiqTPwTfZ8cxzCHNx
 1TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gp5xnfcYqxDRaQuohb65UiVl+ealJY+xKv+LZ1d7Q3s=;
 b=RujIIqMMt3c/W3pDo8PI0HBbAk0vPdjZjSrzO1T7C3ge0Y7zwfQAo4R2XA+Ot1PhEA
 xCO4PvkxUTpN7VRefvLoUedeYWCZMmw5ynAPu2uUv9NXqOTDBPf2KGk5cFUnIsTRYI8w
 jKqtfeDn1MmJHALq+NMrOr7VJnC+NtmCOFyoMwJofTIaqeblLjTmy6xrYltmqbX8oyXK
 s6fNgG5fAGJrt22wMFxWgVhZk15DGmQj/9TbKHAtVKI5qyQuVAhy2WaJpG0oJkMk65fq
 64IRv/2MF3JqXAUMfYrMfkrkd8tI4dwDTTHZGriqQ8h6XlO6jnbt1Cd2Fp14paws6YKf
 Yp8A==
X-Gm-Message-State: APjAAAXhtI/qZZ89NrOpxkeu5yUi1PS9bLhnWdxrT9yeluYFfOGNqIb5
 e2GzKQh9Dpsfim+yc4lqZNg32A==
X-Google-Smtp-Source: APXvYqxSvH5WMfEfbZh69CcLpeULI6GlPOCq+xSQWPOKDTw1qbv9iYMJB+EM6PkMbFweRkJWg9d8oA==
X-Received: by 2002:adf:c809:: with SMTP id d9mr9386275wrh.304.1553682791164; 
 Wed, 27 Mar 2019 03:33:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:33:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH RFC 1/6] dt-bindings: clk: meson: add g12b periph clock
 controller bindings
Date: Wed, 27 Mar 2019 11:33:03 +0100
Message-Id: <20190327103308.25058-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_033313_462536_E57ACB74 
X-CRM114-Status: GOOD (  10.45  )
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

This patch adds the specific Amlogic G12B clock driver compatible.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 5c8b105be4d6..6eaa52092313 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
+		"amlogic,g12b-clkc" for G12B SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
