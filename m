Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCDBC001E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 03:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R76LH5iqCjsZ6ZOud97Ga259ZTC8eXiVeWKxQQdcHGI=; b=oq8AVuOaZ1zMNY
	c4ujjK7zG7/MIhpjVOqgYnKsBK3gvTIZfNFJvCvi0WKya7YRP4eHZ0Pu0tydOfmlOm2Vq54Jq1s8Z
	p05ca98GjHNMVzRNy5oiuQksYptOaJICrGY9mDjGmLgqhf3Di6DnN08udMAaWCrAk/mfrbCbZM5Vk
	kmaGjNiHw9rvTpWgVnvD5rHfOIy4aEdIEIUQUCW1JYvnRFeDa1Tv1dK/uFgqqks8gwac651QIjiU3
	bCJx/XBwQdrn+He004qLJfuUtJrLKztjFxwMF0/cYk/4sF1FTWBCQrsPNM3pZXnOkKXyiJvnKwGQN
	M/SLIDUbUu00483Bg8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bg-003sZc-1W;
	Wed, 02 Aug 2023 03:33:04 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bc-003sUl-2z;
	Wed, 02 Aug 2023 03:33:02 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 2 Aug 2023
 11:32:30 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>
Subject: [PATCH V2 4/4] arm64: dts: Add watchdog node for Amlogic-T7 SoCs
Date: Wed, 2 Aug 2023 11:32:22 +0800
Message-ID: <20230802033222.4024946-5-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_203300_959559_ED8873E0 
X-CRM114-Status: UNSURE (   6.32  )
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
Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---

V1 -> V2: Unchanged.

 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 1423d4a79156..6e34d11214b7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -143,6 +143,12 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			watchdog@2100 {
+				compatible = "amlogic,t7-wdt";
+				reg = <0x0 0x2100 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
