Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA3C369A8
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0udrnMsoZl6HECfyrV2eyQUEq5F942idLL2Rrw2yUo8=; b=d0Yty48v7N9QVD
	1hQ4lR3NEi0BS6p0gFWLuiiNdgkYxuSQgK60U/IJmbdro8DUEoSxjVwkpp8CpCbPCzbEF9DCrqkPy
	FANzxNZpjp8Im1Fyiob1eflQGEgjtJQTo5M52qVsprkDRoIRXW8CwoyvMhc04lR1y2zfBvaJ5SXFE
	3JEdFLo2vvLxx77L1nSm77EFQda4Lcqsm4lOzpwezrI52FmSBwBM42IO0BGj5KU2ip/K+AguvMpPI
	lmXNxyhErw6IRlyBNzG1WOD2tbSFgdshzMGMB/lUY3a5JcSf/soDWyNhYV4xyG3iELBHryniA2xqc
	PFt+dF9v8pqCY6JZQTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EAK-0000000DriN-30yt;
	Fri, 11 Apr 2025 13:11:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dii-0000000DmYP-1enC;
	Fri, 11 Apr 2025 12:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DA8C5C69B1;
	Fri, 11 Apr 2025 12:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 247E1C4CEEC;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375375;
	bh=h91kvtbHybCRq0mtV86D3bylhFUe+/Vc/2PFX8biaKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p4l/n/yXGL07puYnYDDXxapTQdssnlMlIC8A7LkUh1mxNn1fONnffscPSKdeiCxuN
	 Nvsb1Pp8PebunxZxG2Aijs5UQqQFbZOPfCdeTCYPACVMe9jAv6ukiCgwvukEJOpr9h
	 boj7wgp9AyNaTX0M5ZMMhozrVEWcxwDPow3KZMRJzsbxhKhT3vIR24uXMq3PbEjJwB
	 l9eDWyr1ndb3oUseTl/oi5uowrewunARjMVefRkj/mdEouS2aW9/djkZtzkEfmRdc5
	 gjXx9u4z2GfvyiUo72qzN13htSAFP7YkvoZweopRA1NmtT1+ICN56FJPIy8Vm30OVw
	 +hnN1b9XdeetQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1855FC369A9;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:48 +0800
Subject: [PATCH 6/7] arm64: dts: amlogic: C3: Add clk-measure controller
 node
MIME-Version: 1.0
Message-Id: <20250411-clk-measure-v1-6-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=777;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RawVLe8oduTQK4vrDANIUMhpJtp0oGlCVlxkPVdHe1c=;
 b=kD+M8iLLzKrtqwHv85JmaHPCN+0T/MomV0av1kF1svLfbHmi3SSYxB5FAsMaSYqaUEDZLlmm1
 PtwybkplcdiCjWOXzWuAH2eETaxwvqJxyO0R6+ncKnFeRlBzSaXHGv5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054256_528152_AC355334 
X-CRM114-Status: UNSURE (   7.67  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for C3 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index fd0e557eba06..cb9ea3ca6ee0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,c3-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
