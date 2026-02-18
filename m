Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A631E9A03B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sU/ZmOCbcWmlEbZSZR2lZ/K/gLT97KzY6F8W0as+768=; b=n8vviBO9d8uoKn
	EnlZplh+sNOxHS0FhGviDRlYCKF9udOykP5+L0r39jnZtAs+3H9DuXaMl1SU0LYP3mgTC7QNS1qkP
	XCPkq7KasvzwiEwZpGIQayf39PMYhcB883pbfYU1iPZQ8wnMKoL0uptEoyGqe2OobKWZNyc0UTDRs
	FcQDAkR4+6Q2Jm0vKHEncCC6VR+65TTZkcBTHKaeEhw3SvFfDsfad+AUH6yoQKEZ0XggLosFx3z9j
	PzvpnBm70pAdRaQRzDI/rVlAMAfsGOTwMkDmVTKUpKN/9laGsWm+OuFWbkOzuB3Vod8uG7SM4oDKP
	+vW7y/hPW5poznUbUayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfEG-00000009gNl-3a6M;
	Wed, 18 Feb 2026 10:56:25 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfED-00000009gNR-3Ttk
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 10:56:23 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id B9E1940244;
	Wed, 18 Feb 2026 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412177;
	bh=g017/p6TXq1k+XnrThcxW95JuzKUQXGejJt//Dsgzwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mZZDxeuiXfOzCUPfsKZJ+r6uAVKVLE90sPVOzWTTkzwiSdZduIbcPSaf08LIrtjgH
	 f/JjKDqmYuYVb8EqwKeuoyQS7ZZav0z0EbXGoAAizhl6k750O3hqN1vI5EgPYwi4Dx
	 Pd5az69nd87kMb10d9rxBZOHg34EwdA+xl4zdIZ0=
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
Subject: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:56:09 +0100
Message-ID: <20260218105611.36216-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_025622_186580_98CFAD5F 
X-CRM114-Status: UNSURE (   7.14  )
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

Add PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
index e2481f2f1163..690421009eab 100644
--- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -53,4 +53,20 @@
 #define CLKID_MCLK_1_PRE	9
 #define CLKID_MCLK_1		10
 
+/* ANALOG */
+#define CLKID_FPLL_DCO		0
+#define CLKID_FPLL			1
+#define CLKID_FDIV2_DIV		2
+#define CLKID_FDIV2			3
+#define CLKID_FDIV2P5_DIV	4
+#define CLKID_FDIV2P5		5
+#define CLKID_FDIV3_DIV		6
+#define CLKID_FDIV3			7
+#define CLKID_FDIV4_DIV		8
+#define CLKID_FDIV4			9
+#define CLKID_FDIV5_DIV		10
+#define CLKID_FDIV5			11
+#define CLKID_FDIV7_DIV		12
+#define CLKID_FDIV7			13
+
 #endif /* __T7_PLL_CLKC_H */
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
