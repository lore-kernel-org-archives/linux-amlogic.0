Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE1C6FD19
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YwXeAzh8oBaVu9EpbuRm2Wa41NXFv7ZW8pD2x3hkOZ8=; b=eLtLt1vy30gMXS
	Rj8nQ3+XWeeNiaMjc6wU9rLx2OuilBmCS3cG2+iVfeXHUT3DEmCXB5KfWcKbj12X4dEn+TxqRgYE9
	Ee6aLfXc/+Y59kMWqeGMadaLBSkWGsi/J63vjdLDiR4OWklBk2RhyMuWVFV2y4QGNn+51vcx1g0Hq
	fclH8NPjH3sq+ubT+pDD6lGgtxGqAC6u05QzSmT7+ZCptoyQwX9VQ5gcj32wn4nVBll1jelWSFjjw
	cQsQe/yHcDEwhAVzod4B4ViegHtMtHcx/RAIxkLvp8UB4AV3LcGSC1r+Ib4CM29fVAJ9BxJOo4B+c
	MZdvqmOMfTNt2P5a9+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paiCF-00Fsvx-MT; Fri, 10 Mar 2023 19:14:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paiC7-00Fstu-DR
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 19:14:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paiC0-00039I-AU; Fri, 10 Mar 2023 20:14:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paiBz-003F4t-1o; Fri, 10 Mar 2023 20:14:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paiBy-003s90-C1; Fri, 10 Mar 2023 20:14:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Munehisa Kamata <kamatam@amazon.com>,
	kernel@pengutronix.de
Subject: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
Date: Fri, 10 Mar 2023 20:14:05 +0100
Message-Id: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AkvlThN+cI4a7dkV/VVfPk4VyPpzaAaoFocdrcBpL8w=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkC4F69olWoJ7Ed8sEbDh/GIath8w3HSWFxFiab mqyHO9+FZqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAuBegAKCRDB/BR4rcrs Cd1cCACRuq4c1vOJc5h+ju5vADCJKzKpVpiaqj7YLKTdWqMgE2/XsTqcRN7wE1LuoYXAj/cD/kI JEhpkS/9pfiN6KggwQnUPcv6eqw2hHGodfX6WMxbTAN/1iOI2fPWWTs8jK8XrQFZJJsLaa/DEav bPbvFVeAfaHXy/Qb7HM6J6grZZB1HA0IuLz8uW/jAi6hvMiAtCNrdSLXKTw+BxhF3RSd2aHD9DU LDlFiybwK6hYAIknDz6VkMG2GAduKOc8Ky8XcQWZXZ8LHggcDCNJL1Jg6uVlHv0c6ljmGCPfn/i JsNZZvcnjzmHzgNcjakO23YJoNWJ51LwDaMvKmhWHdDp72tz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_111423_461692_51A0E4C6 
X-CRM114-Status: GOOD (  16.38  )
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

