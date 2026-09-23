Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD7C98307
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/iuNDmLdBUqs0w/5iy9M0OJOyGEGpuNMybNNPwz26A=; b=W5sU1PK+zHyDZw
	+KFoLLcihnYBNImHX+GgrSw9QXzcnKqXb6n2b0Aj0o46oaPmo9/E1NF4e66r2P8tsKQEgVRg0hSOH
	MpKWuxN82C4NoMZ+JffBAeMc1FtjrvEcOQQK/UrZ9fXLp5Gk4Idv/O9491DaDFrpCByGmVUHHWJp6
	2bRA18nOogM8XXNI6FUqJ4f9EJnSHqskhort3itiVNbfiHxvxxR1euhSgg2/K5NzHh+iYnJUgTkk+
	m3pcLvvxtBqLLMvx7fpO6xxzmRnbBYzjTYkEZ/fmFpgOeJaNfzsd+UiOGwY+emzLAkulOHP9T7Fu4
	9fWpuk0DHCGg7vwTSl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kx1-000000081PY-0ZA3;
	Wed, 23 Sep 2026 11:15:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kx0-000000081Op-0pu5;
	Wed, 23 Sep 2026 11:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB54743C64;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66A14C2BCFB;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790162145;
	bh=bqP8YA42hWQqWkIXy1FVgmJ12q2wrxR9OYJQppEs/Uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dJjC2anhcVyMwIC1G4OLRCia4y+JfJhGhEtcwMWg+VOrv4Phdfk2NFjfoQrNbW4kZ
	 Hk4sg1nIdD6TjrD9OxxY9thkHw1qQDSP01beLgcok52CPSlFszMfNEabZnPTOrwgI8
	 Nibz+zN6sh7w9zoaldqeH87br0btn4o1yrEReajjoaUiPdChSHuFJSqBzcn+ZDTkAR
	 jPk/4mwYZQNoG7zp4T39TfnNxDiktvfesjEIGJU6/0YstgtGVCsHS0lbG4QM4d7GDU
	 lakTau7LiR37ejZHDtYWoRRtArl6OaJL7tnOnFZ+lvgH6uPk8/XMTZL+KBmiFQIH3E
	 TOLbewP/AdtyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46279C982FA;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 23 Sep 2026 19:14:48 +0800
Subject: [PATCH RFC 2/3] dt-bindings: clock: amlogic: Add T7 pre-divider
 clock IDs
MIME-Version: 1.0
Message-Id: <20260923-meson_refactor_n-v1-2-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790162143; l=1524;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=y0MWbUJ0faMiTivhM85sj5J18sYEBszLSGsO+sIOCFA=;
 b=9o8QfE60g+bIqq/2wkTFt/FkpyfPD2otY1SnuQcmVu8S+UxF0kzuuLZ0zwDw0KR6rsycd0FFI
 4FTSu5UE/c3DSAXtZcRUDeqdhFYcaQMTLiR0/hR+AiwKWXztK20mW2G
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add clock IDs for the T7 PLL pre-divider clocks. These IDs are
required for the subsequent conversion of the PLL pre-divider
into a standalone divider clock following the PLL framework refactoring.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
index e2481f2f1163..69c90bc0be0a 100644
--- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -9,20 +9,24 @@
 /* GP0 */
 #define CLKID_GP0_PLL_DCO	0
 #define CLKID_GP0_PLL		1
+#define CLKID_GP0_PREDIV	2
 
 /* GP1 */
 #define CLKID_GP1_PLL_DCO	0
 #define CLKID_GP1_PLL		1
+#define CLKID_GP1_PREDIV	2
 
 /* HIFI */
 #define CLKID_HIFI_PLL_DCO	0
 #define CLKID_HIFI_PLL		1
+#define CLKID_HIFI_PREDIV	2
 
 /* PCIE */
 #define CLKID_PCIE_PLL_DCO	0
 #define CLKID_PCIE_PLL_DCO_DIV2	1
 #define CLKID_PCIE_PLL_OD	2
 #define CLKID_PCIE_PLL		3
+#define CLKID_PCIE_PREDIV	4
 
 /* MPLL */
 #define CLKID_MPLL_PREDIV	0
@@ -39,6 +43,7 @@
 #define CLKID_HDMI_PLL_DCO	0
 #define CLKID_HDMI_PLL_OD	1
 #define CLKID_HDMI_PLL		2
+#define CLKID_HDMI_PREDIV	3
 
 /* MCLK */
 #define CLKID_MCLK_PLL_DCO	0
@@ -52,5 +57,6 @@
 #define CLKID_MCLK_1_DIV2	8
 #define CLKID_MCLK_1_PRE	9
 #define CLKID_MCLK_1		10
+#define CLKID_MCLK_PREDIV	11
 
 #endif /* __T7_PLL_CLKC_H */

-- 
2.47.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
