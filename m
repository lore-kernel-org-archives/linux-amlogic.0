Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6ACC001B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy5+qcQPzejo93/KGnwsSdLedcZQDIBQYRdUVFyzFOc=; b=YwV7xmTaRbPUWN
	bx9sTpVwieu4kiz/SZp6kEILiC3Al2Cl0t6yJ+9C75p5Jo+MX0NcwEsvEeR1V1xCjf/q2YSj7jryz
	gCxwUXBCCJXZA2wTykDAvufs84POkcbSLGgYIYX4wzZ6D2JYLGx8EEInWmFNxsM2a5Xg/YJoAJL+t
	xM7jSkX12IPDIaFKuU8GB7eQfaPWifpcoKWhJDu4wjXqb8T79DZlR+OEoqU5Vqzk5m+Gt5mLu3Ml/
	1NeewUrwvIhA99h7Hc/tRnYzjP92Bmn/RHmG4ChFFFZpuZt9i5CdzQhVG0faWwk7RfpHieKi8dnjD
	kGbezq1wxO9NmD3ZLClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWRL-00H5C7-2x;
	Wed, 12 Jul 2023 09:47:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWRI-00H58n-2k
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jul 2023 09:47:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRC-0001Lq-RO; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRC-00Dr4c-11; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRB-004GTG-9b; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH RFC v1 22/52] drm/meson: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:32 +0200
Message-Id: <20230712094702.1770121-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=T9q2HXZEW7FDLneroBJCnnqx5xfQev4NtPEI3hay5+I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZv8rVAP69vqAp1qjsT4fg5haYABwGWUz6Ao h5s7UcAOKmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52bwAKCRCPgPtYfRL+ TvsTB/9CXW6h33zDZLUa1e98TE1WPSWIXhTswX02ruQ/rLzZktJf/hnFPzNO43FOy2fjkv0l1HO cU5VRVSWZQk2ztfY3LFXO8O9DZPXMV9IKA6kxeguJ1yDZg8FXXOoj/+hJsTaL4PdC8akazeherg Ssr4gPTR0MHv5wJzy7d23opoyp7QBAGdqZQAWk0gb94QhvP8x3U5cRtFO86itZV0M36SywlRWPz UdvWkkrZJD/GKO+1Z+Vtx02KB8T0lNNnrNGsT5LRZk4aSIs4iBPqxEAM2am0J/6e38yi/e0W3FD frVNciYnTeGg33lmrhgc/J9WpdszEt1vjDEkb9FMp6X6N62C
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_024716_911120_7CB06AF0 
X-CRM114-Status: GOOD (  11.39  )
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

UHJlcGFyZSBkcm9wcGluZyB0aGUgYWxpYXMgImRldiIgZm9yIHN0cnVjdCBkcm1fY3J0Yzo6ZHJt
X2Rldi4gImRybV9kZXYiCmlzIHRoZSBiZXR0ZXIgbmFtZSBhcyAiZGV2IiBpcyB1c3VhbGx5IGEg
c3RydWN0IGRldmljZSBwb2ludGVyLgoKTm8gc2VtYW50aWMgY2hhbmdlcy4KClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYyB8IDEyICsrKysrKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2NydGMuYwppbmRleCBkNzA2MTZkYThjZTIuLjRiYzA4MmU0NWVkMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fY3J0Yy5jCkBAIC0xNjIsOSArMTYyLDkgQEAgc3RhdGljIHZv
aWQgbWVzb25fZzEyYV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IAlwcml2LT52aXUudmQxX2NvbW1pdCA9IGZhbHNlOwogCiAJaWYgKGNydGMtPnN0YXRlLT5ldmVu
dCAmJiAhY3J0Yy0+c3RhdGUtPmFjdGl2ZSkgewotCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYt
PmV2ZW50X2xvY2spOworCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5kcm1fZGV2LT5ldmVudF9sb2Nr
KTsKIAkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50
KTsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOworCQlzcGluX3Vu
bG9ja19pcnEoJmNydGMtPmRybV9kZXYtPmV2ZW50X2xvY2spOwogCiAJCWNydGMtPnN0YXRlLT5l
dmVudCA9IE5VTEw7CiAJfQpAQCAtMTkyLDkgKzE5Miw5IEBAIHN0YXRpYyB2b2lkIG1lc29uX2Ny
dGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJICAgIHByaXYtPmlv
X2Jhc2UgKyBfUkVHKFZQUF9NSVNDKSk7CiAKIAlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50ICYmICFj
cnRjLT5zdGF0ZS0+YWN0aXZlKSB7Ci0JCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRf
bG9jayk7CisJCXNwaW5fbG9ja19pcnEoJmNydGMtPmRybV9kZXYtPmV2ZW50X2xvY2spOwogCQlk
cm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOwotCQlz
cGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7CisJCXNwaW5fdW5sb2NrX2ly
cSgmY3J0Yy0+ZHJtX2Rldi0+ZXZlbnRfbG9jayk7CiAKIAkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0g
TlVMTDsKIAl9CkBAIC0yMDksOSArMjA5LDkgQEAgc3RhdGljIHZvaWQgbWVzb25fY3J0Y19hdG9t
aWNfYmVnaW4oc3RydWN0IGRybV9jcnRjICpjcnRjLAogCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQp
IHsKIAkJV0FSTl9PTihkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpICE9IDApOwogCi0JCXNwaW5f
bG9ja19pcnFzYXZlKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKKwkJc3Bpbl9sb2Nr
X2lycXNhdmUoJmNydGMtPmRybV9kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKIAkJbWVzb25fY3J0
Yy0+ZXZlbnQgPSBjcnRjLT5zdGF0ZS0+ZXZlbnQ7Ci0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmNydGMtPmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOworCQlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZjcnRjLT5kcm1fZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7CiAJCWNydGMtPnN0YXRlLT5ldmVu
dCA9IE5VTEw7CiAJfQogfQotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
