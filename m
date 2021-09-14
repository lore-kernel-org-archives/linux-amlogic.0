Return-Path: <SRS0=aLbU=OE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE73C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Sep 2021 14:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B6960EFF
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Sep 2021 14:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7B6960EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+OA0ugXnEr/IyPYuHUpDN7yOkq6N73IPeDXw2Fij48=; b=rE/uONXDvMVU1A
	ePLwqK7sT40oB4TIB88R5fA7C9kct6T8fXGpuT7k+0vIoSlsRUBrzIVvvLv93jQT2JJICuTDiLSZ/
	PBv3BYkzibOrVZ5otONpH4rWd/+4459NwGYX5S0dWGXTZa1E22NM9WclWz1CWE0u+fF3QaRHNMuFi
	AqqUqPEfGUXj14LkgOOAWYET/aPbXAhjtz2Elz1kwBtKcIEmmlmSfUjTVzOwA+hHW/C7POBFcvA6N
	0W12lGkaY9EWsnSZM+Kc3GPQID8/laD6zomzny6O2vHMhBIL+ySjvh0dteG8ziTN83uOeapIufs6G
	pY89jZbE/EOWyxQJUpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ9Mm-005zLz-Uc; Tue, 14 Sep 2021 14:24:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ9Mk-005zL7-E4
 for linux-amlogic@lists.infradead.org; Tue, 14 Sep 2021 14:24:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mQ9Me-0005tr-P1; Tue, 14 Sep 2021 16:24:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mQ9MQ-0006Yy-LX; Tue, 14 Sep 2021 16:24:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mQ9MQ-0007OM-Jj; Tue, 14 Sep 2021 16:24:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH] hwrng: meson - Improve error handling for core clock
Date: Tue, 14 Sep 2021 16:24:28 +0200
Message-Id: <20210914142428.57099-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=9tz2phqeN+3GzCEXz8gh5AQWNocdSF32iWo28yTN+xs=;
 m=cX96ziEeAkJuDb6P9w+CtfXmQzh9pdqI3yrnaxyU0x0=;
 p=aUBlnzWgqmE/spp/etZnspgE0aeuWMQfhI4MUcyEZ7k=;
 g=b60f7d99182caa434b62de00dd624961cea91849
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFAsJQACgkQwfwUeK3K7AlrTQf8CZp
 M/xfs12DybnVzDWGfGTbDxvXLsNJ7yMwTHa6A/aUq8y5vEEQd8J1WN+DD18dQpQueEq1BOFg6qkfq
 4BL/ETsC4954HMsYibwrFQIBA0pYpJbPuq6iaFJ97g31M4WJmgDv/IouXp9b2EFvcLLan1M6l1UuY
 LKjJsRPqMPWYmJCADVziMOdCVn+54tH7YPCHTLOMdqHWlzuS+YBwbZGHC1Ve8lwnCFhVtILp1hxt9
 PMvFEgEeE0hL73EuJmZzaUb5Ru049iTsgR6ben139Qd7igImWSITtUoRkwbBQMtJgpcQZkQYThM7I
 M17hZa2EKgpE9YHCQpew2ugSuhi2GsA==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_072454_542680_9A841879 
X-CRM114-Status: GOOD (  14.48  )
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
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21l
c29uLXJuZy5jIHwgMTIgKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20v
bWVzb24tcm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jCmluZGV4IGU0
NDYyMzZlODFmMi4uOWYzZTJlYjgwMTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NoYXIvaHdfcmFu
ZG9tL21lc29uLXJuZy5jCisrKyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vbWVzb24tcm5nLmMK
QEAgLTU0LDkgKzU0LDE1IEBAIHN0YXRpYyBpbnQgbWVzb25fcm5nX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKElTX0VSUihkYXRhLT5iYXNlKSkKIAkJcmV0dXJuIFBU
Ul9FUlIoZGF0YS0+YmFzZSk7CiAKLQlkYXRhLT5jb3JlX2NsayA9IGRldm1fY2xrX2dldChkZXYs
ICJjb3JlIik7Ci0JaWYgKElTX0VSUihkYXRhLT5jb3JlX2NsaykpCi0JCWRhdGEtPmNvcmVfY2xr
ID0gTlVMTDsKKwlkYXRhLT5jb3JlX2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25hbChkZXYsICJj
b3JlIik7CisJaWYgKElTX0VSUihkYXRhLT5jb3JlX2NsaykpIHsKKwkJcmV0ID0gUFRSX0VSUihk
YXRhLT5jb3JlX2Nsayk7CisJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKKwkJCWRldl9lcnIo
ZGV2LCAiRmFpbGVkIHRvIGdldCBjb3JlIGNsb2NrOiAlcGVcbiIsCisJCQkJZGF0YS0+Y29yZV9j
bGspOworCisJCXJldHVybiByZXQ7CisJfQogCiAJaWYgKGRhdGEtPmNvcmVfY2xrKSB7CiAJCXJl
dCA9IGNsa19wcmVwYXJlX2VuYWJsZShkYXRhLT5jb3JlX2Nsayk7Ci0tIAoyLjMwLjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
