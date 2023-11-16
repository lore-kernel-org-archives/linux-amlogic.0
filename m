Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62414C5ACB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Nov 2023 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/uc1GOh1ZKcHQ2Vm0u0MKoaL7ZdVNujEx6Ykv5lw0I=; b=uGTDy+cA7k3NPg
	EHznh35c1kdEl9hOeVORnH7Vs6WWsYJV0Dcae7IthjvL6/imXWak5KmTtMwFv/73CPPgy8TmoZ6Ss
	00ZhV0Cgrer7ovhrFLXjEpkpi6VF99dwDnwjvT8oSIaRrOHy18mAIdSumUBP39McZnPfe5qYRfVp1
	oA0YAqpXzkXB11riAbzUQHZ9jJ+yKgjz5jldy/MHc755PmoyO9XqMAMd1DpZN46ZPGriCcMVCvpct
	UolX1do18S7NRBoUYEm/LurwYXpQakQUJTT3qREdrJTWVSnzDsXWpNKa+0Rw962dB1ckj7pjHVYxC
	4S0jUCxyG7X7LFDQVJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWY-003EXY-20;
	Thu, 16 Nov 2023 11:27:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWU-003ETZ-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Nov 2023 11:27:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWH-00084B-AI; Thu, 16 Nov 2023 12:26:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-009RE3-D5; Thu, 16 Nov 2023 12:26:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-002aLs-3s; Thu, 16 Nov 2023 12:26:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/2] thermal: amlogic: Two cleanups
Date: Thu, 16 Nov 2023 12:26:34 +0100
Message-ID: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=488; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1W289yYk/64muKBz1G6Qv0Lggh4SPXvmUP3B6/ALE6w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtTQP1mLJVh/8IfMuq6nYOK3wFdxg3rRl+K+Fy9VpsUdb DNWj1jTyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEllax/w/S57c6tbVUdWs+ i4TGmZ13t/+LMWzem1Iz4RiT0pNn1gG3BGv/8B7XVV/0JCnd/GTbkmxt19SDrSHZRfbiuWbGRxf 4Zp+RiXtuFb95n9XOZy8MVBemXWd5uWWpg6PE3+Lvk8W1tYwOpf1OVV9soX/yoW3z1YOtVas+rD vQ5VLAVT7r6a6i0C1VrxexL83xCZR4Z7J2ZpyAlO3mxtNPqxYx34lYvfROmE2azLGN7c6GxS9Oh /lrP8wo8Jy72XFCasu02XNFfjF6nmd8FXm+Tf3H58iSKHsJrdL3k5t5ok8laOw916c6bdvihXVy f/5dKNvdms08NaW9qzVFdoGmwsGXLkyXYqRcNNiEeLV6AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_032702_125776_DA67CE9B 
X-CRM114-Status: UNSURE (   5.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp3aGlsZSByZWJhc2luZyBteSBwYXRjaCBzdGFjayB0byB2Ni43LXJjMSBJIHNwb3R0
ZWQgdGhlc2UgdHdvIHBhdGNoCm9wcG9ydHVuaXRpZXMgZm9yIHRoZSBhbWxvZ2ljIHRoZXJtYWwg
ZHJpdmVyLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgogIHRoZXJt
YWw6IGFtbG9naWM6IE1ha2UgYW1sb2dpY190aGVybWFsX2Rpc2FibGUoKSByZXR1cm4gdm9pZAog
IHRoZXJtYWw6IGFtbG9naWM6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1
bmN0aW9ucwoKIGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyB8IDE5ICsrKysrKysr
KystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKYmFzZS1jb21taXQ6IGYzMTgxN2NiY2Y0OGQxOTFmYWVlN2NlYmZiNTkxOTdkMjA0OGNk
NjQKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
