Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C9D41C02
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 05:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+kOSnp36uW3YiawaCgGotpIeftxwW9GO0cSW4YOUFws=; b=xEWREVJaRVx1qB
	EB2HrGiAIT54bHt2RE2S7fKK9eiYXecp/x7pfQMO+NWH+IAtAACaHew0kGk2ENzPz3xYVuJr4OTiX
	sPbzx/ySxMBYDjv/2QWz80pxv7/4XnFXT3K+CLupmJFEgxFJQtvp9QUfuPuT17xOJgCs63Rl3Du8p
	BvdfZTbYzXPZfpGnGvHGB1ZefQ7Fbquhhy/WnEf24hQgS6NiyPS8Qb5bF+QCAu0rAQn2oPRz4yFxp
	DGkzUJg7tocmNXQ5+llVCrn2jwTDNGqjZ6rQFvLuk3iyosmXZQewufsgCzKcfvF88f1CWx2ZW6A+/
	VIo4In8lYb09zZa3HrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6NU-00000005qN5-2n61;
	Wed, 13 Nov 2024 05:57:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6NS-00000005qMh-2Ewh
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 05:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67DE1A401B7;
	Wed, 13 Nov 2024 05:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E5F5C4CECD;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731477437;
	bh=O7gqBIX0ZmWwreqBCyMvR1yaKp3Xm8Cc4L0dr2JTvLQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CZWR+o+Lu+5Aw9uon1pwiA75/0Joz2ADugOcTdxCbJ881H6/Z4zOl5HmrvE/mX5tb
	 roBqvg1KZ2AIvOzADyi+8HUQWdQ8KzLVydHfhCKv05bcNAie1b5zji58k1DsCA0d5r
	 G9ytt6fquRWvh7Djxsjn6McmKpfViu1jHf5KVqfCDYsTOMk+aysvX7SutV8/dY6Ads
	 V2WXoJIxmv+ZzrlhFw/w1aohb3oLZLAeE71mNCqggdcVhhoQLqFyLC7X3KQgyhXT/s
	 Hm26ncTMnEX7RheVsj3bECTRYw5tOejhnU2CvQJLAqObOtQuVre4P6TpthuRTrVDk7
	 z8sMEphAhJquA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBCCD41C03;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 13:57:15 +0800
Subject: [PATCH] rtc: amlogic-a4: fix compile error
MIME-Version: 1.0
Message-Id: <20241113-fix_a4_rtc-v1-1-307af26449a8@amlogic.com>
X-B4-Tracking: v=1; b=H4sIALo/NGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Nj3bTMivhEk/iikmTdNCNTgzQzs+SkJENDJaCGgqJUoCzYsOjY2lo
 ApYvmJ1wAAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731477435; l=945;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=km3rlhnqX3L3e5tGM9lHtBkDGz74vs84O5QvGvcNq3Q=;
 b=b1Q7RSfPcsZpytS289JQq6mN7s74d5X8tq1pCZ55i6rFYYxvpDpxHymaqLU8+EA/IhvpLyWxm
 Qr1XBoOtnpCC4zGgIjJDji//eLP/BK1T0C3bsB3haTr5hHZsMHo/RQN
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_215718_676046_E73F04F7 
X-CRM114-Status: UNSURE (   8.54  )
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

When compile rtc-a4, build error as following:
ERROR: modpost: drivers/rtc/rtc-amlogic-a4: struct of_device_id is
not terminated with a NULL entry!
This commit is to fix it.

Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 4960790c4b24..2278b4c98a71 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -445,6 +445,7 @@ static const struct of_device_id aml_rtc_device_id[] = {
 		.compatible = "amlogic,a5-rtc",
 		.data = &a5_rtc_config,
 	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
 

---
base-commit: eb4ffa40010472dffdc276da307161545aab45a3
change-id: 20241113-fix_a4_rtc-f250f66cbb11

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
