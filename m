Return-Path: <SRS0=U+p1=4Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F961C10DCE
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2020 09:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B0020838
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2020 09:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVDVipkP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XFgo88O/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34B0020838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=148CuSYbccaZG66f/RvQQN/iDnznVsvEY8hRm0QDlmY=; b=hVDVipkP+DMW9J
	2ciizfDzNVNSw8RB1zOXx9TVfHA27NAOZj6UnZ3PRLjQ5jSrfq3N3hosVYtOnbKRRRbb9auZQoYja
	rzVJLAA8OLOEHyenyarKk/O/iR7GKENrY3pa3SZ9U77gmC6v51UY03aDlA3zfobMZ94g7RwPs0jcJ
	QQeJl3KwPgvy5QR6IWRFxqYvuKRjCAUt4hV+HqMZc9CCxe5HtEF2X4gtRASE1Q07y+RY0/2UVGa5F
	M1ITRKeNlGsNX2IZI2BUA4UtaJQrzCAgsO+4T1cqh2L4ea/c4fDg66cXJB/ireYnyBtBVici+TXqg
	/6opjEUprP4f5pkFXAcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAs56-0003h0-4K; Sun, 08 Mar 2020 09:18:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAs54-0003gi-LZ; Sun, 08 Mar 2020 09:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=fhp4Lejt1xnuncUJTAw5EqBMO8VXI2TdMyiIcLrV4cI=; b=XFgo88O/Ea+L8R9wxSMUYIEG0w
 UhYShn6JSBNJGFa4VLc7mooizBP/l7rQv1S0NLCpZ7prz94eV5zq5EX3iqElMWvMu7PWYwnA99CCk
 JrAeJhL1Fkf6t81zxgfRW9jk2pQ25bhI6mbiLfhAy/MMPnTce7zMMxD/MkTFSyBQzFR72iuGNXUFq
 nJdMSMWZP7sV16aK1W6xur8WlanXsSMeoSEFJuLxXrhWJWX2Mm7t72U54PUHNm7GGxW8npmMhzBjZ
 bMR6b/Pa3YcyE4lJ1yvSb4DZL769Ng3fJAQHiLLoJvHkxTuDZAe/k7rAdMvxoMz0XCSkjxX1VRh8y
 20HBRs0Q==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAs4U-0003C1-RC; Sun, 08 Mar 2020 09:18:39 +0000
Received: from localhost (unknown [37.167.192.10])
 (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0965D200006;
 Sun,  8 Mar 2020 09:17:17 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Subject: [PATCH v2] net: stmmac: dwmac1000: Disable ACS if enhanced descs are
 not used
Date: Sun,  8 Mar 2020 10:25:56 +0100
Message-Id: <20200308092556.23881-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_091809_216383_2688F0C4 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ACS (auto PAD/FCS stripping) removes FCS off 802.3 packets (LLC) so that
there is no need to manually strip it for such packets. The enhanced DMA
descriptors allow to flag LLC packets so that the receiving callback can
use that to strip FCS manually or not. On the other hand, normal
descriptors do not support that.

Thus in order to not truncate LLC packet ACS should be disabled when
using normal DMA descriptors.

Fixes: 47dd7a540b8a0 ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
Changes since v1:
  - Use reverse christmas tree like declaration
  - Add Fixes tag
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d0356fbd1e43..542784300620 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -24,6 +24,7 @@
 static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
+	struct stmmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONTROL);
 	int mtu = dev->mtu;
@@ -35,7 +36,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	 * Broadcom tags can look like invalid LLC/SNAP packets and cause the
 	 * hardware to truncate packets on reception.
 	 */
-	if (netdev_uses_dsa(dev))
+	if (netdev_uses_dsa(dev) || !priv->plat->enh_desc)
 		value &= ~GMAC_CONTROL_ACS;
 
 	if (mtu > 1500)
-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
