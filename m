Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF4EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSHZlxUyP3kpZFfm9KfImD0HkwY5DKsJ82gxJ9X473A=; b=vJsUXD5muZ9hel
	FXCxtVtLGBB/IQotbGu1Lk5zP9anA7F2jon6UCHee9FXDSL8W6kCb0NisZlzqXkbNqnAq4BWe/iIE
	OcUKY0dOzHmE8Zc75/Lo6zoXNqy1O4D3FHyvJCug+p32uiN/q4WylUNfTsnU0VtndcNuYbDiKYpaK
	1JAkXj3dUmckcI3cQrP+mlY2lb20ot3vRtCkxro9nP3mz2Lq49XaOZKreU0UeNh62DvKrywInC2G2
	c8wk70w7GoEVzlq5dJKHY37QvaodJKK+4ubPS3uZ9uy01B9Sol1omNRHAMRPdYZSoRBGhQjWP4PPP
	4jCL+oAvbwA6wKxTAfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZT-00DSPM-2E;
	Tue, 04 Jul 2023 13:59:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZP-00DSLi-1q;
	Tue, 04 Jul 2023 13:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SVqe3A4FxeAdixEi7Nd7L65hAuANY8HEBhEw2Kj2u+8=; b=hMNb882SJKvn59KIs7VVtEt1x9
	v4+HoAFU7XkhfBs9aXIdPCeIT0M0dmby3PKpv7uiNCGWBnrz+ei1+5BAqQ0v4xWHhdR37+GUjWJnM
	L7nQCLlxtLfo3hfRGHRjvQNSR2Qw57AD6aa2Q0CCiRuw+GP0+N4tL9BQ+VxtN43eawRack5J6YTzM
	gmNC1JRCpbwh0fsUjhSn67o8YEywG5GblkFxKo2znXp71kgvEZ+50tThzwS5HwAM5XXL+fOOcfpPs
	5zqTmXFNYmarhHt4gJ6oPzaQfBg4iS9dSUJI3356ayNXha4n1YMUuwoOk55FRYtpxqoi3vj66uxDB
	hT+D72Hg==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZL-00AwZ1-31;
	Tue, 04 Jul 2023 13:59:54 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 603AF100074;
	Tue,  4 Jul 2023 16:59:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 603AF100074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688479188;
	bh=SVqe3A4FxeAdixEi7Nd7L65hAuANY8HEBhEw2Kj2u+8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=hdI4YxhiDCn0Fjei1lunh5UUBQXuv/PWPY2Kut7+DpZ0ni/LsAdxxFbNd/oRE5AZQ
	 X4ewv+LTy1ULSMm+7vKncmJZtqDj7Vthlv2QOzLjJydEYDtRK/FbqsBbfGTELOQ7Eb
	 d68zYkSrZaQFr/DdOTf1u4mSor/RTYvzcAWNrvKwrytLiUj2cEaetKmDP3ovRC7+P4
	 WMjtgY7aD64RHo1YqoDaZ7ULCp7BDsMAHAK9AQvDEhq4AqB1sWf0/WE8TIe059STdv
	 kzkwrRPf7LF69vzZih+ciEVZWBg7xTn9Cu+tx/QzQgndsqEnR5eOxhxVG2tnD6BXnC
	 Ng+PnNHdji7rw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:59:48 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:59:37 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1 5/5] arm64: dts: meson: a1: change uart compatible string
Date: Tue, 4 Jul 2023 16:59:36 +0300
Message-ID: <20230704135936.14697-6-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178420 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_145952_416997_EC208861 
X-CRM114-Status: GOOD (  13.41  )
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

In the current implementation, the meson-a1 configuration incorporates a
unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
driver due to its usage of the new console device name "ttyS".
Consequently, the previous compatibility tag designated for the
'amlogic,meson-gx-uart' configuration has become obsolete and is no
longer relevant to the current setup.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index c5567031ba12..6273b9c862b3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -344,7 +344,7 @@ mux {
 			};
 
 			uart_AO: serial@1c00 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-a1-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x1c00 0x0 0x18>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
@@ -354,7 +354,7 @@ uart_AO: serial@1c00 {
 			};
 
 			uart_AO_B: serial@2000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-a1-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x2000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
