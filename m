Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCBEF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rukLBx98tMLqGUeON6QdrFqj5jIdqztHh8u2fr3VQY=; b=TXLXhA8FRgYr7N
	XLPnU8bQ2H7u7Q11jOUhPAoP/I+t/5WArrzVdHHEeWyQlZr2jk4pK/G4LZwPQoClF7hGStFDMS5dN
	/TGH+HYH6xJAhxNRYDB+O5Clo3ZsogFbl1jHkUj/45Z9pTRVbYaiVqxXgsrxQkdLW4ggoyHoDGlnT
	nKeqdQy0V1JN+yyj6FaSItIr9SnZdzgDihmvx3/3NiZQ6Wfai+jUWDcw9G0efPibjE0O9GgWlihTR
	XPyhR0Bz4Xo+uZWz8cka5ur8yhjPYv4maYeosoISo5RzeHuN7+UsOAfIL07joY/GTinZX+Lr+XeHn
	bppLnJ4HizWZpoVa14bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1r-0000000HMt4-2fWK;
	Wed, 04 Mar 2026 14:16:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1p-0000000HMsJ-3jxc
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=; b=K0yPx6W7ehEnTv8Q5ipPRTyPU7
	uUBiwAm2VRZt9uy3QXueJOIXwVH5AYhXDRHLfQemqS0o38qmvP9E/agyxFws4JyyHVlk6uDhkjEEd
	61RAMUzKg6b6mYZff6A5+EQefyKN/lsd5Xr9RR7g1jxqOPFstj9FlK/LDccgYYFuAcAqMunJhwLbi
	78JkcXAAo+eALkjzUojqNb037tOkkjumkmqFpPWtbXwfBV2+KaJ1uPAaWIJJnJ4qYjwVcMTsdyIXx
	jKs3NU2OCsKJigqu/9AYi+PYeFwfYhkDQ+2zYTyv505gnGbRew/jz3QuNB50qKr1tNnGWp3g088jG
	s6qMMYOw==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1n-00000004jlB-0GHY
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:16:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3598e60a735so1531475a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633801; x=1773238601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=Yc/ONNVhmoXk+nKvkfPO1oNuKB+QZOgCvznjOKZTLbI2YO9QjRMXtd0D2Mmybshg57
         jQbXMGY5heYD5jWZnjpkujKOaD6Ezw8Bz3mI4fSCHe6eWgi7ATqyylnVUw5B56OzXddu
         JgKg93kalIgWNKEDz5ILdM6JVeSoBQDbDUc7yLrKkWs7w7c0Rrq+sRsz0oQop6wyXM0d
         JqLb0wKglTzYVGbitJsLW38HwVrMpe5Aggcwtc+ZgYW26wcYiyswVINrmwUzqJ++1Frg
         rO+MeomvZ+KEu+Fane/9H9mD+V0DpLp6RA1Ocz6k8XEPxZN1CRR96XBd4u5pzYibvcEh
         2mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633801; x=1773238601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=sQ/k9y1FhGWlRSjtBTecYiVuz7Vy7OT7HcPFlWE9ZttsIRJHQRafmT0veRBaTcUNey
         uKM61SB04YhoLENkb7hhqgT71x/N/jxeq12QEKnaHtI5RnR8ERWeB/uNd9aZSL08rqWB
         vrPXIHHi5bWEEWboRE0AbPg68wR1Yfe9vZBia6OSQWARSeZ5I1igaefoI3azTgoXOqec
         +RJz7q5mnM+Qw8lFzOBFkC2hbrMA7HuocPNTB/37I4rqzaRjhy916F7fH5Hcw+uTItqJ
         AsZbDL1TJM0YWLg1O52iklUJoPNc82ysvlK8JfcFUXkB99+6s5pqV9d6uFXkhCTuYakn
         Kkyw==
X-Forwarded-Encrypted: i=1; AJvYcCU5vZ/ziKpaOI9KP1is+b41ZYmqkR06XsXExPV3DoAy4rOlsgjsvdfcSQE7AWt46roCrfG3mhQgs+rt8+NW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfqn417mIFeFQPbBu8YeNTlD9EM2Rw/I5HcnNYlW96boq934E6
	Hvdcke/0TgoXmeTutkxHA9AdzUBECm4D36jknf1ybb22rNsPmnGcwO8q
X-Gm-Gg: ATEYQzzx+Izz1End9zmISyX8Aii3q96e+Dpu8i5nOaz7S1kxWgkY4Qx6YvDZIv37/GR
	hI74TdnDaZGgj4WNozrRfXUsEzPaPh0yYspZXhrNNLzN+tU+9+jI90baXoGRPzGejZzyd4xkqr0
	fw3xO2CszfceI9keYpa1S0ihuih3ZU6zPXAo0MHwfW2THPD0kccbUNuJ0CC6sd4neWaILxUdok0
	+OGuBkD9aSaxNHx/QTGP7hPfieO44j5m0QDv+IBhSqTjsGLPCIpLnGFPJGVFkT6cJewXdF6GZvp
	7HXRqJlL4RTXH9yi9oUop9GtsUMclhaHBYvlQXWkdu1HM2BBI+ynBJFc2b5kkliraiYVO3HWSLB
	FvvmYVkZbedFbac3UQBmEajLyBXy5ZMk3/mL7U+xlGsrMEVR/Q1xtScRDpWvMN1GTaKx+hD+N/0
	DUOuUnEhnjFormcDH4voS5
X-Received: by 2002:a17:90b:1d4e:b0:359:8f84:ad8a with SMTP id 98e67ed59e1d1-359a6a88709mr2213203a91.33.1772633800980;
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
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
Subject: [RFC v1 16/18] PCI: tegra194: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:59 +0530
Message-ID: <20260304140329.7089-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141643_256444_EB9CC724 
X-CRM114-Status: GOOD (  11.12  )
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
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..7381d0019d24 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2493,6 +2493,7 @@ static struct platform_driver tegra_pcie_dw_driver = {
 		.name	= "tegra194-pcie",
 		.pm = &tegra_pcie_dw_pm_ops,
 		.of_match_table = tegra_pcie_dw_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(tegra_pcie_dw_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
