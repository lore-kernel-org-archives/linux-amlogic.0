Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E27FC27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oyhvh/z7vZ8822d34ZOtZPi5xlGE0DW33REEJ4xesOI=; b=Qwa4KJaqS+fXfe
	ce63ElF2zv14Pny+Xjg6KV19iub8P0VVjv5+PGw2uTqeFPAXufLlbCGiqV6w5Zll+YdikMeU5JaTC
	ppngzAskAjh4NkH+IXXr91+DxJ/hBg2pmmLufGXXBgYGlt16eqXrSZldzi8Zg2r2Ebvqtzgj+oBn+
	cxVe9in/YpLt3IHuGTNjhfBJtWWHce3mR/FapAmzbOM+bOGU9FzXeoo622+SAFEUhvJqCACNtGgmv
	syyLUBhscUCVg111VVC0xRrEbMQu/C2U5u9EZEDeOmmD2P2Lxhr2IJDHNNRVrVUDkohYfHyOCyNj+
	srqKSpz5oMunKmjbhrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Ic-00000001l8p-0FgN;
	Fri, 14 Jun 2024 07:24:38 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1IX-00000001l7F-3SDR
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 07:24:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ebeefb9b56so21183321fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718349870; x=1718954670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XonQmSzUMViZ2/5nnwAc3UPbyjH2uWZ224DMU7aSdNw=;
        b=a1BRgcak/XVB7OLX9r/2ynAz+D4xfVKbFYSbAWn7DA/cFu9j18Zk9ZemY6qGTTi0ME
         N/wg+NrkTiRP2/pwyFbS/XqOr/VVRGFULHQvkVs8I9FUY5DRw2wExCrRK61UNQhVdERU
         hNL/itCT3KQLawjKGTX00kjRs1b1P7SbPnXcFKYk25hH9Rjw/qb6Fv32OI4mUAeaBjFQ
         FsAapIrlGVPmCatfmmQsjzglxV0xWEZ7oK6JiMrLZsdxCKWRggjVFutt7BQbAvlieb/g
         r7WA5YIFlKcnuj8D2SAFIToTVXbxGS7TXfJD3QLmfwPdms39yNFI3AiFte0x013ehyNJ
         U6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349870; x=1718954670;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XonQmSzUMViZ2/5nnwAc3UPbyjH2uWZ224DMU7aSdNw=;
        b=gqL2Yo5fgdVNaM2Qd9GUlxjA4gVpTZ54EUV1wEV9WyZDZk/ThUx7XQpLBn6A354Fmf
         Q02vQqJBTQNQxk6HfDjF7IrC/QmfA9u+/QkOQ8i+BUjCK7rhDFJiCCab7odf91/fOzMF
         PndpTbVWel8OyMfAuttNojaYRb/sY2UgI0c7yM0roxaPzZlFvhlyZ95Xjk/n8UPihW5x
         EAjEVvFS/nAQhrTb0egzSS6EOpld5s2NXDc6JCZrC9/7upollRR6yCvCKjrvDQnAlYCj
         /sYttAVHu2Wpsz5RGhlz7h/ImuDI2B3S7h9cQf336ymDSlhnV8/t0vY7+DBvd1WKrOY1
         o7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkhf6IYlb5rO+TXqL/5X2R3oxnaQ9+jVy9QKPtqmKBfZeppmB9qnq8Zqy+eY7uDXvEwCYfhgnhU1gfzHfwksKo1nFzhG7eZoT++RPPEFKaYuk=
X-Gm-Message-State: AOJu0YwvnCfUgFgy3TB8cGWLq2o5Vhg1tkTiuxcFUmXsUCRv4I37IAFy
	ZqflGNeddDIO7+NXCutp4nXZRExA/OV8jc1YBnR4ql8vqelL/QctY8hRcdUBsEhyQ1xh1LUMvx5
	/
X-Google-Smtp-Source: AGHT+IF0xf98UlruLSknNwRYcad83nIcooBh7OBYmO1Yav9pdgNNBUl4LOUE3c3U17ltnbt3pXsw8A==
X-Received: by 2002:a2e:9ac4:0:b0:2ea:eaaf:bb72 with SMTP id 38308e7fff4ca-2ec0e601029mr16962341fa.33.1718349869805;
        Fri, 14 Jun 2024 00:24:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d811:babc:4f8c:772b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33ccesm48817915e9.3.2024.06.14.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:24:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  kelvin.zhang@amlogic.com,
  linux-pwm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
