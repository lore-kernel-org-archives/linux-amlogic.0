Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818ECC04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A242173E
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTJ3RmC2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZdzRHhNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A242173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJckMNEXlCQCVxjw5rgekHU1QXYeWOl9EQPZhZ4J9no=; b=NTJ3RmC2T5pFKj
	sDKRtLAck6XACTYKMisGlLB13CRHYEKT1AUGjs6Ru6ZYTdNz08NVaKDnhSqNTk2/uyJE09CVL+sC0
	CsGNZKyRYw+PMtaRUvBUq1GdL08qPZr2w00i6PXfhJ5+cTiSrLLMOrHkXE19j2w6MP/FTwwaiL0iY
	iYBkpnktginvq5rhTWcsSLZg1lw/ODixI87dt0e/AXocdB4LyBCaIRe/GYwV4nUDl2WC/oH3R8+3h
	GbG7iUmW7PsSn6NVPnRJXciyhs0GUJD2TAf77x5EIUYU+F8tTM7zCIVchKRIAiDLDNwaeaKRIuWur
	ICJzLHpIn7eo1unvCtmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT6Yq-0006os-B0; Tue, 21 May 2019 15:20:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6YX-0005R4-5r
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 15:19:58 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so19045846wrr.13
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhkCArdSYp19WRy9pHtDkpRiGu4ocnCtsFxZgKHOrQQ=;
 b=ZdzRHhNgFLRHQR2KIcm6dzqe1zFhhkXiYls6dlf6D0mkFq02TpZrZ2l+l4r75FvB0v
 m4JTBZwT8qCdcC88C+fXX6a8njfGpjqV9qvC0JKB2cddv12E4/a8/lAgFsVFSPzQ1rBR
 ZXL+sA089J4vbDi/TfRsJXTWmnzY2bOxPWFxnTaaF5fLuf+ZICJ7f5x0LsKUyOL545JK
 XgbN8tMu7pvfgSSACiloqxRp+TQy2HQq2cGYLE11rSl8SWGkOqxqKfdex0fPdwgW7ihJ
 2RG/iudUEiUaVpyAU0wOUCv/tL1kzCqe1EilyLOC3uMtPMPXyteLlUMS4TSRPWihE6ie
 Iosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhkCArdSYp19WRy9pHtDkpRiGu4ocnCtsFxZgKHOrQQ=;
 b=JtGpR8WGH93P79ppv7dH9GaOmY8znBiK/Ub124grG8MQv6JcTMmdl53o9dRRJgQkBs
 cllhVyB1HwtzAFpjzexQzVQiqbiE5o+koUh7EtMGzbS30Gs8PtEFq/83RZs2yOgk/cCh
 OeyID4waoRfWD7WukMp2b1fn/iINxRou7f9O7F+vsV/j1L6OofIv2Rmpxtx/bvStNr4E
 p167VKG7BpGC1IdJSLtdQ52UpH97VVvrVd9xDBHqARjJWryaMrb9ERJQluU82CwESwLr
 RUQJdbxJvN7wXKPlaayqaGTdKSGU5pc0m1+buPWiXol5lrBpx7kf1mCaq/md5jadw8Os
 UTGg==
X-Gm-Message-State: APjAAAWL5y+kSmzbW8mWbidpsFExg1SnTmL7ntj0KmxC8GsgzUkYWQ3j
 WMC5ROpP7kGzfBJCFenWD5M/hA==
X-Google-Smtp-Source: APXvYqyRX+GLakjFp0Eh9cc4c2GsZ6BB2KNHfqbeBehOMfsXhgM9oc/3OwNRrSmb43o1etqmgBN0Nw==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr14666829wrj.230.1558451995591; 
 Tue, 21 May 2019 08:19:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p17sm3945677wrq.95.2019.05.21.08.19.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 May 2019 08:19:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: arm: amlogic: add G12B bindings
Date: Tue, 21 May 2019 17:19:50 +0200
Message-Id: <20190521151952.2779-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521151952.2779-1-narmstrong@baylibre.com>
References: <20190521151952.2779-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_081957_213420_E0C0A407 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Rob, Martin,

I converted the patch you acked in yaml, I kept the Reviewed-by,
is it ok for you ?

Neil

 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6d5bb493db03..28115dd49f96 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -137,4 +137,8 @@ properties:
               - amlogic,u200
           - const: amlogic,g12a
 
+      - description: Boards with the Amlogic Meson G12B S922X SoC
+        items:
+          - const: amlogic,g12b
+
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
