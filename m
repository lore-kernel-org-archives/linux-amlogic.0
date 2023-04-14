Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F23C77B6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXzdkQn6QqxOdJ+RcScC/PIgI0drirNV/NkHt3+mxzg=; b=dsIyeg6RorGN/4
	hYJpYWfGUDx+wsph8NlcT+3L/sLWjzSicYv00fS8Hz2VgvpezGwAyr/C45Jk6su3fg7OlhhwqAq6R
	4RkA6SmS98/8OqNaV9DQkwLxQGuPQVYTQdHh1rB8eHm2aNsWowK61aQVKQ4IFo6qvKsgdjhyam+GL
	1zmOzBgATx13CSNTp/rrGnXag40d+1ycxbV5rdgN++HWthiZgolgO+JOSZsuKatn9B3Mgy2G9Gn6U
	T0tkpVMRlsrJSyoOvTIE3XnIMtPkiE83752Q20ROBFK/Ca1rJ2jVbaCh2swltlWovcabfWFXQAuMe
	2o4xOsE5p7eElu6kFhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLI2-009wjd-34;
	Fri, 14 Apr 2023 15:24:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLHz-009weC-2e;
	Fri, 14 Apr 2023 15:24:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id ECF2C5FD27;
	Fri, 14 Apr 2023 18:24:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485875;
	bh=LsFSCOE/U7ctFiRSO+kttWX/RvhA2tL+4PMkcrQ5e54=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DCPYUaMz60Nl/RmT7yM88Yzy3adQ6G3ZPztlvKLMMHmWigHQ74VVmrsOIRibpLc2m
	 cCwojrhnuzPzkEay4O5INDE2OsrP+FNrLfxgBV+GDOfP9YpUYQSuyX2p5yMux2crDp
	 8srpJotp+JwjAzegvx1/WjvvuR/MlcKPrgfEZZ04+XLMSuCRHiENWA9jIfWIrOAa9m
	 eQJ/Mho4V+V6Hk4yCrseev6BCxZyc0+0vwTxFX2mJLXmGUnw9NZ8aOGK4xByKUNVnI
	 M2uVFDtZkSCjSzLx4V2L9OoWsk7v9ogaueGA+/bEeK4rF/W7tTGLfnJBSRu0g6UX8T
	 tfik05VQ2pe1A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:34 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 4/5] usb: dwc3-meson-g12a: support OTG switch
Date: Fri, 14 Apr 2023 18:24:22 +0300
Message-ID: <20230414152423.19842-5-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082440_035424_3C63B8AC 
X-CRM114-Status: GOOD (  10.91  )
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

From now, the Amlogic A1 USB controller is capable of switching between
host and gadget modes, based on the status of the OTG_ID signal or
by manual usb role changing.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index b282ad0e69c6..10469b95deb9 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -242,7 +242,7 @@ static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 };
 
 static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
-	.otg_switch_supported = false,
+	.otg_switch_supported = true,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
 	.phy_names = meson_a1_phy_names,
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
