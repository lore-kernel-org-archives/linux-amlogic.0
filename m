Return-Path: <SRS0=5f+e=KF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE420C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 17:11:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256E761288
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 17:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256E761288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNgBhdVIiSFHKtPd3ExbzhjgmeNsan2JFetg7erA/qc=; b=Mozp2k9tcTD5XupEHe9gIvdSU9
	xKnhcPBLORv03eqGf1nGlDqn+CTodVxVcECb0n3KxJIN0vFmcXAoJR6jBYK0pnJKP8jKfYuulESUC
	QDEp7eFWQR4wxWEBYTYxRfN9o/Df2xQ1iAaACGu3ui0fTa6Ro6tzJMBE6RHwzeRznuORM2stpBUSV
	qbuPwjxTyY8DDN0hMfCkOusZ0ZZOnr9xceNwBqp43niOcedyeONxsIcaULcewSlc+FyJ+Z1bNVP+Z
	kmeS68PoNImF2uDXPaiNR7jOfoQ/AQkYra/lIXphMdSoNosP/l5+whC+wAZO2uIPC0hAyJA7dtdb+
	IolA4rzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg9Qq-00F6so-Tm; Mon, 10 May 2021 17:11:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Qo-00F6ri-46
 for linux-amlogic@desiato.infradead.org; Mon, 10 May 2021 17:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=qXLXzMRrY02x45MRrsdpyS5gy4f/7gtbYHlItSiGWXg=; b=TLZ6Qrn9INcoXf7QczezJDFnXL
 QPgUKIWA5n/n1OYzKRSdI2GhYGkULHI77F/eo2s8jHV1KIi5B7aww+iUA38sYgK6rCGaDK6glnLhi
 wcylVRHG1tq8tlitM/YiVCKZlk+mEd5huGv0enATVVUBspqNwNm6ozm2HV78EaEoaC3yOl8yZp36w
 Zy/RmRItjmoXdJeflyL1NylNwG3u6BEfBNCMI2pLupkedjodn6u5ftFdocgej3Fwg/fAPJ+8Y7XNn
 VYbFVVE1mbDZzD6Hl1a0GZ8xZHW5MhWpLgQ0VkZL+UOMg62xItzgwa4zMQU6ZPTIrNBPD1On+IMRk
 0/bV0OMA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Ql-008xjx-IC
 for linux-amlogic@lists.infradead.org; Mon, 10 May 2021 17:10:56 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lg9Qe-0000l9-VQ; Mon, 10 May 2021 19:10:48 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lg9Qe-0005YF-9B; Mon, 10 May 2021 19:10:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] pwm: meson: Simplify using devm_pwmchip_add
Date: Mon, 10 May 2021 19:10:46 +0200
Message-Id: <20210510171046.984246-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_101055_623648_1B6A1ED9 
X-CRM114-Status: GOOD (  13.41  )
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
b25peC5kZT4KLS0tCkhlbGxvLAoKdGhpcyBvYnZpb3VzbHkgZGVwZW5kcyBvbiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjEwNDA3MDgwMTU1LjU1MDA0LTItdS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlCgpCZXN0IHJlZ2FyZHMKVXdlCgogZHJpdmVycy9wd20vcHdtLW1lc29uLmMg
fCAxMiArLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJz
L3B3bS9wd20tbWVzb24uYwppbmRleCA5ZWIwNjA2MTNjYjQuLmQ5ZGU0NTYyZTAwMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29u
LmMKQEAgLTU2MCwzMSArNTYwLDIxIEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKGVyciA8IDApCiAJCXJldHVybiBlcnI7CiAK
LQllcnIgPSBwd21jaGlwX2FkZCgmbWVzb24tPmNoaXApOworCWVyciA9IGRldm1fcHdtY2hpcF9h
ZGQoJm1lc29uLT5jaGlwKTsKIAlpZiAoZXJyIDwgMCkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJmYWlsZWQgdG8gcmVnaXN0ZXIgUFdNIGNoaXA6ICVkXG4iLCBlcnIpOwogCQlyZXR1cm4gZXJy
OwogCX0KIAotCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG1lc29uKTsKLQogCXJldHVybiAw
OwogfQogCi1zdGF0aWMgaW50IG1lc29uX3B3bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKLXsKLQlzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwotCi0JcmV0dXJuIHB3bWNoaXBfcmVtb3ZlKCZtZXNvbi0+Y2hpcCk7Ci19Ci0K
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX3B3bV9kcml2ZXIgPSB7CiAJLmRy
aXZlciA9IHsKIAkJLm5hbWUgPSAibWVzb24tcHdtIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gbWVz
b25fcHdtX21hdGNoZXMsCiAJfSwKIAkucHJvYmUgPSBtZXNvbl9wd21fcHJvYmUsCi0JLnJlbW92
ZSA9IG1lc29uX3B3bV9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihtZXNvbl9w
d21fZHJpdmVyKTsKIAoKYmFzZS1jb21taXQ6IDZlZmI5NDNiODYxNmVjNTNhNWU0NDQxOTNkY2Nm
MWFmOWFkNjI3YjUKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBmYTM5Y2QwYzg1MmQxMDllZDk1N2Rj
NDRkY2E1YmRjZjVkZmYwNjg1Ci0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
