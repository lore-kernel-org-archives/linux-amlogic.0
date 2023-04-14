Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7F1C77B77
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV3PNuL1YgOSCJMGlYTjsL4RYQHwE9glY5Vy7lwuMP4=; b=fJWv8B62/eXk7w
	DyOTlGln9Ci988o2eKDL/43aTsYHYCo7nRAfxc+9QxQ2LnHWkNM+QwTzrMAU+WoTphjUZzE0xmhp7
	WeLqh2RbWExADTCUQ61JMMPs/9m714ZbL81rmBpmPASBJV0K41fdSQFoSgrfLAnYs7d98oRl34TDo
	d4vKZJKld0r2aMucH80cHmiICOvXQBb9Ssq7Ju5d9lZT63cOk/mrRXJ3af1/Jgltw/eJjZVG1Ro15
	4k7GMPX7w0wUX2eChHu7tDaLTtAeAbzvQXA7VJ5n9K/cfQ/vC9oFkDXeKHjn9PIENwFbGRiJY3HMk
	Lf5dsfNFwS50e4Wqd3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLI7-009wnD-03;
	Fri, 14 Apr 2023 15:24:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLHz-009we7-3C;
	Fri, 14 Apr 2023 15:24:42 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 211AC5FD26;
	Fri, 14 Apr 2023 18:24:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485874;
	bh=C6RAhM5A4BPHpRvqPC3ioWTgfct9Luzmkm/GQUTL3y8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CkyiC5UmgoUazTCGzdnnbsZ1pUZ0e/fl8OQhoq4l4f4JFm6e1MN3YKe81/0NaZycv
	 2yUexAzAxh4o0hqFRzrMT2NFjbqywU3XnzTfdqI5tqKfPVfwKp9dFuCJ8/jsRUE+eM
	 qnBVd+4Ddbkwp8StXJqDlSvl1LZHA7bpgU3cAmZ9Q3EJrbOwKknyKA7gHxSkiHHh/N
	 eNmROGlk0ILOQNtPQjvGBTq4OvL0C7+R7Rf8DVBBMR/QX1BuKdCIE+CaX06aZZEww6
	 xoIy35K14SXnltaFUikrxeX/WTpDaCGhfmTiMfo89BtMWR8+FFqkkdfgoIYYg2t62M
	 tDm104Yj+iB4w==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:34 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 3/5] dt-bindings: usb: dwc2: add support for Amlogic A1 SoC USB peripheral
Date: Fri, 14 Apr 2023 18:24:21 +0300
Message-ID: <20230414152423.19842-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082440_209774_0F306FE8 
X-CRM114-Status: UNSURE (   7.41  )
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

Provide the appropriate compatible string for the DWC2 IP that is found
inside the Amlogic A1 SoC and used in peripheral mode.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 371ba93f3ce5..f70be397dac0 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -53,6 +53,7 @@ properties:
               - amlogic,meson8b-usb
               - amlogic,meson-gxbb-usb
               - amlogic,meson-g12a-usb
+              - amlogic,meson-a1-usb
               - intel,socfpga-agilex-hsotg
           - const: snps,dwc2
       - const: amcc,dwc-otg
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
