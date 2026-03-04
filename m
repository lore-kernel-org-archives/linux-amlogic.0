Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDE7EF8FED
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++s7eirAtlRuAFD3x/nIH4NyoVRz2kPvnTYTNr9Va3Y=; b=4w27otExpaDETi
	M04yo5p/+pmfJp0bakeF8wdQoaSMpZpLu2nH4FiYlM7Qr9/pBu4Sg0l/HvGj4/nKxUzF6UhPzl8Lp
	pm1qdpjbaG3sOP9EPmRALQ78wstbGfXFWXUUm8/VTcI60AKJbmXvQN4UenQXkkaYjME1tWYieb106
	RgM8GK5whKQco81XQi4/i7EkzsDYcJ4ygwU9nb8STQmgFLVLaE6pVH0adVZtm6IVMrVp0iNCkaIvg
	S5+cIeGfFBNjzixNJHi8tDxFxK/y4GYJaPTHwLumaAt9hCAlQCPwhTsKZAB/zCUqv+EoSELfeprFT
	+qQ0J3xgnEQzxxaS4ZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqs-0000000HJ4y-2ouY;
	Wed, 04 Mar 2026 14:05:26 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqp-0000000HJ01-0vVc
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c70b69ced09so1872861a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633122; x=1773237922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=F7Ajhuppdzq7vo1mAoylWy1ii2LazoDCyQ4atAq1mkhgPxH+suxl7w8dgDqJV0af/U
         u3PMLwsdev2dvH+2+327/NE909v46epYjQBqSn3jic+//AmEOsHc/ALGomTYS+eTABjq
         ugbtY3kVCLS9+iEp5AiG7HOS+Mc126IQaR5NKd5ctht3E1bP4S1JMYkc9YGf08VZuM9B
         HJL2afDnxaIsk6Uo3E6u581SXipL6SX39hiMG9hAj87nFmoHja/nx8yvikjBpc+IoBRn
         Eh5i40LU0h6ooSregpEbKInqXEdLW8nOyp4d0izBR6CWSMSrAw50tijOXiwYjgM+2qrt
         2uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633122; x=1773237922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=kFACbgQbcE/Gy5BN2Z0AByG/uf9vbC4/tbrE8FbkJTpm0ox5/mTTIJb209yD3ijCx1
         nSEn5aa6kd6bDqrAgnTOkGgNMoLwwLWVqu7tQ3nNUzNA4HSRcy3oY664a/eyvnNv4Jnp
         TP76T7UugC3Dacz8KRZIJi74AQuMjY1Jw+9d0owsCiTw+KZL75amFHMshGOJ4+TaMffD
         KVxwnHRd3o6XicoHSe8avH6cB/b6kgl/FmcftflllsxwNq3PIDchOyEhUBWLqtoDDJWy
         sCUPYVlyMx321RI3QqzhgGPhXy9HYQvhJtc7Nr02lIocGL+Alx9qFTE+xC3nTgSudiZ4
         T/vA==
X-Forwarded-Encrypted: i=1; AJvYcCWXImtcAvNM8LdrlZOcuvfn9Og7SVFexidFb7FFkX56VUhMijkCY7BQQ+XORKfesBazVHpoA1ebvB8EDu5p@lists.infradead.org
X-Gm-Message-State: AOJu0YzD5oztJ2JVzupOiUG7pjsSZ/WjC6Q2MqD+5tSSEnoSVyhoa8pM
	mYhKpKOIIICyajhBuOoczsiBDOLWpbhqVvdi2nk04QWSBV3751KssNMf
X-Gm-Gg: ATEYQzz01XQuU6wJJUkvX3lbddSFLnYLt9Lhvls1U3X3ktnc4ATFAVB+kePxkZIbKcA
	Yd8D0dpv409dZQlrkY/jy6JFagC1H4cpQ36nwy747XlU6Ipeu1+N7MIAs9DNfYVtqcL19pzUhmD
	fVhOWDLx4VzbxRhd3LvyHxOw0z1o2yjnwacGnLbKpdv0TRPtBO1WoQhX/fntAjTeVpD7Y3+THk/
	SSWq4RaFdJ2TYFpkPPS+u1lm6knK9dOWR2SfvRgdh8hEMbsWbVUGPQGUa6Rf7iy54HQnh00IGjD
	/v4IfbwRUw8dzNbz0BpM7lPv3DbLgFdIM/0NsCMizevLv9Wnu+5NBWsvrI9fYvI9OY+Xdg7CWwA
	dZ5dYu86lDxKONDhoEpkYAQCBZ5eAAxwhgu6jCfWo8hW2vEN6gP65cYeGz7CSoDhePFr9tfFBR9
	yYdOyEhPDE/3WqaRre5RmtV1gRFaU3jJY=
X-Received: by 2002:a17:90a:d405:b0:359:8f4b:6ed5 with SMTP id 98e67ed59e1d1-359a69d424cmr1769092a91.15.1772633122198;
        Wed, 04 Mar 2026 06:05:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:21 -0800 (PST)
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
Subject: [RFC v1 02/18] PCI: amd-mdb: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:45 +0530
Message-ID: <20260304140329.7089-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060523_273179_771E9B0C 
X-CRM114-Status: GOOD (  11.28  )
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
 drivers/pci/controller/dwc/pcie-amd-mdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-amd-mdb.c b/drivers/pci/controller/dwc/pcie-amd-mdb.c
index 3c6e837465bb..3da5ceac9b6a 100644
--- a/drivers/pci/controller/dwc/pcie-amd-mdb.c
+++ b/drivers/pci/controller/dwc/pcie-amd-mdb.c
@@ -519,6 +519,7 @@ static struct platform_driver amd_mdb_pcie_driver = {
 		.name	= "amd-mdb-pcie",
 		.of_match_table = amd_mdb_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = amd_mdb_pcie_probe,
 };
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
