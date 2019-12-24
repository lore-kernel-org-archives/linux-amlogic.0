Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33D4C2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E33420706
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sv/A3weF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E33420706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYGEkRpr5cp8gxqOvkKzQrjJgMjEd7aZgUVvdXYxwdM=; b=Sv/A3weFRvL1PE
	lj9sv7wJuCSxCeUx+dQldqo+cX0eQBCLQZa8SqTfJeWpA/y27nF0Z1400lesMfQ84hOk/S/Xn9a0V
	tVnHuHQxrUrhVECy8IYKSKdEa7vFhXRIBUCqj8cQ8zuWHCBNft0DMzeWXHIXX1FAq23hIx98SeVS6
	Tj4eJbSRzAVkcQ0o9yX2cuxSfmWvLppWhvvUVFsxDDN+Qm5TyoBd6R8LlcT7SrN2Z+zg52OCnR1aa
	XwrRm/t09e9wa3mLrT/qm5v5zQraQsrZzY5tfDfTfFzwa/LpTn/TIznSgtSCjCVxH8qzvywG/i9ox
	6VkRg8NmingVCJ8PgThA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijo2i-0000qx-I1; Tue, 24 Dec 2019 17:32:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijo2f-0000nm-9p
 for linux-amlogic@lists.infradead.org; Tue, 24 Dec 2019 17:32:22 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 41D6D20005;
 Tue, 24 Dec 2019 17:32:18 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/5] arm64: dts: meson-axg: Add PCIE PHY node
Date: Tue, 24 Dec 2019 18:39:40 +0100
Message-Id: <20191224173942.18160-4-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191224173942.18160-1-repk@triplefau.lt>
References: <20191224173942.18160-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_093221_517412_BE9DD610 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable PCIE PHY node to make PCIE reliable on AXG SoC.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04803c3bccfa..e679ef26ab79 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1356,6 +1356,15 @@ tdmout_c: audio-controller@580 {
 			};
 		};
 
+		pcie_phy: pcie-phy@ff644000 {
+			compatible = "amlogic,axg-pcie-phy";
+			reg = <0x0 0xff644000 0x0 0x2000>;
+			aml,hhi-gpr = <&sysctrl>;
+			resets = <&reset RESET_PCIE_PHY>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
 		aobus: bus@ff800000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff800000 0x0 0x100000>;
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
