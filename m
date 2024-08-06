Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65896C3DA64
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7SpFFQilQnyPqct+wO9GkkICG0askUoexya/YVZb0Q=; b=2lU9EdUHZfh/FT
	iTvM8ibPKSuLnBzlfZ3SGJE8SjH+MNlE6SB/1PB7yOuxzElCV6/Y9YDJtzr5xEDzEA8NVI3f7E/MC
	EEcSXfgAN+fWCEl7wwtmSDzIpZS94DeHNQjWDb2WA4Ah45UUzx0Qh2EndZKp6eK4sHKV4KZZ3FNMy
	ZkLM+n91cK6a2LTSwhPangIO8bzNi8LryGQIQyaoLioVskPoPyJSVngpA6hZ7sLHHUe8dnF9qpmMX
	67DnDiEblZMzrfzqnFLxpHxetV5xHZlFBan8kJr6sO8LEijIe+2hz9VG5Y7I/MTuYmAMb3gzPClUz
	EcfNHRE/mOdbC0uCTMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHQX-00000001DdT-3Pk5;
	Tue, 06 Aug 2024 10:28:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHPT-00000001D64-1n63;
	Tue, 06 Aug 2024 10:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA471CE0DA0;
	Tue,  6 Aug 2024 10:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A54C9C4AF0F;
	Tue,  6 Aug 2024 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722940036;
	bh=zqTybWWUQeRq3GacCvo2lFGX/liI3cNROhF61Gx3J7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iQ5Lf2rhH5LCe8sYEBHr99sBX/VDP1a56pYSF/mQVXbysnzJRCX9lM5yFvmh0u4qC
	 7ITXX8nZB2n7yKDNnPOvsk3OddGORKBUYLtIc6U/iRzzqGlKGlJE+aPLMer4liCuVw
	 tMKTlmUHwdELk/+rN8DdBqVuHK0z3nyOTEmwO+MlMcxAevj3IlWDP0P6CxBXz+Qb5W
	 DoVjLeLts4El5aq8Nv7ZCC2PsWF3CabJgJL//6uW0U/1qHWYftS+Olt52hRwNkKb6T
	 R+mikFiujd34Q7j9zqrM4gBofY6t/Z9L8Omvl/zJqBeqvz1qfq8lpgkJLNnlqi6z9H
	 2WJXe/Lz965Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D225C52D70;
	Tue,  6 Aug 2024 10:27:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 06 Aug 2024 18:27:14 +0800
Subject: [PATCH 1/3] dt-bindings: clock: fix C3 PLL input parameter
MIME-Version: 1.0
Message-Id: <20240806-c3_add_node-v1-1-c0de41341632@amlogic.com>
References: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
In-Reply-To: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722940034; l=1392;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nOBPKUlDvxHHPW4LjnDlQ83HxUGqGNULEJwk23wSGII=;
 b=wJEXJtfDkx4Zaq3zaoUj1mqfl8KL/DhH/a/4rT0nQrjuMtW2rVxyxv9aaJ0z/7nyYP+dHL3a9
 vPYcwvGuVOkCHu4YcDg6BH4lOKe5kESpLj5mf/4Ctv+ytQFa5LnNnER
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_032719_873028_C4159E77 
X-CRM114-Status: UNSURE (   8.55  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add C3 PLL controller input clock parameters "fix".

Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
index 43de3c6fc1cf..700865cc9792 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
@@ -24,11 +24,13 @@ properties:
     items:
       - description: input top pll
       - description: input mclk pll
+      - description: input fix pll
 
   clock-names:
     items:
       - const: top
       - const: mclk
+      - const: fix
 
   "#clock-cells":
     const: 1
@@ -52,8 +54,9 @@ examples:
             compatible = "amlogic,c3-pll-clkc";
             reg = <0x0 0x8000 0x0 0x1a4>;
             clocks = <&scmi_clk 2>,
-                     <&scmi_clk 5>;
-            clock-names = "top", "mclk";
+                     <&scmi_clk 5>,
+                     <&scmi_clk 12>;
+            clock-names = "top", "mclk", "fix";
             #clock-cells = <1>;
         };
     };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
