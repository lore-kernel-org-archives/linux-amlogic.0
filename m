Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B415BC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F309520717
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="05UeZbta";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fK3T5zpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F309520717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZQ3nYZ5vZH7Q5BJXbUEOsYjbgnc+OY93kaoslhAEYo=; b=05UeZbta3zk374kfv9P4BZGWF
	lgq3rbzHLyTGZV27cELks8L7uYCKbukuxAUcQHHLJAblfoI911JSRsVp27bNVazj208PmEtJVFyrR
	IwXOHB+dV2TLR9tYN1eX86HCfIY1C/ER4UXEA5jJa5NV5FQn77vK48phUXPjDKt8S+6nqgKS6QUGy
	l9b2FQDlshnzDPWomzAKntAMLHbbhgD8+wDdAyiF/9/QrId1VU8uv2cJCkcaey8dx2pO55SSt28/B
	+eJcorUNhPtc/kYQecCiAenWGZuKoLhKTZZAma1gaks/JH68ui42zr3BDyUB8Ilxh7g3Plp3bMXUM
	Aajp8Bv1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khErL-00009X-Cc; Mon, 23 Nov 2020 16:38:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khEr4-0008Uw-QG
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 16:38:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id 64so5822012wra.11
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 08:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
 b=fK3T5zpNtdFE4qkfblQOvZutqPBlD3t/zRsxTZQ1DwegYq6O8j9idVvZDz1yqtrcIw
 KdjNOyImu+9ASuREdRApBcfK4GceU5+rZc4trGbarkKGPCMrOfppVKTEILzXEXeQ32CF
 boBBiwmAwrUPDYsp/5HG346RA/4d3D4vDepKpYifN1th2mmdv2N2UtF1odHVgGVmInVM
 7S9xizR7ziJn5nEyqRza1QdDg7jIRZyHlcrvToKIy100osWsGDYLRAHeDk9fn+5Z3x4l
 ovGYm5Vu1NrbTGKgrJ3yB02AccjBmSFICqWs//Rv/QwBFJdf5Gg4RCgBp4Rbc9wGSoAo
 rKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
 b=dEQHdxh5/gdKaBpYWYBh6OJzy4autlJWZjVLs2fRjbDr/cP7WPDt8KjpBzl/ptacIX
 G7OBzHMyag37gFqsNkrW7u4zvE3DwdchWtdC5CPDTEUwhfhBLjr3186xVIRUBO4Hwykd
 taNbm4E5ssNlSkMnu/4/K91KV3ejt9iDY5j1A2y9U8affCoNa1p7uo5PbgV7sLA7qTUR
 l0x7q6YaSa5f5BXpTJwXuQpda7vhzqvaBYYLJihUvmFqKBe0AuCUm3Tgy0Jyxccnjckd
 NE/PSC3yCeJAlFWOLnWGU7t1frYzKWDXhwZw4Ks73jqNe44UheGN0d8J/SXd9uMlMUkj
 81EA==
X-Gm-Message-State: AOAM5309tTvfmSZnYusbSzky7bg8ZVcgfJqsc10JhvHFrLSTp+F6GNs+
 SoBDLKTvDNpmCqu0J4iNalxv7VL+DxNI/d1f
X-Google-Smtp-Source: ABdhPJxZuTuVAK9+n55is+GQzAN6UGY9JgbVtQ0zjEb8LC2wK2PgJkVpOv+zzDtsyXTi0up/sHeVKA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr491465wrr.423.1606149497579; 
 Mon, 23 Nov 2020 08:38:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 08:38:16 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
Date: Mon, 23 Nov 2020 17:38:10 +0100
Message-Id: <20201123163811.353444-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123163811.353444-1-narmstrong@baylibre.com>
References: <20201123163811.353444-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_113818_891325_2A15E7E3 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the MIPI DSI Host Pixel Clock bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 40d49940d8a8..a93b58c5e18e 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -147,5 +147,7 @@
 #define CLKID_SPICC1_SCLK			261
 #define CLKID_NNA_AXI_CLK			264
 #define CLKID_NNA_CORE_CLK			267
+#define CLKID_MIPI_DSI_PXCLK_SEL		269
+#define CLKID_MIPI_DSI_PXCLK			270
 
 #endif /* __G12A_CLKC_H */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
