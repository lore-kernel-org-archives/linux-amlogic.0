Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C226E9A03E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjA8ap780YBjC9rIotueWg6B1qRBitUngrEzWu/mH60=; b=ZuEfTCejnK9scp
	j2UE5DEcYJ3d2ujOgEE3LLvunECROuFcCJH7r99asWGMNF6LTy1chRM/x10V5RIxR14twmmcpEfYZ
	MITyXVIeGT9GEUmpsPGJsB6o8P86TfIYkGqYoLtNV19nKh47d3cYPrj6BXT7Eig+vGDl6T/5kxQKy
	RHnJXLP9mGqygZd0LBNv/tq5IobP66ZW9U7zppJTMfKhe8DEY3kgxt1p5m5zSOlRF3ZYNzQULHG8A
	vjPn3MmexBctP4apNFT1PyJEih5DdY6FYMiF9fYNN03WAiiszOItwcfnpNzdKvHH5bT2v3T71jyDA
	xH0siT1L//15QWuWdXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseez-00000009d20-281j;
	Wed, 18 Feb 2026 10:19:57 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseew-00000009d1S-3ar1
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 10:19:55 +0000
Received: from localhost.localdomain (2A02-842B-8136-0001-B865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 9E0B14A551;
	Wed, 18 Feb 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771409991;
	bh=1mPXmmMne05pYAaucmru6rWTvugDQH1iZH4JWLruXfI=;
	h=From:To:Cc:Subject:Date;
	b=j+fNq8ZnvCqilBeAnFnjfbYRubTFgYCojnKlGGQ0cd8iJJRFhFJ7C/H0ES/a3oUC7
	 LU2RAVJbNLMtib7tpnwImc+rG9ki1afJfF+Kq4hVkS0/jVYzMyGZ3riL4O2vuqM40R
	 4jdFOvVJDHh4B07YFyDm2JuB7StrhuJSGikg0RFQ=
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
Date: Wed, 18 Feb 2026 11:19:02 +0100
Message-ID: <20260218101904.35541-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_021955_047774_FEB86FC5 
X-CRM114-Status: UNSURE (   8.22  )
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
