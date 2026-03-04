Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735CDEF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhkKNDGIED0lPS8oW5ytaNwvuuoZWynT30Yd5Fwf2Ag=; b=eSt0oWa3gQgptQ
	mKx6Z1SnnbkPJ76Cxxsyy/UVHxAO+cudQ25VoslRbXeGVCSbFQNUn+5MmqfoqZ+bMPItjn6/ncLAA
	8AL0uZrlk8gifCCkMCngAPqwozp4Cxv0ymsUJ5lUEtlX1gLOGiUHTXvK91k71Rng1cLFpqS8NVFVo
	yUAnMpQbN5Cif1g6WFNNAq3GAeU64iW6yeHR4I/NyUt10TEpx7Fy6REvHABhJAEAulv4+nmk5zNGm
	Ycww0XUzygIt0Bl2j23/vjcIuIxdJ46mvlueUkMp9vhRbffyhz+K9HIN+h7GR0Hamz3H9Tltkqb+p
	oBFMRLCvcLA+qhNiqPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0G-0000000HMSG-10mR;
	Wed, 04 Mar 2026 14:15:08 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0D-0000000HMRR-3vXb
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:15:07 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2305634a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633705; x=1773238505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=TwWzYdtE4gN8wq67sLAQZLjKZ4AVr0AmOwYBVA1obVF3my+o9no4DbswYwbRaFuLUm
         1EH8lkfObg4W0UusjT86hF78nZcrIgkQWAx2am9wGAhuPZ7IGi0qzelK46Y+407AsmSP
         hjK7zHPDkMJV02pD9cyPRYfUWzjsuJOj4J7XDQyRyAZgvv7QuOSdQ2a+ypxMoGgrGtda
         6L65FoCaqhCZwIkYR0yMj30VGi4sVz+bnYGQ/AvUqK5ePXrc/RWYU7AdPN2EWgrao8e4
         zzPslmROMgRWOscREUClW5z2+sPDJXPn7gRgpWc69c8TedtcU+WN79iCrg5vb1r2atyl
         cpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633705; x=1773238505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=L0UZ7azshxcd1t6a6xEKGwqhm31+f0SPa3aTpn4gG6xyymOnueZjiJImVHZD6YiX2b
         GiYYoQBurxsPVxgjnYm0UWnpvqYCX7c8vSK/PliF6b3XZcf1QYYY/5zQbLBvmfX6vanz
         tjeuDp7Dr92BDV4eg0QQCOiDYUoLU1lLPCK6OV+Oa2Z0r8QNSKpVRZjsxsguG+29HZVh
         +wDII9UYg2ZsJnJSATyF0og6sl1QSI3FyPZSmLL1tlxoYyopqWnyYYJshB20nATqko4L
         VquatfRW3r6oQIGxFFWsHpLDH3ESgftwc1cIpX0kTBkTY3GxTEI1Ychf98FCG3/M4G46
         X3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp0wiNvIG9XQA7nrlQFJ2dkJGy0/ZSkJgkUIxY91xRHx2JZL6VL8VKpSQgOp9M3bsAAJNaAIZ7cDjGDQjv@lists.infradead.org
X-Gm-Message-State: AOJu0YwAoAadc0e5+hgoTh7o/WV1rw8yacdh8mSdbpv807w5tKgwBgiL
	AP1bYCO+3Xj++ZFvOiKkHP4k+OQMJD/HvUuNNYepH7ODK7bQmNSoi+Gc
X-Gm-Gg: ATEYQzxVzMHOLED9QMzPWg6OT+p9DEVNl40fy48XpX1Lu7UPWIWrjLSE8IjCELkVcNd
	3chqwh9mjd17IIpOJUkIDMwcXrdvMS5B7JDarfkcQOtt6GuIZkNhH6qX1TfTjsvSJHDW+VBOUfz
	2lLHKym9qWQghsncZaglf61rPjTuR5Yi2gssWF2z6tXRD0aQONjE03S7zBT4P4sm0kcFDbh9QrG
	bU9SYo83Oiy9K9/WoYNnSrb/bpf7dB3uns4dffCE00C3cIp/Ce5MGZ63yDaMfBdrTu6XLwkU88f
	yOJczyks8G8ITILQUnAwyKvCNxS24RK29skAn5OWq+sEgBYAvnAWnuslBME7rh+ZgChFZ/c1jmg
	Lwr4rnnE3iMeyawLjxvfsYb2EeaYMMGWXeQtAQGqOk5/Seuyc8n5Seqhx8uJxfpXbkPsNzcT94i
	LHHXBsBL86/g5Wt9FOFOMv
X-Received: by 2002:a17:90b:164d:b0:359:964f:491b with SMTP id 98e67ed59e1d1-359a69c8cb6mr1870621a91.9.1772633704630;
        Wed, 04 Mar 2026 06:15:04 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:03 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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
Subject: [RFC v1 14/18] PCI: meson: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:57 +0530
Message-ID: <20260304140329.7089-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061505_979958_F4698F6C 
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
 drivers/pci/controller/dwc/pci-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..280146f7b783 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -467,6 +467,7 @@ static struct platform_driver meson_pcie_driver = {
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
