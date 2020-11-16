Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3764AC6379D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:36:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B31B8206B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfXQ+WIr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1BPqWzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B31B8206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vb8MINYSg359Ey/BXgYthN9zP8mxAfj8NarW/IfwsJE=; b=lfXQ+WIrwBjd1rnF5aIlmRSFFx
	0hEdyIxJOnCUA9g9LosAQKxg/EsdDfZ6JILpMaB3LuJkRethT+Dn+EOclXXi90+lIr5zbv8vMeizt
	Z8rU0aYuP8YzpHJ7aO2gyFGWNu0LRMVrg6T7NqFvnUPOuUAtiqbEhWHLFcVEUXIFevAzDQ2JXlySn
	Tv5JuhQbbLnmDVq3pEyGk8a+OW4KfGlGuTA6TgZGaeUMRrwGVMp+arjDeDoDObLvG1gbDdIdRoLoD
	htB0OoFRTyKlyJAGA54vVPT5EpSgy5/AaCDeXv4/oX7pI9tt/oMynb+bcxg0xUD1Jge8/Vy2gJ7dn
	otI3aQ2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehUZ-00006m-60; Mon, 16 Nov 2020 16:36:35 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehUV-00005c-Vi; Mon, 16 Nov 2020 16:36:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id d12so19332856wrr.13;
 Mon, 16 Nov 2020 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A+FE3R5hcwBY+z65SnAL9G4GLC9xYY2THDCEYGJfiOk=;
 b=J1BPqWzpxluha/Pzix6Tivk6KVAv2wIWkDVgTeSGvnKGOjIK3xHxOa2efF9EVxS6ci
 8s5rTD3Gc65zy5etH8nriLeeDEg4aIHTGiE57MLKhr2l0O3gtG3TMCS3gDBac525nUCU
 R5UymHm096bLiFhIVfGDLDxZ1Q0kaKnCZQo7CORpzfItWldfKr0wqrjagdu57IcRO7d9
 s4QZz+VZ/2CRSbU1JRs5N2QsYiEDcJuxmgjfsYARlNTbALgR1+wjq420fIC5gJlB+bnc
 GoAUdSUJN/m/A67O2Q4nNNtq5y/1kznLVQ0xNhbkOJRhdPN26GaP1DUxtqA4rrgfpFjy
 YH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A+FE3R5hcwBY+z65SnAL9G4GLC9xYY2THDCEYGJfiOk=;
 b=iQhZHTkxDxZPo5luhJoDjvAncHUTd83T3yLEPGuSYb09xvOiXoJK3TCRiB6dBVsnti
 jz+EcqP/uwHhXEtYfXHVlcLhL2hvlgH0R076xLu+jApSfAdqgYaIHZTm2HfT3cFXke9I
 b4ilLOmcQrgszLrgg3ywl5ItDV0xDtq9W5in21b+zcjKjmN+/N31l/8F/oCiA+QpoRL5
 9yYVu+JSKLPj6CFN4r+3hP4B6xGodvlKQjhLe4XTOEGAnEvrPv9oKp5QPIQEe7QOh/dd
 Ft7c1PXs5oUohjW8ObT4BiCmNkB8BsNW74RIUZFMGXan2mgp/9ZS/le8eBhdZ1vcDamH
 G0Yg==
X-Gm-Message-State: AOAM530jrcEYIuiM3WUT4WFeq/U2c3SlPhDnyXgRtecCJTh1SID4ympN
 O7uu2Y1hFZtKsqcNqCGTgBM=
X-Google-Smtp-Source: ABdhPJyQOz4ID7iAss60cqSo99HMjyg8KY37EymsVFnt2YOdJq7ZDNPakBD9WB6RpRPOkuB4GSz0kA==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr19367408wrq.33.1605544589403; 
 Mon, 16 Nov 2020 08:36:29 -0800 (PST)
Received: from localhost.localdomain (host-92-5-241-147.as43234.net.
 [92.5.241.147])
 by smtp.gmail.com with ESMTPSA id h15sm23361628wrw.15.2020.11.16.08.36.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Nov 2020 08:36:28 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] PCI: dwc/meson: Use PTR_ERR_OR_ZERO
Date: Mon, 16 Nov 2020 16:34:18 +0000
Message-Id: <20201116163418.10529-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_113632_086106_429DD4FD 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-safety@lists.elisa.tech,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
doing 'return 0'.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 1913dc2c8fa0..f4261f5aceb1 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -115,10 +115,8 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 		return PTR_ERR(pci->dbi_base);
 
 	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR(mp->cfg_base))
-		return PTR_ERR(mp->cfg_base);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(mp->cfg_base);
 }
 
 static int meson_pcie_power_on(struct meson_pcie *mp)
@@ -208,10 +206,8 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 		return PTR_ERR(res->general_clk);
 
 	res->clk = meson_pcie_probe_clock(dev, "pclk", 0);
-	if (IS_ERR(res->clk))
-		return PTR_ERR(res->clk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(res->clk);
 }
 
 static inline u32 meson_cfg_readl(struct meson_pcie *mp, u32 reg)
-- 
2.11.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
