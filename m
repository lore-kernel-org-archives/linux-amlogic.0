Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876AAC4829B
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bgk17kq5lUHM4g6RB1/7qaR4uOKcy7K1cZf48qqqWSc=; b=gUFkHj3gmMFJuY
	0g1XB993YDrnPuqmAbVdY4lgmHRcNmb95quzRxKYlMfgGtnBsoNZySMtvQYh9W/Geover0m4AkBMJ
	LOp7lD6a0oVNhDQHGePu8ZJ2Jz2nTDyTOklcm7+SovlZ6Ehc/GmNEZwES/Z4k8mXdPyYW3BQL87SB
	k91oVZ1Wq2mwucweXmIoZkYdQd+kGoS++HpVSUx5ET38dn8Kjzl7u9XkYkfulpCNfjKUH+2BIWRgj
	m+X0FVDvl1X5iCMvR/RGhlcFZXdV+2QsCmObHSpHgKul4bN8mjcWFmynT/v9DTEBg2Hk8rVcRNZBY
	EXb9bYkv8DckuOgahbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeS-00000006FPb-17K2;
	Tue, 06 Feb 2024 07:13:52 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFeO-00000006FN7-0bWt;
	Tue, 06 Feb 2024 07:13:50 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00124;
        Tue, 06 Feb 2024 15:13:24 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:24 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
	<support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
	<ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <patches@opensource.cirrus.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH 00/18] mfd: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:12:56 -0500
Message-ID: <20240206071314.8721-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 2024206151324b9f9b62304e62d05a8d60d6ab6a8ea99
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_231348_511658_858943CA 
X-CRM114-Status: UNSURE (   5.09  )
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Bo Liu (18):
  mfd: ac100: convert to use maple tree register cache
  mfd: as3711: convert to use maple tree register cache
  mfd: as3722: convert to use maple tree register cache
  mfd: axp20x: convert to use maple tree register cache
  mfd: bcm590xx: convert to use maple tree register cache
  mfd: bd9571mwv: convert to use maple tree register cache
  mfd: dialog: convert to use maple tree register cache
  mfd: khadas-mcu: convert to use maple tree register cache
  mfd: lochnagar-i2c: convert to use maple tree register cache
  mfd: wolfson: convert to use maple tree register cache
  mfd: rohm: convert to use maple tree register cache
  mfd: rk8xx: convert to use maple tree register cache
  mfd: rn5t618: convert to use maple tree register cache
  mfd: rsmu_i2c: convert to use maple tree register cache
  mfd: si476x: convert to use maple tree register cache
  mfd: stmfx: convert to use maple tree register cache
  mfd: stpmic1: convert to use maple tree register cache
  mfd: rc5t583: convert to use maple tree register cache

 drivers/mfd/ac100.c         | 2 +-
 drivers/mfd/as3711.c        | 2 +-
 drivers/mfd/as3722.c        | 2 +-
 drivers/mfd/axp20x.c        | 4 ++--
 drivers/mfd/bcm590xx.c      | 4 ++--
 drivers/mfd/bd9571mwv.c     | 4 ++--
 drivers/mfd/da9052-core.c   | 2 +-
 drivers/mfd/da9055-core.c   | 2 +-
 drivers/mfd/da9062-core.c   | 4 ++--
 drivers/mfd/da9063-i2c.c    | 2 +-
 drivers/mfd/da9150-core.c   | 2 +-
 drivers/mfd/khadas-mcu.c    | 2 +-
 drivers/mfd/lochnagar-i2c.c | 4 ++--
 drivers/mfd/rc5t583.c       | 2 +-
 drivers/mfd/rk8xx-spi.c     | 2 +-
 drivers/mfd/rn5t618.c       | 2 +-
 drivers/mfd/rohm-bd71828.c  | 4 ++--
 drivers/mfd/rohm-bd718x7.c  | 2 +-
 drivers/mfd/rohm-bd9576.c   | 2 +-
 drivers/mfd/rsmu_i2c.c      | 2 +-
 drivers/mfd/si476x-prop.c   | 2 +-
 drivers/mfd/stmfx.c         | 2 +-
 drivers/mfd/stpmic1.c       | 2 +-
 drivers/mfd/wm5102-tables.c | 2 +-
 drivers/mfd/wm5110-tables.c | 2 +-
 drivers/mfd/wm8350-regmap.c | 2 +-
 drivers/mfd/wm8400-core.c   | 2 +-
 drivers/mfd/wm97xx-core.c   | 6 +++---
 28 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
