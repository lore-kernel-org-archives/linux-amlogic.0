Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE48CC43463
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 01:31:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A52520659
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 01:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z4fgCtMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A52520659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAKVzfsO16orul3GzMIVj9niApxSGCGtSOI4LSXx2Ho=; b=z4fgCtMK/xi+UG6Ul2XnA1EX1D
	YuZ6b93HgnTlAFqLNk/jHE2bZVmx7Lylkr7/amPBNSRscJbzCfrq+D+a/DjgpkWzJsJFAH5qaCO1K
	Q9lir4htT0ze++UfcFAmZOPPxl2rXToz8+BFux9+Hihl7M0ROKnbvqlyhiL8130e9yr2aCYQEuZbd
	Gn1pQUZux8Q7eWHylakqDXK187zLR+AEhuDiwIOLmHzJCzeDzRC1IVqGFBS3ScZ4dDpqjzTbZF+Ng
	GHzcGNgiQUCczDqSrr6GEJaYwa/sZWO58kd22uQrrr0xmi0qAwTEGn7YR1kUem8xgxFNb63stwh8P
	t3NUaR2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5Ej-0008N2-NE; Fri, 18 Sep 2020 01:30:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5Eh-0008Lq-CR
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 01:30:52 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DC7AC86507DEF281E73B;
 Fri, 18 Sep 2020 09:30:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 09:30:35 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Corentin Labbe <clabbe@baylibre.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: [PATCH -next v2] crypto: amlogic: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Fri, 18 Sep 2020 09:31:10 +0800
Message-ID: <20200918013110.82604-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_213051_687701_40B1B276 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 466552acb..5bbeff433 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -98,7 +98,7 @@ static struct meson_alg_template mc_algs[] = {
 };
 
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
-static int meson_dbgfs_read(struct seq_file *seq, void *v)
+static int meson_debugfs_show(struct seq_file *seq, void *v)
 {
 	struct meson_dev *mc = seq->private;
 	int i;
@@ -118,19 +118,7 @@ static int meson_dbgfs_read(struct seq_file *seq, void *v)
 	}
 	return 0;
 }
-
-static int meson_dbgfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, meson_dbgfs_read, inode->i_private);
-}
-
-static const struct file_operations meson_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = meson_dbgfs_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(meson_debugfs);
 #endif
 
 static void meson_free_chanlist(struct meson_dev *mc, int i)
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
