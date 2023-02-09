Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DC9C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D38jhYf4Wo54svCxElTz3MQnFRaYcDg9GHmpDSvqE1g=; b=xnoZBpoybKWEod
	oQhtwKGmdkfr2wQRXDGEqxgz29xHGQnIizNi+WIFU6RMxjRB+lRsmJd3PattUxBlb7rC5mg+5cL91
	wao0vHoRyciexemzonJ59//B/xeZzSuzWRo/Iy+h9s6nkcYZRrrKXVHMjTmgZrOl7zOC+HplFPgTO
	FA0Su2pUhFzlsRTKxXvFTKfV7j6xTEbu9ux9npWsGCg0KUFzUkOk6HCZEiL/V4ByUh34AvOY7nTDP
	EhvJYoSfv03xEzxZsY2jBldhmcwAJupcwSd8uJ5QHiVHHGE7svRpTBlHAPfaKFjeNIZhVgwXBUiSE
	mLE9RXKxCy5ZOCzuSVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5VQ-001OaB-UX; Thu, 09 Feb 2023 11:54:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5VO-001OXs-AY; Thu, 09 Feb 2023 11:54:23 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 9 Feb 2023
 19:54:11 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>, Chris Healy
	<healych@amazon.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] perf/amlogic: Fix config1/config2 parsing issue
Date: Thu, 9 Feb 2023 19:54:01 +0800
Message-ID: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_035422_406397_DA58AF4C 
X-CRM114-Status: UNSURE (   8.04  )
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

The 3th argument of for_each_set_bit is incorrect, fix them.

Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
 drivers/perf/amlogic/meson_ddr_pmu_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index b84346dbac2c..0b24dee1ed3c 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -156,10 +156,14 @@ static int meson_ddr_perf_event_add(struct perf_event *event, int flags)
 	u64 config2 = event->attr.config2;
 	int i;
 
-	for_each_set_bit(i, (const unsigned long *)&config1, sizeof(config1))
+	for_each_set_bit(i,
+			 (const unsigned long *)&config1,
+			 BITS_PER_TYPE(config1))
 		meson_ddr_set_axi_filter(event, i);
 
-	for_each_set_bit(i, (const unsigned long *)&config2, sizeof(config2))
+	for_each_set_bit(i,
+			 (const unsigned long *)&config2,
+			 BITS_PER_TYPE(config2))
 		meson_ddr_set_axi_filter(event, i + 64);
 
 	if (flags & PERF_EF_START)

base-commit: e8a709dc2a9156f223ec953ae70a919e87ad7e9a
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
