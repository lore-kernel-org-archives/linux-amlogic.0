Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8751DC77B75
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 May 2023 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeGMh0/LxjmqFfboeqNAeBjAlB5rK8JAI+LtQwfehcE=; b=b7OD1085UA3hNo
	DeFlHFaQqt9xhajJQkH80LrRMJTxOEKvJZ1gSCipt2rt/uPBUHvDeH+emRdqIIVJBlFxnpAyJQdEM
	gth45YiLiUCeEYaSi7Bkk+3EkfwQAKnoUbCql9qf3foyTGJQ0b9fcmAKCm6tXbMBfA30gryeMD1H8
	9AGUSXGpsEHN7xIWafVZj+cAFsUXmaQWbEyG/DNA85To5nvO01yKDvV9AirGw9C2/9XHnFxg80Uw5
	i09xCsSMd2+md+gTd2rSNv6wmCSyMIXBLy7RB9Nq4xU2qIBlu6UQvENETaF+f5EUc5RJLcPrhQghu
	O8OAJLL5e8FGGHzbpbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhEI-00GNJx-0y;
	Sun, 07 May 2023 16:27:22 +0000
Received: from [2001:67c:670:201:290:27ff:fe1d:cc33] (helo=metis.ext.pengutronix.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhDs-00GNAU-0t
	for linux-amlogic@lists.infradead.org;
	Sun, 07 May 2023 16:27:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDZ-000261-JT; Sun, 07 May 2023 18:26:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDY-001nDd-7W; Sun, 07 May 2023 18:26:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDX-002Ahf-Es; Sun, 07 May 2023 18:26:35 +0200
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
Subject: [PATCH 30/53] drm/meson: Convert to platform remove callback returning void
Date: Sun,  7 May 2023 18:25:53 +0200
Message-Id: <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IZ1twIv1uwI4nJItBoYCOFI4DD6dXrwGi4YZz9Kqntg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EGtCz+Z+paG2IRQDn3Y9px5icvZXFwIT9C2 Zv/052ExLCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRBgAKCRCPgPtYfRL+ TuTsCACDzyIP6EDyD1EIHbH5PLni2fmWs+TgQvYA/thWExLjGojBx7/CxfpjLhVJV9KLBYT+zJV VbJvmjvqyLuanVmMp14qIrP6iobjyMNL7w2no5r3Du8juur9Z9lFss96NcQN6cSrKBxgwr4aLUy Vw2rAhKbAuK60JWGJ8VtJZNhE9HS9VYnrtIxzGL2aiNBktPB8GF0xrXpbxBbsXx0d2vsYptnhqQ DXeyqxuvUqcCkBIUDAV6R+rPuKYD+xgRPQn5q2QjapWLDDaokJtbRA300lmFSsFwEe56Ml6hVkD 9bOmchl+Fil/PWoRaZUTGnuEm8uQbGH3wjdh3xOuh3QTtdJx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_092656_337424_DD8B5E6D 
X-CRM114-Status: GOOD (  14.44  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgbWVzb24gZHJtIGRyaXZlcnMgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlCnJl
bW92ZSBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICB8IDYgKystLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgNiArKy0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kcnYuYwppbmRleCA3Y2FmOTM3YzNjOTAuLmVkYWFmOWNlNWIxYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9kcnYuYwpAQCAtNTAwLDExICs1MDAsOSBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfTsKIAotc3Rh
dGljIGludCBtZXNvbl9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitz
dGF0aWMgdm9pZCBtZXNvbl9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiB7CiAJY29tcG9uZW50X21hc3Rlcl9kZWwoJnBkZXYtPmRldiwgJm1lc29uX2Rydl9tYXN0ZXJf
b3BzKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IG1lc29uX2RybV9tYXRjaF9k
YXRhIG1lc29uX2RybV9neGJiX2RhdGEgPSB7CkBAIC01NDQsNyArNTQyLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkZXZfcG1fb3BzIG1lc29uX2Rydl9wbV9vcHMgPSB7CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2RybV9wbGF0Zm9ybV9kcml2ZXIgPSB7CiAJLnByb2Jl
ICAgICAgPSBtZXNvbl9kcnZfcHJvYmUsCi0JLnJlbW92ZSAgICAgPSBtZXNvbl9kcnZfcmVtb3Zl
LAorCS5yZW1vdmVfbmV3ID0gbWVzb25fZHJ2X3JlbW92ZSwKIAkuc2h1dGRvd24gICA9IG1lc29u
X2Rydl9zaHV0ZG93biwKIAkuZHJpdmVyICAgICA9IHsKIAkJLm5hbWUJPSAibWVzb24tZHJtIiwK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCmluZGV4IDNkMDQ2ODc4Y2U2Yy4uNDEx
MjE5ZDUzYjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRt
aS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKQEAgLTg1Miwx
MSArODUyLDkgQEAgc3RhdGljIGludCBtZXNvbl9kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIGNvbXBvbmVudF9hZGQoJnBkZXYtPmRldiwgJm1lc29u
X2R3X2hkbWlfb3BzKTsKIH0KIAotc3RhdGljIGludCBtZXNvbl9kd19oZG1pX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25fZHdfaGRtaV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAljb21wb25lbnRfZGVsKCZwZGV2
LT5kZXYsICZtZXNvbl9kd19oZG1pX29wcyk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBkZXZfcG1fb3BzIG1lc29uX2R3X2hkbWlfcG1fb3BzID0gewpAQCAtODc5LDcg
Kzg3Nyw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX2R3X2hkbWlfb2ZfdGFibGUp
OwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9kd19oZG1pX3BsYXRmb3Jt
X2RyaXZlciA9IHsKIAkucHJvYmUJCT0gbWVzb25fZHdfaGRtaV9wcm9iZSwKLQkucmVtb3ZlCQk9
IG1lc29uX2R3X2hkbWlfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbWVzb25fZHdfaGRtaV9yZW1v
dmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCQk9IERSSVZFUl9OQU1FLAogCQkub2ZfbWF0Y2hf
dGFibGUJPSBtZXNvbl9kd19oZG1pX29mX3RhYmxlLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
