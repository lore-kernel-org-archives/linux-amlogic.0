Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE60ACE8374
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3IXX1h/zggagfizYrfZQ3tw6/4O6mc4X1jzoCBW9npE=; b=YiQt3TAbqN1jfs
	5zd8qotG6jGIc5HmeYH8yOpXdelJw2KKIBCJ9jNt9WeoVPR+Lz1l/kQsaprob9lIli6Cvo+4GGGaH
	I8pFIYsQq+tJcrzB4BUfrI0sbO7vzvBsb1/TELywX2eyotmgdsFf7LHrM5KG+iemXxTRozK76yE3d
	h8OahwcvGKRQZmzbQJGxQVeMEezeYO5UKxpFcSCMCKZY5EzJfdGjP1e1fk6LvO1xqFi+MJ8t87E1M
	vkhc0huNTfe9RHc76IRGJih7B13tq/0llbyZmAc1uaAuI1B7cOiOeGtohayGK8cAeFCx7bSldXJRN
	m0RfzcueyW1X2Wj/U16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJgo-00000000JFp-0Rxx;
	Mon, 30 Sep 2024 16:56:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJgl-00000000JF7-3H3C
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 16:56:00 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJgk-0003Lj-HV; Mon, 30 Sep 2024 18:55:58 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 30 Sep 2024 18:55:56 +0200
Subject: [PATCH] reset: amlogic: Fix small whitespace issue
MIME-Version: 1.0
Message-Id: <20240930-reset-align-amlogic-v1-1-f64ed5c4efc1@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIABvY+mYC/x3MQQqAIBBA0avErBtQk6KuEi3EJhswDY0IwrsnL
 d/i/xcyJaYMU/NCopszx1Ah2wbsboIj5LUalFBajJ3ARJkuNJ5dQHP46NiiXbUYeiu1kgS1PBN
 t/PzXeSnlAwv2GFZlAAAA
X-Change-ID: 20240930-reset-align-amlogic-cd4076c1421e
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15-dev-dedf8
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_095559_854587_539CF2E9 
X-CRM114-Status: UNSURE (   9.48  )
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

Fix a checkpatch --strict issue:

  CHECK: Alignment should match open parenthesis
  #48: FILE: drivers/reset/amlogic/reset-meson-common.c:48:
  +static int meson_reset_level(struct reset_controller_dev *rcdev,
  +			    unsigned long id, bool assert)

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/amlogic/reset-meson-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
index a7b1b250a64dbf94530d06138f4270fff8f56d7a..38a767c06fc71b6dd8a998958b20592499db3c8a 100644
--- a/drivers/reset/amlogic/reset-meson-common.c
+++ b/drivers/reset/amlogic/reset-meson-common.c
@@ -45,7 +45,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 }
 
 static int meson_reset_level(struct reset_controller_dev *rcdev,
-			    unsigned long id, bool assert)
+			     unsigned long id, bool assert)
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);

---
base-commit: 5b93105afcdcdb94d654f253850c5432555b283e
change-id: 20240930-reset-align-amlogic-cd4076c1421e

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
