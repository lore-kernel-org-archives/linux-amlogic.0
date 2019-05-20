Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B1DC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53D7206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sBLn5d0s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MQp1WuNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53D7206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxpOjrALoGUu8D/cLpR2lvMdQ6pvfBxsCrdnagxFvZc=; b=sBLn5d0s0pv+MB
	5pulvJGbRb7p7z9GBjUBkdiGtrVuZg3X20+SYsHbxV/ugQPPwQrlqfHQKkqp7FI3vNJBohZgKRWJB
	LhPtJ07LtBvTAgZ7HcQTT6FdARuqnlTszeBhNLoIp77UYvxKzDIl6Cgpz3pOukJ2KE32U1aq83qpV
	diwrvDJMj1j+ddT17q+pvvxIrafPKz8+vwTn3FWLpN5JK1Gr4iTBX2h7PrvA2KtZvGNf1CtdJv5VI
	7tM/1yPeJuqualwEBBPzcJTP4Z6MPuOaG6/lF2TqCHVqsbdfKS7v5qXSWANDwsVLaIvjwRvFR03he
	rJMMQeLH2QrcyAqSpOsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoDF-0001a0-Po; Mon, 20 May 2019 19:44:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoCf-0000mV-ST; Mon, 20 May 2019 19:44:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id i3so538445wml.4;
 Mon, 20 May 2019 12:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYg36bJkUAGqrs6RcoppkW6uHqR+c6iAwwtmm+SF24A=;
 b=MQp1WuNCFJvfPVgPWAa/hBKKkjPR1lPrea/FUxe7vACI/kWv437nXBEHZv/6UJellY
 1Eq6OKYDbWKX/7jp048kyCjTrQrLssBZg/BTe1w5ggjePsCh/9ytffWIwyOlhmG/dnMZ
 fY1i41SLm3XVeJlCsN6TsWS0jbepJ7biSuwXvuBSOF/3BymHyafaXopDkQZ8cUd8TapM
 3Nb7RUS1hV/ArkTGVQ6MXocKAGALtMqWT+XJnyAIHoWoaM/B2i2NKU/A0h4kod5WHA5/
 1Z9RzW6jqYXUZJXG0s/s0Ah61TFsHeKjEEDsDxidKGeaFy2OighIX13Eufp+mAGOPa+G
 7xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYg36bJkUAGqrs6RcoppkW6uHqR+c6iAwwtmm+SF24A=;
 b=ku0Ixm4KXc0vwcBvCo7d2ciw0wljp36Y5b2UCdBRb4hZSZwRRYrA9VKJcyk0+PQkEK
 J2y7diVAUA9zfEFVHwh2xUIE+GTH2E2PSikFnqg/JVhIbDj8smruyBzEZm1h9E6WImR/
 2AMt+q7o0KvZiyFwCG96Y+iNlXLFA5FhIPjN4GFnqOvVP1655PHwKpwXwsKiG+EpHsGh
 aG1UpFhe8wawaP4qFbmqqSvSbT2e20+ijWXeiQcnI21zRRwH0QDl1eYJw11bU5KWMCEx
 t5t1lCnk6GFHVYCCoxbPJ3/D6EcGZB1vs/3qEPLwPkziRvA787dcT9B6jAzILJWoKKhh
 I75g==
X-Gm-Message-State: APjAAAVZFadRbMC8aT8FHgfGShybAGoKIdPCMq8NNMdTb2O0hJqM6jqE
 wL+By+VMUQKrXqcduISmo0bvAkTT
X-Google-Smtp-Source: APXvYqyFdBCG8cWHpaN2+KrG1gXeCei6iHoeMF6BgUJTXx01bW/MIbZDAKOJ2UzJT6V/bPMgmzethQ==
X-Received: by 2002:a1c:1f95:: with SMTP id f143mr627183wmf.16.1558381448175; 
 Mon, 20 May 2019 12:44:08 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id p8sm9135352wro.0.2019.05.20.12.44.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 12:44:07 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] ARM: dts: meson8m2: update the offset of the canvas
 module
Date: Mon, 20 May 2019 21:43:52 +0200
Message-Id: <20190520194353.24445-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_124410_214297_A3B65A1F 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With the Meson8m2 SoC the canvas module was moved from offset 0x20
(Meson8) to offset 0x48 (same as on Meson8b). The offsets inside the
canvas module are identical.

Correct the offset so the driver uses the correct registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index bb87b251e16d..5bde7f502007 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -14,6 +14,16 @@
 	compatible = "amlogic,meson8m2-clkc", "amlogic,meson8-clkc";
 };
 
+&dmcbus {
+	/* the offset of the canvas registers has changed compared to Meson8 */
+	/delete-node/ video-lut@20;
+
+	canvas: video-lut@48 {
+		compatible = "amlogic,meson8m2-canvas", "amlogic,canvas";
+		reg = <0x48 0x14>;
+	};
+};
+
 &ethmac {
 	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
 	reg = <0xc9410000 0x10000
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
