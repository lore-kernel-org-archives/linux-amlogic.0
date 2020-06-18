Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2D5C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:28:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B003A2220B
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEqld9V3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFJp0m2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B003A2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82Gxs21eLN7ZAuA6G+yfxEiBSdluVFYFCbTm344sAJY=; b=UEqld9V3h8uIGG
	Lmow3OWQ0HGr35XBNY9G751yUCyvNBSahoiTE/znEejCZ66ZaQmrIbuW1G2RIW/14Mk6ZuIA/p/xU
	3WvC8Gc8NSvhwr7AL7dZ+Bzt/Mt17sz3zetJN43gWvNsG1Z8nT42IMVV+HUTCJDFVpGdICAYCx0Qy
	fAhY/Z5IUlvlr5N/QBBBYaEWkDeTTk9vLwEUL7h8JXNiUDEVzPD1wJ71LdTji7h7AL5iTjTUjG93e
	5o5rfdlWlbXBm33oX4bImwhEY41SMaLA8bcdABsnSAIenxonm3bT1oHZQn8TYCCS4D9NKxkkYkxMp
	JLg5HIuxBOO44ozj+Iiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljLo-000553-Bn; Thu, 18 Jun 2020 01:28:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlj7f-00033Q-GA; Thu, 18 Jun 2020 01:13:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCA91221ED;
 Thu, 18 Jun 2020 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442822;
 bh=78btlO7Vr7itdFV3U5z5DJ2DrSrGncjQyVvThiu09Tk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFJp0m2PUHF02kQ/OeK4GYUuuIK1wTTRjBpqYBqEw0jC74TdcXXdpD7ZUftnhfMOr
 w9CnBvT+VMBTq0pWdx6jEdWBW0gTzi78Yla6Uy6uUkPFl+R/zFijLOTgadxGv7D/AR
 e4qqwY1c4P14OzR/Kn92Oz4/CbLyRwZPTUEWd/X4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 259/388] PCI: amlogic: meson: Don't use
 FAST_LINK_MODE to set up link
Date: Wed, 17 Jun 2020 21:05:56 -0400
Message-Id: <20200618010805.600873-259-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_181343_568783_307F27BF 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit 87dccf09323fc363bd0d072fcc12b96622ab8c69 ]

The vim3l board does not work with a standard PCIe switch (ASM1184e),
spitting all kind of errors - hinting at HW misconfiguration (no link,
port enumeration issues, etc).

According to the the Synopsys DWC PCIe Reference Manual, in the section
dedicated to the PLCR register, bit 7 is described (FAST_LINK_MODE) as:

"Sets all internal timers to fast mode for simulation purposes."

it is sound to set this bit from a simulation perspective, but on actual
silicon, which expects timers to have a nominal value, it is not.

Make sure the FAST_LINK_MODE bit is cleared when configuring the RC
to solve this problem.

Link: https://lore.kernel.org/r/20200429164230.309922-1-maz@kernel.org
Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Marc Zyngier <maz@kernel.org>
[lorenzo.pieralisi@arm.com: commit log]
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 3715dceca1bf..ca59ba9e0ecd 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -289,11 +289,11 @@ static void meson_pcie_init_dw(struct meson_pcie *mp)
 	meson_cfg_writel(mp, val, PCIE_CFG0);
 
 	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val &= ~LINK_CAPABLE_MASK;
+	val &= ~(LINK_CAPABLE_MASK | FAST_LINK_MODE);
 	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
 
 	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val |= LINK_CAPABLE_X1 | FAST_LINK_MODE;
+	val |= LINK_CAPABLE_X1;
 	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
 
 	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
