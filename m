Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15172EF8FE7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLei7YSE0X1s2PvCL2QUG7wCAFZtYIAKIDOktaQVt6U=; b=F+icG4Fi091tvV
	B3eLGIpGztbVmv8caEffpsNf1G4ZC9oPNNXV+rV/9S6Igz3lvchVLoq9ZjZdcG/keCLj6eUymmuit
	MR+x3t/jS6tBLAQWAS6DMNXJIenCUYK9RIaEYHyzwsQFS+B/FZVPtYP73xpzAfF/+6ZUBnDgMj/Bz
	oRTqfRFZ1JOS/k9T03rnSqA/glz9tf48ESn0U95A1ecAXGAb3cXa7IW4jrApPvE9SZ6Q6AOCBhQci
	x71e4OZ1pJoQXLSSiugNirvWfjXPcEA+eBgxOfnKgRXqffH95ghjHc8u9M63ocB8CFtjrX5CRST1R
	v59yr9ZjB/ETT0CkTaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmq6-0000000HIeQ-3QUA;
	Wed, 04 Mar 2026 14:04:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmq3-0000000HIbg-1o7J
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:04:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1399267a91.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633075; x=1773237875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=LP4sFbr1iIKbHcXoiFJzHIxe4UZ7vcWlt6xGTqd9x3OnTTYtppRMvVBZEsbEzCTPvu
         EyMoACzz4BdfylZjD6IDlzeX36/5X7dxJl4vi5zpHS560bb8opHJF5VsA3Nj7b5uf46c
         698K0oMFfE5BI+WjBsFkAFSbrpVzweZK6e5Ff/5MjbuNYUcdayOkFyzI8sXJNvH2f7aa
         nx9f0smsmEi1WDv4BWd5gRPmXMxNvWYhoEcGUDbVMeQn90BVGAew6kT3iml0uEZD12e0
         u42V/OEfnVsBfQ19VgQpZUJ79kQ/kFgb/tdSffWA5cQlcvkmAgJ1Oa25Kau6BQ6o4kYp
         qspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633075; x=1773237875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=YlcNzkTVrgA4E5HxDHdYfEnZkqn/rveduH6917Qpc77cLZVVdExY1ac4X6IBfvxl6d
         LcVohuH6q71LABF8aXJpHpls5tBZhYEMDhYBe1h7SUTYIr/VCKa4BqhTqo9t/7rREZjZ
         Jovzk08VA7Yl4wHXOG0b7eKn0B5LlhF0WHirQh295YwCBDt9zrmRilZtc0zQyJk982qd
         F4Gws7OF74vPdFICBue78WgiJ9rnv/asyV8/LSxlfSO/iXg7nPS0SBjCTaXFLUnhyETr
         rV5w199RHR15TKpMzZBiibVfCbGOB0X5hFGjTn89qPWlL2g/1QEAhQjMScrs+mJlMdBF
         JsRg==
X-Forwarded-Encrypted: i=1; AJvYcCXi1Ehg7Agpatz8qMBWiGFMvbaK7Y2/8MdAmUHMSH4Q1U2zM7lgDK4pA+OL2tBa3Tnynw6g8gr/R5i3SOYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1pIw7hDjUTxEzsSD1lsHlXIQ0dD26rPO7grp1IeleRErtwWAo
	RJF8bvRQXqZWdX9ZulPg6pc4jNjO5mb5FJ1+PmjjLzk+GTtRUvGApXhK
X-Gm-Gg: ATEYQzzjySptqZu8Racrm7pgAN8fyptfV5FkbW2IZbFh6RlfK6a5W6jQ0vv3hygj3q0
	4SsVL8TZeDuokLSaBt+x90x1AdLyxiCNsPGy9ggQQcjK1xo36PGxdlTFk/daPNpo1WVgbHoNJBa
	Q1wHtABfGG0/3AJQZziuqSFoU6Rm2zyHhpfvKzD+nqWwS1YNB0zjVdvNOmNu4WXjEnw5zPlfHwQ
	C56s+qpiuKQRYjcZvZTUzEqsSFaQy3RJ8O7RLnEuDeY4QxoB70u/kVVqZKJkAPTq9yk1bG5CDEu
	vveCfoNK3pfsg4ZXAG3ZIk2y+aSAM4qKUBukLtbzvKWAXXth1YOcse4zdtnbuGO7Q/hmLHadT/u
	uLnAFOMmlmlF0Nr4mJ2x3+aR0NWMnoP/fsM7gIk5qrhE4RBiah3y0uW4a2MDq7ZZP0jcm5YBEjG
	VcVqQ8L8Fui/esjPqw5XVxa/ON6GjuzqQ=
X-Received: by 2002:a17:90b:4ecd:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-359a69e5682mr2092330a91.14.1772633074556;
        Wed, 04 Mar 2026 06:04:34 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:04:33 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 01/18] PCI: al: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:44 +0530
Message-ID: <20260304140329.7089-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060435_473001_BFF4B2E2 
X-CRM114-Status: GOOD (  11.38  )
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

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-al.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index 345c281c74fe..6e3f52ccc1fa 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -383,6 +383,7 @@ static struct platform_driver al_pcie_driver = {
 		.name	= "al-pcie",
 		.of_match_table = al_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = al_pcie_probe,
 };
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
