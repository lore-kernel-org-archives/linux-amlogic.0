Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90766C282CE
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D36221841
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XUfp9AEP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eodPEEfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D36221841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GrzSXxFCRHYa8fzoXG4ooabLpRBigJltYnRdsbrbp4M=; b=XUfp9AEPY6i4X5
	A05eLNzrGLVU2mJRwkBcPFNlvE2qllEXkvTEeRmiFlpNPYK9HNaVCrQP958RtcqgAqjARisozAzUZ
	GlTkNOVL+0fSu5DJUmJfGjf9jhmqB4MWD2nk5+tIm0QFrz0WpKMx734PxbPqCrngr6V/mAkOD5Xmy
	i5Su6VZIIaNVBhwP5mjRm4hGkYSz3Hfdtghti+zpyhj9tyLwQs29/FUcgRyxhHGYTQu4a3qSQA8u4
	lY4p0BVkblACsuaZCINnjXhyrcDMY0Zj7mE09dKKxthb+uGbPdwkAjYVwZUsRfzzoqAajlM7QvsBK
	5OjILb0kuuOwewwh7CEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVL6-0002cO-Rl; Thu, 11 Apr 2019 08:45:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVL3-0002ai-FJ
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 08:45:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id q1so6236765wrp.0
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id;
 bh=+8KV1rYOptyfogTlAgW1rSp2oGnqn2LH/HebVU6g4OY=;
 b=eodPEEfgGiM5Yns5TWxodKnukbFnK+yjnMpL327eI1HCD6REyONMTrmgUGTYoyb5vB
 L0o1khBew4M940ti80SA93Qp3gjMceiQno/8zSOHozcsMX+EbJaqlo7fteOniity29xa
 aelm3q7WE+MgyPW6SKodaONlC450SG3ntWyZV1RYIu3RCidWuFClHHCCf//pLu184aCW
 Ej5Vz31ZbVg6C/AmiLherWXuihf0AmF1DDF67znsMZaVUJK4Ji+oQP0SLk1IOWBZKkeO
 y8y2AzZp8ONvOVAlRgDA9xQcJWsmbQmocgwHWCEamka+oYDOzCKhDv4z542m0/uX+mHs
 P++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=+8KV1rYOptyfogTlAgW1rSp2oGnqn2LH/HebVU6g4OY=;
 b=BFQiv9EN4AfepKBVc0YD/1QKEeKZaLkZ2mRLiG21OobQLKO26XXeeFxdNQ0qsbW3xD
 KeYJxDCJE4/MmdC2KAXEekq7jJWisOLcLmep80JE+hRvhAXE9/ZSIXqRV9MATI2R8BRi
 1uiKXG+hl5RDSNwCPLc8EpGM3YGofGUcdFMfevyWjbCRKqDyb/rOMJ6EBhAKBcv1uFJ3
 zuPtksxb8d0IdGkJstY+eRDqIP5Dh/9oQ3r+U89tXT0OK01Q46KV9gfTbClm/cZVy4VL
 fKz1iK/HJ3X7yJma29V+MxyZwEZZnENQ+51V6tQI6911kmUMEEDk0FnNpHO1xIxwZf66
 ex4w==
X-Gm-Message-State: APjAAAVtl6QEhi7tqxo5dTLIIAy+dPfG8iUl0jclRpiQReDODE6NICVH
 oEw/fv2riupqZP7aWsmNgQzjSw==
X-Google-Smtp-Source: APXvYqwFPnGbM15P/fHGakMx0heW6tW0fam1knMzXhOVTLTlgzFAac4PWrVhbHJAFpKUdEcCGpImaA==
X-Received: by 2002:adf:e288:: with SMTP id v8mr24708101wri.7.1554972339567;
 Thu, 11 Apr 2019 01:45:39 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 7sm128602876wrc.81.2019.04.11.01.45.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:45:38 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add support of Temperature sensor Clock for G12 SoC
Date: Thu, 11 Apr 2019 10:45:35 +0200
Message-Id: <20190411084537.30299-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014541_562010_A508D005 
X-CRM114-Status: UNSURE (   7.79  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
