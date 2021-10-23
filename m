Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A8AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C197560E74
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C197560E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zoV5+lf8p3XsHtQNrGH1fnL7OfrxAm/MfOltTnKZHdc=; b=ONSA7N06SkDKaT
	HjU/GNQWpTG4h3h9RoM7zIcoKH49GcKUQzEJONxmh0UMEcYPom1JXDZa3E4yrHJFVtuiIhq9Vrf0F
	QpQiaaRxfgTWW0Exx4g7Q0X89XrTBoUIhJWbvuqXTBDZ146mZzNLas0OBoJV8j7UqfLahCiGegIn2
	+M7U2uZs3BRFCxRumPNntfQ+q5zqH+xlBWC/Y8mYbPO6GXsmYnY2TSznVZpjsaRgMtSOyn0XMwvTh
	pot5i7pgC9zy0FmCTxHubyYZBm7mwhqlz2jmHPyacutTU2b1Tmrn0RC7fwL0KOOE+fV+Y1oAfcoTq
	7ycGzwmTjP2AbvtsphIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOtL-00DPQe-Uv; Sat, 23 Oct 2021 21:49:27 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOtJ-00DPOV-Gt; Sat, 23 Oct 2021 21:49:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4HcFH30z4ZzQjw7;
 Sat, 23 Oct 2021 23:49:19 +0200 (CEST)
Authentication-Results: hefe.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635025756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FkzSrBO6NvwHuWP3Puq9S9mHcBwMLBrJwZrwEeSR/HA=;
 b=nNS3T1tpZNW7oZdsKkNtnznhoqxKev85kHza2HfnUsjL5cdyFo+4hbnpSlx7JJ2OVVk6jp
 d7mme0EINY0FgTINr+UcsFkniFjMQEIYbCFO+mtEp3FaqOOd9OLTxU7bxxZA9nXc1Eqiq3
 RaBV/lTpOCRQqJtLF9oJANlhP0rvvSc5AF0C3yETs6EodNQ2codtrUie3DNW2/66sDd6/I
 nI9bxVSYNzTH4+7+8Lkeurt5BUnXBpwprgRW4h60wZV8rLr2WRkxkVsVDqVvgYIAdPFgBL
 x7uLKnFH7eQtAdtr/10i2C1wGo3twL45TpLHcPg9pERH7J8t23MDM/5j96iYHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1635025755; bh=9VkjI/kjIOtOnniE0C+7T76MF5zxMccBXB9K4gEQ+sM=; b=k
 Tn+vSV+sv17lBW7Y9+NQkem+zQNo67gEcOGISQQmagnCQ5Q6ijgFGAobjCneiMnr
 xcIbZME0JRwoVx3Yl3U1QurYTlvLblHespiPv05THe3bCTWZ1CU4u1PzIrABheRq
 YT6vipsArt+xB3Jm3rdOnPi71vK7PM/EZrA3Q+c/pH66OQzKh9KpxbwR4N7gPbR9
 3Zjb7MFM5FSPwotLTqMloUbH+8B5STU7mVugeB3prGHlW4FTCX75qLh49rT/slXe
 Uavwoc5d9dpOa7SaEM9ozsPdNa9gf1l9JUPyAoW+P8EFm/R1sGyJ1X+eKva1y2zr
 h+/MXUczmPwI5RTXgV5NA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: sound: amlogic: t9015: Add missing
 AVDD-supply property
Date: Sat, 23 Oct 2021 23:48:53 +0200
Message-Id: <20211023214856.30097-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D281665A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_144925_758801_3F37F976 
X-CRM114-Status: GOOD (  10.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
do not match any of the regexes: 'pinctrl-[0-9]+'"

Fixes: 5c36abcd2621 ("ASoC: meson: add t9015 internal codec binding documentation")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
I am aware that adding required properties to bindings is frowned upon. But in
this case it seems acceptable for the following reasons:
* AVDD-supply was used from the very first driver commit
* All DT (g12 and gxl) using t9015 controller provide AVDD-supply
  already
But I'm ok to not add it to required properties as well. The driver uses
it nevertheless though.

 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
index c7613ea728d4..5f4e25ab5af6 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -34,6 +34,10 @@ properties:
   resets:
     maxItems: 1
 
+  AVDD-supply:
+    description:
+      Analogue power supply.
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -41,6 +45,7 @@ required:
   - clocks
   - clock-names
   - resets
+  - AVDD-supply
 
 additionalProperties: false
 
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
