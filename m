Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE007C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NucY0E0wUWnTDi9g74FHy2l3uPlUiArGckDjgyxUFRo=; b=mwN30xOeGAYJbX
	ZEAudHWOHoBYHl2KGFDSpY3zwUcexDmoDhW2I9G2L7xpAKuIfSg03WaBLuJgDlBj/+J8HacVh8FZm
	GYQ8yL8wucWGxJphLoMgYoMm5AsN5e8ozVyQCxmAWGC4QA2gVrzofzON1Q7DAHHbiPfVF0nlWfUBS
	x9Ak4QGImsg8otzONA9gH/wsJxW8+GiCsF6P42u57bXDvlfwqvvSg1R0SoX2HlFp32bkmZopGDMuA
	CbX/LkmPdS7esy20zTOVonvY+cDRgHmgVaKLUS7kyCIfQVmLNi1dd3bLw1P8jIABDVJjKUnWd0jeQ
	mgRlRxFvUpZaqult1OZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myaph-00E0Q7-UK; Sat, 18 Dec 2021 14:37:09 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myape-00E0PT-PT
 for linux-amlogic@lists.infradead.org; Sat, 18 Dec 2021 14:37:08 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JGT2Q6hB0zQkBp;
 Sat, 18 Dec 2021 15:37:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639838221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0sXFk4A29aee5T5cwUNQcaVfx8IXgBcOndunD/GQABw=;
 b=RgwsZQMU5t6UEwe/6+9AblpO0KJsdJ1a28TWmaducNA2Z9d3gkDAytIRQq675cjNG+V7b6
 TEL61c27eqoOAabnHCZJmt+hBOsnm/uKI4ELdTVo0ss5QuIeh3ENGREAT9z+2eGZPcKNgR
 aciwMPZZaWz1zFwJ8LfX6SZoReVG+guNWorw3sUcDz5vF7r+ASwfmBrI+Rk+Ld2HQYLl4q
 0TSwm2WFySHxCc3hzbDwZ13Rsr11cSY3ve5QBlQ8huY03zgdpMdlX/O3qdv6xjr8bmetLG
 yc7X+e99bo0QCvCebNaElqew6XDvUc1/823cjHNpt38PRdNhKP0GdAkzfOPL9w==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: display: meson-vpu: Add missing amlogic,
 canvas property
Date: Sat, 18 Dec 2021 15:36:41 +0100
Message-Id: <20211218143641.19372-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_063707_006407_53F95A6F 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

This property was already mentioned in the old textual bindings
amlogic,meson-vpu.txt, but got dropped during conversion.
Adding it back similar to amlogic,gx-vdec.yaml.

Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to
 yaml")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..65bf6d7ec707 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -78,6 +78,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   power-domains:
     maxItems: 1
     description: phandle to the associated power domain
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