In-Reply-To: <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
	("Uwe =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Thu, 13 Jun 2024
 22:46:30 +0200")
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
	<20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
	<1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
	<tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
Date: Fri, 14 Jun 2024 09:24:28 +0200
Message-ID: <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002434_006118_E7E8A0BA 
X-CRM114-Status: GOOD (  15.81  )
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

T24gVGh1IDEzIEp1biAyMDI0IGF0IDIyOjQ2LCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj4gT24gVGh1LCBKdW4gMTMs
IDIwMjQgYXQgMDU6NTQ6MzFQTSArMDIwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBNRVNPTl9OVU1fUFdNUzsgaSsrKSB7Cj4+ID4gKwkJbWVzb24tPmNoYW5u
ZWxzW2ldLmNsayA9IG9mX2Nsa19nZXQobnAsIGkpOwo+PiA+ICsJCWlmIChJU19FUlIobWVzb24t
PmNoYW5uZWxzW2ldLmNsaykpCj4+ID4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwKPj4g
PiArCQkJCQkgICAgIFBUUl9FUlIobWVzb24tPmNoYW5uZWxzW2ldLmNsayksCj4+ID4gKwkJCQkJ
ICAgICAiRmFpbGVkIHRvIGdldCBjbGtcbiIpOwo+PiAKPj4gaGVyZSBpdCBpcyBvayBidXQgLi4K
Pj4gCj4+ID4gKwo+PiA+ICsJCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1l
c29uX3B3bV9zNF9wdXRfY2xrLAo+PiA+ICsJCQkJCSAgICAgICBtZXNvbi0+Y2hhbm5lbHNbaV0u
Y2xrKTsKPj4gPiArCQlpZiAocmV0KQo+PiA+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IHJldCwKPj4gPiArCQkJCQkgICAgICJGYWlsZWQgdG8gYWRkIGNsa19wdXQgYWN0aW9uXG4iKTsK
Pj4gCj4+IC4uLiBoZXJlLCBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQgY2Fubm90IGRlZmVyLCBz
byBkZXZfZXJyX3Byb2JlIGlzIG5vdCB1c2VmdWwuCj4+IGRldl9lcnIoKSBpZiB5b3UgbXVzdCBw
cmludCBzb21ldGhpbmcuIEp1c3QgInJldHVybiByZXQ7IiB3b3VsZCBiZSBmaW5lCj4+IGJ5IG1l
Cj4KPiBJIGRvbid0IGFncmVlLiBkZXZfZXJyX3Byb2JlKCkgaGFzIHNldmVyYWwgcHVycG9zZXMu
IE9ubHkgb25lIG9mIHRoZW0gaXMKPiBoYW5kbGluZyAtRVBST0JFX0RFRkVSLiBTZWUgYWxzbyBj
b21taXQKPiA1MzI4ODhhNTk1MDVkYTJhM2ZiYjRhYmFjNmFkYWQzODFjZWRiMzc0LgoKSSB3YXMg
c3R1Y2sgb24gdGhlIC1FUFJPQkVfREVGRVIgdXNhZ2UuIFRoYW5rcyBmb3IgdGhlIGhlYWRzIHVw
Cgo+Cj4gU28geWVzLCBwbGVhc2UgdXNlIGRldl9lcnJfcHJvYmUoKSBhbHNvIHRvIGhhbmRsZQo+
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpLgoKTXkgcG9pbnQgaGVyZSBpcyBhbHNvIHRoYXQg
ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgY2FuIG9ubHkgZmFpbCBvbgptZW1vcnkgYWxsb2Nh
dGlvbiwgbGlrZSAoZGV2bV8pa3phbGxvYy4gTG9va2luZyBhcm91bmQgdGhlIGtlcm5lbCwgd2UK
dGVuZCB0byBub3QgYWRkIG1lc3NhZ2VzIGZvciB0aGF0IGFuZCBqdXN0IHJldHVybiB0aGUgZXJy
b3IgY29kZSwKcHJlc3VtYWJseSBiZWNhdXNlIHRob3NlIHNhbWUgJ291dCBvZiBtZW1vcnknIG1l
c3NhZ2VzIHdvdWxkIHByb2xpZmVyYXRlCmV2ZXJ5d2hlcmUuCgo+Cj4gQmVzdCByZWdhcmRzCj4g
VXdlCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
