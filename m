Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2354DC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 14:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F6B22AAB
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 14:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5sPmVwP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t2Noy8y7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F6B22AAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QMVAQiJtUNzB+JVfHsB2l5EkVIyl2PbIWsdJD3SPoJY=; b=H5sPmVwPCeqqu9Vp69sRGGHGl
	KAn5+EvGQ4t2Q2IO6CPjLcAC69S9gEutqdSZuUlS2wC8kAp1LMdJDLlt2h12d2M3DK61a1yUDB+us
	OHlWCsZno1RXh//o5Yt7h6lIsIsBmQFagr8+vVtZ426y46nIiS9MMe8zNPIJQUwBsdQc9gqIpP9Qm
	4nKL34uxclD0xZlunqnKGE8uZjgFd3w5OZF8T1lvKE0TCDoA11XJcsA+zPdC2NN7Jdaow2/iis4aK
	4pBIeipePp8X3LD1FsNnpFH9j0n+j+2M+gJCtEALYd6XSFXlqTE6e8ClxwwkiuF0JRheir+9EZBye
	3k1nJO+CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIBpr-0006S2-6a; Tue, 15 Sep 2020 14:21:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIBpo-0006Qr-GI
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 14:21:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id m6so3580408wrn.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTvsmjEM2lW/ZwZbzC+TCSlbB+G1GjCjHr0oK7IJyxs=;
 b=t2Noy8y7o+XObToSQaHOp+GXTJXFcjePrskT5ToMvKO7kgZbM8U7Q/uTMW/P3FhT1m
 mTDGe0GdM7OiGcsJu0bNabxHb6DWuGLaYggRBUpEQgT1Jk9g4GEVZZRKr1jvDtTNM/vP
 6r7H3DoeUQSiHMFIbCSvEh12RwAqliWY5FOL5JTH6NXPcP72DxKfC/U82QrDG+1xcO4G
 aePtQwdnZJni2zpFJBGN3hvbUa8Yx6uE1dxhPQPVq8SHy7pqF+2WMm0EbB1TDED7AzqK
 GZMDkdlbnPYl9fD0elNRRO38dgr0ywNsY/S0lqM1wk4M0DRnDE0WLpTOiraCTAl258pr
 79fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTvsmjEM2lW/ZwZbzC+TCSlbB+G1GjCjHr0oK7IJyxs=;
 b=Ug5y6GbxzeuEja8DHIlUjoKPxaBQMCl6akTs2VahA36LomYil9fmP4QINZyQJbOJLZ
 YzGfe0a2G2HdpALlXjX2k2GM5puZauuCE3A/ErqRXR3SFpBH6bIWDrLN3lSNaiBKRGpO
 xxfb1pFd3Zbsl4cQ4z3dtwMUGqWDHHb/Qe1KiokeT3iUo1fFZvdSVklLSbUXtYuTVy2F
 g0O6wcl2texy6N6i49RQWKZQsvF5oztUrqrvDEik+/yIp3OacJyPvR3ozsICjEZbOUs3
 19BLTZARVu+8e0CLMd8NFh18tVB+eFMX+i0lKaZvBXgIILp7W6G8x+N3CpefCIOl3q06
 NCZA==
X-Gm-Message-State: AOAM530gcHaRN/RuYKfwwwIRRglJSqBGJQSV4mSBsr6fzRuHvv9qPsQv
 /VTGgpjn7C+utloa05wFZqK74Q==
X-Google-Smtp-Source: ABdhPJyjl6rqOWY1S7WLDZu6mXCWM0Z4pZdx8q2N5Ha+62OK1OtJ0l6bXqTFP10p/0KNziTp7BJZqg==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr22146078wrn.228.1600179687587; 
 Tue, 15 Sep 2020 07:21:27 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d2sm27821482wro.34.2020.09.15.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 07:21:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for libretch s905x
 cc v2
Date: Tue, 15 Sep 2020 16:19:20 +0200
Message-Id: <20200915141921.57258-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200915141921.57258-1-jbrunet@baylibre.com>
References: <20200915141921.57258-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_102128_545049_526CAD6F 
X-CRM114-Status: GOOD (  11.93  )
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

Add support for the 2nd version of the libretch aml-s905x-cc.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5eba9f48823e..1c29d7ff8edf 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -96,6 +96,7 @@ properties:
               - hwacom,amazetv
               - khadas,vim
               - libretech,aml-s905x-cc
+              - libretech,aml-s905x-cc-v2
               - nexbox,a95x
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
