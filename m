Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459B4C5321D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x9aVH5eu8OOTdTZzi4oQzAheYS12UBuJuqKN2duuMp0=; b=aaeDeaJjZklIW3
	9vHYpWq841jN3lwb3JF4CqypG9gKNQHSKVGMOZqBddwWT1FEQDLMllzb4utk1gIq0xDZFR3rHk997
	8268TospoNXlk31ZuXceAaNi0/9osNYwptdf11PfQ3YceJImxi0AUNj+GdlY5fGUidRLVQVSW0eEq
	a7hQvtpvxG7HLcOkzZTc/ohW7VEtP+ejVw6fltIgLsV18Le1emmqZOKSpjTRLtVslwSOLIZA/4Kxw
	X42PC2u5IrBsJvj17mOx7YcznIv3o7NBTAlz3NdbeKsSBtZEHtZvEkATGSI6yJnq3X3SJqJvDVS7I
	i7MlawRDZk3Vl+BR7vKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWDg-00000006iqK-2lTp;
	Mon, 26 Aug 2024 09:41:04 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siW8s-00000006hAY-2NEK;
	Mon, 26 Aug 2024 09:36:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wslsc0FqGz2CnTN;
	Mon, 26 Aug 2024 17:35:48 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id AAF741402E1;
	Mon, 26 Aug 2024 17:35:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:35:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <miquel.raynal@bootlin.com>, <michal.simek@amd.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<ruanjinjie@huawei.com>, <gustavoars@kernel.org>, <linux@treblig.org>,
	<robh@kernel.org>, <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
Subject: [PATCH -next RESEND 00/10] mtd: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:43:18 +0800
Message-ID: <20240826094328.2991664-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_023606_885518_25A72A7C 
X-CRM114-Status: UNSURE (   4.34  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Jinjie Ruan (10):
  mtd: rawnand: arasan: Use for_each_child_of_node_scoped()
  mtd: rawnand: cadence: Use for_each_child_of_node_scoped()
  mtd: rawnand: pl353: Use for_each_child_of_node_scoped()
  mtd: rawnand: marvell: drm/rockchip: Use
    for_each_child_of_node_scoped()
  mtd: rawnand: rockchip: Use for_each_child_of_node_scoped()
  mtd: rawnand: meson: Use for_each_child_of_node_scoped()
  mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
  mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
  mtd: rawnand: stm32_fmc2: Use for_each_child_of_node_scoped()
  mtd: rawnand: sunxi: Use for_each_child_of_node_scoped()

 drivers/mtd/nand/raw/arasan-nand-controller.c   |  5 ++---
 drivers/mtd/nand/raw/cadence-nand-controller.c  |  4 +---
 drivers/mtd/nand/raw/marvell_nand.c             | 12 +++---------
 drivers/mtd/nand/raw/meson_nand.c               |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c                 |  7 ++-----
 drivers/mtd/nand/raw/pl35x-nand-controller.c    |  5 ++---
 drivers/mtd/nand/raw/renesas-nand-controller.c  | 12 +++---------
 drivers/mtd/nand/raw/rockchip-nand-controller.c |  5 ++---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          |  7 ++-----
 drivers/mtd/nand/raw/sunxi_nand.c               |  4 +---
 10 files changed, 19 insertions(+), 46 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
