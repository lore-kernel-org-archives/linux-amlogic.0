Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ADEC54798
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2024 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=odtYfx939erV5ExD8+EnhnbNxgKzGbxvgvzPwIJCZ4g=; b=X4Z249vLxVCKzF
	5g4jcNeaK5vPW67drxWUe6Jc+LY/9r4mvWL1LIGDvmGHpG/Hj06JMa8XNLK2gnW++BeZoC5SnqD/Z
	eGKPXPRwVkNHiC6ulsVy+P8MW7goMsobwkvtIIkzyL6qys6Ws6h23kKDvcxH8g3SL6M89eZBYI9Nd
	dg2HLVVXEWA72Q4zZ3kkVD8XZQBcUSYYpb3QWnZXWJpDkK6hK0R4HrCSdshno1275Cm54tr3OJUXC
	RPGuk9wKw4DCLic/Tms1rucCDIoTgByMOh3NN9yvzsdKkTkNm3BNPAxoehEe7aNB3XAkVRxBCJ7mV
	F/8pAcpalbI5LI4kV9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcPJ-0000000FKrq-2mWD;
	Tue, 05 Mar 2024 21:33:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcOv-0000000FKkW-2nDV
	for linux-amlogic@lists.infradead.org;
	Tue, 05 Mar 2024 21:32:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOf-0006r4-C4; Tue, 05 Mar 2024 22:32:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOe-004cmE-32; Tue, 05 Mar 2024 22:32:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOd-000ISt-3C;
	Tue, 05 Mar 2024 22:32:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	kernel@pengutronix.de
Subject: [PATCH 0/3] reset: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 22:32:02 +0100
Message-ID: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=l2rCHmnwafa4rvavnT7HtRmxniTVygw6GJI1m6R/+8U=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtTn/cHfv9WntvveOimT7GDR80N7+z8NVmXdxBOrnwbHR 7zWjvPqZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAi1rIcDO18v1PyboSsFzky 29rO+CBLtGLm7vMVsifKUjSMnOTeHGkIv/0g4eASPV5d6fvmB/uWVS71YVaVbgidLyDxeumMD41 fTC90zDgyyUayartLSmeFV8M39eUuTPbTgg5f1cl22NQ+96tp9tvFgjMT/K99UhIxnJ9oHz6nS8 vFU3e71szOmlij3Xnst1Xvy5U8vdi5QGSLZ/a/hreFGU7S1pLrf092f7RymXHejbVecwJ+HpvSp xyvHhmR+WDy3WzLT3k3l9RtYTb3/dD9NFiwyq3lDNO/7jQ/rx9HvrBsz1D4ZNi+JTK8dt6iTpHo DxViabL7Z1htcziy7viexs9bFBoX3mBcO8s1+qWBTm4iAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_133245_340565_E277BF30 
X-CRM114-Status: UNSURE (   6.97  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL3Jlc2V0IHRvIHN0cnVjdApwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gU2Vl
IGNvbW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybToKUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFj
ayB0aGF0IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQKZXhwbGFuYXRpb24gYW5k
IHRoZSBldmVudHVhbCBnb2FsLgoKQWxsIGNvbnZlcnNhdGlvbnMgYXJlIHRyaXZpYWwsIGJlY2F1
c2UgdGhlaXIgLnJlbW92ZSgpIGNhbGxiYWNrcwpyZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9uYWxs
eS4KClRoZXJlIGFyZSBubyBpbnRlcmRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZXNlIHBhdGNoZXMs
IHNvIHRoZXkgY291bGQgYmUKcGlja2VkIHVwIGluZGl2aWR1YWxseS4gQnV0IEknZCBob3BlIHRo
YXQgdGhleSBnZXQgcGlja2VkIHVwIGFsbAp0b2dldGhlciBieSBQaGlsaXBwLgoKQmVzdCByZWdh
cmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDMpOgogIHJlc2V0OiBtZXNvbi1hdWRpby1hcmI6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVz
ZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAogIHJlc2V0OiB0aS1zY2k6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9yZXNldC9yZXNldC1tZXNvbi1h
dWRpby1hcmIuYyAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVzZXQvcmVzZXQtcnpnMmwtdXNicGh5
LWN0cmwuYyB8IDYgKystLS0tCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXRpLXNjaS5jICAgICAgICAg
ICAgfCA2ICsrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQoKYmFzZS1jb21taXQ6IDExYWZhYzE4NzI3NGE2MTc3YTdhYzgyOTk3Zjg2OTFjMGY0
NjllNDEKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
