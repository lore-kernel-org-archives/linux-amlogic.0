Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D960C64EB1
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 17:13:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4992083D
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 17:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPwMnAKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bFYDW4/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4992083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNF3H/rZ+dyWjQRkhWeFJZCnmn3vdbCtmLuE4ULu8lQ=; b=VPwMnAKulGWge7
	aTiQxxK7edifZ1DvkolKHJFvUD+eK2PpVNFBDAp09flBsbAx8xVe+KomMB72dGrw728FQ0088Mtgw
	j/Iyw71d/3TKlp2R1UiKsQ5Y++GZbXl04QdfGiP6KkDS+BpcqXxDe/2tg8AKEJHoT5zIPrSpzFnlN
	NuoS7W7JtpADCTk8qXlGqgyojzOEJRs68Vw5346GrDTIj4tfh21FJ6INbO0LjkdFADV7yd+8cpFbv
	LhYHCZIxbM9i4qvq2D6IijWgv9Xgf9ShdwYS2cer6RQF6dgjJA0EUO5IrKNPNgvHtrNfTBaMGVMqo
	g33gyzAgJS0KxzROHuwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVgAN-0003nN-Jr; Sat, 08 Dec 2018 17:13:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVgAK-0003bY-Gp; Sat, 08 Dec 2018 17:13:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so6612607wrw.1;
 Sat, 08 Dec 2018 09:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wE0/E2Ken/bZjZgqEBLKchV5gfKl45yizVk0lLCEPOs=;
 b=bFYDW4/+8qDr+Bip/V11Jwndu28XVzccbPCpr+vtpQoQDzgKVA5h2ASNaGIc/Xy5bU
 rEkFhrGBWFpHJniTJp+GeAu+pDR837+hlguWDroP33S2YFm7e579riGz2kE/TX1m6HAD
 ivNFz0B+0WHy8S2HGN5UCq/Ede0YH32A2HeM68HfdCEEmSYC/8x369WYlrZqLH9hpmJI
 FNy+5WkBGLBAWyFsr4cSv1amXRi4mjCMMVPvx76w761BTrV/Fkf54AOcdloCtsmBZek1
 MI7ADon2mTX5QUKhGeTml3xcCax241ftqcgFNci7Z5B178zurVUf+r5OMRy89hR6dIF5
 Vghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wE0/E2Ken/bZjZgqEBLKchV5gfKl45yizVk0lLCEPOs=;
 b=P9zUBBWVMuMtqNkpaV2HOV3g6uwna3lcThWoCLEKXkj0ugwamnTCqWwuTE4xKskCqY
 kwS+/CsahD/Ivj9nOBEqVu2+YgAfT1KIYkZq62CAuNsV1I0cyjzbSXwAYmXCsb+00/le
 7iErG6Bwn2seggTSj+6c+KUGQdvCuPFQCMGHiTB1g7SF1aM65yo5gCE4rQ6Ve3QdgF9b
 GRWU3osPUVKjEgS2t0cCk8M9PldbVdHlPmLtZH++D3vuzoEPLoReZbx8tNC1kA3VrcW4
 45KMF8LQYGSNa8RoXF/BBP7zAHQ0yz+hGFSNv4Tz/Nqy5xRV4wHMXTmAeE/3nzdabY9h
 SMYw==
X-Gm-Message-State: AA+aEWbhDpe8oKvonIyzKf7W3fIKyaw10vAidEfYq09CZ8PQYZD+RP2z
 42FqgxOUOmoL5d6wy6fzgSWFoN+L
X-Google-Smtp-Source: AFSGD/UCvJtMpsBdOmw/IIGPc9vZGR1+kvdrBDqJh4CEi+4FkgHICerDNNgruq8QjwkRk7urzAP1UA==
X-Received: by 2002:adf:ec11:: with SMTP id x17mr5245724wrn.88.1544289189691; 
 Sat, 08 Dec 2018 09:13:09 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r12sm4995851wrq.3.2018.12.08.09.13.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Dec 2018 09:13:09 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 robh+dt@kernel.org
Subject: [PATCH 1/5] dt-bindings: gpu: mali-utgard: add Amlogic Meson8 and
 Meson8b compatible
Date: Sat,  8 Dec 2018 18:12:43 +0100
Message-Id: <20181208171247.22238-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_091320_589921_3AB5AE3B 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a compatible string for the Mali-450 GPU on Amlogic Meson8 and
Meson8b SoCs. Meson8 uses an "MP6" variant with six pixel processors
while Meson8b (as cost-reduced SoC) uses an "MP2" variant with two pixel
processors. Both have a reset line to bring the GPU into a well-defined
state.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index 63cd91176a68..efa1077a90cb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -12,6 +12,8 @@ Required properties:
       + allwinner,sun7i-a20-mali
       + allwinner,sun8i-h3-mali
       + allwinner,sun50i-h5-mali
+      + amlogic,meson8-mali
+      + amlogic,meson8b-mali
       + amlogic,meson-gxbb-mali
       + amlogic,meson-gxl-mali
       + rockchip,rk3036-mali
@@ -77,6 +79,10 @@ to specify one more vendor-specific compatible, among:
     Required properties:
       * resets: phandle to the reset line for the GPU
 
+  - amlogic,meson8-mali and amlogic,meson8b-mali
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
   - Rockchip variants:
     Required properties:
       * resets: phandle to the reset line for the GPU
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
