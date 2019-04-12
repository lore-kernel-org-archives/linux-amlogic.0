Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55726C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265002084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ab07p0aJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fy3RoTXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265002084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMT3lL3sSBl6zLmC5OgjMmIUCoDdvIL+1B5szdNnT1I=; b=Ab07p0aJoe571E
	V9qY0UbQxEsJe2OtuoMDZbqIBozmp/Kqvikz6brYR79nsdTPeiRhZWdUuP1U+Ny6OxKd1bIiol6sp
	nf/b1emUnbRvUDRLiohu0wdZnHBBDNI2y9Zh8C9iyrEgntFeQMKRABZ1DYHSePuMy9UtLRgZtuOoW
	Bs1OD4UZpu28ym5+6bPDCaJxiJ1ZX37S/c7OZjJTyK1hQemx5AMzARuwyk95S43un3IY2Hq3EKuTN
	EcQA7hHyCVOjKM4so2gfmnPTLNg0h3OsW9Un30A6gfzV/6P5THL5YgLllE7u4MAy1YYujZRBeJj9G
	7R2C0PegFpXXTW7o3lVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hErhw-0000AZ-Dh; Fri, 12 Apr 2019 08:38:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErgi-0007I4-DD
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:38:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id s15so10788742wra.12
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
 b=Fy3RoTXHOfIphsoVRbycuck6xBsYY9s/XsMC5pWDgNoHTHTIz/4JQhQHoXcNYUkVT3
 0Er6Qc99i7/MH6OQYMhu2ECBUmIBF8QkVgzyYATCjW1eaK7TRfrBkTTZJjtnLTTUvYtQ
 gaajc/dpUp+k9FZCq4fPCV3LIdgpZcLIA7a5W1lLsqmO+9sSlxufZ7jMkTvIMiaL6+gQ
 BDl5Asz22ssLvQGZtEXSGi65ExfkRbqfGByLrZ8XgM2PY6/WWT2oqqd+XBTXr8cbhGUr
 Cb6m9xHV3y9l6TTH88EE+iy5hymR7a4J6dVjNkF7MJ+zHkOixF4+L/aYxiBXhJ9jxtSk
 02ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
 b=mapObegKXPOTwjOrGE+HpgXc9bBOewUY+sVQteORN2OGgJBtH6esqJ5cHKc80rsqNX
 Vl2C7J0348xM6/CtQDDTV+KLFjRfL5xxBrhl9VdTUuqjgQDtWhJp6xnkpQkTb2FGhRcj
 98epFpajpZW27JkjGoCD+Ytsj5ixzgDjWEsykelbzMaXcgj2a8k16UfYNIVE96+tOdYz
 YUJPKa95MaQZRc293u5T4UU+S+1tHxqPIA4esremM7FKD7jGUrwlonzw3o9h66wc05lG
 mNArhOCzaxOVrisX8fCYwW1JF6k+vb4oVsfd7wEI6/+QCf3pS7A/XnyLGFFtcAYbf7Oa
 XwUQ==
X-Gm-Message-State: APjAAAUV8epPz8UnzhKPL6hkMU3cojugh54001PwglsmRG+6DaKdJkw9
 KXeyEHzaGuBZ3YtGkfS89h9Mfg==
X-Google-Smtp-Source: APXvYqwxR90llho6BB+ndulftlM5xpQnYNt7iul0lf1qAW5CgrelTW1M0uT+nsjxR/qEezD1H6cRPg==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr35007970wrx.4.1555058250988; 
 Fri, 12 Apr 2019 01:37:30 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y125sm12124318wmc.39.2019.04.12.01.37.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 01:37:30 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor
 clock ID
Date: Fri, 12 Apr 2019 10:37:27 +0200
Message-Id: <20190412083728.21029-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412083728.21029-1-glaroque@baylibre.com>
References: <20190412083728.21029-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_013733_146619_D191D2ED 
X-CRM114-Status: UNSURE (   8.38  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..85cfcab10507 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,6 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_TS				203
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
