Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9523C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEONhoNhoKKmfmDYgBp+NYS+6xiNk48Mary7z+WtJV4=; b=ZJ+GTbDcDdRZk+
	DlvQ4REFz7aPPGd1q0OIOTX9flWRKZVSH/eTYPzsKd4ykOPZraaL/p+taezANqkUXWlcg2X5saW1n
	G0ZroD1LHvJTNrt0TO1cf0hsUK3I/eAu8TGrP5gb4Pulid7E53D8Fe0sJ0zG3JTnbBwqqDULuYkNs
	5rxsJJ72fkE+/wme9M4UiDCCcYDb1aabN0tVis94wWSA8KvQWTMOaa59fwLBqJNrA6p/7tP/0cHAq
	pWz1DL97kpPCzy9P7ZCetcSqmwiy2kEoLP+wQeM0yE49fpMEda9JfVeVNuFX1wpm4pwmiM3MtgSpG
	oAOS0z/IOzheZ/CQql4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf4lK-006yNF-G9; Thu, 14 Apr 2022 19:04:14 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf4k8-006xdP-CX; Thu, 14 Apr 2022 19:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962980; x=1681498980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgXmB1hmlgyBRyTbiaI44zoA0d0R4GjmhsIVDP1LpQo=;
 b=OSuiduazpRHytNFKeo1NptDw4N+nvBcYwkbI4YTlin6GgGCNYvo1XOdz
 YXnmTb9Y/uJYuQkk101NLZYXVZFobqb0pJ4ehtMFna1htXKhUOkpXCKz+
 fbPPg6GIabQSVvV+wNd8p0MsUWKx8DuPtSyO5/jBOZbU3v164/l5yUR1A
 JTzJxZxNMTxdZP9aYEjXxcdtM5qXmqgAkYO13QYfItHusqZLwFOYpoElH
 Zp2Z5hEZHmtDA03rpSl/3UPa111nfWDfwkLr0+kxyj/RPrRdTPEmc/G2r
 B4PBYv+3UbcGObEAC0qdbXwn5ERjRB5GkDp6DgC6pX7YRQAHtIgygMZEZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="242942935"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="242942935"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 12:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="573947631"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 14 Apr 2022 12:02:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9F6ED2B0; Thu, 14 Apr 2022 22:02:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 5/6] pinctrl: meson: Enable COMPILE_TEST
Date: Thu, 14 Apr 2022 22:02:41 +0300
Message-Id: <20220414190242.22178-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_120300_525703_C065B06B 
X-CRM114-Status: GOOD (  10.00  )
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

Enable COMPILE_TEST for a better test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index d1955c65b4b6..64fb9e074ac6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
-	depends on ARCH_MESON
+	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
 	default y
 	select PINMUX
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
