Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F7FC44538
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLoQXHFZSw35/p5SaOZoq7sN1jao12mfe+9efwXmFZk=; b=yJ5fNngK/x6E5q
	EeCMDgPqfPRHk3eBDNhNdkkBzAstAZlTR+9aat7IQyOJwp0fPBDNDfaQsgg+PpEvNFlP4pf9B1EFQ
	sMlYU8CFUIdEjVC9yXTumEi/AJ7RQMdX19iw/dbhcykphuTL+CI6X90vWKj9vk3exUw2WyxxY2r/U
	AKB2EQnwj2TDaPB9VGeBUcwFmVsOZlbssI4FgeJ8UPRmi3kFBWfULF9YsbEcD5OugqsHtmJ1ZKYBl
	drGHOo8YIlS6On1ns0LhEcrzihyzWCIAJh6XxnoZHYcFbU0Kl24fYJzrJNfhSB9n89nxOuBq5nALN
	X1FIxf+fkfetctrdxMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbP-000000075e7-3Zc4;
	Mon, 20 Jul 2026 15:08:19 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbJ-000000075K2-2z60;
	Mon, 20 Jul 2026 15:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rb
	JVHVOturhJVseaFdgCutzkTWzNq56ytxEmv63ILZM=; b=GF+PwHNR5pTt4PDsWs
	T0s0PiiqjMWesPjJyyiowX5dFZfrnnirwrFYBQhSP0lrzpNSqY6cgjdv2QOJuIqq
	tIl5UUx1O9sm7a+L/BKoT/KuyihjJDqUqhlhhH1t+I8P1+BJiEsvrNc6nopIbVDj
	DvRKjT+EbgW3o8RLRY00CQ7rE=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S7;
	Mon, 20 Jul 2026 23:08:00 +0800 (CST)
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
Subject: [PATCH v3 13/16] PCI: dwc: spacemit-k1: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:16 +0800
Message-Id: <20260720150619.24733-14-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1fWF1UGr15JF4rXr1kZrb_yoWkCrgE9F
	y3Jan7JrW5Cr90k3Zayw1aqr9Yy3y7X3W09a1ftF98Z3Z2qw1YgryDZFWkAa1UGrs7Xryf
	Gw1qvF1rC3yUKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNVbytUUUUU==
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBC0WGpeOdAGWwAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080814_122042_1B959400 
X-CRM114-Status: UNSURE (   9.09  )
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

Because .init runs before core caching, we call dw_pcie_get_pcie_cap()
inside k1_pcie_disable_aspm_l1() to get the capability base, then add
PCI_EXP_LNKCAP. Hardware is already enabled at this point.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-spacemit-k1, the call chain is:

  static const struct dw_pcie_host_ops k1_pcie_host_ops = {
    .init = k1_pcie_init,
  };
  k1_pcie_init()
    -> k1_pcie_disable_aspm_l1()
      -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 04241df8fd59..3e741324f44a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -116,7 +116,7 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	u8 offset;
 	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	offset += PCI_EXP_LNKCAP;
 
 	dw_pcie_dbi_ro_wr_en(pci);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
