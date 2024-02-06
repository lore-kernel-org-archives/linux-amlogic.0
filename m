Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A7C4829B
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8BL7Mc87MHlzbR4M604eqL64saRC/bu/ycmbM/GfUU=; b=mKiEr1uTu2IOKJ
	5VuSkyEadeL05HtLsaoA0YcVGuncRA3gw2G80GohH9APL7ztnZ3QoxgsrLnZjMltHsnXq0OEMDXsK
	lm0FZ+vumutwSt6JOWJPO7QFuoNWZucK6AP54mBQWWfSn70LzeUT6ROZGTFgujR2YtnZEVq7Cx+/i
	Q4dM0HLlNnNPqbT9TUimAXs4M8zCNvLn41oUKkJSZhOSLOHjyuASbc7vbZcwAki53vd2jGJ41LpbT
	XSCHE0lqxEcn6TbgwPc+04+Aq+b7knob5uWfqHzyM6U7gxBLgfVD09zx4vlTuGHdr/f12Rg3AjtK3
	PsjWBBzIyXawGDjnNf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFfW-00000006GOw-0DZz;
	Tue, 06 Feb 2024 07:14:58 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeY-00000006FNm-0HEQ;
	Tue, 06 Feb 2024 07:14:00 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00041;
        Tue, 06 Feb 2024 15:13:41 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:42 +0800
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
Subject: [PATCH 10/18] mfd: wolfson: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:13:06 -0500
Message-ID: <20240206071314.8721-11-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 20242061513412c33292c74460fb4cc83da7df0762be9
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_231358_576129_6FF952AF 
X-CRM114-Status: UNSURE (   8.98  )
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
 drivers/mfd/wm5102-tables.c | 2 +-
 drivers/mfd/wm5110-tables.c | 2 +-
 drivers/mfd/wm8350-regmap.c | 2 +-
 drivers/mfd/wm8400-core.c   | 2 +-
 drivers/mfd/wm97xx-core.c   | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/wm5102-tables.c b/drivers/mfd/wm5102-tables.c
index f77ecc635b6f..6a8602c1c4ee 100644
--- a/drivers/mfd/wm5102-tables.c
+++ b/drivers/mfd/wm5102-tables.c
@@ -1922,7 +1922,7 @@ const struct regmap_config wm5102_spi_regmap = {
 	.readable_reg = wm5102_readable_register,
 	.volatile_reg = wm5102_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm5102_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(wm5102_reg_default),
 };
diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
index eba324875afd..6ff33a54a068 100644
--- a/drivers/mfd/wm5110-tables.c
+++ b/drivers/mfd/wm5110-tables.c
@@ -3202,7 +3202,7 @@ const struct regmap_config wm5110_spi_regmap = {
 	.readable_reg = wm5110_readable_register,
 	.volatile_reg = wm5110_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm5110_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(wm5110_reg_default),
 };
diff --git a/drivers/mfd/wm8350-regmap.c b/drivers/mfd/wm8350-regmap.c
index 5663b8b0b3ad..3d0ebb004dbf 100644
--- a/drivers/mfd/wm8350-regmap.c
+++ b/drivers/mfd/wm8350-regmap.c
@@ -325,7 +325,7 @@ const struct regmap_config wm8350_regmap = {
 	.reg_bits = 8,
 	.val_bits = 16,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.max_register = WM8350_MAX_REGISTER,
 	.readable_reg = wm8350_readable,
diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 75483c9be0c4..ddfb234849dd 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -100,7 +100,7 @@ static const struct regmap_config wm8400_regmap_config = {
 
 	.volatile_reg = wm8400_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 /**
diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
index 663acbb1854c..1566a9b04b6a 100644
--- a/drivers/mfd/wm97xx-core.c
+++ b/drivers/mfd/wm97xx-core.c
@@ -95,7 +95,7 @@ static const struct regmap_config wm9705_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm9705_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9705_reg_defaults),
@@ -163,7 +163,7 @@ static const struct regmap_config wm9712_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm9712_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9712_reg_defaults),
@@ -234,7 +234,7 @@ static const struct regmap_config wm9713_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm9713_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9713_reg_defaults),
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
