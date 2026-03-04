Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859B3EF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXzX0F+kG1VVIMzbhc2oZkh5T3SJHTOgPb+jzuf7dQU=; b=ZAviqF3Z8LBYE6
	YbGKSbdmr7osDbIGaOYjXgv6GXh0pG/ScNACwlgJ/Dw5PXXIa98yWfPYvzGsHnEdUY1n33N/pTpN9
	jP3GNyGQrVTNHwCJFRxUxH3OhCNfGMk/Ik5FO57jzhSbj0m4N6J2OTtLDcNUqL1j7f3WZTf1uZ6JJ
	S4t6Glcp3C95o0N4ipQHDIb0g1twUBhz9qsIQ521lTq68pMKeT4/h1AHyE93QqbPcv/dmOavGondd
	DNKOTqoApImrBxOfc2+QoPQXB66mDqqVqinTKlPsw3X6x5iXD8HGq3boIbF+QNqk0UXBip23+k37S
	SFvh3ihIjJREyEmYWazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrf-0000000HJmp-13fc;
	Wed, 04 Mar 2026 14:06:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrc-0000000HJim-0Lvz
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:06:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4144435a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633171; x=1773237971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=T2BftpHl1DnMezEWSGDUSis4u2l6seoLgNGPk53VENugZXlbTRUdrF1OntXoRGAapZ
         DfNcp0I5Pf5Ewp+/RPJaMRO5yYlDZllP6KMDoGTMMKqs9Va5lboHXg54nQjMF6Nx3Wls
         bNrOh3S1jDeWYrNwpuRL0HSfC/MwsQM9XNyfyOiHuOTRB/kv7ZXkWvfCFABiswGiws4K
         iXM9Twl3GpWBUwQjMhb/Xm771GQa1p+0m6FGIcFJrEabe9vrMuHV+8Yh7MWdwO+dwSFt
         Igld5JIG65+h+kX12EDhgDPQTjdVxJG2Owt5vQc45RsMnlu6FdlZkhHPKSG7YH1DW9Qw
         4SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633171; x=1773237971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=SM/xpJ1SuncB5cnR7cZxvjDcXLxNdA1MgH7HJoliOl2fgUqsaKBvhhBu5kb7jgr4/J
         ytp0CkSHz8SkIVrBjH+Z+E1sjfzE7KJcqxSO06S0OY4BSc1vWY60QG19lYKAxaWyGPom
         CMU/pm8Y78T1TmGlnqryugyPNacJPcKBV1s+J5R3cunFlt4cHKaPJtl6q1E6IBvz0OQH
         AFF4J3WluZ2tnDMG+k3HDD6oVd0re4FjAg8erDCnaOyovxl9eJUhUJZUf75Og7gAFqpD
         y0gg52HGf6wtFu1AQ/6pVc5/2qaIMD5oICw6nSkQuXnbcBLMFjJsVuFL7WsnGSsJoBL/
         zhpA==
X-Forwarded-Encrypted: i=1; AJvYcCXO4Vun2l1jGtt1KLpbfRDjMTlXbptc11LR2SCpxtzLT4C72SRxLtW5/hvw9l6nBwhaLLkplIAmPhgGlsV1@lists.infradead.org
X-Gm-Message-State: AOJu0YwYoENLdGoOggihD4ZA8N2vIwq26NUknMuU5wq2Vbr7jcOtRAXu
	txsT6jg1b42g6tKs74KdBY2OMEwkFicRB03gK5U1LF1N0k3yZI1SjOg6
X-Gm-Gg: ATEYQzw0b37/7cHlICBbdKgMyrp6hl6Tr4e0o3yvNys20af940pyaSojcIhIgdqS532
	ucHlTRoxDFzNT3FslX64mP3JH7SnWJnGRxpb4AKaSBy1jhFx8XKoNKDDtaHUGGHFC+6jVEorz30
	uKRQO8sWBxI7CQfMF1YVt5VCk34cPay4cfsD6/hEAApXAH8aqJk7DH92SVGKiP76qVj75mQsyk3
	gu+zA+eNgaTq7oiQNp5F6f3xtEw5n3Zs9Mc/1CqRm4UCcxkNqnaPBiwy4u0Ln6T2vKNpegbV5VU
	aF18b6qmcUtJbhMyX46mNGS2lLerDHhcbcy9eCCQyYhqTMuzLep8OtoBS8dY9HddFdEPk/FCzJ3
	4YgW8bxemM3fe8v7UpDXmQcVAiwo3tg5myWzguNhaj6QqrqbugMqw9PGeY1rsiIvVgV1uvhzEIk
	jhh4Rq6PSii0V2xc2W3xrk6a8nZmKWvgU=
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id 98e67ed59e1d1-359a6a66a94mr2076415a91.23.1772633171145;
        Wed, 04 Mar 2026 06:06:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:09 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 03/18] PCI: armada8x: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:46 +0530
Message-ID: <20260304140329.7089-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060612_165688_D2890B69 
X-CRM114-Status: GOOD (  11.17  )
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
 drivers/pci/controller/dwc/pcie-armada8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index c2650fd0d458..ffb5554a2a8d 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -344,6 +344,7 @@ static struct platform_driver armada8k_pcie_driver = {
 		.name	= "armada8k-pcie",
 		.of_match_table = armada8k_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(armada8k_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
