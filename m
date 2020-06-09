Return-Path: <SRS0=kXzT=7W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CF9C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2020 16:56:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8603C20774
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2020 16:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irrNLNrO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JJDTCht9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lsYJ0+yH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8603C20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4hbTFytfFGFyBBoPf6NpJf1m20ucQDy5ZbYs0dMeJ48=; b=irrNLNrOIyODqi
	XLrNaK7SplKshBgpTpq7TynEQQ7p/SP13siJGLIW1Y8XjUdJS9lMJLP93FCK14YfUT4QTtYl3mA39
	0oqiu74cdqKQqd3kfTn+CFEEmcP8Ak4jqvaWVE9B4M4qvDnej/UcXnq+1GjaXjPfXMy4XRx0Fi6YF
	IzNGqDOkqXnoTDMqsOjzMyMj7A8R99NTCUyTBa3sHT5z5FLYcOoXADuUBYH3QN2d1n7AKD445J6jm
	pIjyhaXvskFD6UlDnBJabWqOf1L5Gzp+CpLFzLWHANV8CGKLIJl3gWlDFrAUCJCRmYRNUPaDTTcpb
	8zyh1aQ5UR/S1KXb0UMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jihXf-0005qZ-OR; Tue, 09 Jun 2020 16:56:03 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jihXb-0005pq-0R; Tue, 09 Jun 2020 16:56:02 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 49hGTk6GYmzKmhw;
 Tue,  9 Jun 2020 18:55:54 +0200 (CEST)
Authentication-Results: hefe.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1591721753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j7Bl0e/NNgBksh6phq/ZeF/FFbH797+bKn2Kamf4oqw=;
 b=JJDTCht9yz33nts07y6Sn5sCv9jPSgwxEyVW8LooI1WFFxUrSymVvrihW3wPUIpwHFV724
 JpgZPYGrlyzRTjQF6DFwP8TAHu4p3d7fS98hczoEDPQo2ws2psrQSd6ZIZKaWvT1qwixoO
 akOBZtX5yoBIxY/8h/eaINUPJnJJPzynla8XGhS6CFJ31pXShZ+B+fjwKkxUfHYWKQRodQ
 31Kn4BhdqhYXfSOOu6t/elsAbSaeGSGWvwtcZ8SmTRtpqSNcFZz6jFqyk+gh1K1MZiSvWU
 26UfxhLn+ITqOAtcwgwRBFl5KcckmmhRz80TWBw8cG6OMEht4Wlqv6zrp24epQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1591721750; bh=+NSaqjpCbS41rHQqGIN0xjmkj6DIbcJlPX1xQbzYjGc=; b=l
 sYJ0+yH4epSS2hnDVbXx3ZI+wcHgyf24ERXrR2EjgjZfFUQncTj55uvK2rMheySb
 UYS0V/FoHAK4fY31SW4Wl6BPeEKdLXCpzw3AbHBiqE2uY8DCjLtbcVlMPan7qrkN
 zbP0TURvmld/GrerxafQt+BIM9KGM0dIqITAMJMaHgsxgVgrS9u5NaKKdJKgQCuX
 i8bs7cDy5Aiel/6CHq0yststTk16XKlx1JFr5yklIyyN9BiVRf1Oa879Gfo/iBO4
 VsitGoV7Vckg/HPLk2wPfYsqCWkFwYLQ6mrXTGulf0p87KGZcAyqRrOmiVydzJbn
 BZS4X2AQikwSoOLYHOjoA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id nGIsqmsi5gm7; Tue,  9 Jun 2020 18:55:50 +0200 (CEST)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/1] spi: dt-bindings: amlogic,
 meson-gx-spicc: Fix schema for meson-g12a
Date: Tue,  9 Jun 2020 18:55:27 +0200
Message-Id: <20200609165527.55183-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C097A1761
X-Rspamd-Score: 0.89 / 15.00 / 15.00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_095600_899321_049FC521 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following warning during dtbs_check:
---
spi@13000: clock-names: Additional items are not allowed ('pclk' was unexpected)
spi@13000: clock-names: ['core', 'pclk'] is too long
spi@13000: clocks: [[2, 23], [2, 258]] is too long
spi@15000: clock-names: Additional items are not allowed ('pclk' was unexpected)
spi@15000: clock-names: ['core', 'pclk'] is too long
spi@15000: clocks: [[2, 29], [2, 261]] is too long
---
Conditional schema properties don't overwrite others. Instead of
restrictions have to be validated. So general clock amount is 1-2 and
depending on the actual device type limit the mount to 1 or 2.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 9147df29022a..38efb50081e3 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -34,12 +34,15 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: controller register bus clock
+      - description: baud rate generator and delay control clock
 
   clock-names:
-    description: input clock for the baud rate generator
-    items:
-      - const: core
+    minItems: 1
+    maxItems: 2
 
 if:
   properties:
@@ -51,17 +54,22 @@ if:
 then:
   properties:
     clocks:
-      contains:
-        items:
-          - description: controller register bus clock
-          - description: baud rate generator and delay control clock
+      minItems: 2
 
     clock-names:
-      minItems: 2
       items:
         - const: core
         - const: pclk
 
+else:
+  properties:
+    clocks:
+      maxItems: 1
+
+    clock-names:
+      items:
+        - const: core
+
 required:
   - compatible
   - reg
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
