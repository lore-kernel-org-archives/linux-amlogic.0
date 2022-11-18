Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2205C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAAtT/3MR9XL4SOkfA9o5Hi5KySIXiP6NZ3En6cmJmM=; b=cG98ZYX7rIq4ZN
	DLGa4chNkc8G/8sjwxTe0M1LjisQ8QQqeda4D7/yMc0Vb0v8fcGpMUw45osS4zUUAabRmLaOK7/YU
	kFJPFTQFYDezXEowEElh7P6YQrCia1W185Gaw6kMKDG65u0K09p9qZownHDUlOoM2BWjqYUsHs6EI
	ZKvWaoEpZEKFwes3AnRT1mIuDFA/qGuc15h1GUyUcWUJw5d1dZ5Zm/YmTAiJqxMCM7kqn15T97ZHU
	qEN5ILHiHZMKxP8qfsqjKYKDBIrsplBAuV6irUnXn0ZZvXm9x95E1Q7gIdJNd5P3eJLJlI3NE/QvH
	vsBQWJOHegXEFtCNpkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owAAJ-008rlf-MR; Fri, 18 Nov 2022 22:48:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owA9L-008qpj-Bg
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 22:47:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9G-00046g-5Y; Fri, 18 Nov 2022 23:47:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9D-0058gg-SI; Fri, 18 Nov 2022 23:47:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9C-0000Kk-4g; Fri, 18 Nov 2022 23:47:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:42:45 +0100
Message-Id: <20221118224540.619276-432-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_144755_517244_B1BAE7F8 
X-CRM114-Status: GOOD (  13.55  )
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IG1ha2UgdXNlIG9mIHRoZSBpMmNfZGV2aWNlX2lk
ICogcGFyYW1ldGVyIHNvIGl0CmNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZk
L2toYWRhcy1tY3UuYyBiL2RyaXZlcnMvbWZkL2toYWRhcy1tY3UuYwppbmRleCBmM2Q0MTg4MTA2
OTMuLjczMzhjYzE2ZjMyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCisr
KyBiL2RyaXZlcnMvbWZkL2toYWRhcy1tY3UuYwpAQCAtODQsOCArODQsNyBAQCBzdGF0aWMgc3Ry
dWN0IG1mZF9jZWxsIGtoYWRhc19tY3VfY2VsbHNbXSA9IHsKIAl7IC5uYW1lID0gImtoYWRhcy1t
Y3UtdXNlci1tZW0iLCB9LAogfTsKIAotc3RhdGljIGludCBraGFkYXNfbWN1X3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQsCi0JCSAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9p
ZCAqaWQpCitzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCkKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7CiAJc3RydWN0IGto
YWRhc19tY3UgKmRkYXRhOwpAQCAtMTM1LDcgKzEzNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2Ry
aXZlciBraGFkYXNfbWN1X2RyaXZlciA9IHsKIAkJLm5hbWUgPSAia2hhZGFzLW1jdS1jb3JlIiwK
IAkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGtoYWRhc19tY3Vfb2ZfbWF0Y2gpLAog
CX0sCi0JLnByb2JlID0ga2hhZGFzX21jdV9wcm9iZSwKKwkucHJvYmVfbmV3ID0ga2hhZGFzX21j
dV9wcm9iZSwKIH07CiBtb2R1bGVfaTJjX2RyaXZlcihraGFkYXNfbWN1X2RyaXZlcik7CiAKLS0g
CjIuMzguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
