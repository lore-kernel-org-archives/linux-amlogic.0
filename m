Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A460C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 16:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D0020787
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3bEdioQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV5IKpRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D0020787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzqbGIyFqAklfNgTKpz/F3p5lPjSDem7AlrkGAGM6YY=; b=p3bEdioQtSca3j
	S7W1UckLxBInuWKwIAJRoPPil2u99Llhus9zNYQY7pxwILYfoZRsdK0qjblXEKEC2coNrTyC/qb0Q
	wNsaUpREw405qNs0sdBHVWTb2jg9VoBgdpJXfxStuW4oN2Ek6gUwb4Jm5/61fKyrx4iF780jbqc9A
	aLUbxtOxWBqe5Z2WPlioany46GMWuwgBk4EbxwKqsS1/UUwKWJwIjLUaal0mMgd2solcWaQ45bsOe
	Kr2alLr0Gj1rlSEWIaYHXgFbvQHLr7VdZbJtk9dgUURQov74StdUJ/8Mspxbp6g5g1qTaIceb3zEq
	ODehn6GqGvguWzPYiONQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpnM-0003io-S9; Wed, 29 Apr 2020 16:42:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpnC-0003bc-3i; Wed, 29 Apr 2020 16:42:47 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56B6020787;
 Wed, 29 Apr 2020 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588178557;
 bh=vH8eIR3MMlTacZK4WfkYpv1el05yTxrI9SEhKlzGIcg=;
 h=From:To:Cc:Subject:Date:From;
 b=aV5IKpRSmbzOy/KapP8clDwAjF1XQgvhlAAKcGpyPC3fA71gVOlb1VJEFJUyWeh5R
 b8Q2FzDd80vPcdKaLjRdVqQEl3atumGCJaFIhAFsbNFW1Fz0nhWOEWLApaaE/SvBfl
 OZn2BehNgeP9BLcn27Z3FwzmO5d9zEizNcZLDDyU=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jTpn9-007lrk-7s; Wed, 29 Apr 2020 17:42:35 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: amlogic: meson: Don't use FAST_LINK_MODE to set up link
Date: Wed, 29 Apr 2020 17:42:30 +0100
Message-Id: <20200429164230.309922-1-maz@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, lorenzo.pieralisi@arm.com, robh@kernel.org,
 bhelgaas@google.com, khilman@baylibre.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_094238_195636_958645B7 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Yue Wang <yue.wang@Amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

My vim3l board stubbornly refuses to play ball with a bog
standard PCIe switch (ASM1184e), spitting all kind of errors
ranging from link never coming up to crazy things like downstream
ports falling off the face of the planet.

Upon investigating how the PCIe RC is configured, I found the
following nugget: the Sysnopsys DWC PCIe Reference Manual, in the
section dedicated to the PLCR register, describes bit 7 (FAST_LINK_MODE)
as:

"Sets all internal timers to fast mode for simulation purposes."

I completely understand the need for setting this bit from a simulation
perspective, but what I have on my desk is actual silicon, which
expects timers to have a nominal value (and I expect this is the
case for most people).

Making sure the FAST_LINK_MODE bit is cleared when configuring the RC
solves this problem.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Marc Zyngier <maz@kernel.org>
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
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
