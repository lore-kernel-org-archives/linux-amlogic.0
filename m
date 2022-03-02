Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F5CC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 06:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rKXoUSaw+SEuvbAciirYjXIzm4Ig+lkoCXOQQqg+nnQ=; b=HQKdG+bc1hneWl
	lU7J7Ti8d6vRK/YvmSSlgDgIowfXkrzbTldhMyA1Nfh2KH8c5dlxFAyoImx3SwVjL4SA2hanCVPlm
	BJf67ZuwX9ibkLovSaOWRE0fFdtQj9dQHe35RLNGKMaZRimcuKFl1o8zRIp4S/SkxMdQ2CU3tytEr
	MJQnKgvYg/FuwtybKyC16xjYI0qyO2jn/AIWmT96RMOFlA0bGwvuuABkkq2LkomQjWKv/UJkdHPIq
	62cvmQX+/QUeT3B6/MKqzNBKAmOjGwSJwYbI3PD7CFQaLmya7/QeHdgBu7LHchG1DDtHXC/+uw+yD
	+/hZ7A0OQ7tSjF3MsxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPI3S-001bFw-F2; Wed, 02 Mar 2022 06:01:42 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPI3G-001bCw-CA; Wed, 02 Mar 2022 06:01:31 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Wed, 2 Mar 2022
 14:01:27 +0800
From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Subject: [PATCH V5 0/2] Power: meson-s4: add s4 power domain driver
Date: Wed, 2 Mar 2022 14:01:23 +0800
Message-ID: <20220302060125.1754824-1-shunzhou.jiang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_220130_674809_086A9D45 
X-CRM114-Status: UNSURE (   5.62  )
X-CRM114-Notice: Please train this message.
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

This patchset adds Power controller driver support for Meson-S4 SoC
Likes Meson-A1, the power domains register only can access in secure world

Shunzhou Jiang (2):
  dt-bindings: power: add Amlogic s4 power domains bindings
  soc: s4: Add support for power domains controller

 .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
 drivers/soc/amlogic/meson-secure-pwrc.c       | 22 +++++++++++++++++++
 include/dt-bindings/power/meson-s4-power.h    | 19 ++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/meson-s4-power.h


base-commit: 3448a018ded03ccd4093d6675f4a39eb2d1a18ef
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
