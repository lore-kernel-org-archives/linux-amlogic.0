Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5441EF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLTdjj1VmBtTHjc4KR1NPUExkyNXFnLNoBbfgbfx1Pc=; b=xpMfNBJDGMFx47
	HD2dMa06YnnyrHF21w0c7fYVR0MZE5ykqo+9XdWhfC0D7eedE0bvoLBOh974piJOI3pELEI3DNSdd
	+T/CmTDOSh4/MjfW1l7vloqz2BaCXmqnzjTqbjmkYHC9byo906IJky9b25hZcgqa/cImthxYreUn1
	7Nd6MQNPUYDYjp0mwe2gpGIGzVRkm97z6l+NradLhJg9E+SPJPx7sJ211BzBey4b0elYvNtKhx5Qo
	epz6DJ5VMdT2YQjKOSJdHTXsbTxZo7L4N5Dm7dVNggMtwWmq0ynuh/f2jtkyPr+AKL3g5WRmbKjWu
	xbue7Gib/zrtRUR6fBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmsQ-0000000HKGP-3djC;
	Wed, 04 Mar 2026 14:07:02 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmsO-0000000HKEK-0Gz4
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:07:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3597fea200dso2808158a91.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633219; x=1773238019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=Hzo1/OiKVnNIdXK57lG8MP5/VRBDE5DBy7pQ7W7cyNcjGGlU2sUspPg6oIOu9EYAvB
         9Z2Dc0vyHY6fon/aEGvqac9fG9Hhz2IRGGiCJQxiSiMW1Ggd6i9KGaQSXTCWcq7rjtvX
         3EjHpRXX/Xby33hq+PW2h25s2yAlYqMLxiGyaDWUXoBX0f+t7T9CsPdjaPKPCyrEh5LZ
         zrP4F5S/LuokEc2QtyGgUN5/E5+pKErc4lEgBxj37wxJy6iBWw+br6OSV6RBiohOVJHi
         titx7k6OQXyXExgvwng4D+dpxP20sYcGXVhyx1vK4fQ/NFsvE+UXg6ns7lUGgkXeMVfj
         0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633219; x=1773238019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=GelEDNGA4C6Hs+lnL1bX9GLLv1cj/vt4Rf18/k1srnWL/0R0xkHUTbFEmaAafx8FJS
         Ll7s2jMSFh5j7Ugwlenfgg6Bg+ocs2cKMQq8dJPdipyBznmPa1ZcZh4jODGd2z6Z/9+a
         VbjXXNy8gOwYscDUUHzUfZLv3BzVQzMH+6DmSCSSKKtPKEzBvBBqnjLV1KQU5r3ToPs/
         yOqUurvJGDgbfp4zfMQs4Z7Tt3lA2eXIPGz2LO+Z0n7wYlThe7rSWGm/Elfkq8gPI5L+
         d4ujcwucMudVj25A6mvCyQPJdU/t1f4Y3qb+c7zZ/Gt9an3GGvIog7fFTMWsBFgC2MyJ
         8+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKUcYYpOP3qQgDC1JFWgeoWQaX5RcLmfm7ineZF6G/rXSgWix7XiHXDWiBUZqpISgL65qRyCTISyRHZj/1@lists.infradead.org
X-Gm-Message-State: AOJu0YylMCRyyH3evVL7JW2HlAb+W40XWBRX/6CFUonhEY4yofayV2Id
	l/yyISVIUzj5XjPgUYyPaqvNP0cdhfF6WuxZoZspUTNi0S35mZit3NSG
X-Gm-Gg: ATEYQzxsMLeQgp1R/41btNVGwE8/sKfHest4v0pxl87MFiFh7j9M7zcbao3wtwbU0ll
	nQZ9FeskfpUf0orwyprCMOg9kxG/GwLj1Csd0rek+by3V+MdJRpLkF9LzGi7gUV4yrOJNy1Lz39
	bQAfwhnpEQzLucZqTZ1YFWlhku7Zlxghif0oYOH0lCttG6ovsCEg/ITJOucOU1nV/70e3O/e56i
	iOvbc7J40zVaVb/ypBUgphHoT8RYj4u7jsmqc0IGpx5hpRwEDFJ+YNVnbflFDGhftDmQTgPxtj3
	HOEtohM72iAXmssr+DjhpRs79MGUcj1NpOI3gf6Crvdw1plTS7nX3vmED7caI6MbnK5Ip5WBIaa
	o/ygNUkGPoGDT75VsApV0r59f/rJ4Irn26wdLa1s2J6aKV+O1PFi02t0AQE8/S05fvoCAMug06l
	Y1IgYO2NVPXqM0YsVv/C+W
X-Received: by 2002:a17:90b:5547:b0:359:7c55:c166 with SMTP id 98e67ed59e1d1-359a69a94e9mr1892448a91.7.1772633219172;
        Wed, 04 Mar 2026 06:06:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:58 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 04/18] PCI: artpec6: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:47 +0530
Message-ID: <20260304140329.7089-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060700_109529_CD7C695B 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/pci/controller/dwc/pcie-artpec6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..d8b827926b85 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -520,6 +520,7 @@ static struct platform_driver artpec6_pcie_driver = {
 		.name	= "artpec6-pcie",
 		.of_match_table = artpec6_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(artpec6_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
