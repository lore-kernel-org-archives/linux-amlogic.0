Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA95C25B10
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Bhiw1AGVp8CaOs5oHKAd22rP7WcXm3QXxHAluQux/I=; b=mKEP+RMvgwimuH
	l6oB4KmX1Xc6XSxEPqyigHSIW3XCFgpWhGYXC0OIaTJhwujhSlG3vYHh7pFg+3FdyO4b+idpGGEGf
	yLADM8+Xvyh8LAN+gU4JpcDJXvZpRdmx2wa3ab1FMob1enD2KLsahgzTrn9ghWvK3Sv9/XoX+91Vp
	9YW5OUC5ZSIoUvcfM5DZSFwCff0jXV9MdLCup6sDLViqNdAXJau2xAQ0afkeAmiwmJ1RafmWjrcr9
	VmbnsWT0e/burJTqkcHpuYEtUl6Tu9xAEpC5xll8AkghtFstgcXWXT57UBrKG4kwTITfHKAXDUJNJ
	FkyAfNV4aEYqAbehELzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MKa-00000004eSL-2jN0;
	Fri, 10 May 2024 09:14:20 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJM-00000004dSk-0mYF;
	Fri, 10 May 2024 09:13:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BC1DD120006;
	Fri, 10 May 2024 12:13:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BC1DD120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332381;
	bh=JSRcxYPeGuJ4x/7rMS2s6r0b5V5PwlUZiy7xcqffNMg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=jxlqELikL32otCnH3MZUQY1WzhJo/wsNGLfuEnhTJIyZOrMx/4Lk7lcJYZTa6qobb
	 oyap/BamCL40it5+LKoACbRL835RkqIbHW26QTLM8c1m3vhVYGqE+Qp9186KjO9XBh
	 gOFWytrFpamEIFrKMljkA62F3WD8rTZJtEKe7Z+59Mp4KzYWGzIqVy/IZ2iTot/vSu
	 PQA3fLCG/FQkAdls6ajP+bDzaujiYiBwstRtmGijURR+eUaC9QFG5MpGYIwg3OICiH
	 ISpVuuNOc7FctuFUlkBn622gSznGxfP1Q86qFo+AVh9RZUy41bLo/aRHFmOlJK/cOZ
	 KzLteD969iIcQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:13:01 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:13:01 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v2 3/4] arm64: dts: amlogic: a1: add new input clock 'sys_pll_div16' to clkc_periphs
Date: Fri, 10 May 2024 12:12:25 +0300
Message-ID: <20240510091251.20086-4-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510091251.20086-1-ddrokosov@salutedevices.com>
References: <20240510091251.20086-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_021304_900598_438563F1 
X-CRM114-Status: GOOD (  11.39  )
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

The input clock 'sys_pll_div16' is a clock with a fixed ratio inherited
from the main system PLL.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index afb5d7361177..785778f3a7da 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -747,10 +747,12 @@ clkc_periphs: clock-controller@800 {
 					 <&clkc_pll CLKID_FCLK_DIV5>,
 					 <&clkc_pll CLKID_FCLK_DIV7>,
 					 <&clkc_pll CLKID_HIFI_PLL>,
-					 <&xtal>;
+					 <&xtal>,
+					 <&clkc_pll CLKID_SYS_PLL_DIV16>;
 				clock-names = "fclk_div2", "fclk_div3",
 					      "fclk_div5", "fclk_div7",
-					      "hifi_pll", "xtal";
+					      "hifi_pll", "xtal",
+					      "sys_pll_div16";
 			};
 
 			i2c0: i2c@1400 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
