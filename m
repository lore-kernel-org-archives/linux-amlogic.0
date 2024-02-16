Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC7C48260
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Feb 2024 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuEZ6qNJ2VTgZKW0OM3g/2wQT6Me7u/EFDHzpnd9Xk0=; b=TB1LabRjVAudRv
	OWpyrSNqay3+eHMv2/flcbhs/fjhtuoTkeWkAOVSuCnatiCQcHMn1nMxNYHHyhFY6o/IqD5LDuY3t
	2BK4WfgJ04Dd31BQSyIJYzkry2lwDokOIm28k7/j6W5cAOhrljpYwwb6N7r7TDrl90HmnxSweSYKj
	MtJ7kEhtoGgN/bkYE95a1ASUn7ENBAv0nWTzEHBOSB78DYdueqLz+/+T+spVCFFjQ58ziEZcjz8Q6
	iBhC971Pl359wH5UmSklq48rmyj5VAeYaywLspHs8I5T+r4rDPxVSKT1T+KfiRZ0tVbW/I2DpXtEf
	72MEtWRPkUQOJDyiJUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3Qd-00000003Qvy-0hJs;
	Fri, 16 Feb 2024 18:59:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3QZ-00000003Qv6-3vEX
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Feb 2024 18:59:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso1784350a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Feb 2024 10:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708109951; x=1708714751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq17W6SIJMVFiVDQxckTnzA5OE2gedi1A5TqO2suh2M=;
        b=nidHb2vlfWR7CVZRR0jC1gjSHw4ELmWVZf82zi3oDhhIjYDPCO76cWBCLNYdQZaU+w
         HO7n08uUXTK7Ex38C8WBaL6h+1BbuiP6QT51tykSDY5Sgc2iCG3ng6hIoMV0ThJFdi8P
         f14SyDPEk0/NP3vxRvMGNcoH2mzHVl5ByCQMTet8EqCoaZ3Pt9aSkfzrpVilshuQxe3R
         CeayfFVugXEtrfnBfE/WOA9rHPgvqxXxa61cCxLzK1W24xWImXYFZXHS++xHuvn/hZus
         rofIlSNlubCga3r5IQKbj9hqtpY9/6CB3N9QKXaPOnQSRw7ffz3099fgE0NDUlVlJlPo
         qygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109951; x=1708714751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq17W6SIJMVFiVDQxckTnzA5OE2gedi1A5TqO2suh2M=;
        b=W9ACikoNoNUyHom4Ik4zmgtQkst6LB5oSMpIOLs/nO1ggqc9Viv54KqtccjDI3pRDC
         9N3npypxHLUGe8eNiMkxwmZDvS0JUQZBCyqwpSHHCcnWvnBZfRnKfuDleRVnce5XXpwa
         /itTimBWVdm/nOt76oxlO346c1U8Fj3xbV9NMSK1V9wkf4OxuKj5PEYGY93SqAvo2gPV
         ghrZ02ESKuWEjUEy/PfHdVH9S4YyE+hn85xjXk+GF8Bx65aeh3oISY7HQR+Ygo8d3aQl
         ZgRoxzsUEqrghBl5vgK5pbob6WyCBMnMf1KNeMd8DGf1SE5MrYHkZw38HUYQ/Bf3ordG
         3ZeA==
X-Forwarded-Encrypted: i=1; AJvYcCUM+shB5uhbi2qsvypZvATFZ2+nN0KZJ7gZH9hBq4txEfIJ5XGOaty7CTUzFbaGLhry/op/b17Oy5BZOmKpkCt2GZt/ZYq2LwQhN78JGkrWTE0=
X-Gm-Message-State: AOJu0YxqOYjp5TNtGqALzMN3f3cgmQ4WL1oQzwiWEH4NXYam4klNc6df
	j7jVJ7bnKSUAVNBOyuc+4VqviGDGLOLj65MHKDsBhdPbPUtd0QzOX0gwARg2mgwbR+tRotbvbZ7
	1A/Ly1ESkz9Zgjl4yiGKwAGlyOo9d7DHedgvj
X-Google-Smtp-Source: AGHT+IGqVIJex1/G8rhzXDwOgZM0k+G8zaMETshLR4ChT1MwR+ecSyTyIFpwrDlkp8s4NBTPZn2zLT6t8B3cVj9KN4Y=
X-Received: by 2002:aa7:d614:0:b0:55f:f2ae:20ed with SMTP id
 c20-20020aa7d614000000b0055ff2ae20edmr4226097edr.16.1708109950725; Fri, 16
 Feb 2024 10:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 16 Feb 2024 10:58:58 -0800
Message-ID: <CAFhGd8oQ5jh21U4SG3aN5eZJ5h+Ywk4WLFa0yPz8bquFmA1mag@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_105916_006639_A7E73DA8 
X-CRM114-Status: GOOD (  19.40  )
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

SGksCgpPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCA2OjI44oCvQU0gSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gY2xhbmctMTYgd2FybnMgYWJvdXQgY2FzdGlu
ZyBmdW5jdGlvbnMgdG8gaW5jb21wYXRpYmxlIHR5cGVzLCBhcyBpcyBkb25lCj4gaGVyZSB0byBj
YWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZToKPgo+IGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2Uu
Yzo3ODoxMjogZXJyb3I6IGNhc3QgZnJvbSAndm9pZCAoKikoc3RydWN0IGNsayAqKScgdG8gJ3Zv
aWQgKCopKHZvaWQgKiknIGNvbnZlcnRzIHRvIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlIFst
V2Vycm9yLC1XY2FzdC1mdW5jdGlvbi10eXBlLXN0cmljdF0KPiAgICA3OCB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkKCopKHZvaWQgKikpY2xrX2Rpc2FibGVf
dW5wcmVwYXJlLAo+Cj4gVGhlIHBhdHRlcm4gb2YgZ2V0dGluZywgZW5hYmxpbmcgYW5kIHNldHRp
bmcgYSBkaXNhYmxlIGNhbGxiYWNrIGZvciBhCj4gY2xvY2sgY2FuIGJlIHJlcGxhY2VkIHdpdGgg
ZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSwgd2hpY2ggYWxzbyBmaXhlcwo+IHRoaXMgd2FybmluZy4K
Pgo+IEZpeGVzOiA2MTFmYmNhMWM4NjEgKCJudm1lbTogbWVzb24tZWZ1c2U6IGFkZCBwZXJpcGhl
cmFsIGNsb2NrIikKPiBSZXBvcnRlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jIHwgMjUgKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKSSBsb3ZlIG5lZ2F0aXZlIGRpZmZzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eXl5eXl5eCgo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL21lc29u
LWVmdXNlLmMgYi9kcml2ZXJzL252bWVtL21lc29uLWVmdXNlLmMKPiBpbmRleCBiOTIyZGY5OWY5
YmMuLjMzNjc4ZDBhZjJjMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL252bWVtL21lc29uLWVmdXNl
LmMKPiArKysgYi9kcml2ZXJzL252bWVtL21lc29uLWVmdXNlLmMKPiBAQCAtNDcsNyArNDcsNiBA
QCBzdGF0aWMgaW50IG1lc29uX2VmdXNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gICAgICAgICBzdHJ1Y3QgbnZtZW1fY29uZmlnICplY29uZmlnOwo+ICAgICAgICAgc3Ry
dWN0IGNsayAqY2xrOwo+ICAgICAgICAgdW5zaWduZWQgaW50IHNpemU7Cj4gLSAgICAgICBpbnQg
cmV0Owo+Cj4gICAgICAgICBzbV9ucCA9IG9mX3BhcnNlX3BoYW5kbGUocGRldi0+ZGV2Lm9mX25v
ZGUsICJzZWN1cmUtbW9uaXRvciIsIDApOwo+ICAgICAgICAgaWYgKCFzbV9ucCkgewo+IEBAIC02
MCwyNyArNTksOSBAQCBzdGF0aWMgaW50IG1lc29uX2VmdXNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBpZiAoIWZ3KQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVQUk9CRV9ERUZFUjsKPgo+IC0gICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVM
TCk7Cj4gLSAgICAgICBpZiAoSVNfRVJSKGNsaykpIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0g
UFRSX0VSUihjbGspOwo+IC0gICAgICAgICAgICAgICBpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIp
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGVm
dXNlIGdhdGUiKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KPiAt
Cj4gLSAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoY2xrKTsKPiAtICAgICAgIGlmIChy
ZXQpIHsKPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIGdh
dGUiKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KPiAtCj4gLSAg
ICAgICByZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkKCopKHZvaWQgKikpY2xrX2Rpc2FibGVfdW5w
cmVwYXJlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsayk7Cj4g
LSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGFkZCBkaXNhYmxlIGNhbGxiYWNrIik7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gLSAgICAgICB9Cj4gKyAgICAgICBjbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsIE5V
TEwpOwo+ICsgICAgICAgaWYgKElTX0VSUihjbGspKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY2xrKSwgImZhaWxlZCB0byBnZXQgZWZ1c2UgZ2F0
ZSIpOwoKV293LCB0aGlzIHNpbXBsaWZpZWQgbmljZWx5IGFuZCBkb2Vzbid0IG1ha2UgYW55IG5l
dyBoZWxwZXJzIChsaWtlCkFybmQncyB2ZXJzaW9uKS4KClJldmlld2VkLWJ5OiBKdXN0aW4gU3Rp
dHQgPGp1c3RpbnN0aXR0QGdvb2dsZS5jb20+Cgo+Cj4gICAgICAgICBpZiAobWVzb25fc21fY2Fs
bChmdywgU01fRUZVU0VfVVNFUl9NQVgsICZzaXplLCAwLCAwLCAwLCAwLCAwKSA8IDApIHsKPiAg
ICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IG1heCB1c2VyIik7Cj4g
LS0KPiAyLjQzLjAKPgoKVGhhbmtzCkp1c3RpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
