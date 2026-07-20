Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE11C4452F
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JypqeYBY2t5ZR+KCyWZt9RptFmmC9nsY61DOeQH63lw=; b=sndsurK7EL6t/G
	HNk4QUwwsYtnn0DgguvtL+tzkaHPxs3Eh2lIy/u5K2XQUHQJP/nx7K0DdXhDEAM0V/oXz+AuAh2Xo
	qsMxYuxJFq1XWc27ikE9BYKe1yduX5sIFIdovYIKfgPfWqcGuwrgxa6bQrEVa3q5YjWpxRmmjG0Gk
	0RgqIc+DnoWIRwnevSms4lEiK8BDe0FH3VjnT9gh5pSxSpqnXdrSAObKF8QIlC6pRr9rX2kXncJ/F
	t0aeJGo2W/rxbn01yTCkD5ZhhH80OacUSzVWJzBqJMUkNCiG2Tx2JWCqHdFTK+NoL94x51kcOQEN9
	nltZpvHosS1Jj2zrQLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbH-000000075LC-2I4r;
	Mon, 20 Jul 2026 15:08:11 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbD-000000075Gk-0fi8;
	Mon, 20 Jul 2026 15:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sq
	5n5May5plZP321RlYIM0qj1KqVpHN9549zyN1aNPQ=; b=aO3MFWV9XIa4ABdZgE
	Hlnwa0G0y0jJsfMsU+rQWsAwNfdEQSRYyiF/0lG020ZdM1GUb2xHquff0SkSItpS
	n87eoGNP4gxWufaDI0dGAfmPZRd3iUPaWS2n7tJhD9P+/pRDRXpNGj7rHOOOhjXO
	Cpk0uPrOoe+twSKXp/RvlYGtk=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S7;
	Mon, 20 Jul 2026 23:07:47 +0800 (CST)
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
Subject: [PATCH v3 05/16] PCI: dwc: meson: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:08 +0800
Message-Id: <20260720150619.24733-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX+mO9OV5q8LEOKg--.8910S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy3CFyDGrWDZw47Jw1xGrg_yoW8AFWkpF
	WYgr4jyr18Ar4YgwnrCan8ZFy3Jas8Ar47Ja93Kw1SvFy2kFsrJ34ayFWYka4xWFW293Z8
	CFn8tryUZwn5trUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piyxR-UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxASxVWpeOcQFUAAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080808_558613_DBBFFC97 
X-CRM114-Status: UNSURE (   9.51  )
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

dw_pcie_host_init() calls pp->ops->init (meson_pcie_host_init) before
caching the offset. Therefore, inside .init we must call
dw_pcie_get_pcie_cap() to obtain the offset (the helper will perform the
DBI read and cache the result). This is safe because the hardware is
already enabled by the driver's own initialization.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pci-meson, the call chain is:

  static const struct dw_pcie_host_ops meson_pcie_host_ops = {
    .init = meson_pcie_host_init,
  };
  meson_pcie_host_init()
    -> meson_set_max_payload()
      -> dw_pcie_find_capability()
    -> meson_set_max_rd_req_size()
      -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pci-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 7a4da9fae1ea..c9d0388d262b 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -277,7 +277,7 @@ static void meson_set_max_payload(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	int max_payload_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
@@ -293,7 +293,7 @@ static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
 	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	int max_rd_req_size = meson_size_to_payload(mp, size);
 
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
