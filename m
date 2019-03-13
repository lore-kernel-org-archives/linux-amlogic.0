Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7CFC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:11:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1602147C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7fjm964";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hlUabI8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1602147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfC2Ro1eSS2n8YXQVWAI0InTdk2Wxoh8ZnWAU9cj2j4=; b=E7fjm964YG0zOm
	IX4HZxuJHnr0OP7oKZ37Ss3KkoPvBdRUKW5WCnR9/4B7zb5+hAoP62s+hKCeGx48yY9YJ8zxb4Ats
	aB+3CTZrWeQU8LIHBUVoShIzmv73N+M3UJMwoAGn0RmHWZ5IGWz93VzFvpV/8ub/3Rz71d2N/Vi3f
	eIzIkFO4xyDbp771WKN0b56pTL68YRDhj0EkbF2RzVokwL5MIr864piXar1RAK2B40hTynA/zD9Yq
	FQlxlFRFyPNP/9Dkf6WehhxD6cIe9XB2QL5CfEHEOLpvgInf9v/EVyvRG7AySP+CCzvkUtU/iNdo/
	1sKwFWBugnsKbaYuLLQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44b8-0005a6-AI; Wed, 13 Mar 2019 14:11:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44ac-0004oJ-5q
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 14:10:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id g18so2182046wru.3
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4nXgViyzuKQACrEZaNMM73FqiobqxCzIwcWecm5Iy4=;
 b=hlUabI8gmFDGOfYBqEjnmf4/vk7HjZh4b9io6tE4KhLVywEoHOXMeTa/32P2UacK0O
 xgO07vGi+pPRpk8Oj96cfRr1StIai5DzguUtdGglpFsAh5C5xk4VJvs3NrFx50+Cgx1j
 CJdNaD0gZ9FKnpoM2hbTRI0bJWlQWZZ28wvJ36fy9nctmccWTcgtoKEyFLrjhlgJzZyx
 R0uEM6EA3U5HMuI60HcqpigZuPhlwRDYVaPT1lOpYafH8YCLwch8hBOaqGX307L5n80p
 3ERUfDV48YDajop4s2YDI+UK//HBQ1cxV6fLUvZzU+kSHYjiD94vUTBMiWwG6ogXE17n
 /4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4nXgViyzuKQACrEZaNMM73FqiobqxCzIwcWecm5Iy4=;
 b=hXYMg666HGXDyHRAQpj6Ryt7pRuYcAXnM8YyMy+2baHLqhP9eq1CM9xvxEQsAwi5Yc
 fggL8oC6Mwn8O01kbWKSQqAMwXnRMxlAHn052eah6TG0kPBOyycSwVDDOq0gWLKpkWs/
 XrM41ylEecLrzus6ybo3NZ5vUnK5KDXf4cWNnC1oQsnHtkNk1uXNkBJR1dD56eKpnEze
 ZkXY53dM4iHj2a3aQyrWS1OVQz2P1Ws1dQ1IskRWaXAEIMInHgBVxeIi/7sX0MGaQsQw
 KA+JNL2qnErVTxTPO3WqVdMrSVVkonhFyrxkh4BYufML0N09L84gK0Bntb+ccsYTzz8N
 ywDQ==
X-Gm-Message-State: APjAAAXpgI+1I7Q1fo9KOXQI7UvEa/iY2zlf7A1/8gQP7WhGEekKpM38
 fUwclrQPkINCoGOeDKeCbzDayQ==
X-Google-Smtp-Source: APXvYqwn1v7HjzKEm6XvEQQ08cgKKDFOkMaSpnkmgH7w7Ji8jS4tP5LEAjU4vb2IZNippocLsUGX7Q==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr28593189wrn.276.1552486235928; 
 Wed, 13 Mar 2019 07:10:35 -0700 (PDT)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u17sm37300087wrg.71.2019.03.13.07.10.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Mar 2019 07:10:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: amlogic,
 meson-dw-hdmi: Add G12A compatible and ports
Date: Wed, 13 Mar 2019 15:10:29 +0100
Message-Id: <20190313141030.5958-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190313141030.5958-1-narmstrong@baylibre.com>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_071038_216787_0499CE9B 
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoC has a slighly modified DW-HDMI Glue with
support for HDMI 2.1 and a different DW-HDMI register access.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
index bf4a18047309..3a50a7862cf3 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
@@ -37,6 +37,7 @@ Required properties:
 	- GXL (S905X, S905D) : "amlogic,meson-gxl-dw-hdmi"
 	- GXM (S912) : "amlogic,meson-gxm-dw-hdmi"
 	followed by the common "amlogic,meson-gx-dw-hdmi"
+	- G12A (S905X2, S905Y2, S905D2) : "amlogic,meson-g12a-dw-hdmi"
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The HDMI interrupt number
 - clocks, clock-names : must have the phandles to the HDMI iahb and isfr clocks,
@@ -66,6 +67,9 @@ corresponding to each HDMI output and input.
  S905X (GXL)	VENC Input	TMDS Output
  S905D (GXL)	VENC Input	TMDS Output
  S912 (GXM)	VENC Input	TMDS Output
+ S905X2 (G12A)	VENC Input	TMDS Output
+ S905Y2 (G12A)	VENC Input	TMDS Output
+ S905D2 (G12A)	VENC Input	TMDS Output
 
 Example:
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
