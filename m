Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97292C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 May 2022 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uFdDcycof5ioXFqQ/Ugb2kJJOsyiJgDPsdLUhE4okzM=; b=JbEWS7EQl1vouo
	1Eki7h0/WtTXrbGDxW4sThD6dUM8eGknxV4e62y/gX+Zf//py4wWnO/6MKw7uQST49obz6nRkt56B
	AvHqJTcxaYhLnwYP00t1nCXz9Ok3gvInezPoj/0+nZ0C9TaeZYfDFN2Xtk2otZz/GjkDR0+uc/Icy
	CPe1rk2dRUX22MR8FYvEWyw/3m+PnEs5J7+uewa3WNfCHbYLg2eTNXVn0vj5ZINIrIJLE6RqJ72xY
	sNHXQX7RNQ3gs+jIG9DJVwS8zGXh9ShrqYW1FkTAcJWfJld2qX9Hca2hpSX3RUtklvaaH5ncsNjqI
	E7r04fNV793tzQjcHI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD8L-00EyEu-PT; Thu, 26 May 2022 13:02:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD8I-00EyCP-WC; Thu, 26 May 2022 13:02:32 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 26 May 2022
 21:02:19 +0800
From: Zelong Dong <zelong.dong@amlogic.com>
To: <devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<robh+dt@kernel.org>, <khilman@baylibre.com>, <narmstrong@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>, Zelong Dong
	<zelong.dong@amlogic.com>
Subject: [PATCH] arm64: dts: meson: add reset controller for Meson-S4 SoC
Date: Thu, 26 May 2022 21:01:58 +0800
Message-ID: <20220526130158.36651-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_060231_074899_CB2953F7 
X-CRM114-Status: UNSURE (   6.12  )
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

Add the reset controller device of Meson-S4 SoC family

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 480afa2cc61f..c750bc60786f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -94,6 +94,12 @@ uart_B: serial@7a000 {
 				clocks = <&xtal>, <&xtal>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 			};
+
+			reset: reset-controller@2000 {
+				compatible = "amlogic,meson-s4-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
 		};
 	};
 };
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
