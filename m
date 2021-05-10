Return-Path: <SRS0=5f+e=KF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E61CC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 19:10:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1368461139
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 19:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1368461139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gKfS+ZqPhwZcgmxCQYDn3nmlUIcI0f1tAWfDiGA38mg=; b=BWfzK12L43bTsoGrxIihxVQB1
	CBjjDVZqu8/Y2UZ2nNy8TQtrs5nDrJgDvCBnm48LV5wewEpmNoT11YTwU0l9BnnFLRrHZyCJ3K4iN
	97A91o4iZr/jCngjxQlZh2mmbcA0WNqSpfI8GfL+l382W0qi3t8cwAhN9rXDZ7VTIqf8ZvQDiGUkm
	FsrNPNwoKd1zurdUMxHUyn7D5YlLkwXrPw4M6fK8BdhQo/2MSqBlTLx17zGrnWhHwWWSCcrBNsHiB
	1eXIhYh+6ihlmgM+6sc+MYF2mWYnIgCI3IheBw7tTbZFfivDAFkFO5ToyBrLxoBy3lmU9a2RwzBe9
	KA6yMbhUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgBHx-00FVRO-FU; Mon, 10 May 2021 19:09:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBHu-00FVR3-Cz
 for linux-amlogic@desiato.infradead.org; Mon, 10 May 2021 19:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=POghwcEHgR+BrYrIP4dZE38R/2StYIPNSYU5lSvbKM8=; b=w/zvtE1GNJJ8pKloq/00cdOgmB
 3VaPHMWGZM0QhUj/7b4OnFLi/9jTaBZ9XWcZ2lPWGZVbd0AezJV0GpnVdiT1HPr9MZf3LozPgPBn1
 VKgeYY9YJ2g6kOP4G6sQ1CYXQ5XHwwrRIknpOZ3LfyVDqB/RYZey4vVF8Dwlhu2nru/miGF1QibeW
 /Yatnw1MKNhvWmUratt1bmuv+PhgES3U1ky1Kn5ErPEj8cb0fM/IRhsOtSNwLvFegTQ3TNKu/VHUM
 /QmnmEHyuTTeZ95M+mr25/UpWnLszI7HNeA1MxcN4LwfVwvq8RR3IhWZ8VrcnhAn7ieARv4iYeEZk
 eDLoKsrQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBHr-0093dN-Vq
 for linux-amlogic@lists.infradead.org; Mon, 10 May 2021 19:09:53 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lgBHj-0007Yu-Bt; Mon, 10 May 2021 21:09:43 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lgBHi-0003S1-Tm; Mon, 10 May 2021 21:09:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Romain Perier <romain.perier@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH v2] pwm: meson: Simplify using devm_pwmchip_add
Date: Mon, 10 May 2021 21:09:25 +0200
Message-Id: <20210510190924.990912-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CABgxDoJbnFb+=oSMNrhbBGbFCRZWBQ54Dkyy02YnYm5bveD4gA@mail.gmail.com>
References: <CABgxDoJbnFb+=oSMNrhbBGbFCRZWBQ54Dkyy02YnYm5bveD4gA@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_120952_049508_29DFD600 
X-CRM114-Status: GOOD (  15.15  )
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

U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KLS0tCgpIaSBSb21haW4sCgpPbiBNb24sIE1heSAxMCwgMjAyMSBhdCAwODo0Mjow
N1BNICswMjAwLCBSb21haW4gUGVyaWVyIHdyb3RlOgo+IFRoZSAic3RydWN0IGRldmljZSAqIiBh
cyBmaXJzdCBhcmd1bWVudCBpcyBtaXNzaW5nLCBub3AgPwoKRGFtbiwgeW91J3JlIHJpZ2h0LiBI
ZXJlIGNvbWVzIHYyIGFmdGVyIGVuYWJsaW5nIHRoZSBtZXNvbiBkcml2ZXIgaW4gbXkKdGVzdCAu
Y29uZmlnIDotXAoKQmVzdCByZWdhcmRzClV3ZQoKCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8
IDEyICstLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jCmluZGV4IDllYjA2MDYxM2NiNC4uZmM1YTBhY2I3ZWI5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYworKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24u
YwpAQCAtNTYwLDMxICs1NjAsMjEgQEAgc3RhdGljIGludCBtZXNvbl9wd21fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAot
CWVyciA9IHB3bWNoaXBfYWRkKCZtZXNvbi0+Y2hpcCk7CisJZXJyID0gZGV2bV9wd21jaGlwX2Fk
ZCgmcGRldi0+ZGV2LCAmbWVzb24tPmNoaXApOwogCWlmIChlcnIgPCAwKSB7CiAJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBQV00gY2hpcDogJWRcbiIsIGVycik7CiAJ
CXJldHVybiBlcnI7CiAJfQogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWVzb24pOwot
CiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgbWVzb25fcHdtX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQotewotCXN0cnVjdCBtZXNvbl9wd20gKm1lc29uID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7Ci0KLQlyZXR1cm4gcHdtY2hpcF9yZW1vdmUoJm1lc29uLT5j
aGlwKTsKLX0KLQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fcHdtX2RyaXZl
ciA9IHsKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJtZXNvbi1wd20iLAogCQkub2ZfbWF0Y2hf
dGFibGUgPSBtZXNvbl9wd21fbWF0Y2hlcywKIAl9LAogCS5wcm9iZSA9IG1lc29uX3B3bV9wcm9i
ZSwKLQkucmVtb3ZlID0gbWVzb25fcHdtX3JlbW92ZSwKIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJp
dmVyKG1lc29uX3B3bV9kcml2ZXIpOwogCgpiYXNlLWNvbW1pdDogNmVmYjk0M2I4NjE2ZWM1M2E1
ZTQ0NDE5M2RjY2YxYWY5YWQ2MjdiNQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGZhMzljZDBjODUy
ZDEwOWVkOTU3ZGM0NGRjYTViZGNmNWRmZjA2ODUKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
