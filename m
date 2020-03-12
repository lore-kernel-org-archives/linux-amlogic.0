Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6136AC1975A
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384E12067C
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIOIv2GC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 384E12067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=im6TZPeCYRrhvRWWrDQdXWFX9WPrW1xPrfnhAQgdJ/U=; b=FIO
	Iv2GCz18zDU9w72kTPlIqkLGUWaPPMaFMuXMA5JMCx2rK5vc5fqhsCiKG80n4Q3DE2Bi/b/La4DYL
	ovu41tpoZUyAhlWCfj015zkUh1uuMd2bgo9oA8w+mZBtTvHgS+F2jFOj4k/qMQwyA6d0kzAtQGW4K
	7qVmltm+3usR/U4FUgdpwkg6tN/sR16YoOGMBlcqr2O0g1rvJzZ6LEV1+4AqWVZeCYq3EeXHo6Jfh
	fWxQj7ZvhAU5P+abPs0/d2GjjR8xAQzuKJrYOpn8nzOG3SEbiBPgbbcRzulq+XoFMOEofw+gOjVZV
	hGIFuLgFFE0jidrWchHRgcyho3+h3dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCRnT-0003K0-2D; Thu, 12 Mar 2020 17:39:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCRnQ-0003J9-Bq; Thu, 12 Mar 2020 17:39:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5BE830E;
 Thu, 12 Mar 2020 10:38:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B6153F6CF;
 Thu, 12 Mar 2020 10:38:57 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:38:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Applied "spi: dt-bindings: amlogic,
 meson-gx-spicc: add Amlogic G12A compatible" to the spi tree
In-Reply-To: <20200312133131.26430-9-narmstrong@baylibre.com>
Message-Id: <applied-20200312133131.26430-9-narmstrong@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_103900_450174_8C849E15 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   spi: dt-bindings: amlogic, meson-gx-spicc: add Amlogic G12A compatible

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9ea7db818d9dcbbde581925b82bbe259e1926e20 Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 12 Mar 2020 14:31:30 +0100
Subject: [PATCH] spi: dt-bindings: amlogic, meson-gx-spicc: add Amlogic G12A
 compatible

The Amlogic G12A SPICC controllers uses a secondary clock used to feed the
baud rate generator and the delay control logic.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20200312133131.26430-9-narmstrong@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 49b617c98ae7..9147df29022a 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
       - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and compatible SoCs
+      - amlogic,meson-g12a-spicc # SPICC controller on Amlogic G12A and compatible SoCs
 
   interrupts:
     maxItems: 1
@@ -40,6 +41,27 @@ properties:
     items:
       - const: core
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,meson-g12a-spicc
+
+then:
+  properties:
+    clocks:
+      contains:
+        items:
+          - description: controller register bus clock
+          - description: baud rate generator and delay control clock
+
+    clock-names:
+      minItems: 2
+      items:
+        - const: core
+        - const: pclk
+
 required:
   - compatible
   - reg
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
