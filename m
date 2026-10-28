Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3760A2639
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WuhIRAPp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gtbwcafv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kAXmMJtQrzTYeLyaTWC3PKrwkTxCOoPveZTvBzx17Zo=; b=WuhIRAPphtirswOlVPc5jXpTOo
	lXE4aA9KHwIuhtbWkeEoaAVys8kCt0W/tweTJCxvAtHmE7bxUgQ2VUkAo6VJRqD5R/+HVO5e5KtHB
	5x1GZ913ZHmYvHRAVVIYryR42feu0ey7xRc7XSM8DYIZEz0NYdBytXX95m6g8WZj5KDu/kabr0jkJ
	D20JnITUuTQfyPEEIuu0hFBpMDO8UXFYgXdY+ypDwvPeMKOGmL4znlggwL4xO25ZERmN7nw0kskWD
	qQFPDi4whnEIelZEGkBsxxOT+v3L0onHNMvkYWMtRCmqkpl75qC/bp1YUXdJuml3jrJV4VlFDBKj7
	CErmGm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0z-000000069ce-0lok;
	Wed, 28 Oct 2026 03:07:49 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0f-000000068q8-1iIE;
	Wed, 28 Oct 2026 03:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=n4
	jGWf/FWtMvLmpyVMZtbApsVdmVgjXDZdhxzRoPMwA=; b=gtbwcafvem1NRSUNV0
	mgm8RE6uKOEJUTa2VO2GqaFjXsEQnWaUj6v5IT1Q7mXLnpZ1m5KQVRqFrILUwe3X
	ZvJwkC3e9F2oCNAWnvHJcatHWEB9lb5V1TFrPusvFdw3NtsWhgAfpfhSVj0g//ku
	pQW8iwlRKvrqlW8IcZrLVMkpQ=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S9;
	Wed, 28 Oct 2026 11:07:16 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v5 15/16] PCI: dwc: tegra194: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:51 +0800
Message-ID: <20261028030652.2917756-16-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnVwncZuFqLzE4DA--.33198S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWruryUuF43Kw4rGrW3ZFb_yoW8CF4rp3
	yrXr4Fkr1kJr4aqFsrAa1UZrnFyr9IyrW7WanYgwsIvF42ka42grZYkrW5tF17CFs7tryj
	kr18tFy3Gr15JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGYLLUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ATliWrhZuTTXAAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200729_850659_F5B118FB 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the two dw_pcie_find_capability(&pcie->pci, PCI_CAP_ID_EXP)
calls in tegra_pcie_dw_host_init() and pex_ep_event_pex_rst_deassert()
with dw_pcie_get_pcie_cap() so that the driver-private pcie_cap_base is
filled from the same cached value.

tegra_pcie_dw_host_init() is called from .start_link, i.e. after the
controller has been initialized, and the PERST# deassert handler runs
after the endpoint has been brought out of reset with its clocks and
power enabled. The helper therefore performs its single DBI read at the
same point as the open coded search, and the private copy keeps working
unchanged.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 26e2ac5c58695..9d7ac539aceae 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -906,8 +906,7 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 	pp->bridge->ops = &tegra_pci_ops;
 
 	if (!pcie->pcie_cap_base)
-		pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-							      PCI_CAP_ID_EXP);
+		pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	val = dw_pcie_readl_dbi(pci, PCI_IO_BASE);
 	val &= ~(IO_BASE_IO_DECODE | IO_BASE_IO_DECODE_BIT8);
@@ -1890,8 +1889,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		dw_pcie_writel_dbi(pci, GEN3_CTRL, val);
 	}
 
-	pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-						      PCI_CAP_ID_EXP);
+	pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	/* Clear Slot Clock Configuration bit if SRNS configuration */
 	if (pcie->enable_srns) {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
