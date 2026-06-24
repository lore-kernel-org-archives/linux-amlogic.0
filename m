Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E8CDB470
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=07t6o7+XzHUxtQTU9bIwqRlhKR/Cu0+/xAWEZdZUFcI=; b=rdirz4+mNasnNr
	jeRyLgdv+NhL2bXZrbyyvqWWGamPTEJgmZ+BTg1RLynqucfpPL9gAGnuEYWqkADXJwELpOuuVoA+g
	AvvNyjQAEMMouO3Pa3IDrzoyu73ObpcQlPAGZSqMJBFqJb7rFzKOtZNfjmc6+HKfaRhIAvpN1VumT
	9KTrzkSjBufsgsPoxhGGtnZLzY7dAYWtXK6Ziby2FIMiaUiEOiW6TryQxPZtSKUlLuhHOoo7Q7vt1
	iN4+laR+ou3a5iChZeNNj4NofPXrgEQYTWpuYInkrSbLIFNkQNdOrx+70Z1tLth4l5AG9veCQS3TA
	LOtmzE+uSFef6KcNE2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHyS-00000007JNj-2wHq;
	Wed, 24 Jun 2026 07:24:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHyR-00000007JNW-1Ua7
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 07:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75C30601F6;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B638C2BCB4;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782285878;
	bh=QojzKA+AL9yufTBuhEvjrEAhb+khx3/xRIV8QBdLzG8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NeTVbvGFlvNeKvstEQtBfIyYGoJnm7ajizM/Lp9dOFDZ0h+vIgcWB3uDx7zEpMmfh
	 o6UAI4ESmvpaSiMJEUkI7Yr5WFr2K9LUVIKMsDRNN+XNuI2utxOKNutQi1Ye3Xi4nX
	 hVXYcQ5alfZz57dKEdgn0HT4ns1Az70rrsmli1u69iWmI2WtN0CovChJHeCoWVzWUo
	 8o1KPiS6SVvaRWGZAV0hUmvg2jHtk79nH8r3F+0zbYgKIMatz1BwWGiI+9cvC7HtU2
	 4oiMZXUexp5fIVFXd6p1wOMYKilSd5ChPQ+WTSKjYxCKx8IWWWtq8GRuq7oLNZtZVM
	 VTW+waKQ8eM7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026BCCDB47F;
	Wed, 24 Jun 2026 07:24:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 24 Jun 2026 07:24:34 +0000
Subject: [PATCH] rtc: amlogic-a4: clear unsupported update interrupt
 feature
MIME-Version: 1.0
Message-Id: <20260624-rtc-feature-v1-1-42dccd22c0ee@amlogic.com>
X-B4-Tracking: v=1; b=H4sIADKGO2oC/x3MQQqAIBBA0avIrBNMRaqrRAuxsWZjMVoE4d2Tl
 m/x/wsZmTDDJF5gvCnTkRr6TkDYfdpQ0toMWmmnnLaSS5ARfbkYpTIBTTSDNX6EVpyMkZ7/Ni+
 1fiM27XxdAAAA
X-Change-ID: 20260624-rtc-feature-03ce3f3843a9
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782285876; l=1071;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=pJ5eX/skfag9z0pkWfC/zXmkphBv9K7+CU5zNogQX00=;
 b=K8SW8U312kCtLZRTKBb2MmA6n7lo6AJUWoPjwyFhymEluNvfnNr7RierO1ahP2OjvK8nQydOZ
 6+CcbiIlZ2AAj4mU+kcubK5ai8aeDsJBtdjFjvMwX5V1IViaFKEHLN5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

The Amlogic A4 RTC does not support update interrupt. Clear
RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device to
prevent userspace from enabling an unsupported RTC UIE function.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Clear RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device.
---
 drivers/rtc/rtc-amlogic-a4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 50938c35af36..116cf095a9e9 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -379,6 +379,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &aml_rtc_ops;
 	rtc->rtc_dev->range_min = 0;
 	rtc->rtc_dev->range_max = U32_MAX;
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }

---
base-commit: 851d961ff248218f681c53cf0f7f08cf8201a117
change-id: 20260624-rtc-feature-03ce3f3843a9

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
