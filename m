Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C84C4829B
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSG0CAM9TvTbklmWk72jMrgUtus09va/sMRDOnY1Cy4=; b=RO8NPXaSEHBJK+
	O3E7gFCG4sxMf6auXhcA/h3CFcR5KsxrmwcenL7AAvQ+vFoGYfrkXORp+3v+IAXuMq+uhQoq4YPh0
	4tE5Ws3RmlCKnJ7pwSnp81BBCr22zVycyO51YAuacCpLB4bcOClpipXt/QSuInyZdCADp9wxIjB/9
	hfWl/ZxiAAzHUv3FrvJZma8D1VzcaARQ0pDviuvpSNsl4LAP/g3umg03V+iUjkxM8upkYdbQz39tA
	MU1e0rlyJtOC4EYWXzqaVVT7gx90PAKo4q+NeSmxzlqybIheGvz3pgYhTJ5jNQN0CG0zI2R0PQru+
	UXYppbNf2meNoAKn591A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFem-00000006FiL-2gKu;
	Tue, 06 Feb 2024 07:14:12 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeS-00000006FP6-27sD;
	Tue, 06 Feb 2024 07:13:54 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00146;
        Tue, 06 Feb 2024 15:13:46 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:45 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
	<support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
	<ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <patches@opensource.cirrus.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH 13/18] mfd: rn5t618: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:13:09 -0500
Message-ID: <20240206071314.8721-14-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 2024206151346ad9d6b2efc569570e0a336b7eae766e3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_231352_960657_5B147BFC 
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/mfd/rn5t618.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 7336e6d8a001..23ca00d2c624 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -62,7 +62,7 @@ static const struct regmap_config rn5t618_regmap_config = {
 	.val_bits	= 8,
 	.volatile_reg	= rn5t618_volatile_reg,
 	.max_register	= RN5T618_MAX_REG,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 };
 
 static const struct regmap_irq rc5t619_irqs[] = {
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
