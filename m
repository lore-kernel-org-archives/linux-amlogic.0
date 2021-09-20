Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C051C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 07:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1119C60F26
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 07:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1119C60F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xw5Tv1ko5jzHDXirAm/PsQW2eTdC1XY+DXIweTenYj4=; b=HofOvkZf43gDMH
	cv3PpxzDRWAc6r5o+KVa4HzgmluuvAx9d41rdz3i0ND2NfMLkBEU31W5/m7XRlWkrr6VM0mHhcqel
	A7g6daOB+qJwb9q/3RbxAZUcVeEhJIkFG5wobjSDmnZQR5c3eFcnZ6T5IH2jytTmSF5KNlOw/jfmJ
	4VcldGIERQt4l2vKwvrBdOV7U1hQaq2Kkoeb9TYjbvSvfTwxt7swdM0/NADNTKvin2/4V52iuZ8di
	vJ5tI66YyFIvTLWg9JJ6AVbF/dIKQwP8M1AGmyMNf5EETrALFhGeWdLk/nOlnMGA88kyBoun6BEQB
	fALqcg2pj79BThV/JACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSDyd-000oS9-Ji; Mon, 20 Sep 2021 07:44:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSDyO-000oNs-VH
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 07:44:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mSDyH-0005Z1-3J; Mon, 20 Sep 2021 09:44:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mSDyB-0006I1-Up; Mon, 20 Sep 2021 09:44:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mSDyB-0003GO-Te; Mon, 20 Sep 2021 09:44:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2] hwrng: meson - Improve error handling for core clock
Date: Mon, 20 Sep 2021 09:44:05 +0200
Message-Id: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=9tz2phqeN+3GzCEXz8gh5AQWNocdSF32iWo28yTN+xs=;
 m=cX96ziEeAkJuDb6P9w+CtfXmQzh9pdqI3yrnaxyU0x0=;
 p=suObcorQD7ed5z2ooAXD8XsNDOU1xSrXgnghM0cQMIo=;
 g=768da396a3457f83adc357a91eec69259edb1cd1
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFIOx8ACgkQwfwUeK3K7AnlGAf+KXe
 TSs5rrw7D8qxHbKDoi1ko2oXWIpazMMa4tZAhN3jY5JRqeFAwFkVljJALT8c03j5ylsbOgv+pQdxZ
 o5/MJqVr+wRetKulUJcDKc9JIzac8aA0dN0FTlF7/ZCBEnICh+BhtP4MXWD8OiyVAsS6L8y077DIb
 rNXmQFKLJ8j7ckNB39vsRia44FnL9omWskX93xZduLrcvJtOoPOGNtma6s1pZtP1J4RQHiRlP2Kau
 VShxiWEpxgDHeL9MpsP1PdN2kfEFXqYWusn8qAcII2gsZZV+hXIzbPlFXaCDJoBtd0WbO5bsDTno9
 P0NRaxJxuQ8AeQ/EOK3wiPS140RKoEQ==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_004421_048426_5B34994E 
X-CRM114-Status: GOOD (  15.03  )
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

LUVOT0VOVCAoaWUuICJ0aGVyZSBpcyBubyBjbG9jayIpIGlzIGZpbmUgdG8gaWdub3JlIGZvciBh
biBvcHRpb25hbApjbG9jaywgb3RoZXIgdmFsdWVzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgaWdu
b3JlZCBhbmQgc2hvdWxkIGJlCmVzY2FsYXRlZCB0byB0aGUgY2FsbGVyIChlLmcuIC1FUFJPQkVf
REVGRVIpLiBJZ25vcmUgLUVOT0VOVCBieSB1c2luZwpkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKS4K
CldoaWxlIHRvdWNoaW5nIHRoaXMgY29kZSBhbHNvIGFkZCBhbiBlcnJvciBtZXNzYWdlIGZvciB0
aGUgZmF0YWwgZXJyb3JzLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCkhlbGxvLAoKY29tcGFyZWQgdG8gKGltcGxp
Y2l0KSB2MQooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDkxNDE0MjQyOC41NzA5OS0x
LXUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSkKdGhpcyB1c2VkIGRldl9lcnJfcHJvYmUo
KSBhcyBzdWdnZXN0ZWQgYnkgTWFydGluIEJsdW1lbnN0aW5nbC4KCnYxIGdvdCBhICJSZXZpZXdl
ZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiIsIEkgZGlkbid0
IGFkZAp0aGF0IGJlY2F1c2Ugb2YgdGhlIGFib3ZlIGNoYW5nZS4KCihIbW0sIG15IHNldHVwIGlz
IGJyb2tlbiwgdGhlIGI0IHBhdGNoIHNpZ25hdHVyZSB3YXMgZG9uZSBiZWZvcmUgSSBhZGRlZCB0
aGlzCm1lc3NhZ2UuIEkgd29uZGVyIGlmIHRoaXMgd2lsbCBicmVhayB0aGUgc2lnbmF0dXJlIC4u
LikKCkJlc3QgcmVnYXJkcwpVd2UKCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5j
IHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jIGIvZHJp
dmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYwppbmRleCBlNDQ2MjM2ZTgxZjIuLjhiYjMw
MjgyY2E0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYwor
KysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jCkBAIC01NCw5ICs1NCwxMCBA
QCBzdGF0aWMgaW50IG1lc29uX3JuZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmIChJU19FUlIoZGF0YS0+YmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKGRhdGEtPmJhc2Up
OwogCi0JZGF0YS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiY29yZSIpOworCWRhdGEt
PmNvcmVfY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKGRldiwgImNvcmUiKTsKIAlpZiAoSVNf
RVJSKGRhdGEtPmNvcmVfY2xrKSkKLQkJZGF0YS0+Y29yZV9jbGsgPSBOVUxMOworCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZGF0YS0+Y29yZV9jbGspLAorCQkJCSAgICAgIkZh
aWxlZCB0byBnZXQgY29yZSBjbG9ja1xuIik7CiAKIAlpZiAoZGF0YS0+Y29yZV9jbGspIHsKIAkJ
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNvcmVfY2xrKTsKCmJhc2UtY29tbWl0OiA3
ZDJhMDdiNzY5MzMwYzM0YjRkZWFiZWVkOTM5MzI1Yzc3YTdlYzJmCi0tIAoyLjMwLjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
