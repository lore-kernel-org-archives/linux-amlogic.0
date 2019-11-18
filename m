Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69B4C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 11:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B820A2071C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 11:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbW5yx3Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B820A2071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fNo54DCw+UcX3lDRL45nNv/4OVG7AAW9UI/v+2j2h0=; b=hbW5yx3Z6/DZpG
	v9FSh2obziKDy37ucaaRb44CRnUUdoi/j/wq7KxVAsSJm7xbUXiECfs5dI5WJTPHgML/HAbdHtEaY
	4cvl2w2BTBt563TuwMfKTejqfR40/jhMEMznTHQu74hUquhCoo0anwKR9U6mQeXV6NHilSJKqomgl
	Rnpa7sg77VyzpVWMJm5fGnEn9ne1IKUu7jSbYFq99i57TbX2duKB5dNVWminErO6l4TBWknOR9gWw
	bdSX03QeAkWyfEKw+1r7v/fBWZAW8OVz7NYYU1Vacmfpf5uWkS87EF53zkaDbI95gIr+qfbhf13j0
	1y7USNciEU0AhkXxNaIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWf2w-0006rG-JP; Mon, 18 Nov 2019 11:18:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWf2t-0006qA-DF; Mon, 18 Nov 2019 11:18:16 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 76FA1B027C2DF58F8C9A;
 Mon, 18 Nov 2019 19:18:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:18:05 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <yue.wang@Amlogic.com>, <lorenzo.pieralisi@arm.com>,
 <andrew.murray@arm.com>, <bhelgaas@google.com>, <khilman@baylibre.com>,
 <linux-pci@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] PCI: amlogic: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 19:25:29 +0800
Message-ID: <1574076329-48893-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_031815_617084_541F32BB 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes coccicheck warning:

drivers/pci/controller/dwc/pci-meson.c:300:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 3772b02..38902a6 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -297,10 +297,7 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 		return PTR_ERR(res->general_clk);

 	res->clk = meson_pcie_probe_clock(dev, "pclk", 0);
-	if (IS_ERR(res->clk))
-		return PTR_ERR(res->clk);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(res->clk);
 }

 static inline void meson_elb_writel(struct meson_pcie *mp, u32 val, u32 reg)
--
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
