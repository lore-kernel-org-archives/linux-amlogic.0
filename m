Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4768AC64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AFF2151B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mn/8Ztkq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EstpTfjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AFF2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRR4fHS9Z8MLSJTDwN1XPZy+0rFOf1brbKzrp4pxEMM=; b=Mn/8Ztkqg7ms66dXQe94p4ES7w
	5VZMK/VrFHp8T2Pa4aXf0SGi3rkbt8DsNu/c1qBuJAkmhFjGj8ZseFeTc+94BPMKffS4mvLPt03Dm
	9VzeFEl3Zmb4FGhcRN7OE/qVrKbF0Ub4yANelbETtgHzYD7UxjwVa0xvPBMDTn+YLf2O+BAgsHBJl
	qFxJDwiAZlWnwA1n2/Z0IKRh0Glmf8zaqR4ABgm48tagy4HKjWp+SWmDBeHN1KwIB5gLlc2nIk3vI
	wC4Q18qnFuPHTZ+MUbJY3fuCJol3PaIWijCTXuqH8TxiUCxMStEGxsHVwKxNDOOJ7uJPPKBeYqQnv
	HfMpnoTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkAu5-0001AE-Py; Tue, 01 Dec 2020 19:01:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkAu1-00018x-P5
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 19:01:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id r3so4378902wrt.2
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4db92qgs7Cx19eXkYKoRrrPswVYgwmdMYfhe9hzWuuk=;
 b=EstpTfjBIGANDhV6j9xxplY0OMuMT3mXYXjXGWEmMkfck633Rx5GNrZCx+qvmEMTk+
 30qwQ2p/RMkaS/35v8gblXZPQ5pjuuuXUIHRjbcb/r9Lca2TSWINH0LzI3+v9pUWInbl
 CElsK8saKw913EWsTswc0UYIplLU1szE+p828DOBNswnjYIANOCm/BvG68L4F1O+we93
 X7dAM1fkwe+svPyP9YY6x7ADIGtkL69IQ/GPwVjDdfEtqbl4TT7hnrslBLdpo+TKRQfs
 2GYQE5TPX9j//2LJPbJxHR2IZ+EXn7+czPTTXYag0QyvyZSBDHHjtfEtv/BYbHQSDs01
 fT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4db92qgs7Cx19eXkYKoRrrPswVYgwmdMYfhe9hzWuuk=;
 b=a2DPWyyxo/QZotbLaOOMJ1mMLXDP8inzgLMxAWlWoMV6B/SNO6/NFN4gjzreizdGum
 9Wj/Tn0zqniDV2hBG5N1dkvfgBbiAmw8WFLnNlHk6j/ZtrVlBzTXksyqc+/F6FJZsq4i
 XhBOWNUY7We8qg5I3KviDc5FbxWCaQNImVAAIsDSM048DGysH0tbALQG0NNR37BjkTdu
 wAu9meOUThaVseTnAAXstO3Kk7JEMNRYnN0XMxAREe4pd+8tFXsuHDd8zEiiAX4jDMFj
 qFZuXvxWNZPZTOZBiN0NmzQGFy9vSrO0sOYPs0xnl31YtpalcPq66B/NApyWX9q9jhOt
 Z6DA==
X-Gm-Message-State: AOAM530Fm8J59Y9dkzE0+YI+C9kJ8i9XZsHB+gZmfqrG+pwqWRLD6OD7
 uQS9qgzVmQReCGUSjubkAmy9gA==
X-Google-Smtp-Source: ABdhPJwIXyPn73uqnfcK1Vyo37ATQR99pYmv4e0H6SMMvE1rbDlHUqqJvBW5/a62nbSNYjYvmSUivg==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr5761412wrw.221.1606849288897; 
 Tue, 01 Dec 2020 11:01:28 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:40a4:a590:1da6:9599])
 by smtp.googlemail.com with ESMTPSA id 138sm887733wma.41.2020.12.01.11.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:01:28 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
Date: Tue,  1 Dec 2020 20:01:00 +0100
Message-Id: <20201201190100.17831-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201190100.17831-1-aouledameur@baylibre.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140129_836924_2272F396 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use reset_control_rearm() call if an error occurs in case
phy_meson8b_usb2_power_on() fails after reset() has been called, or in
case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
used and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should
be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v1: [1]
* Moved reset_control_rearm after clk_disable_unprepare to clean things up
in reverse order of initialization for phy: amlogic: meson drivers

IMPORTANT:
This patchset depends on this patch [2], it adds reset_control_rearm() call
to the reset framework API, it has been approved by the maintainer, and
will be applied to reset/next

There is currently an immutable branch with it [3]

[1]: https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylibre.com/
[2]: https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylibre.com/
[3]: git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..651eec41a896 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -154,6 +154,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	ret = clk_prepare_enable(priv->clk_usb_general);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB general clock\n");
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -161,6 +162,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
 		clk_disable_unprepare(priv->clk_usb_general);
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -199,6 +201,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
 				clk_disable_unprepare(priv->clk_usb);
 				clk_disable_unprepare(priv->clk_usb_general);
+				reset_control_rearm(priv->reset);
 				return -EINVAL;
 			}
 		}
@@ -218,6 +221,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
