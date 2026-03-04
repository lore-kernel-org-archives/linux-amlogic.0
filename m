Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCE5EF8FEB
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR+jd/YYsn2YMvYWGg8iWA/OJW206Vpj8aMz0NE/AJk=; b=KJYIH9At12p2tp
	kxNvfHRo/qBZA0A6uP9flHtS9AXgvorUgHlFRJ08GxPDctsA3Xr062grqSwJe2i8lQu+M4nNPhI6c
	GXfF1r5ucuNH7sAB6zPxN6RGe71A7uY+ZEeKLAmFwy41QXicEVnpWYddaiGs61PAtpIcXWcajcCLs
	yVYG9GzmQgqPyAXQIlLNSYFHf7hJhFWrfGF0YXNrBcuvgGT8quwNUC1MQ4JtpY6JAbbPAX2MBnmYk
	LZyl4HwoNBolxke64X+imy7WzGvV2hrepbqJI5Zibvx7TQx2CBoqq5BealvbE8o8iMoLM34UPwMRK
	hWnh0j0pdN2NU8W6POVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmu1-0000000HKnB-1NEp;
	Wed, 04 Mar 2026 14:08:41 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmty-0000000HKkt-0Kl4
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:08:40 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c70ece855e2so2815941a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633317; x=1773238117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=MxbW9MrR8xfbt4ojkJONRG2Euov6GMteiNUZaC98H0LufM6Z5dtpYaLjGd9kt3x2PW
         5WqD/CTpxxuE1c/71wXYGbcVKzgJcOVk1QU+gt2qT2kHVEMe66WbqKOwwx/ouMYmp5bd
         3BoQ9mHeTD/x9COU27nEYmT+2tNOYC+drIdXY0Ur5+7jsRiDmFnnV6g9Y16eqrqvO11s
         qKCDAc4gSH1ug1JUJmiF4qCVoppzWgTccbX8ksxWgRCyKk1Kfg12GL+PtXA6aAJj9CSV
         dXu3h4BSRuelQdanEsM6eDjKxlX09phfM1RLDrcWotWkfcHArQ1wVS+4GVP+NDOzc8ib
         IJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633317; x=1773238117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=HjkWEmkRdC7ZDRGobtP7CrNvLn/uL60wW+4fKQ4E4G9KuOUUlnInI5ZsU0fP52gyvU
         51tHC3qHRPCz8LSJXB8T1FpSrkDe1WeyF0MW+mY3K0g+xMiPTRIxih6xWfbZSrU6xCmy
         LvNqbVFJC5UDfydJd3TPzL8Haj/VVcJWYvvkji+JtDUdDIMeRrRrdJoMd/DlkulmkNYf
         yvfEg/qw35Wf2J8F2B71PY/IbFhv6Fw+sAHeWgeyQmePRB6QpxOxTUgBSIRFKs6dxOnn
         OavBeC/xKXgAm6mzz9DZyVFP7MypCAt8U8a+0BOXOQbFRpTf6BtY+xg55nNwrbEUAdre
         M8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1XwZh2VEAdCuyqNVdecpiVXYtDE67jCSNIgYZDHByNGS1FbeNQb55Zb9gLHp+j2wnTgLOTaZ00fpWPmbV@lists.infradead.org
X-Gm-Message-State: AOJu0YyUefxeCD45JtIc06k1Csj0IvxQEpGiyk2Gni0Ueynt7a+MZuX6
	Y/t5/GvS9jxTkQQm/4UGfyfp0rd68f2SIk0EzTo940FctXrT3uWfZZ80
X-Gm-Gg: ATEYQzzcXSl6JxDmOoC7buDWjRqKUT41D1fvdfcMsK+OvzxrmEkkFBic0AsbQXKCVR4
	JekjRx+DI80NOt8bfI6MXkE/ww0IuxkfojQFOz3vDut7HPbcTa8N6b3NJrz2onaoaaYL5PCw/Kx
	zHfkhqEB+bN+COmh/Ll+FHy+OCdSHHd+ewTjVuZq/A+UVNQlGvW2DnkTW3AyPZyrq3jj4wOr9gM
	MjJHrQLkBTGPF2IJ02xdTwbtDw1wOPDIfhL8N8absW9ss/t+Z1UB9dyd/FJxjkMBzNfNVJUXD2q
	9yie2X0o0nvRcWSSQVANUZ6gTRMuSIgZ4z6ncVqPsRM1G5LtpsaWdobC1wIopfuB8tG6O//LVi9
	sg5fv8J79giAVK9M7pDVz0Fek3I6N2fWdXZXV7OtBplkZzqcgU4aWcqovU0NLxBmrP8Ju3OTkqb
	ZrGcCoz7GbDdAL0TV2iad2
X-Received: by 2002:a17:90b:2d8f:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-359a6d8521amr1962255a91.9.1772633317107;
        Wed, 04 Mar 2026 06:08:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:08:35 -0800 (PST)
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
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [RFC v1 06/18] PCI: dra7xx: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:49 +0530
Message-ID: <20260304140329.7089-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060838_129336_4B92A98E 
X-CRM114-Status: GOOD (  10.91  )
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
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..be470d54b2ee 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -951,6 +951,7 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.of_match_table = of_dra7xx_pcie_match,
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.shutdown = dra7xx_pcie_shutdown,
 };
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
