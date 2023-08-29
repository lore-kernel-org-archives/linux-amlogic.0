Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC233C71153
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Aug 2023 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oz8/C7Qu+nwf8WRDjtM7rS4xuUoFZUyVVsF894A/8dU=; b=0etoTP3GpXQh4L
	Va17MPtULgob3ezFC0t9mkaDTlOKcXPm4Upq2zZpNWAsrwgWolg84+FcT1sj9MiNSmSXBc1JcmZ+U
	szZx9gD3yD/96TLkSj3JQ5KkYBmc81AQhOV1F5h+XUUe4wErhk3OrWJZBOPgzIqQoY+RdHfIOAR5d
	7t+VTVNM8kw5SvQIrTmyxo4u2dnunZqCLiYuW/EoJKhMA9hAU9n+zjQl3excq/EFKr++i6ZjxTxuc
	YigdS8ohaG8q3vlDN6QLObB0pFtJgiH1USunNVdVTKLCoaqwMKK6V3T8w3ZciU8kzs/+SyVMzLtbW
	soiFuO5fuYHokrWBwObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5z-00AaZN-0W;
	Tue, 29 Aug 2023 02:04:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5j-00AaSh-0K;
	Tue, 29 Aug 2023 02:04:28 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 29 Aug 2023
 10:04:12 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3 3/6] genpd: amlogic: init power domain state
Date: Tue, 29 Aug 2023 10:04:01 +0800
Message-ID: <20230829020404.4058677-4-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_190427_136125_E84CAF2B 
X-CRM114-Status: UNSURE (   8.58  )
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

If initial power domain with 'AWAY_ON' property state is off,
turn on the power.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
---
V2 -> V3: modify subject "genpd: amlogic: "
	  remove modification that transform is_off into 1 or 0 using !!
V1 -> V2: None
---
 drivers/genpd/amlogic/meson-secure-pwrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
index ecada537b19c..d751c224048d 100644
--- a/drivers/genpd/amlogic/meson-secure-pwrc.c
+++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
@@ -222,6 +222,9 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 		dom->base.power_on = meson_secure_pwrc_on;
 		dom->base.power_off = meson_secure_pwrc_off;
 
+		if (match->domains[i].is_off(dom) && (dom->base.flags & GENPD_FLAG_ALWAYS_ON))
+			meson_secure_pwrc_on(&dom->base);
+
 		pm_genpd_init(&dom->base, NULL, match->domains[i].is_off(dom));
 
 		pwrc->xlate.domains[i] = &dom->base;
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
