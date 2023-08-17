Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA043C2FC14
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Aug 2023 07:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k9sgyjEbXUn4EzLrp95zu6H8gxLEuyI7mLHbHXnrfU=; b=0HowfHYJpxEm7j
	1aZZl1cc1QS+4W6yZn4GcD0wLyBhgaiwFXGRjTMWazGZOdExtB4xEqhw7wtm+bnDKKvj/ZtBbv1fB
	OI7finHUOHE5xeCsPipFQPWqPXw/WkqgAKtzl7q61mOYu33tqauvRCQ2fbWbNE2FZfnIxKYzuRObj
	5n3FolYmdL7SJ5LYuiS4k/fRgh8QSyBbyDvZxPCjCcb7eFp11EaQFdnEIZXPgMZWdqGi3X+zFAlFi
	BrGRE85WhzbWFNR11/HUmHJ8SyRh7oO/pJOlT5p0vuev85Bl+dvIYymYwrngZiNECNrOyOkbePdVt
	Vj8Mzdmxpjc/Cv/i2exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXB4-005h6h-1S;
	Thu, 17 Aug 2023 07:12:18 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXAx-005h0S-1f;
	Thu, 17 Aug 2023 07:12:12 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 17 Aug 2023
 15:11:56 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 3/6] soc: amlogic: init power domain state
Date: Thu, 17 Aug 2023 15:11:45 +0800
Message-ID: <20230817071148.510575-4-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230817071148.510575-1-xianwei.zhao@amlogic.com>
References: <20230817071148.510575-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_001211_552021_BFC7DAC6 
X-CRM114-Status: UNSURE (   9.69  )
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
 drivers/genpd/amlogic/meson-secure-pwrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
index 76527f4946b4..3e7e3bd25d1f 100644
--- a/drivers/genpd/amlogic/meson-secure-pwrc.c
+++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
@@ -55,7 +55,7 @@ static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
 			  pwrc_domain->index, 0, 0, 0, 0) < 0)
 		pr_err("failed to get power domain status\n");
 
-	return is_off;
+	return !!is_off;
 }
 
 static int meson_secure_pwrc_off(struct generic_pm_domain *domain)
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
