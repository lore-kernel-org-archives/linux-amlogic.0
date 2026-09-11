Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7ADC88E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Z4Z+uujeCDSYqkzpgO6clZW0oiGRPRLjm8Rs25PGtg=; b=hT6mbPDFd303Is
	lDqxuInleOT6DBnZRa9TL2tOjs3IAsvrECOMgRwcx9LUrtnWJlMGHesoOT5jB3H0cg9tfhZyt0b7J
	Kz64ZLxFRBZxVQQpfYpLOmbSas7h2uYOFmqUEI1xoFnBB/XAHRnJuOwrncAA2l5za7VqlVx2Qsysi
	b9JixdEHHhVXWvu8SiitzlXlePI7y8sgzOMtl/Jm7Ji+jrt/atQTSLU+M81ZnkSC0OEGWGzM02b3A
	Ywzws7IWsiAiJAQQMZ4MZB+pwjltux4lELIT/WixvM+48FyWkd+ACZoHm28UVwSmeW7v88MKJsmZR
	HfuxrGJVvPiWX7GXNP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcx-0000000G7ke-3sYZ;
	Fri, 11 Sep 2026 08:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7h6-2nlD;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DE0C447C0;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30936C4AF0D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KppIjkc3Ey3qNP05A5ATH37K53I3DnEZ5DU+4A+G07s18UXuk780jHcDYgHixxe09
	 AumAq9BYru8fpRU1AS6JIVu4DN+TnTQqu6zGbBVNErCErZVI7K5+eBB+4y8Um5qgYu
	 AUODr1UJo7jM1d1ibOKJOCagsu0RLVecTSPo9ErhDxuDXHBKV9zpb5FjDtjk/Kd0Oi
	 xG32pQiitQMoePxOOzKs5rJDNXpXMcV638bBJKrVniTKCua6nWuwR6Or+GJyszGOQ2
	 JteDSpECQChX4f1rNnlGSduAWg4JnUpJ9WdFn/Iuq+pA/s7r+2xnba3JHqDMnH7O2V
	 gDUhZOmpJQiYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9AFC88E53;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:34 +0800
Subject: [PATCH 07/10] arm64: dts: amlogic: s7: Add clk-measure controller
 node
MIME-Version: 1.0
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-7-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g+jOIpaICoW8GinTHQ5X1UmJpEi/mHf2rXG4N1xQzYo=;
 b=jBoQhEkWh+cODoW1/QU+/Cii70cHo4qDdgNTjWFcVZNRN8DquG2R3AjAfd3k2RUObSja2setn
 q3V83Y//pNQB9YOkf87zm3ICaORQYI5UsiSQtmaWTadt5pqCMJM4Tpo
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

Add the clk-measure controller node for S7 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index a3faf4d188e1..64440df4f542 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -239,6 +239,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
