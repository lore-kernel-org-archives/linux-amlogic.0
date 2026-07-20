Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E78C4452E
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SN80l3eE077YI1v7uQlJv454WNTOSSO1RpDeO7rCxb8=; b=MhsgTPJgZJOGGN
	r0JcdmUsymFmnREu+jaOra54E5LpRs59cCDk0I41kiciiI/zOLjl+gyGM0IDv/PTHWMKeaK8KNt5h
	k3BBYQ90QTsilCRZiL8g2O0RhEADxPp4OXDpi0XP7kJmMI4gtN8cDlb+MlwzpkMXoycaQwt9/Elfm
	VnlkknIZN/9pQ2HTI+cU2GpEylrZDC5GuVIcCFt/logp1ztfH7zNkrjsy3Rsk5bGV9/b83RELUdiR
	AW0ErCH1G073teA6W1e+927mKzEF/ONUp+q5jmNq5uHEuDNYAIxHKd0W4w3kGsp8qC1d9l1j3NKNR
	dyROHN38HftoIS7pjbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbG-000000075KF-3qYD;
	Mon, 20 Jul 2026 15:08:10 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbD-000000075Go-1bhY;
	Mon, 20 Jul 2026 15:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=S4
	lPlR1q4qSCvgYn9gZFu5HucqogfFBKik1eEg5ZKUU=; b=IFTUZrp4E9PZKqQGHU
	jILUxrpWJD9kNSDQNDCct1EO5IHqaTfV1PLv3Buw3HPhXxbG8l0vFXtWfO0phug+
	Fq9aLtAp97ZUlgohkgbK5M0BgY539ri6XL2Z1cplFxkoxGS8YhCY/7jb0A/yJPOj
	Z1OpM9bzQG2mLsXIWZWsrEUvA=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S9;
	Mon, 20 Jul 2026 23:07:49 +0800 (CST)
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
Subject: [PATCH v3 07/16] PCI: dwc: eswin: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:10 +0800
Message-Id: <20260720150619.24733-8-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX+mO9OV5q8LEOKg--.8910S9
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4UZFW8XF4kWw18tr1DZFb_yoWkuFXE9a
	4DKr9rAr47GF90k3Zavw4fAF9Fya4xXr1293WFyF9xZFyIgr1jgrnFqF98AFWxCFn5XFyr
	Jr4qvFyxAryUJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNF4EPUUUUU==
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wWxVWpeOcVuzQAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080808_114556_1607488C 
X-CRM114-Status: UNSURE (   8.60  )
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

This function is called after dw_pcie_host_init() has already cached the
offset (dw_pcie_link_up() is called after .init and after caching).
Therefore, we can directly use pci->pcie_cap.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-eswin, the call chain is:

  static const struct dw_pcie_ops dw_pcie_ops = {
    .link_up = eswin_pcie_link_up,
  };
  eswin_pcie_link_up()
    -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-eswin.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index ce8d64f8a395..6a37fd5a8384 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -84,8 +84,7 @@ static int eswin_pcie_start_link(struct dw_pcie *pci)
 
 static bool eswin_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	u16 val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
+	u16 val = dw_pcie_readw_dbi(pci, pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
