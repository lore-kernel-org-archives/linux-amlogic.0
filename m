Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70899C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B52C2173E
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLCrQAXA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dBhRX0gX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B52C2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSBtI++r3B4FkzjpBDwKFXlKnFjX/IOCObXSCK/2ACE=; b=NLCrQAXAGjEolK
	JxR6yNkms1vW80hgz1uE9yUc2GUtTbnMJK9X+Eu7bW1rY5mK6e5XSk5yX+Yamnk5N74IIz6WpwVMq
	PcElxWTzZEz+EnBe8Iiyazr9C2w9Am/U62evbe0L2ANGnD1UxRzFUjv3NaELYpysZe/lC880W5fA+
	jDxOSrIAUkqAmrPSYJ7VZfDK4Np3TzkAi5iY7VDBwH5xkBLGcmL8RQRHqC46q/DyGwOTVfOYNOi8Z
	Xu0Fske/EO6Lhn6cBgMBLrGvcFy/ezq4TUQLU2rTnsRv3soKHznFKNZM743ArUOe4A1aWGf/ER1S0
	6xNUKAGToxSJPPxkzN9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT6HO-0007pI-5Q; Tue, 21 May 2019 15:02:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6Gp-0006zN-5T
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 15:01:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id w8so19023948wrl.6
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hya6Oxcm01Zg9a8B2aUxovEoEemSR2xPIYhlXd2pWtI=;
 b=dBhRX0gXkRK36yhJmJO4jLCKNM+dhSO4r2g9ikQxmWnfmxRYoiQtKvh9ZbxkouX2gl
 +cx5mgkB2z2xQN6uLO58FuFN144F7NSwgNEDQUFXZtOAq1+m4ZKCRWuid+5L7KYsE2gf
 m+69+L163qwh7+ASSreFa6vR2pQ9RSwuCMNwjaXibFleucsR1CUVcjN3UlJC7S141rN0
 TpK9VEzSQfhy1GHT5w05aYURLxpZNEqr3gwkBRykRVlZOQXWtjEF/v8MLR4gNnSWJS2u
 jPTJgvreHMn5Y9LI3Ie1nhF2GVJIQdoF/5W+LzEmlEIWLuwEApUiB2sKrcesRUa4wjDU
 kJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hya6Oxcm01Zg9a8B2aUxovEoEemSR2xPIYhlXd2pWtI=;
 b=eU3OPkmCHkhLsVzhNlBo54oQk+jSpViznHxt7j5I3JcEufVdrlLW490KKHppLyd5nQ
 wXrpJr+FH4Wi1l3x9O5QDvipFfWgWW9SwyQhhmdr/eEsV/mm8RJ9a8B7d0SkKMh9wI0G
 3IKfo1H0ucJLpnmW+BSx1H85WEVY7dGyahreFKWL2Iz4ljoTQYqzm7cGX8BA7PYjgwMi
 JJ6alZS8UcLqQ02FVA4n3nJW1jOk3Om04IGViiWA1602cD7UC3PZeF6sqTurMTxff1pW
 LsN3Ug8TRjkVNxr4KxkQuYBhp8cOZsvQmPurE7t1PAOLGJ70rWNxHHZ+Vxc9hECmVGB6
 KEng==
X-Gm-Message-State: APjAAAWGbhnYitPwfq5Dw3dsDzOtK4/XOPMS3PhiyJIb2rqjO7uFoLnO
 qqsgiGTsgrIk2ensM+un6nGfzA==
X-Google-Smtp-Source: APXvYqwXgQlgZURhNNRL21mnF9cPN0R/YHRg8kmGR1/Zp2hUWtmqvfEbm6g5T64mtoUraVddL9g3OA==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr13436681wrm.166.1558450897467; 
 Tue, 21 May 2019 08:01:37 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b194sm3407505wmb.23.2019.05.21.08.01.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 May 2019 08:01:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 3/3] clk: meson: g12a: mark fclk_div3 as critical
Date: Tue, 21 May 2019 17:01:30 +0200
Message-Id: <20190521150130.31684-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521150130.31684-1-narmstrong@baylibre.com>
References: <20190521150130.31684-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_080139_215542_B9D237E0 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

Let's mark this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 81cb38ac3c85..575e58752aff 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1244,6 +1244,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
