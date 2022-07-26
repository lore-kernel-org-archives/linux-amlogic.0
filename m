Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9EDC43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j91EUvtjYQD3tHsyVXys5a1+4LK0sYWLVapJLjzY/BI=; b=o5DLaISnnDGWGE
	iT0Vq2fj31BwZkk3Zfu3s5+71Ug258q6Gwk5i5CQOKRg4w5aKPh8tMrWuj18Z29AAT4vrs6e1ERvW
	HwntX6Tb22bFb8ZggFkVwC5IK8e4TsHvQkWjy24QglWIAQlukybu3t6LMRlnFSXqD4xqUBvC/M+Dj
	4qYDX8ITqTBR6hxn/R+HV+Hu8Z2VL5fGmP0UoYNETYPny7XI5hKwSfZgOs/gs6ifB42iqgUfED25O
	kUHXclt0OHGXoPXA/mgQHrH/USQsRHoMh0sqoEFMuQbcUfgC6dPgK0N43TotgIrmeLt5VYdPsnap8
	lBWGwvc9V2CdQsKRzTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFKp-009eKO-UZ; Tue, 26 Jul 2022 07:50:31 +0000
Received: from mail-m965.mail.126.com ([123.126.96.5])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFAP-009WlX-1n; Tue, 26 Jul 2022 07:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/yW/t
	bD0LNvX+u4t+d8dyyc68MM5cwGlNp9S4N1ES7c=; b=Pt4/9zm8T6cGyFyi4rX0I
	Ov9r5BPLlpORwtWCpYfthAZrbYjvyxh3IhEK2BxHgyMf0o9bjQozKMQXtrqKZ35s
	oR/griV8pd06s5Ay9M342FfrOeV7BcLG/l0cCPjj1o0ahIeUWeo+1iXrMcq8jlVC
	+zXltojOJU5ttjcjjM3Glc=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgAHboIDmt9iNJZWHA--.59720S2;
	Tue, 26 Jul 2022 15:38:44 +0800 (CST)
From: Liang He <windhl@126.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	p.zabel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	windhl@126.com
Subject: [PATCH v2] soc: amlogic: meson-pwrc: Hold reference returned by  of_get_parent()
Date: Tue, 26 Jul 2022 15:38:41 +0800
Message-Id: <20220726073841.1320509-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: NuRpCgAHboIDmt9iNJZWHA--.59720S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4rJFykAw48XFy8AFb_yoW8KF4Upa
	1DKFyYyFW7Jr1YgryrKan8Za13K3y3Ja1F93ykG3WfZr1vyF1UGFyfGay2yrZa9FZ5CFyf
	Jr1jkFy8XF4UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziCD7fUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3ARKF1pED-CaNQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_003945_525542_5E080647 
X-CRM114-Status: UNSURE (   9.39  )
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

We should hold the reference returned by of_get_parent() and use
it to call of_node_put() for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 2be3afe6c2e3..dd5f2a13ceb5 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -469,6 +469,7 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
 {
 	const struct meson_ee_pwrc_domain_data *match;
 	struct regmap *regmap_ao, *regmap_hhi;
+	struct device_node *parent_np;
 	struct meson_ee_pwrc *pwrc;
 	int i, ret;
 
@@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
 
 	pwrc->xlate.num_domains = match->count;
 
-	regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
+	parent_np = of_get_parent(pdev->dev.of_node);
+	regmap_hhi = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap_hhi)) {
 		dev_err(&pdev->dev, "failed to get HHI regmap\n");
 		return PTR_ERR(regmap_hhi);
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index b4615b288625..312fd9afccb0 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -273,6 +273,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 	const struct meson_gx_pwrc_vpu *vpu_pd_match;
 	struct regmap *regmap_ao, *regmap_hhi;
 	struct meson_gx_pwrc_vpu *vpu_pd;
+	struct device_node *parent_np;
 	struct reset_control *rstc;
 	struct clk *vpu_clk;
 	struct clk *vapb_clk;
@@ -291,7 +292,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 
 	memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
 
-	regmap_ao = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
+	parent_np = of_get_parent(pdev->dev.of_node);
+	regmap_ao = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap_ao)) {
 		dev_err(&pdev->dev, "failed to get regmap\n");
 		return PTR_ERR(regmap_ao);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
