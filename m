Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B805C74A5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vW4PzpjVgVZeXuh8onWFdblwHVLH3CrQhEJ6sKEnWbI=; b=DW8UAZSf3vc0WX
	DJRAFsUta1BNh+yjReIutxxQFyMKC5cuVtlC2FUiAWIiO28NNkVylH6uOKIGmB0jfRImoK5C/UvQP
	ekN4Rgke0vBZmfJbwpC3rQg3YiRJwKHVgL8+Cvbm4roJn7Q18H0Rp0E2vChOSW6wQ+s/jS07e15Ot
	jiqiM/peWQAf+tMEEYWxEi/SEueeLzjthuEgcGPefqsBXYhvD04L9UMDtSv6zwZDgXl0/N+Mz9ye/
	3Dq5WrtI8aYS4igz8yd1+iYYAAyvWJYlbvENh77t5PQn2xg4TMdN4DYP+fIiOYiKnnswXpjvwx/Q5
	5mvgVeLsCNFgvkNAgMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQ6j-002mFI-2Z;
	Thu, 23 Mar 2023 18:56:17 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQ6g-002mD8-14;
	Thu, 23 Mar 2023 18:56:16 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9C1825FD09;
	Thu, 23 Mar 2023 21:55:59 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679597759;
	bh=ed9AeSLzPB6ZrfljopDiIm60hYwrFfEp8kaOKxNGdNU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rgtT4PGb3ikHO1fOwokuFMAglPXKKSFeslNFC54blWwHc2meiZCC7EOwOyR85R1/1
	 OnJSfffzOA3lze++dGtwxh/3CWDHqKqB2kyJOnCJe2bxupQmn/fSJTqSd3UE0o4681
	 mlCqC6ZcAa3nLrE819pVerDJfe03YsWl4g3TQVc+B2zYhVKcwK3U6nHjIFEdlPAoZG
	 YBRrDbNlnq2kG7ARS4boObxNsiWd/keQWmbv0QS9T9122Xj5HpHKB+joiQ+ktQsRuJ
	 rdDGl2oYoZXn3YjgG2RsiqRMM1DoCRbEhbB+WRfczmiPa7/vqI4flQSkzmTMWH2pCo
	 xHmnZLJLLfLow==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 23 Mar 2023 21:55:58 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>
CC: <kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1] arm64: dts: meson: a1: place pwrc and secure-monitor under /firmware
Date: Thu, 23 Mar 2023 21:55:48 +0300
Message-ID: <20230323185548.13731-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/23 12:44:00 #20998559
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_115614_565922_F1357F9E 
X-CRM114-Status: UNSURE (   9.68  )
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

Before, meson power secure controller was a child of secure monitor node.
But secure monitor isn't the bus in terms of device tree subsystem, so
of_platform initialization code doesn't populate its children
(of_platform_default_populate() API).

Therefore in the current device tree meson power secure controller isn't
probed at all.

If we place meson power secure controller and secure monitor nodes under
'/firmware', they will be populated automatically from of_platform
initialization.

Fixes: 04dd0b6584cd ("arm64: dts: meson: a1: add secure power domain controller")
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 77023a29b6e7..44c651254dc5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -72,8 +72,10 @@ linux,cma {
 		};
 	};
 
-	sm: secure-monitor {
-		compatible = "amlogic,meson-gxbb-sm";
+	firmware {
+		sm: secure-monitor {
+			compatible = "amlogic,meson-gxbb-sm";
+		};
 
 		pwrc: power-controller {
 			compatible = "amlogic,meson-a1-pwrc";
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
