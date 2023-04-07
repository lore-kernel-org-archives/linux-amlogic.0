Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF5DC77B61
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K/CPsHYs6a2PgiMz2B+2yb6BJG3rkeQSSuVD6P+f1ZE=; b=Ry4uki3BTd9LP9
	aJ28KDZaVWrpszdo1whS+DGYKoFsTL4g5DCcE3JoDd58x61QWY7vt+HyzVLCKV89miRvKtSh6HJdO
	Rcvli4CpTslleAe49iYKdy5xTbXzZS53Evk5DK5v3SEZkeq9pdtERkofK37OQ9HFM0rJDH6Ps24tB
	x933LsLb/injvqxKSyhjoJXyiqJb6tsPpDUvzrEdIrMLqDONcLSZKu8goEk+K7OYVGVF7yXY08uI1
	tXrZMRGAVGJd3NtC0qjkdp4OHFGWrk6a/7mblZbRnMUwSEXrrEYFwC0jWxLz27QBUgVVbtTI3QTqy
	JLwzBMmBk6UEmJKlVxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pknCc-00AVmq-0T;
	Fri, 07 Apr 2023 14:36:34 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pknCY-00AVmH-2U;
	Fri, 07 Apr 2023 14:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1680878185; i=hfdevel@gmx.net;
	bh=XJ0Yc4cr0JnDef9Jw24TvKlWj64iwV/S922I5QT4uoY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=rs8NppMMZWYrmjQSdvRBwBZj5M4YGBcXXaAnwFHdSulaEqq4LsEVPx0phkBBoKjqY
	 105Vak7bST17BsoywdH3G3UEGfjRckP3kLCFlQhyqAGqk1Ez937C5JNk6NWRFndiUE
	 pfYl5EZRLCUl6GvSnh1TFIznr4upDQZa6hfCvm+KA3BMHFwhirUeNou9x1tr7p7VW1
	 R86BkYbASp1+NpbV+lLuL+4v5XA6eX3FWq2hXioYUJObJsf9qtGkC0iJt3usOOIRuD
	 TZRgSMWq+jWc7OCWOXgS/cIClG7HUcRlvqjMtATOJsRLfNfZSkbUzxvFs2sL+YqmvI
	 xpZbx50ybThPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [77.33.175.73] ([77.33.175.73]) by web-mail.gmx.net
 (3c-app-gmx-bap55.server.lan [172.19.172.125]) (via HTTP); Fri, 7 Apr 2023
 16:36:25 +0200
MIME-Version: 1.0
Message-ID: <trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55>
From: hfdevel@gmx.net
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: meson8b: correct uart_B and uart_C clock
 references
Date: Fri, 7 Apr 2023 16:36:25 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:zyvGPj6hqLDunDW98Qsb8UOVKhijpOy22cS5iLkrBlCZFle/h5hyf7T6xFmm6uJ+/CHQc
 hIV2yxHj1PQKJ4enNouXhSLdBH/x2M1jy4srq+POvRP6HhzUiPLxQ8h0JMqQ3Kf9QgGqhEKWNoJP
 eJfe8idCDGeTM2e3zk2SrhjvFIvGvTkfpceWy/xEUJuahkM5h2OEkXIbwVJYtkxGZbTQ0iBqj1s/
 WPcYq933K3VfXckkK5Tv77Z1KKYnXEcDl804ismx78ue9yLX+o0e5syy8ZIUGx3ezlU1lhy5BB3X
 oY=
UI-OutboundReport: notjunk:1;M01:P0:25iDbh0m2mo=;pmEOWd/uz3CFqVgh6DJH4C0YOB5
 9OFw2C85CfDcB9beW7ALHLVfH/9PJN12EaDSIATpIJhjxMPVDF43khA2FJX6GXCe7IaH687EX
 o3YCOOtOkwPydfP27Sm6TTsTf+XL6v4yGNWyeNfRE3QiKepBEq4SyLQBIZEJfDDwjDC90q8Jb
 fJtnDn1zQW/R6LQDxxmrMooIyV3XNgwlYMt/rECnwLRz8cQ2slcvSPl3fmUGS7bMiWxNwCGvS
 RObhE1hDOC0NJGMd6gY2pU+TqfSksH9tgtzUQZ+SfqPvhnCsgdwc1ka7fFwWp/hBhXXIhV93l
 IZWaVyG+CPIeF5QWZvs/TbRRsC8AGzz42BzFobtU0G60mA7UZ/miPE7ltuImqzOW+uUB6xAI/
 f2dqEdMkjAw7y4y5aw1hWnvVmoXBu9lWLPxufzqpuhKXTEhOIb2CBG7Qx7TSTQbSLOUGR6baa
 iQa4qGg5eXiE6hJ8jOgCx1a6bHW8M7Vo49QJd4b2htsPsMRsWwlfNJDVLHm5qc0VVg3n2niPE
 nzhaXw8hCEiKvQgNcA50t2pYuYXtjmv8vsAxA9YCAk1Wmp7Ks/vfGBKPldEltye4SkNVyjIsS
 iDh0gckJJfy5BByKZB09SfI+OqGglmWwNLuTbyJ8hQgXl1/lJEMHhyYxUW6ahAH0CeHjikFkw
 NHbps0jh6Q4M0gsWTZyTA2RNX3jjthZbQNla5ORlLnxFAZuWaiQKDOFhZNpqPiWRxWImvCXyz
 AqWyvvZtnHyhvk31qg+2bguEtNUAE0Ta4ptTgMPOX9eA8k6Wr9EdAVqKN1ssLcLUkRPRw/sGm
 0QXV4vfm4MwgunnXurKsbb9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_073631_259651_78FACCCF 
X-CRM114-Status: UNSURE (   8.65  )
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

With the current device tree for meson8b, uarts B (e.g. available on pins
8/10 on Odroid-C1) and C (pins 3/5 on Odroid-C1) do not work, because they
are relying on incorrect clocks. Change the references of pclk to the
correct CLKID, to allow use of the two uarts.

Fixes: 3375aa77135f ("ARM: dts: meson8b: Fix the UART device-tree schema validation")
Signed-off-by: Hans-Frieder Vogt <hfdevel@gmx.net>
---
v1->v2: Addressed review comments with respect to patch style.

 meson8b.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d5a3fe21e8e7..25f7c985f9ea 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -740,13 +740,13 @@ &uart_A {

 &uart_B {
 	compatible = "amlogic,meson8b-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART1>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };

 &uart_C {
 	compatible = "amlogic,meson8b-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
