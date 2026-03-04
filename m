Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF89BEF8FE7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2b+nMKS4kM5PiSqGPss4WFGeCKuacSNZfzrSt0Roydw=; b=n7fn/Si1VYok3e
	0epNQL8/KKFoDvKvWVFItLK9cJgY+k0Y4Th1iB4Dc6e1WH+y76Yz75lb8v96YCRQLMS//vXOc5tkR
	yvwCp3tbC7eXlFUyBN5rzS2uzgK7Tgem63+vZUi4DLkH65ZVnRqeZn+8y5Pk6rXKYCQLSH6kRX1xU
	3RIkmNSJKaJDzL9/6dvKu3OEVK+k5mYDHLk4INeIioEeCu4DIMw9Af5ZFxG9mWsA25+LMrZc51Zlg
	cu1JI/SlYI5rfWdxHX5HyZpZYH8rtTT9NwXF7VZOfJ/jRDxvt5NCoJWcePU6AxYw8qy89304vmgA2
	9VZs420xzmJt0pALTbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtD-0000000HKWt-0WIf;
	Wed, 04 Mar 2026 14:07:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtA-0000000HKVh-3DGQ
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:07:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3599019ae92so1774194a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633268; x=1773238068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=Rku4GAgn7qpVK3KgvWGdsbjW6DcdFqn74XuxoKULuT4fL3aw8V8NdPKKmSCuJIjYk8
         w2mF0p4LQcpLcidvH80B/0ec1z8p8IqZjRQFs3PuHEKs6KiSUUR2UJA1NGyDZxNFEL/O
         eNdNy45mBtBVfiarzNh5wHMW6jgagM9UlCJRJpki2AQncyHLnOKkGz5EkAR/OjkB7HmN
         kjynPGuAU9LyzerCu/+cuIheIGomRORjiUFFFTcAkdNbR8F9j8R3Lx+V0/2Z4OmKjpiz
         vLEIynkIRkCeAu48c132sLyE8zzqf4ppj2L387OMp6rI8KizmxIaPu3TxVIqvINkHxsC
         8JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633268; x=1773238068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=nidr3lnlbG1oMAuPEVe3dBC3w1friYZKV2ldukVF3iue5Z0zNYUv+JDiDT6ZIkUR0l
         Mmx8hZRVlHw02D6fiVYMYPhYWJmiAX6IhWRLrJsqRTsTHWdCNjiuD//pciq5Vx3YN0gm
         E8F/PyOcKJguIiuc9G6W+ZiDfNOytZtbEwE3MTGOxwVfbo5Ixb6kWY2RlM5nDtNEwYNm
         bF0UBqz2HMzALY1srJBVFRV4bUIVlftWDB1igB3PWhhb+jylg+CZFAESWCLSrNjB3ecE
         bWiPMQ+xQ2Oz7QHolUOdDPhdlj+exTSPFOmaAqxji189lT24UWsxKami8pIngQ7tGC0u
         miuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnvsxWOjYi3sDrJIpNKNuz5MdFSGHI2pfcSNPZDJAg2dugdyW+Faub7htsW1RoOdn7yDOvoDguZCoEoOCB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3kMojHMj8NnzOxwLeA+kUGux4w+iDM4DYYVcKoNGfa4m40VfV
	D/zncNKgsaG3rrlX5daaHOMfZDwSLBpn+mEuzEILgzkoKAhZd4xjy0es
X-Gm-Gg: ATEYQzx6yXDjg0+gcCjs3dCl3ZHdlYBWzxBY6WrG0VqFrpDsWAyTENmqLJaU8uD3iWV
	y+963fiLwj+lBw/3jTEP6bEjgpB0C4SWdgtOuxQy3fAIoVoFFUUcN1mQ4eyipG6zQubjswlXByB
	e8QGZ44SSODpdUoIkpaDq4/h0Ly95im5JbCvWAzNxwY8uoH58V9akqPkfIraZs8gtlwGYOVwxnw
	KxE4q3UHxViqA1cNf3Ua1VxMv8Y6znQb0awxCE1H3dW+hXryB+CVzUJ0xBzqPdNRS7Iiip08SbC
	VS5/2JVEOYqq0mNauO6YCjV5c4zNHJWX1Pmoj6Ookddh73E8l4zNv5XcSIi2ehoD0SZV6CRcOii
	W5Yv2QjTPblnZL4q84ec+uhpCEji1D+FgrcSsIo/SBNj8fkBt+1ZTybM3q1hu/kmaeOWTWOTxAA
	4wpB286rhYEExlbMtLAH8I
X-Received: by 2002:a17:90b:3f83:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359a6a4a2fbmr1903833a91.21.1772633267856;
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
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
Subject: [RFC v1 05/18] PCI: bt1: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:48 +0530
Message-ID: <20260304140329.7089-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060748_804126_815364BA 
X-CRM114-Status: GOOD (  11.50  )
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
 drivers/pci/controller/dwc/pcie-bt1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
index 1340edc18d12..ef6a3c7fa279 100644
--- a/drivers/pci/controller/dwc/pcie-bt1.c
+++ b/drivers/pci/controller/dwc/pcie-bt1.c
@@ -636,6 +636,7 @@ static struct platform_driver bt1_pcie_driver = {
 	.driver = {
 		.name	= "bt1-pcie",
 		.of_match_table = bt1_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(bt1_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
