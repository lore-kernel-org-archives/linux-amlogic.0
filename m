Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054C1C83F1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jul 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VuWknI1fRr8DsGdwP0i+BOqiirhqa8KGMnvYAODxaXc=; b=XZkAQ0XioK8y9o
	BJB+c2KXP+vsaYBGCJ5l7SqzDc9CvXkJDumsYw6X2UE+ryB742rBjXjYg+sy7E3JxYu9FogW4F8G3
	ALC89yRfNHgV8L/ga/8ok6DM9QyZeNRTkNcEP/kEm0i0x9gKu8AZkrvPC7BbFqvVG2vf6wJBsFQqG
	4yXdqyt+YxqMpvM0xXGpkqB5o4incyYHHL/VPjbCM83kllZJWFqH1PbJfyNR3m1rft4dbxWxoPG6M
	LMdwHUnSlC2qlzsMYNq48YrmPBkjoSx198V3pRbTsv68oqYv+zc5PbreHWkFEvh6tOsyKn8stpx8/
	q37YcLMzFsUpL3lzNI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4K-00000009kMh-2pAb;
	Thu, 17 Jul 2025 09:38:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKmO-00000009iDF-2Rw7
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Jul 2025 09:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C21CBA577F3;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6552AC4CEF7;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752743991;
	bh=berKg2cuWH4Y7zdED4eT5oFHY1ZYlo7PAlZDh/gw2g0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eGLqCPU71HxltxYx+8SOmxosROA1tIcHvwXwJV2fcsf+9i5B48YzoVF/d5XKQR+9Q
	 mQlUxTh1rfms2L3dirXmXM1a3u7OxVHzvM7sg7e2ZAtdpGPWn5CW58U19h6JW4K7aW
	 ODpRs2RxXedlSj5+Hc79afHV219gNM3ZIDaWMU9VreFgltZ2utlnwTGAEipCfrFwFf
	 gP1ccW5XqK2NKPcY7Lh7VPaYoiUqSOZ8tO5Stikl3iNqW15q7NWkKPdhOsRPXQzm+E
	 P7eD/uIJV+7x9E2MS6OFh0C1c3xBMtaR/gqC26jhBpQP7TVqCkD5wuvnY5JdE4tv4t
	 yioyvK832qNNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54096C83F22;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:19:35 +0800
Subject: [PATCH] rtc: amlogic-a4: Optimize global variables
MIME-Version: 1.0
Message-Id: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACbAeGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3aKSZN2i1PTcxAJdQxOD1FRjiyTzpDRzJaCGgqLUtMwKsGHRsbW
 1AOcNBfZcAAAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752743990; l=1406;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Tn5lD1nQJpDiw1LSnQ4GALbhpMqAH3g7E7P1O0bGP2E=;
 b=6VRmWFfex68uuBzChVw66cU/9X5dt11KTQvIdrMbsj4WkyCFYWXYXIZvfZTDWe7uAJOPDLj+4
 6ugN6hxm9PqDYRlB2eeuo2y9hMAw5x1LeQ1rHEUgcnkc7g6tRa3zkZg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_021952_697695_4D59B356 
X-CRM114-Status: UNSURE (   9.26  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Use local variables struct regmap_config instread of global
variables. The goal of saving memory has been achieve.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Use local variables struct regmap_config instread of global
variables. 
---
 drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 09d78c2cc691..1928b29c1045 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -72,13 +72,6 @@ struct aml_rtc_data {
 	const struct aml_rtc_config *config;
 };
 
-static const struct regmap_config aml_rtc_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = RTC_REAL_TIME,
-};
-
 static inline u32 gray_to_binary(u32 gray)
 {
 	u32 bcd = gray;
@@ -328,6 +321,13 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret = 0;
 
+	const struct regmap_config aml_rtc_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = RTC_REAL_TIME,
+	};
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;

---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-regmap-140ee38b7bf7

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
