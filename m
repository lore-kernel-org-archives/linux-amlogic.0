Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A519FC71153
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 06:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE5JOQbLiQD6K8zjTYrrE4qTG8R9MZ4arGNrVK8WCno=; b=mEIHvLjGGUpvyA
	/PZeBaafupsRHzWFMEqiCRpcY+/fd3f0x7NbKMrKpzs1zVOhyqsY4AlfXzxxwgbKOY1fvCY4dl5Gb
	VRZxpv9UcK2+C/F/oaTm/KymMn//CoQdKnqahPJDknRHEKlZSGTc3OzAjFNMKxJxo0STPmIw/f94h
	OqAOBaY/hGsk0PfJ7T1e0ntG8to12XFE9LVI4OneOm8ZgEG4/I4UBOnFWvGO/OdilllHISfM/m76N
	zUpUs4yNwaD6Xw+vDpI4asXVqVcTr0c82gWWF98bMQw3NhxFP2hvNh0B/y02vkBmjtBWP1ieehjCg
	S6JbdnLAN2535nF5EvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3OJ-002HmB-14;
	Thu, 24 Aug 2023 06:00:23 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3Nx-002Hdv-1p;
	Thu, 24 Aug 2023 06:00:02 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 24 Aug 2023
 13:59:52 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 3/6] soc: amlogic: init power domain state
Date: Thu, 24 Aug 2023 13:59:27 +0800
Message-ID: <20230824055930.2576849-4-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_230001_609239_AAFD67E7 
X-CRM114-Status: UNSURE (   9.84  )
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
V1 -> V2: None
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
