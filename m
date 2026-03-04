Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA249EF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PnEqZoQOJZyRzdtg+kOsDdL2Xgxc6LaBPydEzxE2cw=; b=B6yu5rhdJ5sgmi
	SVPl0itHhDT9zOPNTvSUkHvZkYDwmJ8SaYo4Iu/6cBwyMnTkDYlVh+RveRNPPdhdooBNKz6dMq4c+
	dSdlkw03OFL5LxD3o+foDOKXKAhxNdi9jiJBsvVREyd0hXEJ/lXHIvjEv1QYTKw2CzU1LepQzH+oC
	dSc2YFFbFCI7ChrpK25pu3IB+16VizxS6tlG2Dw9htbSYy+oeTr5QjMHaZ6wghH5epPw+z8rKb/1S
	S4y20ou9byl8TMLQVyu3G+SrSwLThOIoS7dyPzrOxrn/fKfqlfGvVfQIDdFS9In4kl8hlDSw202lc
	Sh63wx0EpQ0ThBImUu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn2a-0000000HN5G-1BGw;
	Wed, 04 Mar 2026 14:17:32 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn2X-0000000HN4M-3yze
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:17:31 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70378ddaafso4498334a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633849; x=1773238649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=lwsSh4X5E2ZxIPSSwMPEl5oTlPE4fuEHxI5ArimuXkUwaHUCC2zJ4Fc9PluD0TGc7k
         YwueEocjDu2ek/pO+WzJj2LrZYyxTFzaMEmX7DeaNOnmwZBz2j8gXUBWmFX41Mbcr/Ef
         4TLt/YjqYXHl11ehKMTuqcR4pyEoVfN9LSWQCJevDKzHqr33KoltkU2bvdYSs8XHInSS
         R3gN63qB0kvXqfwB9t9jDT51kzDwmqukpw0ScnaaIvgM4YIwH6FqI2eqTGfXcsMGh6un
         XJt4Fk4PxHKpMdqajQjZE3i90jQo0Ga5+XKW1whu2K7V/Y+HDFX2UmejzV/Ge+fQotm0
         tJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633849; x=1773238649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=A7gi5VGHvrRhK/yfw+7EyBU/fN58ZFdt0gWWkMZjlvItJ7LQXB8jLsM+6gYEGMnc7E
         rF9/nU/O1fBulNu7Lz1Ihptq8rb/a/YpHIK8oe4TvQom7XnYjS7V5ss7O7vjrH9/TZdp
         lLE19eITiO22RnY9Rju/cdxcPrj2RIyHKtUSl8g3cXbHVGr83M41l8FzW+RLWiAA30MR
         i1PyBsymwxNVWa1Y1gscuuM7JEsQ9SZ4pB7syizYxcqxzde+bXRe7mEpfrD5bayWLY6e
         JvPh+tvsElMFWGI8k90JNpc5C/QXpMK8EvjFhAtlKQDBxpNagQmmSKIoAvg19Kx2eexK
         3jRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVu8SN4R03Y36t+TtwvxZ8hjZ4UaGrLnAPz3r6KrLMPXtorM3EFMHOoOIpvetOoziypQ5XDQ9RTg1Fo/C5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BmTCI/6xplyLnCJI63KKx2AQToZFEWZjqoLEniA9CpiVHp1Y
	ZYQwPwFZ8hz3u6r27p5frPz8Mdyo8AnOR1vfPhpVfFAKFRS29sT1/CTO
X-Gm-Gg: ATEYQzyS/8qn76hdGY6hTKUs6d2Bjb0EvIfXOXawzB/CtwfApZk2Vpia6i/Mq1gchSB
	UsT4dSa3qYcvoW1dgvjPBh7/xoqARqWcYtlA9yHJFjxPdpQZhBE2raQACswC1g8wZf0Ms2WJhfy
	O2/LPRBsYBpDw06Ge1IR2ZbWtKZCas4PCO6QwwXlM068dtfs/z7DG3rKDD3q6xw25ku1W3qZci9
	v1+FNPbH1nX4uHkGxEgD6s6NdrEoKYm/nQlRGtpQA+0Uy6T0isVO5ArQcAoaQyTdD8caZi7rBi8
	wz3e4hLGV/tOUh1DIU65eOdzLQLASUz5FdVS4nkqhdIELBeyBWKcX5z8cDLBIt72m9fP0K8iR2s
	z9B/Jo0DiciQKM8nsPI3xTsZulrfb17WSzAeMbKHuX2B8806qsh14UPw1/qh6AlR2SNEJYiQ1oM
	5aEJLkHDea8Mai52tGMlgd
X-Received: by 2002:a17:90a:d2ce:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359a6a3bc3cmr1764561a91.20.1772633849089;
        Wed, 04 Mar 2026 06:17:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:28 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 17/18] PCI: uniphier: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:00 +0530
Message-ID: <20260304140329.7089-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061729_982383_C1B61F48 
X-CRM114-Status: GOOD (  11.26  )
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
 drivers/pci/controller/dwc/pcie-uniphier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..53f3bc9f5ba7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -404,6 +404,7 @@ static struct platform_driver uniphier_pcie_driver = {
 	.driver = {
 		.name = "uniphier-pcie",
 		.of_match_table = uniphier_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(uniphier_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
