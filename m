Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A908C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC80A20855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8xG07jI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wj5w7P2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC80A20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LbRdiePe1usUOIOHrXAFCiePVTA/gw4a3Ud5bt4n3i4=; b=V8xG07jIGBoPebMWxKHS5Q9UN
	V06l5teJOtvLrq/JweMk1ITFp0/SzHMe4KwbUuwwRawOuI/iRfnFzHukabav9S+V/Hnk//T7YC+ou
	WOQx8zQuA1OvE1PEY0m2KsgX+7ygnpnZRvJ5MNUsJ7L1cKR3qUO8ZD5MNTO3axs5yYXqdwWyO73lj
	EILhC9o2FusdrDobZiJR7r5y5iTzMCVHauq9qxuV+A22HZRrdtFgZnKZv0b0wNPPQ7HPC+8TWH8WO
	m1Z/381hdUhkIpJxNJxRMxVVwF26mQmbc8N8/FySAHhjh+/wYxLH4VGNct8zZp4eiJJo/z8cVoigx
	p8QediRkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yRg-0005NJ-Qn; Fri, 21 Aug 2020 04:14:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOL-00034Q-5Z; Fri, 21 Aug 2020 04:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OdbUqaHlOxpNwKxtKQG+iMJdH7wgWqKuZeq7kbv/krA=; b=Wj5w7P2ljEh+/ksXnnYFl/nkYi
 hzhAtwnvGgMxdqWvn8iKIKQm+m6kTMdZOpmen0Ntbb3QnE6DVokJLfp7I4tNLnEfHKDsI34YJ9H2Y
 gEmz5Baz2VAklwJlo97g5FE7oKaoSfrhDbgAURsfBddm0dAqEm0X1r4tZJzvXTb1oihqo+BWeNvhV
 9Hg54quySpR3nrBSHA89BX2UAKc8SwF534+BrpdjMrNz4QxLKGzdP2zK36en/bJFrUEFnGUvZZ4Vx
 uCXcOc/M3/guIKNs7h/B32o9ZwV5wVVhYtAeyzAB6ktwaHZ56/oSWHCEdgQTFCP9XdRqxLECSPSjn
 O+RwHj9A==;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9C-0001EQ-NO; Fri, 21 Aug 2020 03:55:24 +0000
Received: by mail-il1-f193.google.com with SMTP id k4so313977ilr.12;
 Thu, 20 Aug 2020 20:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OdbUqaHlOxpNwKxtKQG+iMJdH7wgWqKuZeq7kbv/krA=;
 b=mlX3nR/JdBB5YPQ1tcsYKnCeYHTGGG/K0eWwIU6aKami/Mk6frroFUFd1TS34nyqbi
 /9tTgZcZnHdUmFih4+pBOEPMOXnqEh7dQoTc6SsbqMYNhvIUGVWOhuLE2+m+WD8n6Swr
 /FfloYDbt33H2ZO1Ww1uPnsFrZLHlwiSVwiWe/MGsd9+IklgOTM373blALbw0BedCxkI
 lAOIsKoY6shhPQZezgxUWzCNlt9cR+TCZvAYfD/pkyhFdQ6Vj87EaiP80urhc41KBvsl
 TrxbnQkN11ZFsij6olmCPKNPWQiggsaxYZIp4ulM1CqUCTG3Tp8Uq/ZIUefe3IcWV6Qb
 qZJA==
X-Gm-Message-State: AOAM533SJjtKDm+GAAAS3/ESvkoPsIr0olzFSe3VYYb3DzdueTYW6tdB
 vsyXK+yGfymm0xKpLQfVCA==
X-Google-Smtp-Source: ABdhPJwE4917c5+NGuqLlyA9JDGlrpGe+mH9Eho+5KNlJKwz9WZvaxODvXKvQEAkENi0q4FM4lOqPw==
X-Received: by 2002:a92:ad12:: with SMTP id w18mr941662ilh.218.1597982121701; 
 Thu, 20 Aug 2020 20:55:21 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 14/40] PCI: Also call .add_bus() callback for root bus
Date: Thu, 20 Aug 2020 21:53:54 -0600
Message-Id: <20200821035420.380495-15-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045522_922508_0ACDEFBC 
X-CRM114-Status: GOOD (  12.20  )
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

Similar to pcibios_add_bus(), call pci_ops.add_bus() when the root bus
is added. This allows host bridge drivers to do any setup requiring a
bus pointer.

There are currently no .add_bus() callbacks, so this is safe to do.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/probe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 0c9ebc72532e..d8bf3fe8dacd 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -941,6 +941,12 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 
 	pcibios_add_bus(bus);
 
+	if (bus->ops->add_bus) {
+		err = bus->ops->add_bus(bus);
+		if (WARN_ON(err < 0))
+			dev_err(&bus->dev, "failed to add bus: %d\n", err);
+	}
+
 	/* Create legacy_io and legacy_mem files for this bus */
 	pci_create_legacy_files(bus);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
