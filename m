Return-Path: <SRS0=VV3g=SE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE611C10F0B
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 19:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F332082C
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 19:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PABjOUAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DiiJgO6s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F332082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wS/BFCOnZj44lqkr8L5ysdhEOX0VR/luS74+iQ/4OmI=; b=PABjOUATc/+RBt
	CTJtwPqJoGVNWh22H8ARCcYL/QLeJCc6TqkVC8QTVK55gm+u+jnU5D4OdQZmgZStwCXvhuLf7Wci2
	Ohsg6bSXo31fwP6av+EQzNJ1q00Eus0FLokcfFKyeBRmzBfWpyVIiAyyu7LieJww3w1vV33ZrAV6x
	tOOcQZqH9QAwQOSg5CfVaiH3VPnZChIbaXt8oYsxoUO7L7j7xf3VrjQZKYm/9XpViyH5+TeRos7W6
	agAayWw8jN9mz+wTg7fFCfC8cs4os8z4RTEcRWW7sLkKgQsDqsrzccBj4GrMJoDmjU3k4J0L1TL3F
	ZzqZ4enT7n+Gi72QFlcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBP02-0005C4-N0; Tue, 02 Apr 2019 19:23:10 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBP00-0005Bh-2x; Tue, 02 Apr 2019 19:23:09 +0000
Received: by mail-ot1-x343.google.com with SMTP id u15so13066397otq.10;
 Tue, 02 Apr 2019 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n5qyPlBMNh5sZ/jbDN+VjVIz9+XoNdXWKJOvxQgpQY0=;
 b=DiiJgO6sFgcCKr3BbrFwgApQg7ROfOp1I6jB2BStf81axSgeOdc6snwCpQbo19QlUS
 zmU2m08pszfpPTZgsoMcsSAXqpS9hTyI/VK5G4tp+LcG3EfIHUWsI2OU6kbPx7Z8dWCY
 9tNgNSqlJU59tqZSqFr3uJhm05gYTeTelF4Lc0wdOk8odJd7muZmOXb+/UGRBXY1z5lK
 q6yS9S9I0RLnhJcQetvitsPqhX3XIv34ZR9qMtVc+pKCona/fo2eeD5nLhDoztwReUYs
 9+O0ElX2praaveIDQgjg2fzKbEuMGfTuyfn4AJWED+o9u7+erQWmxPSOXDybOWrgkB03
 w+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n5qyPlBMNh5sZ/jbDN+VjVIz9+XoNdXWKJOvxQgpQY0=;
 b=cJHUS2QY4XaKCI/oXQ0mueK4u6dzXl62mX9MkvzMT8Zt1DNZUpT1T9upbmw0XFiBfe
 SG7gQn7rQ55kJuCkB6rLfle77p0WOjQ2ichLEWY+9VZoWMIR91XjbN0uA2mxKdIY0QS1
 olgHxNTarEDufPCTTtuRhwrCqOjBGz84NxLt9/GnWR6n6f60892CX7n9PsvNV0SPKOp/
 WT0Hud7H4gCw3ye2nS0GpW5M9kioJOr2onKBp1SPMlyEc0bxReIT0r7NHw23Xe7Yq69Q
 n2cAJRUl3pnb3kH0/ykIrc+qhf967uJLAG/6/yWCGekd7JDDKo7g7T0nSEylrqzlxZQU
 8/Jg==
X-Gm-Message-State: APjAAAU8urzv0suzPl4ddH0tjm0qteDxWtNzJv52jkhxIGD4RB2oNwdr
 q2DrN9RR4mm4wzYa0TmIJz+F1XaTmSGKjjgDsT+pLA==
X-Google-Smtp-Source: APXvYqxHChjMSVeSCaMIfXO0Edx/fjzUjYllYZaWM0ZGmeLEEos+8a08qfu2Mt0g/xNbOPUPd2PiynuALA6sY6OfqaA=
X-Received: by 2002:a9d:6e88:: with SMTP id a8mr34372516otr.117.1554232986753; 
 Tue, 02 Apr 2019 12:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
 <20190401181817.11999-2-martin.blumenstingl@googlemail.com>
 <20190401183847.7xhlgff63cvlzz2h@pengutronix.de>
