Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E60FC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:04:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F8D2098B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0KiZYmJx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8LETQ3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13F8D2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JeueLYv6W9AThL5iMekGeoP1MFYBM29roPjqXSJBSag=; b=0KiZYmJx+6Oc5DmEp4qFmx0TK3
	pKWzx+Dq+Y3wV9hWbVVseLX8PJ9SZxhjho+PrRqvAQ/fvaaKBGNDLa+tfyJSNZz4KR8TQ8MCIETfN
	4yRW3ImySxL3sN2dXnMo8f0ynJtmE4CQf3DPNLrcKe6M4yxe9UB843ShT8HsZy6PIRMPCA61CBuo4
	cXGVLPukRdICe4Miece2DhWfXtBACtmZjNNpEhpSbHGH5OLxZJg6WR5KGkjUd4/Eh2CD5ddGAWEye
	QDrAIgTvFwseeewm95bZt2hanUJQoe9T+0+2lvaW1Duby+GeRBfI+RxPZnzqZ1SOlKEefiiflSbS3
	Y/HRhB9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDUIs-0003Y5-Ix; Wed, 02 Sep 2020 15:04:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDUIq-0003X8-Ro; Wed, 02 Sep 2020 15:04:01 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64C4520773;
 Wed,  2 Sep 2020 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599059040;
 bh=aA+PtX6Nad2JFzWaGrJQ2P+Mkq0OmWZKEB6gRo24RH8=;
 h=From:To:Cc:Subject:Date:From;
 b=u8LETQ3giKPlRcn+a/R/eWqA6GUVG4FAiqFYzmRMqn2vlA5UNNO4H+WwjxOb0g8eq
 hxJeGI+2kXZjju7EZqjBXc+v0aQxSQjU/MShvRjy1dpwcGl3HZ2fXE5lo291Z/ZQ+H
 XHI1KR/Hg7nXMdGRxmZlmXpmZTqUmUHApR6W5ywQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
Date: Wed,  2 Sep 2020 17:03:39 +0200
Message-Id: <20200902150348.14465-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_110400_991031_98629F14 
X-CRM114-Status: GOOD (  12.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The at91sam9g45_pcr_layout is not used so drop it to fix build warning:

  drivers/clk/at91/at91sam9g45.c:49:36: warning:
    'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/at91/at91sam9g45.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index c88ee20bee31..cb4a406ed15d 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -46,13 +46,6 @@ static const struct {
 	{ .n = "pck1",  .p = "prog1",    .id = 9 },
 };
 
-static const struct clk_pcr_layout at91sam9g45_pcr_layout = {
-	.offset = 0x10c,
-	.cmd = BIT(12),
-	.pid_mask = GENMASK(5, 0),
-	.div_mask = GENMASK(17, 16),
-};
-
 struct pck {
 	char *n;
 	u8 id;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
