Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAA5EF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGGMwgN5L/Q9VHgseaFrFQOVURIa3CN1wcY2vDwgN20=; b=H/ZCE1FS0q5DH+
	NXNNza9S4ywMDzih88gMgz/a0XsmjItuhKTWEOH1RAv1H1QawVelIzm4W7IVwHIJqtmu/z9vrDmZP
	XOTQGprk6i6E6JD2L+x2TjkZS2pKYLVXFdv5AUf4VhnUjC/jNnWGCMs1BEcJF/+WJ/ZGXohBB/VSR
	Q6qZH4ut9+QUU0tXcSNQAajXensBDnjrCLZjrj0DEVfEfdqewE3KD4OPxY20X1tJGus+dH3W5LrIR
	ndxKP5y+lB2BX9uHuhfF8DzLsjU6xTgmp/KmTPWCTL3Fhp7rd0OAUBjtrNFPYI8oUKmH9Nq5jmHx7
	c6VEXtst2cReOLQTasew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwN-0000000HLRj-0jzu;
	Wed, 04 Mar 2026 14:11:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwJ-0000000HLQ9-3rz0
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:11:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ae56f8776dso21832475ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633463; x=1773238263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=Qxpo2daJ+wwckDJPQvXbxBjMotdHPlhcv7ajaMGW+jY9pE4H9yOt/J3C+mSOd+e/7I
         SOQi9EpSKJyzYkn0BEDNc7RaSxeI9Z364SPq+/SGfWOSkb5m1oAXEtuNE4RaSN/AE/F2
         YyYnd3BHlFqnbPFVYCim8Jc4Z+b1q1QD6SlEQnOPsGNod6hFzhpu1NvKveInI2E7mB/F
         xVsOrvIzDIcYYXUm3n9leuiawUXdBKlvjat+QwFaJiUAqy8im4jgkMs/dfcM3XmgZHP4
         PDMcrKEOMuuweZ8Nz5yOzggS1yNKgpbkCaC0KEv2DbxAAlhpuha5zxPNyouvb7GcNQ8w
         MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633463; x=1773238263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=R+T13gz+ZO5VArD6eg4BTW6OsFbiwkUDOMlhY0sGRNIJmZn3+gbYxwRmwMgvdwyeEC
         t9ROCZNCHHkNdmkOXGCg8bRDVc/SKdBrSsEaUxscVBzbgQlnNQQSWZHlugXxZxRegjm5
         53CaEj3s1oNhLx1RRIUeDHGnWrFnAroJ/OXLfYGCVwe/mf5IetXlwURKEbttm4vwyLQZ
         QbAOHUCiQmddtXanBlC11TQh+/CgbAUXa/nibgiF7YWSzZHPYmUKAwWmlYZxjv6BhJee
         HBHLrvogSmZYUxlzXJGDub27A1YfGIImdKgc4d+IILEBBPH2ccF5aW5/wo7zzOezN9Rl
         mEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqSPTNU+hVYvoxFSdcqGI48nat5H0adGozhTRYVWoABX6h5t40pVqEQEuvfl2H79XADxNh8K7rkj7ZDv3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxex2q5vplRaMywq5bqHI19v3A+QVHKkBI+ucv++wRSgiyFfmQp
	BinsMqwXkyMI/mzSAQgaq25zn3OwaRMRkb3RvRQjKgJ1XOL/0qZybROY
X-Gm-Gg: ATEYQzzYd7ezZEwxsdr2a3IrWhpVe5nTB6C4EQaZETCEYa9v0EaXYOJkpqhrzoBYeTW
	FOGGGYyPh9Xt7gDnLS4SIKr8pbzOV/Rn++g/Aj2Vw4tXmi0gyBUsOgp4dfkCgMRcp+VC34K+S35
	hmeNXG9b2MLk63PgtlPp9NvUWQGzMkQXK4In35p1Ja84uYMfoJhsQcZnD5+Rv+7WD7ZoaICFb0P
	XvvtIEe2E+nZO0MM3Le5wGrDubEcATknMs+VPyNsAAiMQgjJr6CpAYm/xKEQwQVeSDStVvpwDJp
	klkuNdRs4izoS1ddPGlNEbaGIiMauB04uln0Y/gC2QS5q4WoxSwkMEfcB2H7cnP7VOllJZTlmVs
	X/0++Uiz+Sjp7ueH1BZycGEIsFlnE1t5VQnkcHKWujLwLdKDUbp3uqv0uTZ484fRILNshpvj8X4
	nbR3/YyOt2MQFEqvY7OZGKY9hPEVOUxlc=
X-Received: by 2002:a17:90b:510d:b0:359:8c63:8ff2 with SMTP id 98e67ed59e1d1-359a6a4f880mr1548752a91.22.1772633463114;
        Wed, 04 Mar 2026 06:11:03 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:02 -0800 (PST)
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
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 09/18] PCI: intel-gw: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:52 +0530
Message-ID: <20260304140329.7089-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061103_963248_D8E0685C 
X-CRM114-Status: GOOD (  11.25  )
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
 drivers/pci/controller/dwc/pcie-intel-gw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c21906eced61..bc5d96dc12bf 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -442,6 +442,7 @@ static struct platform_driver intel_pcie_driver = {
 		.name = "intel-gw-pcie",
 		.of_match_table = of_intel_pcie_match,
 		.pm = &intel_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(intel_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