VGhlIGRyaXZlciBvbmx5IHN1cHBvcnRzIG5vcm1hbCBwb2xhcml0eS4gQ29tcGxldGUgdGhlIGlt
cGxlbWVudGF0aW9uIG9mCi5nZXRfc3RhdGUoKSBieSBzZXR0aW5nIC5wb2xhcml0eSBhY2NvcmRp
bmdseS4KClRoaXMgZml4ZXMgYSByZWdyZXNzaW9uIHRoYXQgd2FzIHBvc3NpYmxlIHNpbmNlIGNv
bW1pdCBjNzNhMzEwNzYyNGQKKCJwd206IEhhbmRsZSAuZ2V0X3N0YXRlKCkgZmFpbHVyZXMiKSB3
aGljaCBzdG9wcGVkIHRvIHplcm8taW5pdGlhbGl6ZQp0aGUgc3RhdGUgcGFzc2VkIHRvIHRoZSAu
Z2V0X3N0YXRlKCkgY2FsbGJhY2suIFRoaXMgd2FzIHJlcG9ydGVkIGF0Cmh0dHBzOi8vZm9ydW0u
b2Ryb2lkLmNvbS92aWV3dG9waWMucGhwP2Y9MTc3JnQ9NDYzNjAgLiBXaGlsZSB0aGlzIHdhcyBh
bgp1bmludGVuZGVkIHNpZGUgZWZmZWN0LCB0aGUgcmVhbCBpc3N1ZSBpcyB0aGUgZHJpdmVyJ3Mg
Y2FsbGJhY2sgbm90CnNldHRpbmcgdGhlIHBvbGFyaXR5LgoKVGhlcmUgaXMgYSBjb21wbGljYXRp
bmcgZmFjdCwgdGhhdCB0aGUgLmFwcGx5KCkgY2FsbGJhY2sgZmFrZXMgc3VwcG9ydApmb3IgaW52
ZXJzZWQgcG9sYXJpdHkuIFRoaXMgaXMgbm90IChhbmQgY2Fubm90KSBiZSBtYXRjaGVkIGJ5Ci5n
ZXRfc3RhdGUoKS4gQXMgZml4aW5nIHRoaXMgaXNuJ3QgZWFzeSwgb25seSBwb2ludCBpdCBvdXQg
aW4gYSBjb21tZW50CnRvIHByZXZlbnQgYXV0aG9ycyBvZiBvdGhlciBkcml2ZXJzIGZyb20gY29w
eWluZyB0aGF0IGFwcHJvYWNoLgoKRml4ZXM6IGMzNzViY2JhYWJkYiAoInB3bTogbWVzb246IFJl
YWQgdGhlIGZ1bGwgaGFyZHdhcmUgc3RhdGUgaW4gbWVzb25fcHdtX2dldF9zdGF0ZSgpIikKUmVw
b3J0ZWQtYnk6IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24uY29tPgpTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgot
LS0KSGVsbG8sCgpzaW1pbGFyIHRvIHRoZSBwYXRjaGVzIGZvciBmb3VyIG90aGVyIGRyaXZlcnNb
MV0sIEkgdGhpbmsgd2Ugc2hvdWxkCmFwcGx5IHRoaXMgcGF0Y2ggYXMgYSBmaXguCgpCZXN0IHJl
Z2FyZHMKVXdlCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdtLzIwMjMwMjI4
MTM1NTA4LjE3OTg0MjgtMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUKCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jCmluZGV4IDE2ZDc5Y2E1ZDhmNS4uNWNkN2I5MDg3MmM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYworKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwpA
QCAtMTYyLDYgKzE2MiwxMiBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBtZXNv
bl9wd20gKm1lc29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWR1dHkgPSBzdGF0ZS0+ZHV0
eV9jeWNsZTsKIAlwZXJpb2QgPSBzdGF0ZS0+cGVyaW9kOwogCisJLyoKKwkgKiBOb3RlIHRoaXMg
aXMgd3JvbmcuIFRoZSByZXN1bHQgaXMgYW4gb3V0cHV0IHdhdmUgdGhhdCBpc24ndCByZWFsbHkK
KwkgKiBpbnZlcnRlZCBhbmQgc28gaXMgd3JvbmdseSBpZGVudGlmaWVkIGJ5IC5nZXRfc3RhdGUg
YXMgbm9ybWFsLgorCSAqIEZpeGluZyB0aGlzIG5lZWRzIHNvbWUgY2FyZSBob3dldmVyIGFzIHNv
bWUgbWFjaGluZXMgbWlnaHQgcmVseSBvbgorCSAqIHRoaXMuCisJICovCiAJaWYgKHN0YXRlLT5w
b2xhcml0eSA9PSBQV01fUE9MQVJJVFlfSU5WRVJTRUQpCiAJCWR1dHkgPSBwZXJpb2QgLSBkdXR5
OwogCkBAIC0zNTgsNiArMzY0LDggQEAgc3RhdGljIGludCBtZXNvbl9wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJc3RhdGUtPmR1
dHlfY3ljbGUgPSAwOwogCX0KIAorCXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JN
QUw7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4zOS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
