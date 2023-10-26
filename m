Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9867EC25B48
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3ybI0OC6HDh9FH39Qvs48bySqz9I3MWnEmmvEcLSss=; b=MVxFmA7Hwlc46w
	yRlY3I67lV+/0r0dKGcqkRfdmwvMLFaH8/YBGJ/mqie5whgADORa+CDgVqzKRAy5LqcrH6X6ZCR7u
	Pl042gtNWe5kdsd7XNzKV6DvJpJxfA1WwsTY6HaTk6AhzPIiI+GQ7AG1/W1AwEyOH62Lh0HXJRtFZ
	o6y2RVrZROtZYH1Z/U84MkD3falxjeEJQbQfPMzNAb+dCm6/sAFlwRYoBPxDgGJIe0aNmPJUyyO58
	4LfPjhDLnWc1JVLmVxXeZBrGhIb3nxeEun6RxukuJYNembxqGmJVQq1gdrEFdheCX5+F3Ett+7gck
	ELl6BQlF6t0zXMEp6aTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRt-00E9bK-03;
	Thu, 26 Oct 2023 10:18:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRp-00E9Xi-0J
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 10:18:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-0002nf-A9; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-004O1u-S9; Thu, 26 Oct 2023 12:18:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-006XTy-IX; Thu, 26 Oct 2023 12:18:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 1/3] media: meson-ir-tx: Convert to use devm_rc_register_device()
Date: Thu, 26 Oct 2023 12:18:18 +0200
Message-ID: <20231026101816.2460464-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+gu7PsQ78lu/drAjNNP19vItgRnGPLGh6eKbIvernDA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzq2KqF2O8O/rskyEMRysHku4n4pOk8KXFCf x5HpCgkY2+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86gAKCRCPgPtYfRL+ TvcRB/4rd+V6XNLjuRxwdcLJzw6xCKG9UDWs9T7/yj4zrqlxcGZDbpiAgoR0NshP2YXVzc28tcg nMkrVP+xy+gPgdzIkp6lG/BQOIVXNKyzIFuXbKyPbDZi+TTiii8eTN+sjhpGxDQoEpm4Wc0FvTG QwdiGSEsaqXli4ufKoD7r1kNtgm6qNO8dd7nsrLrMwEWfCsaO7eEzGRxU19H3NxCsszezhpgsjz WRNBDqFt5MJRyr90G/REyOgox+5Vq8df9PPfZGMA9HCJihiBk6d7yR7z8YOZXDwKvQyITPgyg6e n1+KIp6zEp+chcq+jd352FCoYHJ+OkkOX4kFAJxY2K46IXmL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_031841_132287_BBCEEF59 
X-CRM114-Status: GOOD (  13.32  )
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

V2l0aCB0aGF0IHRoZSByZW1vdmUgY2FsbGJhY2sgY2FuIGdvIGF3YXkgYW5kIGFsc28gc2V0dGlu
ZyBkcml2ZXIgZGF0YQpiZWNvbWVzIHN1cGVyZmx1b3VzLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L21lZGlhL3JjL21lc29uLWlyLXR4LmMgfCAxMiArLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9yYy9tZXNvbi1pci10eC5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCmlu
ZGV4IDYzNTViNzk4OTNmYi4uZGFiNTQ4ZGM2MzAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlh
L3JjL21lc29uLWlyLXR4LmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCkBA
IC0zNjAsMjUgKzM2MCwxNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtZXNvbl9pcnR4X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmMtPnNfdHhfY2FycmllciA9IG1lc29uX2ly
dHhfc2V0X2NhcnJpZXI7CiAJcmMtPnNfdHhfZHV0eV9jeWNsZSA9IG1lc29uX2lydHhfc2V0X2R1
dHlfY3ljbGU7CiAKLQlyZXQgPSByY19yZWdpc3Rlcl9kZXZpY2UocmMpOworCXJldCA9IGRldm1f
cmNfcmVnaXN0ZXJfZGV2aWNlKGRldiwgcmMpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIo
ZGV2LCAicmNfZGV2IHJlZ2lzdHJhdGlvbiBmYWlsZWRcbiIpOwogCQlyY19mcmVlX2RldmljZShy
Yyk7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcmMp
OwotCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIG1lc29uX2lydHhfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCi17Ci0Jc3RydWN0IHJjX2RldiAqcmMgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQotCXJjX3VucmVnaXN0ZXJfZGV2aWNlKHJjKTsKLX0KLQog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25faXJ0eF9kdF9tYXRjaFtdID0g
ewogCXsKIAkJLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLWlyLXR4IiwKQEAgLTM4
OCw3ICszNzksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9pcnR4
X2R0X21hdGNoW10gPSB7CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtZXNvbl9pcnR4X2R0X21h
dGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25faXJ0eF9wZCA9IHsK
LQkucmVtb3ZlX25ldyA9IG1lc29uX2lydHhfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1l
ID0gRFJJVkVSX05BTUUsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG1lc29uX2lydHhfZHRfbWF0Y2gs
Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
