Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4262C7EE24
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRoH4cyBdQpbKPKJg7hSZot/BItrTbqOxppduWKia7Q=; b=jlfvT56tVzGIny
	o6jHq1UjTiFZfDtajMiBX6hchKoG+g1aNSMb7fTtuLym3gRDZR5M5LB+nhP8KerYw/96ESJ+J0FwA
	6JZ48Tn79Uc0zDpxUm12sHSBtdJDAvl4FKJa2MdDRWGruT+gceqlvVEn39F3z1zgTQksGHeLQRXsD
	q5q6/WiOBJ0Nm3Hbw76m64pyQGJiKpxN6ByBZ/+ZUQL3+e2WkiaARZeyAO6jZgFvnzd5apo9rSbjL
	bA0hXdniEdSqO5d5T9Wt2Vd7d3j3cXueLh0NAPmcyOLNne3ZDIsLwETez/mmb59tefpqmZl2eW1JV
	wk2jCmvDOP7wafX0SjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDTO-009yzS-1j;
	Thu, 11 May 2023 21:05:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDTM-009yxd-0p;
	Thu, 11 May 2023 21:05:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 112885FD15;
	Fri, 12 May 2023 00:05:09 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683839109;
	bh=d9FEepOf44U9WlSTkZRyE7W3kPgjD/3/5ttgBCiHj3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NpXc+JAquzliIizVSYH5/0ly7V9axiK8/Gm/G6t0/wFlmUhTnHTxtryYcDN/D6M9g
	 E0t8BzNMcoF/Tg37/rku5F4YXqQwsHtpEUYpNFibhpklEaUjJgZMCkvpKBSsN5yuNA
	 vdpkTy00dJVFPWWVz3P0gtAB5dlF7foWw0i7g5Q68GMsJQsH9Jyu2QczqeXTSYLDHb
	 yiNjmtlTqMqjmGk6NreLJ1JWlsuk1phnbZatvExflF19te0P4bB+egN1nPPTqekhJD
	 vuQZeHaVbayjcRkbc2VybkPWuSCZsn5HWS/hFDjJt3Q1rgVl7QHB2fmUlL80DTnycf
	 o8HQZ4Sb8NagA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 12 May 2023 00:05:09 +0300 (MSK)
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
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: usb: dwc2: add support for Amlogic A1 SoC USB peripheral
Date: Fri, 12 May 2023 00:04:54 +0300
Message-ID: <20230511210455.6634-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230511210455.6634-1-ddrokosov@sberdevices.ru>
References: <20230511210455.6634-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_140512_471234_776AF8C7 
X-CRM114-Status: UNSURE (   7.73  )
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
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
