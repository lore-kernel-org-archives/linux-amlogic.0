Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BDC71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 02:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nsor3EBn3KOXVhUoaHRxBJH85BI16TFGD7DOxJN/b2E=; b=q0FG9/9B4fP0IA
	3sose3/SUSWtJ0Fdbsv4h4eP3PSucUymipbwrzbsmLSKhw2OWFUIHk210vMLPsLMj/mxPAsr/XwhL
	JNCTfM/M9yIGCwJCm3j9S5VucX5CpkFAjsqHPv2CeQKtkygiI6MvDEttFw3JT35x1K+s4gN9poApF
	zeXzGq62zfBQQt+OuKI+3tic9O/YZnzMM144jeN42fis5OFa7U5owfJAeJPu0pD0FXpGqnDA4pLen
	3E1OYA+zPh8pwm9iHYnev/mz0/8JIQTEPB4sCjeF9t0rMFnQyuLaA5OwHq9nPXq7YxZHvFU2Q+L8l
	CKLASv/wQ3knYYnDce3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX2s-00H7kC-1W;
	Mon, 11 Sep 2023 02:53:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX2n-00H7fW-0p;
	Mon, 11 Sep 2023 02:52:58 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 11 Sep 2023
 10:52:30 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, xianwei.zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH V3 RESEND 2/6] genpd: amlogic: add driver to support power parent node
Date: Mon, 11 Sep 2023 10:52:19 +0800
Message-ID: <20230911025223.3433776-3-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_195257_293112_721DCDED 
X-CRM114-Status: GOOD (  14.17  )
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

Some power domains depends on other domains, Such as Amlogic T7 SoC.
Add parent node to support this case.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
---
V2 -> V3: modify subject "genpd: amlogic: "
          define PWRC_NO_PARENT UINT_MAX
V1 -> V2: None
---
 drivers/genpd/amlogic/meson-secure-pwrc.c | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
index 5ac2437ab8ad..ecada537b19c 100644
--- a/drivers/genpd/amlogic/meson-secure-pwrc.c
+++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
@@ -19,10 +19,12 @@
 
 #define PWRC_ON		1
 #define PWRC_OFF	0
+#define PWRC_NO_PARENT	UINT_MAX
 
 struct meson_secure_pwrc_domain {
 	struct generic_pm_domain base;
 	unsigned int index;
+	unsigned int parent;
 	struct meson_secure_pwrc *pwrc;
 };
 
@@ -34,6 +36,7 @@ struct meson_secure_pwrc {
 
 struct meson_secure_pwrc_domain_desc {
 	unsigned int index;
+	unsigned int parent;
 	unsigned int flags;
 	char *name;
 	bool (*is_off)(struct meson_secure_pwrc_domain *pwrc_domain);
@@ -90,8 +93,19 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
 {						\
 	.name = #__name,			\
 	.index = PWRC_##__name##_ID,		\
-	.is_off = pwrc_secure_is_off,	\
+	.is_off = pwrc_secure_is_off,		\
 	.flags = __flag,			\
+	.parent = PWRC_NO_PARENT,		\
+}
+
+#define TOP_PD(__name, __flag, __parent)	\
+[PWRC_##__name##_ID] =				\
+{						\
+	.name = #__name,			\
+	.index = PWRC_##__name##_ID,		\
+	.is_off = pwrc_secure_is_off,		\
+	.flags = __flag,			\
+	.parent = __parent,			\
 }
 
 static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
@@ -202,6 +216,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 
 		dom->pwrc = pwrc;
 		dom->index = match->domains[i].index;
+		dom->parent = match->domains[i].parent;
 		dom->base.name = match->domains[i].name;
 		dom->base.flags = match->domains[i].flags;
 		dom->base.power_on = meson_secure_pwrc_on;
@@ -212,6 +227,15 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 		pwrc->xlate.domains[i] = &dom->base;
 	}
 
+	for (i = 0; i < match->count; i++) {
+		struct meson_secure_pwrc_domain *dom = pwrc->domains;
+
+		if (!match->domains[i].name || match->domains[i].parent == PWRC_NO_PARENT)
+			continue;
+
+		pm_genpd_add_subdomain(&dom[dom[i].parent].base, &dom[i].base);
+	}
+
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
 }
 
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
