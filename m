Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F21FCA0EE1
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEyMplnISUrDoPTJJHS2IC/+dKHkBZTBQuM0tzf2XFA=; b=TbqU4leTamytsW
	1MqfSTuAUQcUNgr2wLU5tVbGe2yVqPSAqe4MABkpUwHBQgsDu+ubcB+lmmj1iQGFso8mG//spklQo
	1lz1AJa1fNFpOHYoLayVisAmFKs2fbJ/+QCt9/hTdXUKSGx+bSYCq/+1HZK/CjKCsquNQnOSAlAfc
	hvf54FROYhujtV1YrKWg6LxFKw041acNVgiWk6aJj8La2lzRi+tXMJSCjPhyz9dKOt2YHHTHa2Rfp
	u9yjfWRXvCkO4v0KtKgSVRyUA6rQz7AP56tR5w+pKP9xui1E+gNfOaL0h8ULk/8iyOUOQh4BYeoQq
	pKEXjo3TPfH1dgEEvBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuBk-00000004nb1-2VYJ;
	Fri, 30 Aug 2024 05:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sju9O-00000004mrV-1sdb;
	Fri, 30 Aug 2024 05:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=L4fQhxA1nWjf0hmSH/qavlwfrQCwiNdwtBbXYNnkH/A=; b=EeQJqK32mRGDBMIGu/mZZyYmfo
	4SmAPpsouKt+AXY+G52WnCCLGcMkjsYPKxF7lX8QD0InzaMtDNL0p6tUfLqile85p39OUBmHXxavg
	Yro5Y0fNTzRELCaWKfMpC+sPkYGIvAoLYh289D7LhiCIojc8Ie5tvCxrA5VlTIrbq2pjQy5mBrcgh
	RyS+NQ0BXX3aW/YbVkd2gdkKDa/C4n2JU6c0H/Mn01jW2LOBOJwMonbil9zkpZBRBrNAEzBiSpTkU
	SA33mL9BQuF2FGPnqLJhTNKc1XU/kJ/B+9Kd0wpOdgn9mz571Ot104JhKNticy1Cgtt/Hxsk3SIBe
	TgUs4CyQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sju9I-0000000BZQK-366x;
	Fri, 30 Aug 2024 05:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65A21A43BBE;
	Fri, 30 Aug 2024 05:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3521C4CEC6;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724995570;
	bh=6QAYYF6aaar5pzIHYRxtO4F/Jfa/IlFus/mckSJRuB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GEbGyFmdkrqhYiMXPMDDMskWpYLYIECMj+qBU31MQP03ka3mCekicJp0Kfyck+pXn
	 j98Wt/xXjM4TNrpF0nOvl4kE4HLthmdbx9mmO959LQhfH7lo9TbjZCc54zoQrXi6JR
	 i6TiEM0WSVMFjcSQCuKKpNH2PJ+WvOmrjBuQMOt/RK7OP3nqb7DeIWmwDIwjO23/t1
	 zau18mxjZp7SiHQSU0KBego2c5ytOhevsedZDKhY2U5lhBjxSuWYy6WJEGaXcUbkhF
	 nSloA5R2w9O5Qz8BMBnaItPNOmUl6njrgcfg+FNUeb0UjyaRf1/j0QLiQ12QUubttB
	 zEnu6i27iMTJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9537CA0EE0;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 30 Aug 2024 13:26:08 +0800
Subject: [PATCH v4 1/3] dt-bindings: clock: fix C3 PLL input parameter
MIME-Version: 1.0
Message-Id: <20240830-c3_add_node-v4-1-b56c0511e9dc@amlogic.com>
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
In-Reply-To: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724995568; l=2021;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=WQR1UBxGONQHyor5r4Vdf/Olja7ABIla1YIY56QfC4k=;
 b=8px0text+zQI58RVTiqzPiJZVkV8OcmuahfJ7ecX1bkgQS/cJUvDitRkKfKS4vHbikCn7tThL
 6CQ/UrHGzwlAEtGJwoNrcHK01Gix2f6ublNvP3K7YzYZEW0SOrD+5NQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_062619_024570_741D42EC 
X-CRM114-Status: GOOD (  11.46  )
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

The clock named "fix" was initially implemented in PLL clock controller
driver. However, some registers required secure zone access, so we moved
it to the secure zone (BL31) and accessed it through SCMI. Since the PLL
clock driver needs to use this clock, the "fix" clock is used as an input
source. We updated the driver but forgot to modify the binding accordingly,
so we are adding it here.

It is an ABI break but on a new and immature platform. Noboby could really
use that platform at this stage, so nothing is going to break on anyone
really.

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
