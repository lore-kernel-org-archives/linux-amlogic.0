Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFB0C624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVeMcFhMr+uY5Lg6ywiTfm9HolOsJlWYJCV44mtwH/o=; b=12pAEbrchrsm6u
	6Lmn7VvHWJgDH3XOWV7vfocdshZDlbaMyVNY04gi+/daQR8ZmLLYIaB2KlgMlBFEpRh6fIKpFe8pE
	g20S49XdRHHyqXDNmaIMeWNwO82+222UJnbPIMmurXOJzRLWD8kIDqgjqcblJMm2fxDWk5ViTmdZe
	h2EAW4eJNHRTXCh5mUanINks3CnfypRD5/Ku5WBd9xuX70EyFFH/vfhjZApstgNSoGjy60ascrLpk
	ZqHuT+4UXs4pl8kuDRB5+K5sJfspD7+26cmINOrNj3MSFU8hXWZohzvjxUIqgi6FLs7crSCQzIGRP
	iLZH20ZSG35LobRypYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x221r-0000000GcAp-1XXr;
	Thu, 03 Sep 2026 07:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x221q-0000000GcAH-14WT
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0996F44787;
	Thu,  3 Sep 2026 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DED9AC2BCFF;
	Thu,  3 Sep 2026 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788421113;
	bh=NcdLhXrPcWFclpxrmSESajR2JcjuoXQBKnYxQjejsnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q538lbYMTTPrnheczeSona+XWJylCJHfafHxKrTAs6wn6r963AeuVg2LObxwoWLPi
	 G3RuF3VZrDdJxRgfArvgTOh2bFZ7MfVTYMPogyIrMcEN88bNCFRqxdoYEJAHocrsfH
	 JnzZ6HAjPtzBB4H4yZ3aXGBOvIjhuQGztMZZFUkzQOWTEBIHXNpnWlLTJjNjcsMSDo
	 2mU55UyAESQmwPyRckQvS4yOPyYMcUNUDr1w1ov/f+2X34CtgDWAKog32/Nu0bUCvU
	 pZWKl46BYPaH9kCOIlEiy1MlXB9iPChS1kb2ZDeGajtfSrnnc7SFnN/kVeGPh04EA5
	 7Xqd0eB5sJYCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45CAC624DB;
	Thu,  3 Sep 2026 07:38:33 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Sep 2026 07:38:30 +0000
Subject: [PATCH v12 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260903-amlogic-dma-v12-3-f769bc344056@amlogic.com>
References: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
In-Reply-To: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421111; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=9xq7fFe8x3ZtUEb/et7K+dc4J+CzRRN9hABeSR7Mhcs=;
 b=ES5hG1QHitnj//S1zRt9r6Ao+jjztMG7eGTlhBv2rhpNdy5sPM+uEQr+E50PWKdWIW+UshcLx
 kntKVGGN5M6Bw4bjdZF5FYH9Hx5axWyzbQDXKrgxcbycpC+RR4XVbLn
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic DMA controller entry to MAINTAINERS to clarify
the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e7b2d9e9c24..b4ef8d3f52cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1307,6 +1307,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC DMA DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
+F:	drivers/dma/amlogic-dma.c
+
 AMLOGIC ISP DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
