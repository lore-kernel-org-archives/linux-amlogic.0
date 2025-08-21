Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B64CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Aug 2025 05:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4BtE/xBTPSIQe6Q9HNW90wgHekkgK8/902txkepeq8=; b=UGVaBWzYzBUDId
	OYPJYt3D/yEFo22v3I5aVermUDNAq1b7ivD3twoiaeAbycEOiZLkhB3NQFxKixY/PCildwOly4Ibb
	ZOCxK1cxYLMLh2WO0WJXDiti1sOfP9hNHUoSwsQwcJH9FviEEi06bb++KyUcVDUlvZRKHMLIGzP+p
	FiJk+W5/94p6rZt9lmPZhlTBe0xsLdA8kvASK4mpLDB1ygQjsBkTCRiu8FgENhRomVN6aBqcqKIek
	nnbvUgMTTH32tG91Gg8VD4oOdS7bU5VEQcN+3JMEIxHzcO4dLAZUvZpb8L9mZDb2GDeXUGJg4ipZA
	Uvotkb+4reAu2IXkIxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxny-0000000FsPk-2XtZ;
	Thu, 21 Aug 2025 05:25:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxft-0000000Frai-2afT
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Aug 2025 05:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDE1D61450;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6762BC116B1;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755753440;
	bh=SGZ/ztM0Jh+alQljhSybFcNPM0P2ohWIF7g13dEMIfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fOqPJWHoWnZk7EJtNc+gOUDfUA6OajCqfX5gEfr7lKle9ozbWYfs8XsaRHzsiRSSL
	 FeUsPH1X0qqnIOlwhYT3MTfC6cUh/j13SnVjH3so6QNdwNceSQTD0xmvY16xb//zJP
	 Qvw0XEJsiCER70Qn/0nyCN5ZfZJ7t/VLMcv+IN1rE9+drlLzKbJCcVjwA3iOBKiGXS
	 ro9JZZAA3bGq4GGuEfD/8gW4y1lbx5cr6Lv+EiUNYH+/moYV2WtGAjo4eiBK0jStO9
	 +bL+RLZvcZcldQIAFljfPpKbdP3/xh+rYO1FKkf8MErO1kiydBnPgJIhk2irh7tgpg
	 UlpCmuzQU9Xzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB82CA0FE0;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 21 Aug 2025 13:17:17 +0800
Subject: [PATCH v2 3/3] MAINTAINERS: Add an entry for Amlogic spifc driver
MIME-Version: 1.0
Message-Id: <20250821-spifc-v2-3-b119f64b5c09@amlogic.com>
References: <20250821-spifc-v2-0-b119f64b5c09@amlogic.com>
In-Reply-To: <20250821-spifc-v2-0-b119f64b5c09@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755753436; l=935;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=waH2I+tfwvOLzp50Qi+Yg091qChCxHO4Mz5PuoGKYLg=;
 b=KAFa60+6MQk6r4CLggQRiBeApIJPazVc2fxGrAnW9/Lxt8/r8EmIMKkkNgyipVV5xFhcgy6II
 Bif1p7n2ADSC+ZjxQt5N4JV7Cpav1+yA+SvN1OpiW6VVgFYhz4MH3sd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic spi flash controller entry to MAINTAINERS
to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1c081f9c567..9f1f337e9b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
 F:	drivers/rtc/rtc-amlogic-a4.c
 
+AMLOGIC SPIFC DRIVER
+M:	Liang Yang <liang.yang@amlogic.com>
+M:	Feng Chen <feng.chen@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
+F:	drivers/spi/spi-amlogic-spifc-a4.c
+
 AMLOGIC SPISG DRIVER
 M:	Sunny Luo <sunny.luo@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
