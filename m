Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3DFC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LJfo/MlLZW9N8UkfHR2hZq5Aupmx3sJnxDl8P8YClQ4=; b=yJyb9YeVwISFf/
	Yjs1BPWiFvrmwTDG5iNrC60j90pDMrB5p18XpcumKxwRH/7017aMIVPe5ENRUbp93aVc/tRTjJYRP
	xvsUEhSt0Wqkl5lFIQPe0O0HWaajo6C6H8KyZaRJJk4fW/jHOX4OQymalgh4Ehc5G7u6o1HB8bDS+
	eC38j1wTodx9SsZ50rzj9EkE06gmnFafZ7xiyRxsI0mt01rOTmf0/2m9jQ4XrdZQbQVgR86wgDQ9i
	d7qa/lVF/udYQuMIYazXBcgY+r0CjqsZHSf7+MrtMXA0IHFaiMKTiaL8VQPpRIqFq2GB1AcgqnJxJ
	mfmfKQuMZhOTH5GkzxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naF3s-005Kpl-EG; Fri, 01 Apr 2022 11:03:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naF3p-005Kob-Uq; Fri, 01 Apr 2022 11:03:23 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 1 Apr 2022
 19:03:12 +0800
From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
To: <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <narmstrong@baylibre.com>,
 <khilman@baylibre.com>
CC: <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <shunzhou.jiang@amlogic.com>
Subject: [PATCH V0] arm64: dts: add support for S4 power domain controller
Date: Fri, 1 Apr 2022 19:03:06 +0800
Message-ID: <20220401110306.3364551-1-shunzhou.jiang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_040322_018701_03009FFD 
X-CRM114-Status: UNSURE (   6.39  )
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

Enable power domain controller for Meson s4 SoC

Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index bf9ae1e1016b..96ea95ea5eb9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -60,6 +60,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	pwrc: power-controller {
+		compatible = "amlogic,meson-s4-pwrc";
+		#power-domain-cells = <1>;
+		status = "okay";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

base-commit: 1930a6e739c4b4a654a69164dbe39e554d228915
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
