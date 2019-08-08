Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126F4C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 17:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95AD21874
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 17:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpt9VxF0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sf9v9V1I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95AD21874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xh2DWCB3k2mhgcSslj+YFz/1Mfn0HagYKvb9l8EXMr0=; b=gpt9VxF01iJlcV
	0Gm98IciftjQflIJJMfyxdx1JYv3EerqNbs+Ks+cEzLMTDwDPD2l8dM+jEMjuGAl5560QehCXLNHV
	ACTTjTxW/pasYXBLw5cANYs2M+aqThJxrz7pyn8TDBdryhSrPmoKHTK3bnQ7bPm29p5qVi5mkVZ7o
	KM2roUz3XYOVLeyLmnZxw1d91lC2qEUiQmjPR0NacW9xMfCD2L7iaXRWH25Xx/8ODk0iZT3hUx7b+
	X4llLXfl+bszX5EFyUBeEVBizxyr3mvNLPiIjVGWTifk1cPSuGYdReWnELzVmjcAYj8ELeK6QT43L
	8lmC899E5Lslx+e9LoBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvlqj-0002aH-S2; Thu, 08 Aug 2019 17:05:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvlqh-0002Zs-CH; Thu, 08 Aug 2019 17:05:12 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00A702173C;
 Thu,  8 Aug 2019 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565283911;
 bh=zjIYazZXYmDz0mSg6jSasyr/sD3v4s4QZ/0wOpd+6V8=;
 h=From:To:Cc:Subject:Date:From;
 b=sf9v9V1IY7ZjpE+il+TEr27iMMY8AwIeJxaSIuk3AFyXfj9I9lylHe0864VX/rUA3
 jfYPJ+rrTNCOOXqaBfawWQdrzso4RbhUsL/oLWbi5H8QmD1wIzJYkLpOMgKPVmpy11
 n59tiTpNjOdlRvuWy/tADw6XytpvZRhERClbZJVk=
From: Kevin Hilman <khilman@kernel.org>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: g12 CPU timers stop in suspend
Date: Thu,  8 Aug 2019 10:05:10 -0700
Message-Id: <20190808170510.4141-1-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_100511_442221_24927E3E 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

The Arm per-CPU architected timers stop ticking in suspend, when the
SCP powers down the CPUs.  Flag that in the DT.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Applies on my v5.4/dt64 branch

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 27bb242dc95d..cd3d23d2c6a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2407,6 +2407,7 @@
 			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10
 			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,no-tick-in-suspend;
 	};
 
 	xtal: xtal-clk {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
