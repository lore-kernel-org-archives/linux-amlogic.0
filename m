Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDD2EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiKPF2ul0NUasP2YE/8sLYzgzDX4tAa+2JbyeYWCoIk=; b=gA5JcPnfuUEny4
	FuQHA90q5zLZmhLJQdKsG5+0eiswq4yR2fH4I6JqYjiK0HZ8hH+3dZmmTX0v396H2HZ+SULBhbDyZ
	omsids24XKh6B8E84KeHxu58J/JOUmUqndit0yF0prh6uhjQ87qSLpDfQgMbIKxElbvxJucC+r8ab
	KLzRIO/SQQzqGOFwebQg28dbhLeTAsrkfPQs4frT3jvf6LdAgy+cDAMfphYJ/utj51fQpoFhyxjJE
	watIhKF5umM2PZ8lk9PolyfSlASalKkE6Zhu4EXHCso8pScKxKxv76R/ONAbjiCI9MnwJTiPudOWI
	wc1WbXstJVE0TRzwDa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERHy-00FE5O-15;
	Wed, 28 Jun 2023 09:16:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERHo-00FE2v-2I;
	Wed, 28 Jun 2023 09:16:29 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 28 Jun 2023
 17:16:10 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add support for Amlogic-C3 SoCs
Date: Wed, 28 Jun 2023 17:15:32 +0800
Message-ID: <20230628091533.3884385-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
References: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_021628_747948_DCD698F7 
X-CRM114-Status: UNSURE (   6.48  )
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

Update dt-binding document for GPIO interrupt controller of Amlogic-C3 SoCs

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index e84e4f33b358..3d06db98e978 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -35,6 +35,7 @@ properties:
               - amlogic,meson-sm1-gpio-intc
               - amlogic,meson-a1-gpio-intc
               - amlogic,meson-s4-gpio-intc
+              - amlogic,c3-gpio-intc
           - const: amlogic,meson-gpio-intc
 
   reg:
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
