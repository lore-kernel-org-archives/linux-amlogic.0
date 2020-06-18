Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C139DC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772E621D81
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skszghUq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCZxilbw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772E621D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1C2szvBLf9aQSAV/OFeGINZJZeF0DMZmgigLeu2rPI=; b=skszghUqwq42Am
	bXIHK/sEx6iPfMiXq807axfP+Pi5GN1PjHYFvgKNTsNpwgQ2BLlxAjB7GTkCnIciX9k6Pv+/Zr8up
	w7Gk5ngex1ykwBl3mt32kahZK8cKUvoVOvmkteIN2BXoMRaGVkfQvpRrzSHXQ+gWdJGxQSkSMgGQq
	6OhzTK9/c9QKclURuJ6gJ5JdGks6HgfVOsAHnAubrLqIrRxCuo85j2U0dvyfvvLpkYD6qLTFTu6lz
	4Q/QYJpfbGQJnz0mveI8B8GTazjD//LVre7Vs8OCuU72RwDBNvY+xEqyOCu/9Dlj3wCHML7/p8bjt
	uFX7bkKI0Enajl2oax9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlj9M-0006kW-65; Thu, 18 Jun 2020 01:15:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlj4I-0006hw-Pg; Thu, 18 Jun 2020 01:10:16 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 937F321974;
 Thu, 18 Jun 2020 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442613;
 bh=ZeP8K0zOh9XWf/M6ZeyFsdFt9/ZjTz/WXT7NJMGHJ0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aCZxilbwtxz18Z/u+R/SCS+fnsOc4+WeUA3Fe94ursURI6skcMPYo0e5I9PnThSoF
 4MzTalCn66s7PnSPQtbSUtprrZVPkrBEJ5cPEJo9WpokznXFtLnxWwaXzYxrFsGQrp
 fsOTBW9ML/GODNtnzuEPay0uq2FO2kplNUhZWMSo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 094/388] ASoC: meson: fix memory leak of links if
 allocation of ldata fails
Date: Wed, 17 Jun 2020 21:03:11 -0400
Message-Id: <20200618010805.600873-94-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_181015_345056_03C8F451 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 6e801dc411329aff592fbd48fb116183d0acdb00 ]

Currently if the allocation of ldata fails the error return path
does not kfree the allocated links object.  Fix this by adding
an error exit return path that performs the necessary kfree'ing.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Addresses-Coverity: ("Resource leak")
Link: https://lore.kernel.org/r/20200604171216.60043-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/meson/meson-card-utils.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 2ca8c98e204f..5a4a91c88734 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -49,19 +49,26 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 	links = krealloc(priv->card.dai_link,
 			 num_links * sizeof(*priv->card.dai_link),
 			 GFP_KERNEL | __GFP_ZERO);
+	if (!links)
+		goto err_links;
+
 	ldata = krealloc(priv->link_data,
 			 num_links * sizeof(*priv->link_data),
 			 GFP_KERNEL | __GFP_ZERO);
-
-	if (!links || !ldata) {
-		dev_err(priv->card.dev, "failed to allocate links\n");
-		return -ENOMEM;
-	}
+	if (!ldata)
+		goto err_ldata;
 
 	priv->card.dai_link = links;
 	priv->link_data = ldata;
 	priv->card.num_links = num_links;
 	return 0;
+
+err_ldata:
+	kfree(links);
+err_links:
+	dev_err(priv->card.dev, "failed to allocate links\n");
+	return -ENOMEM;
+
 }
 EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
