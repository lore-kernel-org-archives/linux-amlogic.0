Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B438C5321E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 02:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsddKkESlfL+PRrxjOcsl0PMcSV2qrMT2eHLF57jbUE=; b=Agu3c0DTtiO6WB
	wUPflf501riJAFY24J32LTyC9GMnlEQU7lLL/kcKP+4uKvM8p1BSeQW+w9bngvfHF1A3HqjLx0hd5
	LKUl15bEuTIc5Q/3EittIiPDbBCTVxKw+nYhlC9sB+ktmz5BqsYY9NcxMAflf2kyxPx57RHYWZp3Z
	Tiy9XxBROY0JBrfjhkwvGAgUESChsDx9wpkeTkW1xpsaSyTK205FIQFM7iyObGfiSoOTHs5LUuCkF
	PGxi5TNnFWIeVrxMcT8wEHmXn7tvvDyGw/wAeHcl1gN2ksuWhn4aHKqECLitDw60ohPpF8+pOfbFp
	cdkXsq3HkOuezzqU03kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shK3I-0000000Evf7-0pLy;
	Fri, 23 Aug 2024 02:29:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shK3F-0000000EveA-3kRM;
	Fri, 23 Aug 2024 02:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A442A61302;
	Fri, 23 Aug 2024 02:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FE1CC32782;
	Fri, 23 Aug 2024 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724380160;
	bh=j0bfX7RwioxZel71Y7a7ItvYplwaW9cdPPAEsz+h/o4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HuyefCcxv8nRuagOUejt7Jb/i+NuVRF06X+W1VV0nG1fCE/krTmPqYxqNv5MPt9jc
	 r9yir9VOerBW6qGaLgkMZaMNJqt6zQe2Ssjf0Ea/DHSsGPzRplSBVfvoAXwWq1PIoV
	 0lQmE5xWP6O9TyJhyRfbr47H7OMEFUsvnwyt2ihAQErH1w7Wf3i9QMfVbigKvGzzve
	 +Xj7AELqgLtU8IAGqDkwqXyRQKUgxj8F1VgLKEhB+4v4gBLXlXVCgmdLNGslViRFyy
	 I8EOMv9IAiJfktCyTg+VderPOjN/j7ksSNFJ3x0103oE6//miuhBEurW4EoviyAd55
	 d1Jz+FAgVfUpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A0DC5320E;
	Fri, 23 Aug 2024 02:29:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 10:29:17 +0800
Subject: [PATCH v3 1/3] dt-bindings: clock: fix C3 PLL input parameter
MIME-Version: 1.0
Message-Id: <20240823-c3_add_node-v3-1-3648376037f4@amlogic.com>
References: <20240823-c3_add_node-v3-0-3648376037f4@amlogic.com>
In-Reply-To: <20240823-c3_add_node-v3-0-3648376037f4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724380157; l=2021;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=EZulQ5wpUmaV7Lvp/UM+s8rjmGBRsUnekPSl5hxqIH4=;
 b=FOnaCsVmFwP8l5psqP1H2cZPbDXq0jdUvEUdjL9j5DJUURUcRcy8Y2qd2a3skK7/OJNh6+MoY
 lLPcgN1Pwu3Bi6FkCe54El0cDTX5XloX/aY/FZLe2wChfrtFW/DlY3R
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_192922_107163_41A45186 
X-CRM114-Status: GOOD (  11.42  )
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

The clock named "fix" was initially implemented in PLL clock controller driver.
However, some registers required secure zone access, so we moved it to
the secure zone (BL31) and accessed it through SCMI. Since the PLL clock
driver needs to use this clock, the "fix" clock is used as an input source.
We updated the driver but forgot to modify the binding accordingly,
so we are adding it here.

It is an ABI break but on a new and immature platform.
Noboby could really use that platform at this stage, so nothing is going
to break on anyone really.

Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
