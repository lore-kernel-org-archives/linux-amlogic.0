Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C719BC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962E8206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lld+kfEn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e9lrcfFn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962E8206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X4+2ndo3aLhhJW5KE8wMb6RVkHulBLPV0ncEuPSQi2E=; b=Lld+kfEnbM5JD6r7mbbTSAn4j
	EiXhR4Mg0uapjbe3WMOgaBY6rt04DOtsaqfvPHekN50KRxQPxyUr5CeoJTM712IF8U0dXqTbT112D
	hDJ3NahXZFR3Hbheh83tA2GqZDsz/JAe+pujIpIPWK8dwzWig5fhaBDMhTCXl4e7QOwv9DVDJ08Gi
	V+MSnUNKA6popC3xOepiRIiiwpUBcdaMPib/Gq6EAM1PRU2YSVKduxa03SZ+IakCVogZn2AQsVKZP
	6gTQZBFtLpdkR9FaLKY0XSdyemSKbWCeGCzP3nhUjNAsE2xaryzmeMwCHSmPc1CUQdDJ5CUeiDE0v
	Kp+Me8AxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yNn-0003Fo-SP; Fri, 21 Aug 2020 04:10:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yNk-00034Q-TG; Fri, 21 Aug 2020 04:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wCTy6HIJ0siuoHKEt9Jh+dIb5CfTt4PsBCEo/LAgIko=; b=e9lrcfFnjPGDRbGDB5ZNp3RvXf
 zDxGF9Z5T9W0bRtIi8/vI+fvA1hIZye2j5fBqXXelWQ9cPmjdVRDS+lC8NOqs+vrVXvAAwJOlck8A
 CaCqWX7z+KppURhtzTr81FrO9wrdHHD+cB1k5LjdU5P63YkyEIbtiFygZPKKI6i1qnlczmUMRHvr9
 MpdwS7musvkj4ZwRmuOoBCpuimxaxN6GY4bidJwpNhiXlWD9kMzu/8IW8imsnHW9GXmzkzO/Ype5d
 nnfFVg0IowNkXtyE1n5xxZenYYAMJfHcceo2hN6eQMtogjVjXHejgY5jV4J/lz/wrJiukwkMG2RV8
 aB1C+w+w==;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAc-0001Rl-Kf; Fri, 21 Aug 2020 03:56:52 +0000
Received: by mail-io1-f67.google.com with SMTP id t15so485344iob.3;
 Thu, 20 Aug 2020 20:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCTy6HIJ0siuoHKEt9Jh+dIb5CfTt4PsBCEo/LAgIko=;
 b=s9X+SWE7k4e8AEOZ7Z+nCD8iris2HgND9q0yo1n/+7zdQ3V0TyBQ4ogmaeFyksBzTt
 4PGgg/fxqipM9CekuRyQj5eJiZYN91vIG4uWoqZ/35kIQ0zay1ctuhHbnGviQ5c01yPY
 VzgB8DOa+qEa5DhkX8LFJWbw8uaduMX232uzmWhEf3JnJejI+h0YahkMod1UaDQnL4dY
 M7f8XvhWj3+XBgT4pOUfOb8JioAGMkoQAyhC2M74bMm8oj7o63FBoKWhDxOcB8Py++vT
 6NX21uYximB4zDg8311CnnwMdStFUxFNPBJ/DhOlkeZN98TZj1FYfjHuYlKPwl4Axh0o
 LWlA==
X-Gm-Message-State: AOAM532WWEWykbz90uLEIWDAAqH9SWsjE8X+GIJVJB8YSUo9MK4Hk5Yt
 ZPSINH/C+WB/KXvs+0DvXA==
X-Google-Smtp-Source: ABdhPJyVQS4lKmzqeroBIofceYh0j4/zV6pM1lp4Q23N44EPxrVFx8K/P5ZHYh9Xho/IbnSww4WCyw==
X-Received: by 2002:a05:6638:1393:: with SMTP id
 w19mr823225jad.113.1597982209493; 
 Thu, 20 Aug 2020 20:56:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 37/40] PCI: dwc/intel-gw: Move getting PCI_CAP_ID_EXP
 offset to intel_pcie_link_setup()
Date: Thu, 20 Aug 2020 21:54:17 -0600
Message-Id: <20200821035420.380495-38-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045650_847809_B5B39422 
X-CRM114-Status: GOOD (  13.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PCI_CAP_ID_EXP offset is only needed by intel_pcie_link_setup(), so
let's retrieve it there and avoid storing the offset.

Cc: Dilip Kota <eswara.kota@linux.intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 6b102197a1b6..807e1fa1bd6f 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -72,7 +72,6 @@ struct intel_pcie_port {
 	struct clk		*core_clk;
 	struct reset_control	*core_rst;
 	struct phy		*phy;
-	u8			pcie_cap_ofst;
 };
 
 static void pcie_update_bits(void __iomem *base, u32 ofs, u32 mask, u32 val)
@@ -132,7 +131,7 @@ static void intel_pcie_ltssm_disable(struct intel_pcie_port *lpp)
 static void intel_pcie_link_setup(struct intel_pcie_port *lpp)
 {
 	u32 val;
-	u8 offset = lpp->pcie_cap_ofst;
+	u8 offset = dw_pcie_find_capability(&lpp->pci, PCI_CAP_ID_EXP);
 
 	val = pcie_rc_cfg_rd(lpp, offset + PCI_EXP_LNKCAP);
 	lpp->max_width = FIELD_GET(PCI_EXP_LNKCAP_MLW, val);
@@ -328,7 +327,6 @@ static void intel_pcie_turn_off(struct intel_pcie_port *lpp)
 
 static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 {
-	struct device *dev = lpp->pci.dev;
 	int ret;
 
 	intel_pcie_core_rst_assert(lpp);
@@ -346,17 +344,6 @@ static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 		goto clk_err;
 	}
 
-	if (!lpp->pcie_cap_ofst) {
-		ret = dw_pcie_find_capability(&lpp->pci, PCI_CAP_ID_EXP);
-		if (!ret) {
-			ret = -ENXIO;
-			dev_err(dev, "Invalid PCIe capability offset\n");
-			goto app_init_err;
-		}
-
-		lpp->pcie_cap_ofst = ret;
-	}
-
 	intel_pcie_rc_setup(lpp);
 	ret = intel_pcie_app_logic_setup(lpp);
 	if (ret)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
