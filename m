Return-Path: <SRS0=jdKd=VX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58967C7618B
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jul 2019 12:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD542238C
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jul 2019 12:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCuxClcD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mUsF1imL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD542238C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHVuJWTDJW4++P/CfWfgnJpGxlJlzoVJD58JlVZ120o=; b=iCuxClcD58BM1f
	vjCAq7mr+CcGZoNjcF8yhepMwpAats5vrdcBBp/qgok98D8hESoylUWCI/A8MKS1q6N9R2SMYa6z8
	E9fzY5yb0VaJ0zGaCbH3peZzd+J5e1/T/tfqwqL38KPi86LjkK+HqMvclt6e+Qx96vLB1Jc+x3vZR
	Ht9n9j4dVIQC4OPpuCPD77JAxyxbOjVjnyXtelQtdWi2s1Cf+q2B3fDb3l1xJVjFv5MJKx10IkTvN
	CosjP3H/vS7EevJLWXWAmWMlrjlLW4V14q4PXkdPSdnpzAQs49tra4G023g41rLZarD77p4j77G4U
	5PRu06j0g1xlLdU9sxNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqzcc-0003Pf-6S; Fri, 26 Jul 2019 12:46:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqzcY-0003NH-B8
 for linux-amlogic@lists.infradead.org; Fri, 26 Jul 2019 12:46:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id x1so4406737wrr.9
 for <linux-amlogic@lists.infradead.org>; Fri, 26 Jul 2019 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLxaMsYCZ3/jXkIVQkw/a8MrmWzCu04lpfPSyYLHWrs=;
 b=mUsF1imLERCFTkg2/Uzs7hmT38m2Kw7AJTfPDinEzNaaUZiuZV0l7wgIMCBRiIpBLB
 sA2L6wbnAkNjgyxnvt+9CUZas/y2tN3c+yW9Z/i0K7FMw8zz3ahtIQ92Uc0Cq6vWSNLW
 b9iiTR5A8Nj+kKSFXN4cp60DhKL8YPrrTBsjy2J73V2t/u15peL4eIha+TsgPDuiMVqX
 R09H5zAiMSUYAAQp+OJQo5RAcr+JIVtweRBbU5unW8uZIaYHUdvP2ANTxyy3VlJFZ94a
 VPttMRsEIV69Jbf0DBp5gHwDaBz8ET5XSc1LefOqoVZFYXZ3XRW9z1IFjgCVwUcGHSUM
 Rb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLxaMsYCZ3/jXkIVQkw/a8MrmWzCu04lpfPSyYLHWrs=;
 b=omzuhn844PczR6ivuqlxvY+XgZApm+3rMRJA1Pwmy+sYGc6engp4yVR4x5d9Bhybw1
 kJ2/eCsI8BYMfXcdCux7zmyiZr1meyeZLGsiPjahLUvc2aMRZYXdtI+qO1zXsCvrGlxm
 3INb4OwAiSKXU56/EBC6jaeKjTL095bJlNQHrnMKxX7s8QBapNlRUs/qmYscPPLcyilQ
 /0jSJQ0wr+bZUp8JdkkCXqJluLiFpQM3XcdSQsbWbZqQW6MiFlUJs7FpnAAm4ufOJUqP
 6b9fbnwdnRF1QFnmrEwHZZiHhxS+I/dPZT0BHa/mpjjqKnJl2RaisMTFMCC13C+M9c0t
 6f2Q==
X-Gm-Message-State: APjAAAXEGaCz1tqaHWd0Ucw9bTHYJWkDt89C0ygBs87MBLPWu71DKhzT
 2W+/iDSTKVUK7Ck9RgXdv6u0jg==
X-Google-Smtp-Source: APXvYqxm1YKS+4DrGIxchn3QR4y65WJgjEHqXNZSjIdrgVVETjxtNhl4GAnKHur+0BraxsIAcY0zmA==
X-Received: by 2002:adf:fb8e:: with SMTP id a14mr7232715wrr.263.1564145208209; 
 Fri, 26 Jul 2019 05:46:48 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id x16sm39090124wmj.4.2019.07.26.05.46.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 05:46:47 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson: add the video decoder nodes
Date: Fri, 26 Jul 2019 14:46:36 +0200
Message-Id: <20190726124639.7713-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_054650_452255_E90BF017 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds the dts nodes for the Amlogic video decoder for the
GXBB (S905), GXL (S905X) and GXM (S912) SoCs.

It also includes two misc. fixes for the bindings documentation:
a missing generic compatible and changing the example node's type
to something more conventional.

Maxime Jourdan (3):
  dt-bindings: media: amlogic,vdec: add default compatible
  arm64: dts: meson-gx: add video decoder entry
  arm64: dts: meson: add video decoder entries

 .../devicetree/bindings/media/amlogic,vdec.txt     |  5 +++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 14 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 11 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 11 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         |  4 ++++
 5 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
