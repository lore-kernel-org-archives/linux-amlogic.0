Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF332C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A2Djjcuw4mM65A3ZcoVBoJwgzR9a7zIJeBPpNH1CM1A=; b=TqwIf9QTCMyWGb
	qSMv/VuvmqnBsKuQVrZ/9F030hvy8RduCvRiGXh4K4hWpFzN0ETqykVV1tGgN/Cou8HTA8hRoIx7S
	lGvyzko31LGNktp4IHSNCygoEy1xDB9EyC3+QRAKwd43fVjxjC8onEezu2jm5tepK/LQEfXdo4d6D
	lQwujQdUZ8+nQFb3Rt0Pp1XQjEQzHd9pR9J1+ZA22QcXayugYUE0wXVxREEHtC7Js9qVNVFLZTCIN
	eUSSPs7DGLKOTISS0XpayjioUE2yUsYRlqSmG4dI0V3/Cu8egUt0fPAXd0f7uA0ac4Xi3XYyIiOuc
	bFuAZN6SXoewC+IfbNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOnr-00B1Ix-GV; Thu, 07 Apr 2022 09:51:47 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncORb-00ArM3-Lw; Thu, 07 Apr 2022 09:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1649323718;
 bh=qrEk1KaQqHvx86BvGZbTrk+9iRUH0cmWZPEc61qHsBI=;
 h=From:To:Cc:Subject:Date;
 b=LDd5Jay6Ua4M7Rk3quFdJb8SgDPSuZjtqWrWwqliBIg5ntSUNjqp/XacMdFtX7jJp
 /X/fkzdKAMvVmFPEWFBR5+U+YOHa9IUv2mpP35DLCjkdZ6mH4VgDyKFE3QoEKTYe/d
 ap5kgwwuIo7p3ExFZYpafOI6djHPnxvewqi5BfBA=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
 id 720A506C; Thu, 07 Apr 2022 17:28:32 +0800
X-QQ-mid: xmsmtpt1649323712txu21a4wf
Message-ID: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntuj7gXE9EPckixmarPTNotNuv+oSnMoBzpUK/sMEAhv3nREl6ig4F
 WQJ6nhIBxe2K/G1fr9R9+gtZonkh3jygJuZ11VbRvBqkl5ltFnuySv/Ab/xXcSbXLs/I26jTHjYw
 Ue94j8EPgpcxzvysMVwld7y8MEbEIOq/E4BOaBeW8/kMyxhPwSTTiPQ3MOX7MDNLUB+lfky6+oMd
 uSxl0GUqHlZdpZPfN0KYKeI8Knxijp76AVpKZfEmmnom/CEKwg9NwiOzjILt4ZottQlcuA4isZI1
 jxGg2MFn2Mb6PNfTfBKhlDvxASNCfpkOwvK/HyWYTaivYPstV4gqChWxWclJgOXtuqQ1e3rHDwhR
 E5WFqZGKDFfXkByYRoqsN/qnitiIgXsAuSTKAgWxS8NCPyD1b0LuUYzoKuXImaZc9TchccBLE4tA
 AGZkm9AmCXPumw1p1FNP6y0N7vmQlAub0vil0WaN4TbWDQQuYFtKSMoDx7TLX+uXuhWYdIltiR2/
 m8okaFJ+Kqz6N/xt4eEy4Ejv2Qpa0E+yaT/LoU4xn4K9r6wbSd5PqfXbWty57ne8XcmBEQRArlAo
 tvk9rp2HNOnTwphtSaeWOHph0juckClHzUyvvcvC21s/1MCH6bM/EviXSKH0kfqUXbuJREFF0NA0
 K06MIYPG929N93yoTBdhpN9yLFKOqjkF8VuSm0p5ewxQZ9A23FBUtAl+Q9VBfugEZs8Y8dEtzglv
 59qZsx+fsWyxH1kfRDDeEPLQqZgkc7B5nUr8sxvZ9QjjXK6nq2/hh3kOxBzwz0oJLrdLP0lYNzEi
 O6gTz8WCRcBZXshOfUfT90itR1do5p+lKNawaEIIkv155skoaya19lO4/5+nSKYFti2oNGuFtpQ8
 dnp9yrsJiXTwC73mMqm8VB9ggIKxe9oaUuRGmwP+W6fQrZFg+LgM9XTS8FcnYFgHCn+hiihv4tru
 6p8ph7Pu7QCPHt1RcbTWBImgJyEfXKKucZRq8W7nEeBuH89iORSw==
From: xkernel.wang@foxmail.com
To: narmstrong@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com
Cc: martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] clk: meson: meson8b: fix a memory leak in
 meson8b_clkc_init_common()
Date: Thu,  7 Apr 2022 17:28:23 +0800
X-OQ-MSGID: <20220407092823.14526-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_022848_534002_FE155CCC 
X-CRM114-Status: UNSURE (   8.23  )
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

`rstc` is allocated by kzalloc() for resetting the controller register,
however, if reset_controller_register() fails, `rstc` is not properly
released before returning, which can lead to memory leak.
Therefore, this patch adds kfree(rstc) on the above error path.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/clk/meson/meson8b.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a844d35..823eacc 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3741,6 +3741,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 	if (ret) {
 		pr_err("%s: Failed to register clkc reset controller: %d\n",
 		       __func__, ret);
+		kfree(rstc);
 		return;
 	}
 
-- 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