In-Reply-To: <20190401183847.7xhlgff63cvlzz2h@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 2 Apr 2019 21:22:55 +0200
Message-ID: <CAFBinCDac9189=+UVLPLqdmJsJvudys_L0GE=Zf0FRkOWsruuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pwm: meson: consider 128 a valid pre-divider
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_122308_186409_AA728681 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 bichao.zheng@amlogic.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gVXdlLAoKT24gTW9uLCBBcHIgMSwgMjAxOSBhdCA4OjM4IFBNIFV3ZSBLbGVpbmUtS8O2
bmlnCjx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGVsbG8gTWFy
dGluLAo+Cj4gT24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDg6MTg6MTZQTSArMDIwMCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVz
b24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gPiBpbmRleCBmNmU3MzhhZDdiZDkuLjRi
NzA4YzFmY2IxZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gPiAr
KysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+ID4gQEAgLTE4OCw3ICsxODgsNyBAQCBzdGF0
aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBtZXNvbl9wd20gKm1lc29uLAo+ID4gICAgICAg
ZG9fZGl2KGZpbl9wcywgZmluX2ZyZXEpOwo+ID4KPiA+ICAgICAgIC8qIENhbGMgcHJlX2RpdiB3
aXRoIHRoZSBwZXJpb2QgKi8KPiA+IC0gICAgIGZvciAocHJlX2RpdiA9IDA7IHByZV9kaXYgPCBN
SVNDX0NMS19ESVZfTUFTSzsgcHJlX2RpdisrKSB7Cj4gPiArICAgICBmb3IgKHByZV9kaXYgPSAw
OyBwcmVfZGl2IDw9IE1JU0NfQ0xLX0RJVl9NQVNLOyBwcmVfZGl2KyspIHsKPiA+ICAgICAgICAg
ICAgICAgY250ID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKCh1NjQpcGVyaW9kICogMTAwMCwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbl9wcyAqIChwcmVf
ZGl2ICsgMSkpOwo+ID4gICAgICAgICAgICAgICBkZXZfZGJnKG1lc29uLT5jaGlwLmRldiwgImZp
bl9wcz0lbGx1IHByZV9kaXY9JXUgY250PSV1XG4iLAo+Cj4gWW91IGNvdWxkIGV2ZW4gY2FsY3Vs
YXRlIHByZV9kaXYgd2l0aG91dCB0aGUgbG9vcC4KPgo+IFNvbWV0aGluZyBsaWtlOgo+Cj4gICAg
ICAgICB1NjQgcHJlX2RpdiA9ICh1NjQpcGVyaW9kICogcmF0ZTsKPiAgICAgICAgIGRvX2Rpdl9y
b3VuZF91cChwcmVfZGl2LCBOU0VDX1BFUl9TRUMgKiAweGZmZmYpOwo+ICAgICAgICAgcHJlX2Rp
di0tOwo+Cj4gKEkgZGlkbid0IGNoZWNrIHJvdW5kaW5nIGFuZCBtYXliZSBpdHMgb2ZmIGJ5IG9u
ZSBhbmQgLi4uKSBUaGlzIHdvdWxkCj4gYWxzbyBnZXQgcmlkIG9mIHRoZSBzdHJhbmdlIDEwMDAg
dGhhdCBpcyBjdXJyZW50bHkgdXNlZCBpbiB0aGUKPiBjYWxjdWxhdGlvbiB3aXRob3V0IGEgcmVh
bCBiZW5lZml0ICh1bmxlc3MgSSBtaXNzZWQgc29tZXRoaW5nKS4KcGVyc29uYWxseSBJIHByZWZl
ciB1c2luZyB0aGlzIHNpbXBsZSBwYXRjaCBhcHBsaWVkIGZpcnN0IGFzIGl0IGlzCmVhc3kgdG8g
cmV2aWV3IGFuZCAoZHVlIHRvIHRoZSBGaXhlcyB0YWcpIG1heSBnZXQgYmFja3BvcnRlZCB0byBz
dGFibGUKa2VybmVscy4KSSdtIG5vdCBzYXlpbmcgSSBkb24ndCBsaWtlIHlvdXIgc3VnZ2VzdGlv
biwgSSBwcm9wb3NlIHRvIHBvc3Rwb25lCmltcGxlbWVudGluZyB0aGlzIGNsZWFudXAuIEkgbmVl
ZCB0byBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhlCmNhbGN1bGF0aW9uIGJlY2F1c2UgdGhyZWUg
dmFsdWVzIGFyZSBkZXJpdmVkIGZyb20gdGhlIGlucHV0IGNsb2NrIHJhdGUKKHByZV9kaXYsIGNu
dCwgZHV0eV9jbnQpIGFuZCBJIGRvbid0IHdhbnQgdG8gbWVzcyB1cCB0aGUgY2FzZXMgdGhhdAph
cmUgYWxyZWFkeSB3b3JraW5nIGFzIG9mIHRvZGF5LgoKUGxlYXNlIGxldCBtZSBrbm93IHdoYXQg
eW91IHRoaW5rLgoKClJlZ2FyZHMKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
