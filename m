Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC53C04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 15:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144432075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 15:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2XCIzSJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="xpZgTG8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144432075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=U5h2rhUT4FDwMPV1hzmH61S0Y0K2YH8eaQ9/S5jeKrk=; b=W2X
	CIzSJ1dQFxkojRqe9GLtKUDa3Ij6v9HXAT1I9aEl66HuV7YT1U7rn/H+UyboMT50OhqMP7OFevUOu
	xyv2XhR8G8swrbqJvRv5/SrLihBXu/EA82eNCdclaFjA7IGfKmkMxdKg2hbGNoPaJCVMb9eg8xylt
	O0fWCOEyeAMkjbEtgH0urdEFFerxjWRRT/nskDXb9VyaDQaY7Cj5rOwZOYqytMhvjg/ynpirGR4PY
	O5nglg28zu44H/neMYiFwA+tvIWSnXnvxDVGsF0vPnvpI4pqipdxNdn1coUK2ZaqFomlvBiJ22fsP
	2runCKsVG8o3jUoVoZeirax49jfsfpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVdhP-000078-1c; Tue, 28 May 2019 15:07:35 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVdhF-0008Lp-2O; Tue, 28 May 2019 15:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0+E2u/R03c5rPCMEH9eEWAg7IhEIFC7wRcCvovhk0TE=; b=xpZgTG8H0HVB
 /crTj5heZptBCg1c+uDaPw0D4ABriLSifu2LzuBjsQ7Ifz2g/q/FVsacgY/zfNY4eTJzK5seXaOF5
 NMoC07kQMX9WclvvAZHLkCqPyM582pY33E743KIHg0yvTRpN9/hEK3Sa+JXJFsSSrrVQsyfIow4Gv
 4im+U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdhD-0002qS-5Y; Tue, 28 May 2019 15:07:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8F921440046; Tue, 28 May 2019 16:07:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Applied "spi: spi-meson-spifc: update with SPDX Licence identifier"
 to the spi tree
In-Reply-To: <20190527134124.3034-1-narmstrong@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150722.8F921440046@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:07:22 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_080725_262594_D2729426 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: linux-amlogic@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-meson-spifc: update with SPDX Licence identifier

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.3

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

From 891100dfa2d6eeca6913b45c883b72efee7c229b Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 27 May 2019 15:41:24 +0200
Subject: [PATCH] spi: spi-meson-spifc: update with SPDX Licence identifier

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-meson-spifc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 616566e793c6..f7fe9b13d122 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -1,15 +1,9 @@
-/*
- * Driver for Amlogic Meson SPI flash controller (SPIFC)
- *
- * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Driver for Amlogic Meson SPI flash controller (SPIFC)
+//
+// Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
+//
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
