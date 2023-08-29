Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371AC83F17
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Aug 2023 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkoHn9KUN6BbKeklAIgqD0tgHfHOpnooRwHsAwh6R9I=; b=pjQI7Lj5xv8FyD
	JopSeRtJVkFbwNxqf2fTDFmmBa6faS3GwJttZH56Y1XEOuWbsHSTtxL8fhvmNAlEDVCBZjSu5QF3q
	vb1qupkqyK/HfsFBZhUKSY2RGfiv2DD5HlR3N4qRUfWhrcOvrO6w+SJVELu0JaNONkbjM+dbklaiR
	+PKed69UV7eyH++RH5miVdY9MHH/FxQueFrr1RxC8MYOhJvZMK1X8sL/wihfV28I/QdKGehx9CDU0
	MEg7uuaAwRFPXsEZszOqWT0tKbaO0qVp2pJeKxM5Edsa0ZWu+9B6vL5lYVjfGiikd32slqMSF0w8d
	G2q1OkrwtqicihXaZrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5p-00AaWR-1Y;
	Tue, 29 Aug 2023 02:04:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5f-00AaSh-1s;
	Tue, 29 Aug 2023 02:04:24 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 29 Aug 2023
 10:04:09 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3 1/6] genpd: amlogic: modify some power domains property
Date: Tue, 29 Aug 2023 10:03:59 +0800
Message-ID: <20230829020404.4058677-2-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_190423_621408_9BFFF862 
X-CRM114-Status: UNSURE (   8.32  )
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

From: "xianwei.zhao" <xianwei.zhao@amlogic.com>

Some power domains for C3 can be using runtime PM,
remove ALWAYS_ON property. And add some power domains
description when ALWAYS_ON property.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
V2 -> V3: modify subject "genpd: amlogic: "
V1 -> V2: None
---
 drivers/genpd/amlogic/meson-secure-pwrc.c | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
index 89c881c56cd7..5ac2437ab8ad 100644
--- a/drivers/genpd/amlogic/meson-secure-pwrc.c
+++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
@@ -122,18 +122,19 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 };
 
 static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
-	SEC_PD(C3_NNA,	0),
-	SEC_PD(C3_AUDIO,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_SDIOA,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_EMMC,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_USB_COMB, GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_SDCARD,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_ETH,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_GE2D,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_CVE,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_GDC_WRAP,	GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_ISP_TOP,		GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(C3_MIPI_ISP_WRAP, GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_NNA,		0),
+	SEC_PD(C3_AUDIO,	0),
+	SEC_PD(C3_SDIOA,	0),
+	SEC_PD(C3_EMMC,		0),
+	SEC_PD(C3_USB_COMB,	0),
+	SEC_PD(C3_SDCARD,	0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(C3_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_GE2D,		0),
+	SEC_PD(C3_CVE,		0),
+	SEC_PD(C3_GDC_WRAP,	0),
+	SEC_PD(C3_ISP_TOP,	0),
+	SEC_PD(C3_MIPI_ISP_WRAP, 0),
 	SEC_PD(C3_VCODEC,	0),
 };
 
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
