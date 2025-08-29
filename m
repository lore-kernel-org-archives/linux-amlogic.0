Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0566C8303F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Aug 2025 05:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ei3ho7cuhelzkxYiwePuGrp3JOdhx8fLe9ocSHH9E0=; b=ZcVsnvHbRknrIE
	FaYNK9LtVyd7UNksUJ/kRRUdDo5XSmJOGMzVf1Mi9fI4ZkAPcW2cjOdkdn0ZmUatkeLlG3Njn5UhS
	slH1CMekckqfspxB5iM9+nFGX75xcGamgdzzNZwZCHhbnWprm1vkC0GVdYUe6wIYiDrUnjgmlwW4s
	o9Fcjk4czEwrN05Baz06gfX/X4O0Rpw6p6neT2YkHvpbn5PIPuH+B6mDuReeXcgIAFVYNDmrkt5Ex
	NVHnNt8LAJWSfYzcEc9LAsHJ39VvXb5RGGvY7RG931xJPc+RayJKWtb9UFi3ty7CLFna/MTsxi5M4
	Y135nDjP2HypwCH8azfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrTK-00000004UEF-1s2O;
	Fri, 29 Aug 2025 05:16:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrTJ-00000004UDy-2I69
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Aug 2025 05:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7927D6019B;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2656DC4CEF0;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756444580;
	bh=0HKyVc11qco89SpE9cjbxY8QuDwSLcwJI37c2AqdRc0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IU9pdo1PhtN49YoO/AGgqnybEO6IhVkc9okPWxz5gaojeYCSdzUVwFmy5RmnItvC1
	 urd3Oq1jvGEQcSYITTNrfkqGHtdaaS2NTLHaJbXKBNgOw6EP1ntTCefbQpaoNKGzxg
	 zinYPz8OZtCsiYIujazT0O1DPyjUT/mSR1bYbNyOxKSD5SfoJOfxbx4WjdDbsAdn98
	 yKSt8C3bxEiIks7CKmAAUl/sD9adoCr0OKVWuPEg9aYbHpHi5ADhGBoX2zTN7pE83z
	 e21dMjOqVPB5sSQZFkWawNZT5AJTjiZXHqK0tNXjo1UtiTkox1tGH6rO0OhEjGKCRT
	 q9g8KTkfEd4pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1265DCA0EED;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] support for Amlogic SPI Flash Controller IP
Date: Fri, 29 Aug 2025 13:16:12 +0800
Message-Id: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJw3sWgC/2XMTQqDMBCG4atI1k3Jv9pV71G6MHGigWokKaFFv
 HujVLB0+Q3zvDOKEBxEdClmFCC56PyYhzgVyPTN2AF2bd6IESZJRQSOk7MGy1JR4NJqoBbl3ym
 Ada+tc7vn3bv49OG9ZRNdr3uh+hYSxQRbK4ATYKpR+toMD985czZ+QGsjsYNjdHcsO01pbZXQ0
 pD63/GjU7vj2ZVQM0UEbUurft2yLB+PAWnpDAEAAA==
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756444577; l=1779;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0HKyVc11qco89SpE9cjbxY8QuDwSLcwJI37c2AqdRc0=;
 b=UyfouoSwtVHlx1WRl75VGX6HTe6cWganyLSUw2IaoA+5TsZrKiSTg9OTDDON4+ckzjoF/oKb1
 Up6EETv31mdA+wjJVvFt27zDU2SLgzRMvWFJIOu6x+5wXCuuJ/+0v/H
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This Flash Controller is derived by adding an SPI path to the original
raw NAND controller. This controller supports two modes: raw mode and
SPI mode. The raw mode has already been implemented in the community
(drivers/mtd/nand/raw/meson_nand.c).
This submission supports the SPI mode.

Add the drivers and bindings corresponding to the SPI Flash Controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Reword desc of 'amlogic, rx-adj' in bingding file.
- Link to v3: https://lore.kernel.org/r/20250826-spifc-v3-0-7e926041d7f6@amlogic.com

Changes in v3:
- Restore message description and modify subject [1/3] that was omitted in v2. 
- Link to v2: https://lore.kernel.org/r/20250821-spifc-v2-0-b119f64b5c09@amlogic.com

Changes in v2:
- Remove clock reg descriptor and get clock from common clk.
- Remove ecc and ramdom descriptor in bindings.
- Modify the format and message description.
- Link to v1: https://lore.kernel.org/r/20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com

---
Feng Chen (2):
      spi: dt-bindings: add Amlogic A113L2 SFC
      spi: amlogic: add driver for Amlogic SPI Flash Controller

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spifc driver

 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  |   82 ++
 MAINTAINERS                                        |   10 +
 drivers/spi/Kconfig                                |   10 +
 drivers/spi/Makefile                               |    1 +
 drivers/spi/spi-amlogic-spifc-a4.c                 | 1224 ++++++++++++++++++++
 5 files changed, 1327 insertions(+)
---
base-commit: f8b3f0d7b2a91ba84d06343c3ca4522e35a65f56
change-id: 20250804-spifc-5761e35fbe1f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
