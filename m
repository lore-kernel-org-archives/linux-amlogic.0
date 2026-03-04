Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743CFEF8FEB
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPX6hPby0WQ/xBTTs9RSnW2MdbbzjkVMWgZ9J+8bMH8=; b=1YvXxbURg+vKgb
	gwEckI9cxeFy6eIP+vaaHU1EM+vQnjVWYFJwYbNcova9LdWHd8eduaK/dT0yjCC8zmi5VSqFOVdHb
	igEG9sQNMriVe8EF/VGweupiDr7RFbublNaA6SHmWXyGggKTNqIrZ29UupxFS2aZ0st3c55UinuxX
	qmuxglSb2pAt0azXncXRNfPoEfXNcwaOjpk7t3J7L+WZBbOFFj1DKQF2LsoidbRiHPkA2lhlRzc5d
	1bEskZcEaI+7zma8JDCoyBPd2/8vVMqZCbvM3LiI0th1hb4zAMDhs2AA2BqntDeeGPxjkuXgiQWMH
	ncw2yBQXpK1IKfP4dLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmyj-0000000HM5P-3D70;
	Wed, 04 Mar 2026 14:13:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmyi-0000000HM4D-1XTL
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=; b=H/wTyE8kxtS5l4HZqpE1NQDwW5
	gxbbRwVP7rPZoKzVLT3mEZYT8Ux1TwmE1HFz9D9OanYsck9RbDsFo/yXFfJPfQqwfy23HMB6FeT9T
	d5XCm/73CUC7QtPisfw6BB2M1oU8Wm3XJLSuK5lF7uoMvpThzMGhM42YlDcNPc8t8KrvjA2Zsj1qo
	3DuGS7p/yauiccLFBM/PUDbUiWRbKPAawmtOlbzFzX79Qb0VIZkilGnSaup8+UjkVCGpp9oV9uPII
	C5PH5VgqxaCUwZf0EYw5Z2lP51BG7lVsJTqiru3eMukxcVj1IOD5tSc9Xm7byQL8fDdzOVdEfxiFe
	NsXUIcxQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmyf-00000004jIl-1yY1
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:13:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-827336c0994so4030228b3a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633607; x=1773238407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=O/H8/QeVTkgTi4GR1CIByifLyWrVLaSLgc+pZ3MaUzJSdZX4+PVRmEjQWlQzz9Vqlu
         Luaq1gh4482ufWLNqSfUt3YmcpLxP3iB8USOhVDDWFdZj66SIj1iH+YWnbdMj6LViId4
         dfUGc5bKmO1GA/oFsE4SpLcWfgI9xZ/TRLOdI2bKxihhZH3/it5MxrnNPbfKAhBlVli1
         UeA/VdHuGl2xyOcDfG3GCKSq2ojyyUb9OZXLUnzcAE6nisN0j06K8Bbx7x50JPI8+cot
         ODEHZriqdJAGyTCU37Obm2mxJhZU1zAsao/tv8m/kpVGqmK+7p1I2CThqykZHJzEimzp
         EXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633607; x=1773238407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=wWrflrKxevLnXgMr9eGirQCYai4D/Cx/Li204+F+SUIGzzKQfFTdMRjauGPcErBg2q
         Fl3q61ds3VuhewuqvqP7w7onavxQi7FjI7CF4O4+0IE6EBqWfHeOcHyNqdOMVMSQjC2i
         t5CptqkRh81qsUefOSV9hSKwqAwAa6qhkoZkxFKIO1CUhgnTtNTMK158DO2s6CywcMZ0
         QSyUhYe52vfUYUeL47kczVzIyFVprJ9mu07cnDG2PCCb0Yr30o9wVAlHF3uFVyzbUtym
         rF78cv4UAK8qFKd7OSGRuFRPTwaWBU+h3r5d46usqbgaPyh+RTM+NRtib91m28nVp2eR
         OxQg==
X-Forwarded-Encrypted: i=1; AJvYcCVp4wpNdUac55Jy++5CbWhlag7TP9TVg4qYyqGg1oLmI6eZo2bO0odwM8fhPLZC8lWJ0RPBxWCIyjDWlaG4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz21mBvQHGFJ6F3A1BtRYwgg7ZNUmJjHZmYNsNDeASQEMaHxiB8
	7dmkKzg9yilAx/mf5k1U0IaeQ0iaXhmOTpZ2CQ0y2X4UKz5cAUO2QraI
X-Gm-Gg: ATEYQzyXuwRbJ91Wm0fvXwmAK3J0VKyXaOCWQvpze667BdnrgY2a40Lg/ONnIFNTRqd
	WGFepa6LM6S5nycM5cr/ftGMfdGYEroVIJn2n+jkmBq9JKHnKcLYjJHMHob3IRreSbQOjRLhZ9W
	1CJQ2Y3AGFoRS16hS05EHYy+5KfkXbeP3nQE6VFWkqalIePuNADZltGP6646JH9fJHgVOigife4
	DBiCsLUxS2ylCw/cHfgtX/PT/WBDfiv1vEW54iIYUHWddDq7cR02jhP2JFv0tF2OakeExptKf0S
	6PejVJZJLMirV7o9glcGg2eOWefZqem4rIzkVSR64GnGZh8IN1qVGYLmOi25S4xHR9eZYlFHs+S
	66X1T7VD30Go+Li93C3BUjUIAW4k5lPFr0wbG3Gv1Rdks/l6UumCdwJ+tYEbfnthMWa5oJ0YxR+
	FWTwPlD4K0/pNydgFEEdXu
X-Received: by 2002:a17:90b:5286:b0:359:83a3:584d with SMTP id 98e67ed59e1d1-3599ce32dabmr5222786a91.6.1772633607253;
        Wed, 04 Mar 2026 06:13:27 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:13:26 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 12/18] PCI: kirin: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:55 +0530
Message-ID: <20260304140329.7089-13-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141329_620523_C75F34FF 
X-CRM114-Status: GOOD (  11.31  )
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 91559c8b1866..bc905056a9d7 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -757,6 +757,7 @@ static struct platform_driver kirin_pcie_driver = {
 		.name			= "kirin-pcie",
 		.of_match_table		= kirin_pcie_match,
 		.suppress_bind_attrs	= true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(kirin_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
