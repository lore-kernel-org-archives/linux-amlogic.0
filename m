Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F05EF8FE7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmNBck11CqNXtgNws/QyOyX8bmJa/g9WNjv+qxIPx2w=; b=Ky7NlG518KpEuj
	0OdzNQxqKbzH+qhNBK4qbVYRNIJDw+U1Z8II/DNJ5HVM/aZCIXWfQeTf5N2Ez3BKRKJahxSnr3+3U
	qi0kqqxL3LAPsxnMOzgVrss87CdR4g9FcLb6liOh1xo53RPZwjXFjI0vif9OqmUeaNaNdQsm/RV1l
	TE5gCW03aXwMQai+TrBkQG9G06oCj24DQRFniET7RUdR8XAF0beiwMkiuldVuenJI6f/7kkq73r1M
	IsdNJWklq6T/dQi7at7cWAW16aTkmJdRXkuCn3l5ncMp1Fnx7jn265h5OAJSA5uhZ8LlYSbdDZcOs
	u4DLdtkP0te/ENGcIGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmx9-0000000HLiI-1Km6;
	Wed, 04 Mar 2026 14:11:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmx5-0000000HLgJ-3A0C
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:11:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3599126be32so1790855a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633511; x=1773238311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=NdaVw8oO9/2cSGpDRogqHKc1iaRojaFxJluk7ZXvPxFYrPynjJd0wCq//h+EpGQdqS
         ybgl2+dgszVmH3ThDkWDPyqsgxUniEYYNFFDzsqE/Xw51BeuHDqGQDsbHz/J191Ze+S0
         NBAeZzddszo4l0bm4e5DubokncJ42Gg6qBFzLXiZJGxIAIQf/8XPwLTxR0r9tvx7jdNv
         WoWWMB7I7F2GRcLYdxWsNwnvclut+6WlZAeQXashhqsYqqSrrxIHRcQV2vkbhtVC7Oyw
         GBxo2QothNW/mqByL1gnPAVcPjpFY5cJvT528l9+YQo1Eq07xRMojGSTHnG1viuy9E+p
         z0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633511; x=1773238311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=WwGzj0ikM+RqwTfJB/7S+W+IfUOS32Or5WudLfxsUojvJdiD9e0rJ0rwMhTzYjbHPZ
         IaNSziewTo/33p3LPNra62pdL9vM/MBBE7yARFG3EdfNoUGAlPlUVXPPzMFm6qiyw36Q
         jJwmK2YCG8sy9YBsq1+Po4l4qduHoMGuMLcVkMAMEdPMz81ns/80veoEX4BI0hAm/4qh
         JoLKR9Tc59UAToYEuLeYnnxHbh27TqBuqCAKnx4U2Q/TGcRZIuSG32+dtJ72BKLa7Yce
         SZZnXyMBuP/ZnFLzV+doowTSnc5FQ+NhjgOpYvbiHHYu+6/eHoXDl9k15KZH39TiMAZD
         7MDg==
X-Forwarded-Encrypted: i=1; AJvYcCXHkCpZblYdVPs7DvB5x+RSxejaKVc9iYZUV2vfFsYsncOe1THCggAKA6a2YZU0DGjg1WPhF+3lAVyAEAkQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+97Tc8FY3H3KtqatypohVWb1nK6Ny3ZSj5R+OpZVozWgUixoA
	Bx0jHu/Tn+MKt2h3BTsJNM4sh5bMO7GjkvpAAN/UWcyETzHlXUnOA43x
X-Gm-Gg: ATEYQzyLnll/cM63Sih/NUgRMnCWJciWUBogDRivfRO3LdG9pgNMF/sayccAyH2g3W5
	5RYMu7pELO8Kvv0UNuYFfxnuwAXInIr045RvgGFHEOh34P/Xrj3SaW7iod2LsDFitgHd7nn1Xp+
	ySBakeJj69o5Mi96zlO+L+d5VDVlnd5SclDpbHTaUTLAtO21I7JpzLn00ix8Tcc61eAaPOC7VMr
	9kVKJifjU7dStgI1YOCEsJFv2uS7fo21onnA1YJ8EjK0cDLdeno2Rtvj61sUYyzw3jRTWclp48y
	Hbf60CuAsTszWFjuB6Lt6Q0OpAvkjs8COaJkL+IhTTD8ujs5nbSxpDup3ce+4nRMAg1RQj3OtxV
	fRRbrUKOPeOcgteZ9fVgJIcnycz1fT8ePxqXzwhR/4qFF+TLDdcPLCWd/vzSialA0Elisgl/kD6
	L9Cch5xe/3vo1v4+fjF36pAOpUDAjRUdw=
X-Received: by 2002:a17:90b:4e84:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-359a6a575e7mr2125758a91.26.1772633510992;
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
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
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
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
Subject: [RFC v1 10/18] PCI: keystone: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:53 +0530
Message-ID: <20260304140329.7089-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061151_790678_9D02B27A 
X-CRM114-Status: GOOD (  11.27  )
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
 drivers/pci/controller/dwc/pci-keystone.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..b5c0c690593e 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1351,6 +1351,7 @@ static struct platform_driver ks_pcie_driver = {
 	.driver = {
 		.name	= "keystone-pcie",
 		.of_match_table = ks_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
