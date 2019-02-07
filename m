Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D751C282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85102175B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQX/NXDh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aoHqqmsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85102175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QF81OqBPQlkZQQyUxiy9iaH1v2mukicky4tmA6Xt6+Y=; b=TQX/NXDhIbPyka
	4ZTrAFlDPltSjDVV+E4dGBCeydU8xq3+V3eFDfI6RVtFeSIIK7oFEA7azM1SMR58WOlpN2XM3x4lT
	nRplTuJIQnYxnZalZjx1qKNwlFN6Hx85trLXWgf5mWperbCigr8hbxCR9KpDFVQsnSNOR+maZSAkP
	9GHQ1m+aZjbif49fAKnsFwElpM6OFqvCvx+3bulcuWVQAQ94ZyAVAT1I9U4wlYc70nntFgCPjN+j7
	vdSkw3MAva0rlOx0TBh7AGjbA88fStMEoblZ9pYT3dlK46KS1drKOPL6GeE2P8KVPiS5kSb+50Lbd
	SSC2cDzENyCpjPmqerHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjhN-0008Th-3b; Thu, 07 Feb 2019 13:26:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjhA-0008JW-Rq
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 13:26:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id z15so9510622wrn.1
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 05:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=68x/n4YDg6XvhOG3QrYH78pmnPYmUGv4xBBGZW37dwU=;
 b=aoHqqmsHxLvaZVvK6pciw8h+RM2epyh5oRNkW/lYxfMtG9SHCRJ8YjI8S3M3Xt3PDC
 G0szWkwjcx4owhd5rfuF8uwaJAypAEjtqTZFIZrjOldeMcodt5cAU0p/6BM8B9Am8LW/
 vSI3zZnzhaQncChGJqELdAl0eA6+nfc/h8+ajDx8zt3SMccG4mn7uzZVTh8tMF5loobv
 IISUKF3iGP04c7Z6AptUJk+S8tyPcVVyxWXOQKnFVrmBMoKRHkoA73ywRmzdhNmjw0no
 52U2/ClvSFPnNwJCd3kLMq+PErimLHuVhJD4rVUfJ2hv/GehYpLnU/dWMOnhT3JojQC/
 KYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=68x/n4YDg6XvhOG3QrYH78pmnPYmUGv4xBBGZW37dwU=;
 b=QIfWeeOUfjSN6KRH0NSBUP2olTdXQQuMt7/PjSMY7hjJ61HruhRUeojQl9alH4tlwg
 juaKI2DMCWuSU6kUAEN+KEznHyz+Rc49s5OqabADXndb2UMsa0e78QBx9j/oU19bH6mN
 Lb79UeJMQjODlT5RVYBM5kLt9XNFGZK+GVNsAJrxli5dW120aGI6G/Bff8tz1CSCb82A
 BVhuw1y4Jy0FmABEtUsfxwjh9ZSbcf3ylnnXUttVJhtFsyqfv3qWvmKo+W4EywsRZFDR
 VfYu/4x8exV5G+1Vz8luxpfQ54m4G47O6YcFdRS1UyDYA89fHn7Vr42FPSk+GWGWdf7d
 YZ8g==
X-Gm-Message-State: AHQUAuZNwepY3GDkMV97okU1IHIIdL8YRsq3/7ViQ9Z0NoKEIfso5aeE
 unZBq1gJLtNY7gCOiMV88smKVg==
X-Google-Smtp-Source: AHgI3IaT7VprTeH7c5oBcCf9wqY5VxyMXvWEVPQO0fZU1WAn9MivbluAN4VHwi6oWhJrQEi64aYjgw==
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr12028437wru.291.1549545983061; 
 Thu, 07 Feb 2019 05:26:23 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id v22sm11061612wml.37.2019.02.07.05.26.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 05:26:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] soc: amlogic: fixup clock measure
Date: Thu,  7 Feb 2019 14:26:01 +0100
Message-Id: <20190207132603.694-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_052624_906144_FA8CD50A 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

Here are 2 fixup for the clock measure series.
First error was due to the rebase on the v2 of the bus fixup patch
Second address some comments Martin had on the initial submission

Feel free to fold these fixups with the related changes if you wish.

Jerome Brunet (2):
  arm64: dts: meson: g12a: fix clk_msr node
  soc: amlogic: clk-measure: fix-up some clock definitions

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++----
 drivers/soc/amlogic/meson-clk-measure.c     | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
