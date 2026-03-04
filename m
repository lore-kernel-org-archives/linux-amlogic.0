Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9F2EF8FE7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgj00j80yrmcdK12LZgZoiwjlpIA4nseeiEirVeXhsA=; b=1TN2bc/U07WQCd
	Q800FRy9YyFXr2gAcluFnvYrqTjxq2UTThHRFIoguYswCq6cgFF/eP1NG2VhVGNqbn1L4DOGR6CHc
	t+4KG3qIH+HRD4PhZ6S8lO8uZnO/D12pLE7FTIOqWN4JS9WNvGuG6aRyFlQHpzDm45EYYbtsho+NW
	S6jBQiscLeINGnJgfoUND96i0reW1R6/VkxNuOlvnp/XCKjSuOD9OvrFZwqeO1EkRhFrChPv+6Tl4
	Br8TG7evi7NzX+NCK44Cb845ZXMzrSz9hs6PxArSlWK4RYsd7WeG4ELJaiQ7wef9vUGXN3ojbTqka
	HTLp/iEM0AgnF50ZZE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmxu-0000000HLtq-3lqX;
	Wed, 04 Mar 2026 14:12:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmxs-0000000HLsx-0veN
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:12:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso2540877a91.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633559; x=1773238359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=hrqIgbVZ6dliQkNKm648/XbbgBvVPdkvuzuGMzOJ9EHZcYRYxFvZqqkhqCpD0XJN0H
         Z4CEYtxfIeYxw7P+A1m73mzSIRLGqrg1V6KYRs0QtW2jbFTbFK8fCj4dxQE8MaauQAKX
         0XA7UwUdnqhdckTPnP9kqRj6OsjGMf2ahENLiNV/fyU5BVq52DIDu6EnR6Ftkt+0vLeO
         u4Jx5fqlbrhy4Sxj2FrnoJwCIEtwiYV9O+ylHszt/Fxz0Y0z1SvKqcUTu4hqSvt0BK/e
         OByrONEQpfiX+066Ckwwp2a5njFlW4F4fWEYqZWzCa/OmUeMVtWfpFTuHU2xfLPbfemF
         9Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633559; x=1773238359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=w0u+7YEMxQTIyEosz0nI96YhIaQWjuEeN4k2jbOXbJzgi6jp1noqNgJjSlBl2y5+n0
         wWe27iPbijJLIm0gZfyhHAfkWeKQwnyDLTQvw1Q+SAWe9vylKe7uYSePeBkAEuhhzYSw
         mTr++pPNsouRL1VvBnKb91WJih2JFgQDIw402wSzBcgidz7xjl2S1yBnNgCztohEQONi
         8Tkm96qWz1LYAesiBfMdv0zuDb0nm0m+UnQWFk/oqevw9JYR6zRPMTVIlkeBHZoWWIIs
         4xKDzLZRHrUjmDHpN8vH+VSk9sM4n0Tq0I/0w0y4qbT1bcK9SeN7W6lOvuI6LC6i7Gor
         81ww==
X-Forwarded-Encrypted: i=1; AJvYcCWlkDi36ub0XkH/mrCMulzRZDo0QbfKXN8pQwf3wZrS5YQn54aOFEHm0n9biGXh+mgj626L6UzIjprxpPMm@lists.infradead.org
X-Gm-Message-State: AOJu0YySGv2qWva9UUARYcfJdo1rxPjK5BnEVSMzLorBYDVbCcg+LBwz
	zRj7I5AHuKgk4jNld+UrQJBTH4hcFN9HlLUSKuET3rIYMr8KJ+hiRMPD
X-Gm-Gg: ATEYQzzaDLVTxXmDO8p2rWs10lwGNt76B4QKvAulkhQJ4Bpic1OWrfN1Mfw/uQyRg9A
	E4WdQfjgb8dTnKKsScJGMQAR+HRqODg4OMGwN0Sn4KCw3Tzv1C07aj3j4TEVk24NjlYPiIqUUdx
	PKgQMcSTUYoqPBFk8wdGTLySSK7T+pnlh3sqeld98FPNq2SdWSYJE5RU4Fb4AFM4yui4dUobBNA
	Msg685d5ljO8uuNo5lpY9UiUZ9Npmp7C1GEocr0Q2zCnE/WG1JbJCOXbk1V/uXuU/vJtJGUkHdY
	mWDagkjEDPHnw7THuCuHxWQN5WQZW21myiU9Sf8YKvzS4WSKCz/Xbw+xiVCJyi2NrCRGa+esYat
	Qh5u1oZS2m1eM09ycBcR8lfNQGv94arRq0KAfjD981Xv5/8ijbF2OqCcGvzFHi+Iid3VJzwn3iW
	kidtMK4UA+V4v+JmSdnVCF
X-Received: by 2002:a17:90b:3c46:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-359a69c774cmr2111843a91.10.1772633559439;
        Wed, 04 Mar 2026 06:12:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:12:38 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 11/18] PCI: keembay: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:54 +0530
Message-ID: <20260304140329.7089-12-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061240_259973_B025DF47 
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-keembay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..a82d69b37e4d 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -478,6 +478,7 @@ static struct platform_driver keembay_pcie_driver = {
 		.name = "keembay-pcie",
 		.of_match_table = keembay_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe  = keembay_pcie_probe,
 };
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
