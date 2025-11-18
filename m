Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C833CED249
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0CSGsZyPoKHUZ/s8jHup8NYKVPFbYrkBbXoJa8GfYU=; b=Gal1UANY7MJo37
	pam9S8dNjr7XIecGO2gG9S76IugHFr0ZP+fYWYYXbTHC2bGw8vV5gtbygsfG+AyCIyvE8o2C7VIaH
	djVg8n2klNnUz+uuQWbQpG1zIvgphagX8ewyk/OJxQTGeMK2Bqk/xOJuACpkIuLX1vEQPaDm097oG
	tfomJ/oeLzF9VTjsfPey2Aq6HZ0d62wPFqwwBQifLaqKrYOWM0//Tfnuqi7WvYcDqAHJI122koGEt
	hK5FcVCLsYyaceBGkF/rbswGiYzAJblCXi299yPbUVps4AkYEkqnaR9NbLs9chvBHRkV2T75dkC+c
	bWLa0JTpwEqT0kIZfu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEkG-0000000HSIE-0XkN;
	Tue, 18 Nov 2025 05:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk4-0000000HSC9-3TWo;
	Tue, 18 Nov 2025 05:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4993244384;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81C7C2BCB5;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445544;
	bh=K/UsZ1gWQPrXE8Cmyyx1itR+TSnLgVk5ZkCZ5Z2VCCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=muIbDzM//nQ5qQ1f4EFe/WmwM95YS1Ckp8AMf36CqZLk3tnJxzZM8czPqnDIS39I/
	 27J5KMlpzFNs2ZLieEkOBsZe123zBt2LzJnUmqXsJTwMjtsVf8/oNe/FsFaceOCf+1
	 LuG2J6f0y8QbEyfnaTfrtOFrtTcr6lzGJuijwGSuhMCUaPqXiyCVNU8/ynUkG2YlES
	 sjc+DzNp5c8nRCnulnHQN3SQwb6poYzXQpEgIAgCbJw/9E0ZcYBG0+fIai2Lb56Bxd
	 6xjeV1cPTJbENPPmAWZI4tcla5GTsdHZJSBvUCczWfmsef3wcIczM+n26bPq5NmJ16
	 rEc3az0mKI40w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAB6CED249;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:02 +0800
Subject: [PATCH v2 3/5] arm64: dts: amlogic: s6: add ao secure node
MIME-Version: 1.0
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lkBjmJL/fA5SfT99KKhTn/IbIqqAL9gYKbERk/NBAp4=;
 b=/4j2wGfR+kNruk3cqjYP5no72jgN2ItSWlXKlprbI1PYFezCj5zK8v3ryWe4WQOTUIJCc8Utu
 qpS1C6qFYGXAEHhkAuSyPQEbXRua/PUatPIAlgFieeUgwmRfLd1tZoi
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_215905_647578_7715EB55 
X-CRM114-Status: UNSURE (   8.41  )
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

Add node for board info registers, which allows getting SoC family and
board revision.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 0dca64a2ef9e..da3e607aea85 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -199,6 +199,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s6-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
