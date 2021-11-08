Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D96EC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB74A611C0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB74A611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAqfiRTBhQaHdp/6jYdssup3XiV5qvwlmhSgt7X3LIA=; b=Bgwxp8qi6KIWFJ
	LfnWmYh5sRbzV6Utr8agEMaq83lnfYFo87PNP0ghoMDTukk9AoURhMIvMsAUNHPedrhVw7cX/vV44
	DoDDBBFIjE45IfMuLCq34IakVURXjtuC50UG9/Bp4cpKxjaRGoe7GpVZzI1Q41/P0a6B4evNogwL1
	+6X+UHxBq7zmUz9A3Inm/NzgjSldrRPgtaDfS8cuPzYeBDayoIf3h1YlW9OA8fTmxTozPWnsjo/Dw
	r9n5SC3FnAs9F+z9j1htLj4vbqK1saQBRiyZUoyrhflirroEKJtFGb9INgY0ednreUC2cBeSKnrIG
	0kxjW2ioR5l77i2YmJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk4yv-00GWab-EA; Mon, 08 Nov 2021 13:46:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk4ys-00GWYz-7r
 for linux-amlogic@lists.infradead.org; Mon, 08 Nov 2021 13:46:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yn-0004Uh-Kw; Mon, 08 Nov 2021 14:46:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4ym-00069I-Bv; Mon, 08 Nov 2021 14:46:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4ym-0002pY-Ar; Mon, 08 Nov 2021 14:46:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH 4/4] pwm: meson: Drop always false check from .apply()
Date: Mon,  8 Nov 2021 14:46:27 +0100
Message-Id: <20211108134628.120474-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=t6nqP68umcfgl2LMMZu5wgSXv5y7BP8Yq//bo4VIgNc=;
 m=jGsFlekQ+2yilMcwc32RAz5K+wnk4VawfE73mj0m3qI=;
 p=LtpYs78wmQ0R8LbrvctrXoYoGhL69XWeqyaBE8SxIKQ=;
 g=6e7fe3eec186f73a06b22fddee4682d34beb692b
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGJKjEACgkQwfwUeK3K7AnGYgf+Imt
 8va6K+BIAFvqfU0/lfExarhVnwqBGy4vN3UTLXOdGJiHvcNyNKQ7tiWxf36QX/OYE5sLFNUg14jRN
 4NysbBguwGipT/92RLdXOiyz++lGogPl3OrgH39bkC5AiLo0YAhK6cjRk3nMLKn7aU0ypA67FNXzx
 hq8xl6Af+wIWC38CBtxY/RoYqGFZQuRDY21S4C10WXQzmmgqxPOw1ujAqIvkXxKCOexCV1eEWM7+e
 axAGEA2AzpvfsRJzpie/G3het+OeqO229bf+icyDAgd6MrS0yodTZc1kq5HTw1eIF/eJAvueBHPUZ
 y0yixS5fDaPAIAKwbqSW0c3r0VlN+3Q==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_054638_354995_BF597614 
X-CRM114-Status: GOOD (  10.53  )
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

VGhlIHB3bSBjb3JlIG9ubHkgY2FsbHMgdGhlIGFwcGx5IGNhbGxiYWNrIHdpdGggYSB2YWxpZCBz
dGF0ZSBwb2ludGVyLApzbyBkb24ndCByZXBlYXQgdGhpcyBjaGVjayBhbHJlYWR5IGRvbmUgaW4g
dGhlIGNvcmUuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMyAtLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggOTA4ZTMxNGM3YzAw
Li41NzExMmY0MzhjNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCisrKyBi
L2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC0yNjUsOSArMjY1LDYgQEAgc3RhdGljIGludCBt
ZXNvbl9wd21fYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAq
cHdtLAogCXN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hhbm5lbCA9ICZtZXNvbi0+Y2hhbm5l
bHNbcHdtLT5od3B3bV07CiAJaW50IGVyciA9IDA7CiAKLQlpZiAoIXN0YXRlKQotCQlyZXR1cm4g
LUVJTlZBTDsKLQogCWlmICghc3RhdGUtPmVuYWJsZWQpIHsKIAkJaWYgKHN0YXRlLT5wb2xhcml0
eSA9PSBQV01fUE9MQVJJVFlfSU5WRVJTRUQpIHsKIAkJCS8qCi0tIAoyLjMwLjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
