Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27A2C33CB6
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C94D21582
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cpa3IKZF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIWwam/4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C94D21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faWnSLTaUZCs+m0IAqIbR1FCkUjKY50hx4kYzPji7UE=; b=Cpa3IKZFo+zW4Y
	SZStK7L9pBUg+v3hw0TcRYNPYlv5C9cQ2MwZhemQXS/LvHrdEbBH1cXcutsPJtJ1++I1XV3QTYy0K
	Eg77Gfli0isUDi684gpywy7fmFzzCcWO6vvztMDAg5OO/bJfh1Mn5qNWbUBw3AEuohdkP9THr7Scf
	E1gmpLQ9FqY5u2UC5OzdUlhpoKLDYNbqh1YMUgTpYreiVEGHQGys4yjYsNQsbPgajM5E+9t24Ezk/
	Cwg47GQMApYrzuiLH1R10+dmltSztAUUqPTKC/ikdvHvm1H8y5nJTL7ok7wu8ZfreTFn0nbdS6uSa
	sJtnX1IPqRD6ShnewbvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9oW-0000nb-6z; Thu, 16 Jan 2020 18:24:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is98M-0000Ja-PL; Thu, 16 Jan 2020 17:40:52 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E60F24713;
 Thu, 16 Jan 2020 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196441;
 bh=1WBwtBFd/S4ZThNyRSXh2J58uFNS4zT9LBSOajQ34ak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIWwam/41KaBySxHjPyGgf80ZlyS/zk25FppkSNHBK3qWuJbsmlFB0qratz8+9BPG
 no5EqXGhWWVN4fwuyzc+9k591g02oeouvysQpy/+RPWBca8jOhJILlyZETvS7TjSFF
 Zh9ejVs4TEz6eH7yrSOSLEeOJW14+2qOrvMxJnq4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 205/251] net: stmmac: dwmac-meson8b: Fix
 signedness bug in probe
Date: Thu, 16 Jan 2020 12:35:54 -0500
Message-Id: <20200116173641.22137-165-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_094042_879934_B626300B 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-amlogic@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit f10210517a2f37feea2edf85eb34c98977265c16 ]

The "dwmac->phy_mode" is an enum and in this context GCC treats it as
an unsigned int so the error handling is never triggered.

Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index f356a44bcb81..6704d3e0392d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -280,7 +280,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->pdev = pdev;
 	dwmac->phy_mode = of_get_phy_mode(pdev->dev.of_node);
-	if (dwmac->phy_mode < 0) {
+	if ((int)dwmac->phy_mode < 0) {
 		dev_err(&pdev->dev, "missing phy-mode property\n");
 		ret = -EINVAL;
 		goto err_remove_config_dt;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
