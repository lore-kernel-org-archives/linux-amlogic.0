Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E622CF256A
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBHZnP1iedX82fxVnxwW5HWM6OG32jbR2NbioC+O7rI=; b=dAJ8k/LF62T6Jo
	vnl4SMEf6jxPAXHY72IL4xJ9L5FVwRJspeAONx4hBiHAdg4NWi0gO+3aiNYwnigkr/v7lLimHsZHf
	BIS6rc6vjt4MjUPg4UfU1GrSQa1aMk4ac4kq+axJPr5k3Fq5i7tYW15UEEEvONu0Za5ZkG9arMn3E
	RCkGvm1o9ir6MnBgmJW+Obug0b1gHTWfHNevBi6lUIlCWYuMRX1GWoOl0jBeJMJQAueYGhkM01Tjt
	mQWQ6KXB1taZkeYOk2zAUICPMvH89GiLCZA9fNGVv+8VkCxBdXOncibYRURWvrRU1EHpIz+WMWyul
	UI/NOQwAUXW3jDEnfRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJE-00000001Pnd-1HPH;
	Wed, 19 Nov 2025 02:52:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ3-00000001PdQ-1e0F;
	Wed, 19 Nov 2025 02:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 283744455D;
	Wed, 19 Nov 2025 02:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 843F5C4AF11;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=cyiYUkhzt9a5Vr9zW13uqsn+eoSw1lee7spBvhydj7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u1mWRpRZIX5m+PByt1j7rXj/Kaa//gXc/OmMugRm04D4NZ5Xbpe9jA2gr33rq+8pN
	 t0CIWyLDthHx4IHnCFHj6pSasBxfyRzkboJt7uvbV3BBGnJ+r63G0k8uB97TwyZzTp
	 niwRZoskaR9owaeJVP3Fh2AAXAE9CmtHNFRlSudL5bdXcGVVi5btg0G+UT+Zy08lbe
	 fBDP28WCpbDnwg1ZX0Ag1yG4kIyTT/mPWDZf3+MAEyYpYyYxwxt3jtA4KIieNdoSG9
	 +cPdypENc5u5EtbQuLxHHXosZR7bMqircpp4PilnSOtGR4DNWAf7YCR0n8Tkp+3Okq
	 nSNtuJ410h15Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0414CF2572;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Nov 2025 10:52:26 +0800
Subject: [PATCH v3 5/5] arm64: dts: amlogic: s7d: add ao secure node
MIME-Version: 1.0
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-5-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520743; l=919;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=cpqB1LNnz4EVCh8gXZ8/VFLD9SRXCAMe5RV0gVnWqBM=;
 b=hJZ3a93/SCaYe8VPfwgqMDgNXVu5AY/ly8Nz72esgHLP15RQ+KDYXDQEYvrJGWoO/LXFCFwg7
 Q9tmcdDABHXBd/yOS+UR0L+NZIDVb1wiSqFme0TtmF13w7uqqTDbvx0
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185229_454783_DD881232 
X-CRM114-Status: UNSURE (   8.61  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index f1c2e91ec6c5..e60167af0390 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -194,6 +194,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7d-ao-secure",
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
