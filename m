Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B578C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7GFtSa6/sHkPMQCg6nEQQwWszx0eyuSV6oaN+gCGj0=; b=4Sjp4AUyJnZFgs
	kRCHLUD0LvcxGrzP++sWVxOIy4Z57gygMtQIROc9i48tmdx+/5JbNkyGMDzYf1SUgI9MQ0PO+VSJe
	Nv5gacKvimT3rwZ9foX759eGqhpKL2mVici46Omws2ARzjNdLlKnnVmmDC+ApcV4KxTwWMo9OCI7n
	4aydP3ikogtQlRMs1epPvY4hn70xz0KiTfGScf05Sqosnngz1Wo4ljcU7gDWOj1OQ33pFm3tg82ho
	EEItkBIv3anMt3+dCwzIlVDfSenEjw1mhUHMsFhO2PhzQamWPCDI9N1VoeAKIKG+aZz+J0e/3iNyj
	YlpHeR3+kpvR2ddAKVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zab-0074zI-2S;
	Wed, 07 Jun 2023 20:17:05 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zaW-0074vD-2y;
	Wed, 07 Jun 2023 20:17:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1B3FA5FD70;
	Wed,  7 Jun 2023 23:16:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169013;
	bh=UTZcZ6SqBjR1YEd2msrtjkp6jUwOSc8GxBbCJ0Tz6Xk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f+vaPMXGOJFDqj1KS3+wyVqC1kzG+ieLA8Dm/owf1lIlUeXjJT7/ImErFX/5E4XsQ
	 LfvCGkqX3tgmD7Qp1YUTe8X/+Ie1Y1olNBCheCisMt71yJxI10I+CDkOqhpG20Iwpb
	 ANmZxAaCA8Fxi+nvnSxsSAo+MxzY9k3cJoCSe+CBaZ7nrcNIbKGdQvCC8lxItjSKtF
	 ALQ1iu6+tdAyLmh0pYpx33O+S7bBEy4UEnlw/DOmM5mK6AQoO793+9QUde5FbYL7Cp
	 DTSpgFenmMhjy5PLrE2VUdsJJvKQek+0S3f6f+Qb/6bgvLqihDMUP9QZdpBaUHCiow
	 O/NhnXkdGZLKA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:53 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Alexey Romanov <avromanov@sberdevices.ru>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1 3/6] arm64: dts: meson: a1: enable efuse controller and setup its clk
Date: Wed, 7 Jun 2023 23:16:38 +0300
Message-ID: <20230607201641.20982-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131701_157387_177503A5 
X-CRM114-Status: UNSURE (   8.66  )
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

From: Alexey Romanov <avromanov@sberdevices.ru>

EFUSE A1 controller uses CLKID_OTP clock and PWRC_OTP_ID power domain.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index b2563c7d3842..63faccfc1134 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -44,6 +44,16 @@ l2: l2-cache0 {
 		};
 	};
 
+	efuse: efuse {
+		compatible = "amlogic,meson-gxbb-efuse";
+		clocks = <&clkc_periphs CLKID_OTP>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		secure-monitor = <&sm>;
+		power-domains = <&pwrc PWRC_OTP_ID>;
+		status = "okay";
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
