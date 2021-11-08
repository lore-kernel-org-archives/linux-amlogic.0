Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B841C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADBE6115A
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BADBE6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QU5S+DgMJ7t2Ei7twJBllW2fembU/6MRhkunItEIGqc=; b=BgFPGdjyiOkwa9
	fCQ8mvIsftG35CIH/RQxbXZHCxT+eQWQBOfEyx6hkcSQ+vPfWeXb1oB7OzYo+HUxGD3TaGCQ8mt0r
	35WT/2t764RG+3mjbxTVKTxDAsMCl1jS1CHHiRoOSle99mbH+D2lt+4raiqDGQK6uBFm46MiLV4Ph
	yo3+VvFGWwg74/brr6XVOCz5c6lZgezdpDfNUnfddfikQiPpv9LxQdAlpXChoSbkbe9qK68i35qj5
	JKhS5N0AaA/4177ykfpUJt5gYBL1C/zGWDtFtXrrDMAupQ1luFV+N3BtfmOSRpiZh7noFkrhuTxeF
	MKbGzAoResFOwwHSsxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk4yx-00GWb1-DV; Mon, 08 Nov 2021 13:46:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk4ys-00GWZ0-7q
 for linux-amlogic@lists.infradead.org; Mon, 08 Nov 2021 13:46:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yn-0004Ug-Kw; Mon, 08 Nov 2021 14:46:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4ym-00069F-5t; Mon, 08 Nov 2021 14:46:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4ym-0002pL-4o; Mon, 08 Nov 2021 14:46:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH 3/4] pwm: meson: Simplify duplicated per-channel tracking
Date: Mon,  8 Nov 2021 14:46:26 +0100
Message-Id: <20211108134628.120474-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=rNZrjCvgYmAqlJ5riojVlnaxpCf4wtmwd9yLL/nP0PM=;
 m=5XgqPhF6+YixcIl9jZOqNtNzkP5opD+m/1BKa93KXaM=;
 p=wj2PEOpn/8zNM06wPsEr602+lpcO38hRz6y9qIvpvBg=;
 g=2eaf700f1bee0410d39a81c3eecddf3d6da7db05
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGJKi0ACgkQwfwUeK3K7An8igf+INv
 cesPBBF3ca/KVzDkShBEJWZ1BVxrlZYKESmYp1sHbfMBtt2rAqQdGULLf70AYEiyzwi+5I4wPPrKk
 9MyOapg0LS6ioCsC1ItQENjdArGwEybcHlx3uUNLPXPFatVe940MWOGbTA0NoDZoI907tysjtfAA6
 6Iz1n58FZTyedYOjeyoJFOTEYSpITgd08jtD+morYCqD1h8sg/3fDWDcq9VkgDfeHHdrxnPgTa5mk
 izu2biIvenHBJ5eW53m5gkeyPQkFDde7S38uc01IPj+yM5AtPNH/37J+9Lg+2gYT12WYJCi84D52B
 lHkM7e1T4OsKs9ZVhX6R3NX2sMk8YPw==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_054638_357328_CB6EE26B 
X-CRM114-Status: GOOD (  12.96  )
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

VGhlIGRyaXZlciB0cmFja3MgcGVyLWNoYW5uZWwgZGF0YSB2aWEgc3RydWN0IHB3bV9kZXZpY2U6
OmNoaXBfZGF0YSBhbmQKc3RydWN0IG1lc29uX3B3bTo6Y2hhbm5lbHNbXS4gVGhlIGxhdHRlciBo
b2xkcyB0aGUgYWN0dWFsIGRhdGEsIHRoZSBmb3JtZXIKaXMgb25seSBhIHBvaW50ZXIgdG8gdGhl
IGxhdHRlci4gU28gc2ltcGxpZnkgYnkgdXNpbmcgc3RydWN0Cm1lc29uX3B3bTo6Y2hhbm5lbHNb
XSBjb25zaXN0ZW50bHkuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwg
MTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3
bS9wd20tbWVzb24uYwppbmRleCAxZmJlNTRhMmFiZmUuLjkwOGUzMTRjN2MwMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMK
QEAgLTE0MSwxMiArMTQxLDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX3JlcXVlc3Qoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQogCQlyZXR1cm4gZXJyOwog
CX0KIAotCXJldHVybiBwd21fc2V0X2NoaXBfZGF0YShwd20sIGNoYW5uZWwpOworCXJldHVybiAw
OwogfQogCiBzdGF0aWMgdm9pZCBtZXNvbl9wd21fZnJlZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAs
IHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiB7Ci0Jc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpj
aGFubmVsID0gcHdtX2dldF9jaGlwX2RhdGEocHdtKTsKKwlzdHJ1Y3QgbWVzb25fcHdtICptZXNv
biA9IHRvX21lc29uX3B3bShjaGlwKTsKKwlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5u
ZWwgPSAmbWVzb24tPmNoYW5uZWxzW3B3bS0+aHdwd21dOwogCiAJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGNoYW5uZWwtPmNsayk7CiB9CkBAIC0xNTQsNyArMTU1LDcgQEAgc3RhdGljIHZvaWQgbWVz
b25fcHdtX2ZyZWUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
KQogc3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgc3Ry
dWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJCSAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUp
CiB7Ci0Jc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gcHdtX2dldF9jaGlwX2Rh
dGEocHdtKTsKKwlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWwgPSAmbWVzb24tPmNo
YW5uZWxzW3B3bS0+aHdwd21dOwogCXVuc2lnbmVkIGludCBkdXR5LCBwZXJpb2QsIHByZV9kaXYs
IGNudCwgZHV0eV9jbnQ7CiAJdW5zaWduZWQgbG9uZyBmaW5fZnJlcTsKIApAQCAtMjE3LDcgKzIx
OCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IG1lc29uX3B3bSAqbWVzb24s
IHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAKIHN0YXRpYyB2b2lkIG1lc29uX3B3bV9lbmFibGUo
c3RydWN0IG1lc29uX3B3bSAqbWVzb24sIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiB7Ci0Jc3Ry
dWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gcHdtX2dldF9jaGlwX2RhdGEocHdtKTsK
KwlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW3B3
bS0+aHdwd21dOwogCXN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbF9kYXRhICpjaGFubmVsX2RhdGE7
CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAl1MzIgdmFsdWU7CkBAIC0yNjAsOCArMjYxLDggQEAg
c3RhdGljIHZvaWQgbWVzb25fcHdtX2Rpc2FibGUoc3RydWN0IG1lc29uX3B3bSAqbWVzb24sIHN0
cnVjdCBwd21fZGV2aWNlICpwd20pCiBzdGF0aWMgaW50IG1lc29uX3B3bV9hcHBseShzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCQkgICBjb25zdCBzdHJ1
Y3QgcHdtX3N0YXRlICpzdGF0ZSkKIHsKLQlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5u
ZWwgPSBwd21fZ2V0X2NoaXBfZGF0YShwd20pOwogCXN0cnVjdCBtZXNvbl9wd20gKm1lc29uID0g
dG9fbWVzb25fcHdtKGNoaXApOworCXN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hhbm5lbCA9
ICZtZXNvbi0+Y2hhbm5lbHNbcHdtLT5od3B3bV07CiAJaW50IGVyciA9IDA7CiAKIAlpZiAoIXN0
YXRlKQotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
