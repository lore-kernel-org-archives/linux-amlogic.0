Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B555C54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Sep 2022 03:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ayxFW3EOaCAZ7pbz7BlUuu+j2YJyO5/x5RHVXVobHs=; b=NYxO21OfMFCO8n
	ZzP9kPf01OCb0K7Fa92q8EOxH5rhUUlZH+lJGEI62YFhFO6LuztFa0R60ex5escWdIHefFORrePiq
	1I8Z3ojCkuG+8yl2bj0wIDWVia6lfzYLIxMGzG4+sR4H1VLGR1doI/lH3vJkV+7CFeWpHEAP78R9T
	TtTyyOIK6rczAlHRmnY18UTOcUxrVjdI/6znnVyzUu6Q+BvqKxBTpdFKLXHVgnacJAFtBkexAVDjb
	D/Z+niHVTemMrfEQp8hTM0nhyislbXkHXKHd7+npZzdK5hDY1/BRiXx8tQ6JeWvFiXqWQI6MuRh69
	DE8mkiS2TkXGESxzHTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obDFZ-00DHGr-7m; Thu, 22 Sep 2022 03:51:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obDFY-00DHGT-9y; Thu, 22 Sep 2022 03:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zNuK3W2N0xi0twUNnj4bQHOwtPANW6WtVXpC+yf4400=; b=Mh6T2zOFi9MYpqv/kUl7p/bf8u
	+uXFt20hfpPSg0qz/asOLiWnUwQGu2gGECxlnCmGrKIysKrEWFVqSpxt3khOtOMooam3hzzeolG+o
	Q8DO81DGjJ+MZ8L95AaDzQ5ryEpmZ4fkUN7mvBXqRy84F3NyrknbM+5TFSli38rU84yjWZ88uzM/u
	69h4gQEIKrPWj3Ka9qv5aM4cygoKKgZmKCz8REBFH8FcnE6ou+2JrIEOALZPxK5oGVCnBs7Y8ACPx
	wFUmTBjsezoQSqHamvXycZdCVhegw9TJ2ChCQma3o8Ai2m8RpHmyrcOI/zGRHLHUcIElpNLF4fs/u
	Qf6Zww8g==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obDFQ-00Er0W-Qh; Thu, 22 Sep 2022 03:51:41 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MY1VH4L9mzKPxx;
	Thu, 22 Sep 2022 11:48:55 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
	by APP2 (Coremail) with SMTP id Syh0CgDHGXOd2ytjjvLTBA--.48717S4;
	Thu, 22 Sep 2022 11:50:55 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH -next] spi: meson-spicc: make symbol 'meson_spicc_pow2_clk_ops' static
Date: Thu, 22 Sep 2022 04:08:07 +0000
Message-Id: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgDHGXOd2ytjjvLTBA--.48717S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4fuw48Gry5tr4DZr48Xrb_yoWkJrb_CF
	WDGr45GF47J34xAFy3u3W7ArZFvF13uwn0vr4vgFW8Aay5Zrn8ZF1DuryxCr98u3Wj9rZ8
	Xr97J34UCrW5CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUboAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
	0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07UWE__UUUUU=
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_045139_115350_F5849713 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Wei Yongjun <weiyongjun1@huawei.com>

The sparse tool complains as follows:

drivers/spi/spi-meson-spicc.c:570:22: warning:
 symbol 'meson_spicc_pow2_clk_ops' was not declared. Should it be static?

This symbol is not used outside of spi-meson-spicc.c, so marks it static.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-meson-spicc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index e4cb52e1fe26..85b4b9b267b1 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -567,7 +567,7 @@ static int meson_spicc_pow2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_divider_ops.set_rate(hw, rate, parent_rate);
 }
 
-const struct clk_ops meson_spicc_pow2_clk_ops = {
+static const struct clk_ops meson_spicc_pow2_clk_ops = {
 	.recalc_rate = meson_spicc_pow2_recalc_rate,
 	.determine_rate = meson_spicc_pow2_determine_rate,
 	.set_rate = meson_spicc_pow2_set_rate,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
