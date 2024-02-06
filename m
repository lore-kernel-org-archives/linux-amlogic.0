Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE9C48286
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/1tRkfVaMBNX0iN56c4rvadUKRLUTWtPmGZ5pntZR8=; b=3eefv0dkhiHiyq
	Z1HwxMuCEMKunv2D6TVYTiXDDAFOrk3QmUXTQpsgNbW2eq3U1pyay3Efm6+lklhtD1woXovfnkJ7G
	9CECYuXXK5VYwJH8yqMLgk2B/Flmnd+gbdYp8z6vGITcRQh7p+0NFmRrjW8H9kvUGocGWtBOnuop8
	qxA60PS1SrgTd524Ib7SE7xiYpYm02UpWEIsvR4j12QSvUyy+I0bctXLzjTBjDedfNsJJ/oeqbGrF
	5HEX8t/6dqr1PmVQNj4S51bxOGlprA/36eqChTDyCWQNL2lmgTMAdlqnJbQEun8PWz3naC4udstlC
	13228jJuqxCYxdp5GnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFei-00000006Fe9-0aUz;
	Tue, 06 Feb 2024 07:14:08 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeS-00000006FNU-1SJx;
	Tue, 06 Feb 2024 07:13:53 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00135;
        Tue, 06 Feb 2024 15:13:35 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:36 +0800
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
Subject: [PATCH 04/18] mfd: axp20x: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:13:00 -0500
Message-ID: <20240206071314.8721-5-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 2024206151335455be694382fb7b7469966a15f63c484
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_231352_723606_041BD437 
X-CRM114-Status: UNSURE (   9.32  )
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
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index deaa969bab4e..d8daa593ebd5 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -352,7 +352,7 @@ static const struct regmap_config axp192_regmap_config = {
 	.wr_table	= &axp192_writeable_table,
 	.volatile_table	= &axp192_volatile_table,
 	.max_register	= AXP20X_CC_CTRL,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 };
 
 static const struct regmap_config axp20x_regmap_config = {
@@ -388,7 +388,7 @@ static const struct regmap_config axp313a_regmap_config = {
 	.wr_table = &axp313a_writeable_table,
 	.volatile_table = &axp313a_volatile_table,
 	.max_register = AXP313A_IRQ_STATE,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const struct regmap_config axp806_regmap_config = {
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
