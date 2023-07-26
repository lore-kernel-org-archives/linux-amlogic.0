Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD57C001B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX1ZeNxMZagpw66X/k5g7rvWLrdgDCQ4hHcgIffKakw=; b=aFm6+xR94ZOARH
	A5oBv0cWQijjGOZZTDe6XuKFkyfbjgY9eVGPn9vWOSUgPhGsogvRJPTHQw9jMgtXVeziuzd1FDgTZ
	NKRzViQmttTbai4xAMl9hYEuArB38AxoqsR6Y/I7rGJrz1MiGGEGu5CsegKAsf89GVTZQaJ3RcP0k
	GnjoDme2+NM+W16SI88fCpoKr9ehhDgcOqpKymcvS7k1xWFLC6B6E/y615mkCdrH4Kvm3ndtAe1UW
	yNPEsnmeY2//E63TPa4ZckyRW17rcRBT6rX2gwznUrnQfiVGAKkDgCiCz6klH+JBpt/gLLa4+wINC
	Ml52JNnZIiPf1dyNMWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd8H-00AGZb-21;
	Wed, 26 Jul 2023 11:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd8F-00AGYD-2p;
	Wed, 26 Jul 2023 11:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6OrOunRbobEVYxEiv7Iyx0lwT+G6sADpP2biil22mPU=; b=BX3OhH/CMyQog/dxPbsypMaitz
	oJyFMHJcB5JGyZ77VzTwxOkX2tDd6FRrigTc4ldMrAlwgwFA/VJcI5b2n+8ZMRFQ1tgzI1BIb/4rB
	hARvSTGcy7pMCJryQaBtp8L88Z6hgdmJsuoIE3Y0ktFJZZrQr+ZA+K+cIvm7teAO8Hg0pyPf5Fr/I
	vztxRarPNaT7qxl8oxm2583fzEXv3slGs5kgxLQEIoU4eKEEymnCjshjufUMRyvASBYYrCtueqRtz
	TU4otgaTQmrIjy9QT2PSKHPuwXfrDzGAKCFAJE3eFbkB0IhN1M0OTaAObYbvKD1Oqgv/hC2CDP9lN
	PvSbgMTQ==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcbU-005pDe-2B;
	Wed, 26 Jul 2023 11:22:54 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:09 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 3/4] watchdog: Add support for Amlogic-T7 SoCs
Date: Wed, 26 Jul 2023 19:21:45 +0800
Message-ID: <20230726112146.1127145-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_122252_800656_FD71729C 
X-CRM114-Status: UNSURE (   8.92  )
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

Compared with the previous Amlogic-GXBB, the watchdog of Amlogic-T7
has a different reset enable bit.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index a6c0d743b607..dc48b0a332c3 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -147,8 +147,13 @@ static const struct wdt_params gxbb_params = {
 	.rst_shift = 21,
 };
 
+static const struct wdt_params t7_params = {
+	.rst_shift = 22,
+};
+
 static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
 	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
+	 { .compatible = "amlogic,t7-wdt", .data = &t7_params, },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
