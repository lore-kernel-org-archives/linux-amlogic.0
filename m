Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C28C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGAkE255Fg6tCUZ4Hx9r1qBxxEFd3Rk3M2Im6lOUaAk=; b=F11uCDZddN3tsM
	i9T0CPzKkl34ogYLJHmUYTvAr8Ow/RskBjxpVMx3pLD8g5Oc0u8zk/Ps/TeDHoIf6DrSm13zrPtEj
	evPLYJhLkVbtfknMdWtf2K66gS6+hwfmhckPjoYHE1Dq0P0IkozCp8so4zq8Reds73BlMEcf89Qvd
	915GeDj+V2pZf9UkNpxevqK0TPXxrVmkXs/nxyrZcFSE+EFYybssm936sefSKAUJt61jPaRrMcPlN
	BzkVUUjhEtQPPRbM8A9GGYGI+q288caoi/MsAPXJ6L8GY6SMoGLiwb+mvQYFJG80R6p0aQTlMvbZf
	eyestU6bevZ0nS3B8+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHve-0020yr-Uk; Thu, 09 Jun 2022 13:10:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHui-0020MK-7o; Thu, 09 Jun 2022 13:09:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE11920009;
	Thu,  9 Jun 2022 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJzo5FQG4ibWZMlX/zfQxIXX/GDZH8AcQv2xHltlkw8=;
	b=bsDgJ6eDagXSkf1cYkwHabVM+QQTcPQ3cVP/lhPSaaVAc4i6K62Lu1NvVgB61HmPVera7n
	Sw78aIwoqEx0YXufQxnhSgX/28LQ1aSrKGbbJaEH7r9N3SnPz2kellcFpsD0hqzBc6OHAX
	vnuXKw/AF2Xc49+7/ywECOnmIdH/OYQmtZV8vd2jpuNownVt8iuAbULWhW5s+iynRjnm3N
	0MDzb8Zt1c8HnXdugH7QAEjK1m+1MpR9oXeUvt4WSTsLMJYyhHJm3v4IG2NteSdVrzptpd
	BLsSdphxlp57Xfl633AAWObJm6T8ZBw1oSpDO5a3vOIxHSxwm/65SRMppF0CGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: kernel@pengutronix.de,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 12/14] mtd: rawnand: meson: Drop cleaning platform data in .remove()
Date: Thu,  9 Jun 2022 15:09:24 +0200
Message-Id: <20220609130924.293164-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-13-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'43adab7fd4131ccdeda7abb9bf66afcfa0915a82'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060928_478964_3E6E0E41 
X-CRM114-Status: UNSURE (   5.25  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjU2IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSBkcml2ZXIgY29yZSBjYXJlcyBmb3IgdW5zZXR0aW5n
IHBsYXRmb3JtIGRhdGEgKHNlZQo+IGRldmljZV91bmJpbmRfY2xlYW51cCgpKSBvbiByZW1vdmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
