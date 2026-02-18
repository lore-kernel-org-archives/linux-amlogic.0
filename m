Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62AAE9A03E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+p0wvBIF3OEK5xHzkr0R6F5zWT9WQ2dAmKofxBelssI=; b=BhTf8gF/hlMXXz
	uvmLHm0Ca5ZhbxSTlfoL9THlQ4lmgv30guB769J6vX2T3tA7QxHed0Gq4NEiTu4X2+hUlsc2xNmoz
	Zrm6pxGOcyS8t98b1kxhrhFx7e8qyO3jXZihejezRTc5GjQeoV9gqjgqUljWpbkkQLpanNCjY2QuP
	wMCOSSbZKc4yoEVIYcNcrCBzTjjZ3tyYWLGi8xbWDet2DC6UGBT3Yiev23vF899iotsy0M4IULQIY
	/hMEjDZJP2ZRf2wwCjNso7hVgvD4dPZFojVlaa1O1Uv/JDpFcWkaCXkR6ewEMGD2uGtTxjei57/mi
	WF/HgdluhJpgUeDwcdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsefn-00000009dK4-1IYv;
	Wed, 18 Feb 2026 10:20:47 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsefl-00000009dIs-1Gor
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 10:20:46 +0000
Received: from localhost.localdomain (2A02-842b-8136-0001-B865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id E9B9A4CB4C;
	Wed, 18 Feb 2026 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771410042;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date;
	b=uknmluUGFLxqkNsYXpaLbBYo6U3WTYr6EQW0Wu+IQ7zMxCUgGdpPIZwBOxtg+amVH
	 XZ9SsfrrHcUKjCn0MHmfP5Hl4SgQNk1AZb8IzMo+Ss0Qh/gCNQwr8Mq05zbbr2NMrL
	 r2zWcPvSDb4f6Se2v/05AruylKLlYpG09BeHowJc=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 11:20:23 +0100
Message-ID: <20260218102025.35604-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_022045_489267_3ED5068D 
X-CRM114-Status: UNSURE (   6.68  )
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

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
index 32c4b62037de..0cda8edfa7cd 100644
--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -224,5 +224,12 @@
 #define CLKID_SYS_PWM_AO_CD		215
 #define CLKID_SYS_PWM_AO_EF		216
 #define CLKID_SYS_PWM_AO_GH		217
+#define CLKID_SYS_A_SEL			218
+#define CLKID_SYS_A_DIV			219
+#define CLKID_SYS_A			220
+#define CLKID_SYS_B_SEL			221
+#define CLKID_SYS_B_DIV			222
+#define CLKID_SYS_B			223
+#define CLKID_SYS			224
 
 #endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
