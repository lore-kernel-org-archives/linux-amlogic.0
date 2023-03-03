Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CC3C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pq7L25guuZrxaY8ERfGMTV4qrB8ytbaBZHwlGYzJ4ok=; b=jppFojR1optdz1
	Dn2wlvHEYrkQsWwCr//omPt2Yj8iH2CAauIn232GZ89j57XKNJpPoK9rO2CZsw0HCFvdyWAfE1B99
	YEACFAk7hJGzeUhuBeLMhgkLigzKXfuj4Y91JDI0fnv6pO77VI6DVTiWzwr7snmuJFDcGidxwQzfR
	bvFLkfdHDs0n1TcKoIN2+5HgT2Jhgw16mdMDKeGMcf13B4C5Gr1kxZnuzt1gp3W2E/FSzwN99n4kG
	UcvjLk5JpRdg0HWRidkolF7NH9IVBMU3AvwkyovHJLqB+MBXFwhTzNo78YJNN6DiqGTSAnz1zGUPW
	zdEEYUCM0I94FumtYR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY97B-006tpU-DV; Fri, 03 Mar 2023 17:22:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95j-006t6e-Kp
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 17:21:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95X-0006jk-PT; Fri, 03 Mar 2023 18:20:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95W-001blH-KZ; Fri, 03 Mar 2023 18:20:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95V-001tk5-UR; Fri, 03 Mar 2023 18:20:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 35/87] spi: meson-spifc: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:49 +0100
Message-Id: <20230303172041.2103336-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V5nExC369g9w2BPhMLN/ksgUEQ4NdUM7PLbWh6nlt/U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiuTxhgFrMMlWot5x24gJMir9kRj+snNI1jGR Z+3CRX7itaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrkwAKCRDB/BR4rcrs CZl0CACI68St2Bf6RIQ770thnASVOLSkjCSsiGDyaF+/7W/w6EbUczZMf3H2nkSuc8ZGECJaO25 fub+Tq8nvXK4i0fJyAkyJ+CfOfvMxSeFKwHw12QQN2O2yxWm95foQXpMlmSFOD87rb8IENFIMcM aQQoVWrlBs5Ot8I+jfZhZBc+jUkY8IcpHzYcOKAvKkA7s3wKXbPsrLIZsLSzra9CMtvfPmMkrJg JNf/mdx+GeL9mx1VUeLScIs2DRDOiLPuLvCbzlV5Iq4QMuoh/ajurf+r2+s0glY3Kxq4TZugzX+ GpFDcSgWwD4LSL7iqc9IEdpIhao0l0FDhXGHF5Z0y/CazkRN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092111_706860_6B802189 
X-CRM114-Status: GOOD (  15.50  )
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
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktbWVzb24tc3BpZmMuYyBiL2RyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGlmYy5jCmluZGV4IGM4
ZWQ3ODE1YzRiYS4uMDY2MjZmNDA2ZjY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVz
b24tc3BpZmMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpZmMuYwpAQCAtMzU1LDcg
KzM1NSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fc3BpZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1lc29uX3NwaWZjX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25fc3Bp
ZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHNwaV9t
YXN0ZXIgKm1hc3RlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBtZXNv
bl9zcGlmYyAqc3BpZmMgPSBzcGlfbWFzdGVyX2dldF9kZXZkYXRhKG1hc3Rlcik7CkBAIC0zNjMs
OCArMzYzLDYgQEAgc3RhdGljIGludCBtZXNvbl9zcGlmY19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlwbV9ydW50aW1lX2dldF9zeW5jKCZwZGV2LT5kZXYpOwogCWNsa19k
aXNhYmxlX3VucHJlcGFyZShzcGlmYy0+Y2xrKTsKIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYt
PmRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19QTV9TTEVFUApAQCAtNDQy
LDcgKzQ0MCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX3NwaWZjX2R0X21hdGNo
KTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fc3BpZmNfZHJpdmVyID0g
ewogCS5wcm9iZQk9IG1lc29uX3NwaWZjX3Byb2JlLAotCS5yZW1vdmUJPSBtZXNvbl9zcGlmY19y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtZXNvbl9zcGlmY19yZW1vdmUsCiAJLmRyaXZlcgk9IHsK
IAkJLm5hbWUJCT0gIm1lc29uLXNwaWZjIiwKIAkJLm9mX21hdGNoX3RhYmxlCT0gb2ZfbWF0Y2hf
cHRyKG1lc29uX3NwaWZjX2R0X21hdGNoKSwKLS0gCjIuMzkuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
