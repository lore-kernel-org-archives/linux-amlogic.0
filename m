Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82E9C4829D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39q9ujIrgQjr48AAlFJAJhW1e5MpHOBhJO8E2F9ZO1c=; b=JEQ/ZTsdRLZOlp
	3Xnbg9lvxgeuDcDgeQwVUR+MdxmfrLZE0P4qAAHUh8xXB2IiWpmfCAgpIeOqyXudyxf/kGxXIAI4q
	Pwsb2c+znUGKV2bS6dd/fMrZMB7VWfIeIeTyjCwZ98aqXJevjB+SfMBvJkLUSsSF/SKIBiLE4chkV
	4N//5qzAadMZhytrsbzXQjxrDimva6WxBxMTEkUgygtVBkjkxKH4a+kCm1N/el3tI/si1dBf1TW4P
	42eCPTM8PxMr8oJdB0jbRtxdYxrG5ur+HcMNoUqjDb46UyWEBVfl/MRBKNu57GGrICVZfexiD9Lqk
	M65L7U0ndQFbOrBjHhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFfC-00000006G7z-3bQy;
	Tue, 06 Feb 2024 07:14:38 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeW-00000006FNe-1A6A;
	Tue, 06 Feb 2024 07:13:57 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00038;
        Tue, 06 Feb 2024 15:13:38 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:38 +0800
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
Subject: [PATCH 07/18] mfd: dialog: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:13:03 -0500
Message-ID: <20240206071314.8721-8-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 20242061513389d05567c28aed27fdad978a96868676a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_231356_729963_AC411541 
X-CRM114-Status: GOOD (  10.22  )
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
 drivers/mfd/da9052-core.c | 2 +-
 drivers/mfd/da9055-core.c | 2 +-
 drivers/mfd/da9062-core.c | 4 ++--
 drivers/mfd/da9063-i2c.c  | 2 +-
 drivers/mfd/da9150-core.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/da9052-core.c b/drivers/mfd/da9052-core.c
index 150448cd2eb0..dc85801b9fa0 100644
--- a/drivers/mfd/da9052-core.c
+++ b/drivers/mfd/da9052-core.c
@@ -533,7 +533,7 @@ const struct regmap_config da9052_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.max_register = DA9052_PAGE1_CON_REG,
 	.readable_reg = da9052_reg_readable,
diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 768302e05baa..1f727ef60d63 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -245,7 +245,7 @@ const struct regmap_config da9055_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.max_register = DA9055_MAX_REGISTER_CNT,
 	.readable_reg = da9055_register_readable,
diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 73a22107900c..dbbc4779170a 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -476,7 +476,7 @@ static struct regmap_config da9061_regmap_config = {
 	.ranges = da9061_range_cfg,
 	.num_ranges = ARRAY_SIZE(da9061_range_cfg),
 	.max_register = DA9062AA_CONFIG_ID,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.rd_table = &da9061_aa_readable_table,
 	.wr_table = &da9061_aa_writeable_table,
 	.volatile_table = &da9061_aa_volatile_table,
@@ -582,7 +582,7 @@ static struct regmap_config da9062_regmap_config = {
 	.ranges = da9062_range_cfg,
 	.num_ranges = ARRAY_SIZE(da9062_range_cfg),
 	.max_register = DA9062AA_CONFIG_ID,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.rd_table = &da9062_aa_readable_table,
 	.wr_table = &da9062_aa_writeable_table,
 	.volatile_table = &da9062_aa_volatile_table,
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index d715cf9a9e68..c6235cd0dbdc 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -342,7 +342,7 @@ static struct regmap_config da9063_regmap_config = {
 	.num_ranges = ARRAY_SIZE(da9063_range_cfg),
 	.max_register = DA9063_REG_CONFIG_ID,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const struct of_device_id da9063_dt_ids[] = {
diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 94d621e20635..5c59cc869fb3 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -169,7 +169,7 @@ static const struct regmap_config da9150_regmap_config = {
 	.num_ranges = ARRAY_SIZE(da9150_range_cfg),
 	.max_register = DA9150_TBAT_RES_B,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = da9150_volatile_reg,
 };
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
