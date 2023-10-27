Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC4DC25B47
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BCsyKGXLrdOJCzcYffK7q2dyg/gR+5t3beBie9xh9I=; b=Z2+28oBZlkBxC/
	yyCYQDX5VbooPTQ14VCZmijvmLXda0C+8VR5swmLtUQJ1RqNP4M6dltV7jFdwxwq20HgMTwZuZkfk
	dy5Q0CuTVkLC2MbvkoMbyLVgLPIPzEjdpjN/iTPi5UC4grbiU3kxBzZyOVdHoQqwsLMt1/qBDY/w0
	vFDkfZfUbqtPdIP3LE13tE6OfKq3LKNFh0wqWBA0ETeUZcoWiBtevJPV7cy68w5TTuKZcXv5papON
	m6u5AVV2Eiy7IF9+zY9ICKb1o1JxosMOqAw32S7R57OJy2xVJCx2w+Jx3AkORia9P7OpM1gRF0jBS
	0HnQmkx5qvhSwYMFKK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZY-00GGYS-0l;
	Fri, 27 Oct 2023 11:00:12 +0000
Received: from [58.32.228.44] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZB-00GGP1-0u;
	Fri, 27 Oct 2023 10:59:50 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 27 Oct 2023
 18:44:27 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V3 3/3] arm64: dts: Add watchdog node for Amlogic S4 SoCs
Date: Fri, 27 Oct 2023 18:43:58 +0800
Message-ID: <20231027104358.342861-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027104358.342861-1-huqiang.qin@amlogic.com>
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_035949_314125_3C7B8914 
X-CRM114-Status: UNSURE (   6.18  )
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

Add watchdog device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index e0cfc54ebccb..2344b2d741c3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -92,6 +92,12 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			watchdog@2100 {
+				compatible = "amlogic,s4-wdt", "amlogic,t7-wdt";
+				reg = <0x0 0x2100 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,meson-s4-periphs-pinctrl";
 				#address-cells = <2>;
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
