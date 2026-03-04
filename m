Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01EFEF8FE7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kiai1RFjgJOeJXuO8vVM/LtU8LFN4oddY7CEH7g7KGM=; b=euYd0NbJfeYzJT
	NUBBraAILJZUgKEri8QUJgp6en1m32WnyUGqjYrYjWY15CcM4hEXMX9WAMu78AbzL2aOmdQ/w59DN
	LStknR0m7vxFO8eO3gFQRgK6aUwN7F9zvHxrb7hGUHjzYzPYGLDqjsCE/vKaUXi3x4kFU+xyMlkes
	XeuZnLF3gZpPV3rAzGdaxkKEZK7vf49spCOxhfHzQHw3e2VP4NL4ddmbyW/8S2QSmSMKsN6N3SEsU
	9+AgziQYWC+0ekgKprhFbXjPhmJkzMBFtLFWe2xmd4v5acO4bpiZwY9LDIpb0DRbZ09qmvahvhrjB
	Y1sX0CEBkXvRgkxC0oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmva-0000000HLFP-3kGN;
	Wed, 04 Mar 2026 14:10:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmvX-0000000HLDz-2zdQ
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:10:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3190413a91.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633415; x=1773238215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=VLHdHvzXUUII8ysdcztEeofm4Xa2m6308uQ+nXKJ3rFHCA+YJjv6u9ReQZOfg35RJp
         Hxi0DdbJqhPvT05LBzF+212nBNi3vkCeM5ZjHm0orGcFQymp9t68kCxDUVWWDul25TcK
         /vE/0o5SVKRgpf1gk9umQOD7PWLl25DUU3cwAkKnS7PsvmrjtIlhxDQ8uoo7eGw95R6n
         QdNGT9hCG5n4yh+o9xVFVR2CaDW1lc1C65pvVgwQ58Oo/J2PPhiKZAwvfFqvldieRidK
         z54HNFlem3juJpdh2qsM/SEgiwymqY9cFNU7t/bhnsHXopRI5p2LD6T795wtKMUiDcKY
         AgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633415; x=1773238215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=uFXtOrhZ5bcWQ9DdEiWcqz526Ag0TmXah+Xiro7PnuBOxP5ry9ywIB4TDM9fTcnp9y
         GgffN5WuvwMynSUSiLd0AvURxkgDm9+TdPuMkjTEN3TzjO3JO8Y3I43AGHmEGigKgmgX
         Gqt+hbmFodayFL31Jz3R6B9yocmVK+L7YbGs5wsbRWPl7wHQ9QavC4tS1FbQzYGz2h5x
         9NYKWlLNtIFav89Lef19sWazC8ICXQLL2CASxNETSaw6K2qdjECQrShvKSDnMNE19+FS
         J7fEbaWBVk9Y5LjL5Dkw4tdNjiprpr1C7XruL2K6L3M5iydhLeLwKHGg/r0+t1xc4ot2
         6Ipg==
X-Forwarded-Encrypted: i=1; AJvYcCXxpeLjWMpYhaGZjjI2fZ58Gr7vNbd5QLrUkQfQ2ceUB4nNh0SdUpWO7fKceGOAF5Y6nFJB5u3M/R+nNjaE@lists.infradead.org
X-Gm-Message-State: AOJu0Yww4y6ZZAO+ToGBVVsJcqqkr83EFKPJPpGimwO66nl/tFn6IhKU
	jbEMI5dMIsnBSBqnketjcgV4OiVPwKvY6N6otMePaPxxtipzBSwXgEii
X-Gm-Gg: ATEYQzwwPMI36Zo47kVFRnjUrzQ7jh/hNtiF4/vIvnnSI1OKgUoEVEl51wvTA1HClJb
	j1elHOFbDM2OSbddSt2YPBkZHFTaZbkxaP7/XXcBXQeublicIhx8s5v5NUbkWX15LoJaKiwI0UT
	uBbeF3brdq9QSb0pATvv1lN02AeQgW5G+N+q6IkGxYtE7yt5ifWUR+NhzV+YOzms9a3FYwyIpCF
	Uv+16luSq9NurCRuXfrdOX8UljByhZupWO9qs68ssdH1BPg67sbgYqWox2owXdtNV0yjl3QC0si
	v1eMkcHT+sF/5gqrUfQoUdQtg1E59BNruDmK5ePoiORLnd/wi6FnW0TdxhsCPb/vu1/fAJGc9kB
	RJLzgoSblVSSyim/+faCOnCh6GhLs0tD3K2HmMa0B0IqNx2ux9q6UXNa70bO6vaV0loGscZX/t1
	viFqnJ3D0rqnS6Iv1uP0PP
X-Received: by 2002:a17:90b:2e8c:b0:359:8c89:96e5 with SMTP id 98e67ed59e1d1-359a69caab4mr1729374a91.12.1772633414915;
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 08/18] PCI: fu740: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:51 +0530
Message-ID: <20260304140329.7089-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061015_746966_7EBB17D9 
X-CRM114-Status: GOOD (  12.89  )
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

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Fix the identation of the callback functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..aa6a15baf3fd 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -346,9 +346,10 @@ static const struct of_device_id fu740_pcie_of_match[] = {
 
 static struct platform_driver fu740_pcie_driver = {
 	.driver = {
-		   .name = "fu740-pcie",
-		   .of_match_table = fu740_pcie_of_match,
-		   .suppress_bind_attrs = true,
+		.name = "fu740-pcie",
+		.of_match_table = fu740_pcie_of_match,
+		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = fu740_pcie_probe,
 	.shutdown = fu740_pcie_shutdown,
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
