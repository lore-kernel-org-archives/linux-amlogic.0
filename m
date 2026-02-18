Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46083E9A03B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjA8ap780YBjC9rIotueWg6B1qRBitUngrEzWu/mH60=; b=E7ia/XqsfA3Dfa
	d8O+wYwfGCbv9RmjjjlJl4EJ+DPotX/tNQWJ6OQ2LZlA6u0QRuDoPcoZMhqGyTaYJGsRDaoGsvhf8
	peF0pabBm2jnA0eqYRlroKAuJ7rjZ85j6cX6WMJCoAFS0zIohWM7G7DiaLvGI9N6MCa3UCbuWEKjt
	ZV0koXuwYCu1Gm7c3p3UYkzKxz9WC2mBmMfpNNUWNE8xjJD75e0QX+FPcz549pJyYQ/5vLanJ5LgL
	RUi8NyrVq6McQvMvuiBZMd+lU8RuxJhlOx/zGZZRbDwyV59YgSaCE4OzdCWaYXgw98PIFJgRS93Bk
	qgAwIjA3XpF9+Lf4DVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfF8-00000009gSH-2M3q;
	Wed, 18 Feb 2026 10:57:18 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfF6-00000009gRW-2Zwn
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 10:57:17 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-B865-661d-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id E772940244;
	Wed, 18 Feb 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412234;
	bh=1mPXmmMne05pYAaucmru6rWTvugDQH1iZH4JWLruXfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=orEMHMmS6KMj/5Eg3ixUr9EczDlGfQRqjtWGujH3EaHBH3y4SAKGO93wF5CQh7iM+
	 TXNXb557LloO4VOJXB5w37wXz18Et7lN9mz9NwC2iBKPW+2vApGOWyf2ybfSBhDmaR
	 EQZMbhx6bRQsDN8u1z66t/Se+SMTxvzrBMucm60s=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Hu <jian.hu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:57:07 +0100
Message-ID: <20260218105709.36253-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_025716_799791_A5FAE064 
X-CRM114-Status: UNSURE (   8.68  )
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
 .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
index 49c61f65deff..6a1598e6c359 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,t7-mpll
       - amlogic,t7-hdmi-pll
       - amlogic,t7-mclk-pll
+      - amlogic,t7-fpll
 
   reg:
     maxItems: 1
@@ -42,6 +43,7 @@ properties:
       - const: in0
       - const: in1
       - const: in2
+      - const: xtal
     minItems: 1
 
 required:
@@ -72,11 +74,12 @@ allOf:
           contains:
             enum:
               - amlogic,t7-gp0-pll
-              - amlogic,t7-gp1--pll
+              - amlogic,t7-gp1-pll
               - amlogic,t7-hifi-pll
               - amlogic,t7-pcie-pll
               - amlogic,t7-mpll
               - amlogic,t7-hdmi-pll
+              - amlogic,t7-fpll
 
     then:
       properties:
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
