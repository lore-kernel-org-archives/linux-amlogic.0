Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2C7C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8UQbvb9amnQ2VeQB0r0UEzm7baCBsAszkYOTRTmGG4=; b=SUazfl6Ediptg9
	/4+DEeRm3VYdPslDga118BbIR3LPG+kZ3VubkZnM5hgiphHqgLE6367TDsyp0C2ggjjfnWGhPveIx
	LttY7zuS5TDZY8/I2JldACyYEIcGjq09Xkf695Z86N8SmhVNI1T1qiXTWYJm3N7mKizoZp7ONZNVf
	4BDulSVxdJ8IlP2px/b68rPXGr8dOVrapglL3MxGqw0JbEMv5y/+XDDs8U9FhiHeBsu6XJQFNXTmM
	pznRVBb9Wcntm4z5peizwky5IgNw91d3EY7+ijI801Z1WNQUOZBIddIklT0TmhVC3oFvSq7+Zgd3e
	I5WVLK6he6QlqThi2aMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYax-0000000BoWe-26Ql;
	Tue, 03 Jun 2025 20:50:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYZe-0000000BoGy-3DoG
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 20:49:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2353a2bc210so43056165ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748983770; x=1749588570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT6b8lrgqqFgJL1GBl4bDuZB9RiEcEu9mJDEkOukBE8=;
        b=lY6nEmTtoR9+wkaW04HK8Wz86fow6ykLjVhp7wcayblQwNunqknrDDSu//RYUSN89t
         s0ERELPbGVdEXZ4GAxhZxKpo4qAIoENBJ4rLZKfUIXuEq99//BJq1MYRcW4V01BdmZKM
         CNjvAwNuwB3DdAzcTeHhFWaUios4e9dwlc7qe3MdmKJcBceNhr2qW+xLOhHGXoSVv0Eq
         zMZHQCl+dpebEZBu4H1/hTTIkWy6knUGU12D+SSbnHGRyGOP+fHNwNUn4y9ixrFBrQQ1
         QYViYPigq+1Fed4qUXNeAs3obRvr1er7mSy7tEI/7FVzty9irIFmtvlZM9bL6vsIEgF3
         ZBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748983770; x=1749588570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT6b8lrgqqFgJL1GBl4bDuZB9RiEcEu9mJDEkOukBE8=;
        b=jDp5PE3TCUn9hYTBWCyFBMHDqw7rlKlIQZiYnJD2yNvXdXex2C7sB2DXLjIjcOAy0m
         vsxGeiPl0JXgrygRvEFXQSEYJ2ki1Soyp0CrPUZk1DF4eE+emzgPP9OvFnQJ0JtkKk7H
         4/waLzyXro0QkbvBEOifQHP7EqsboPG0NGzOScUL0EwwRYUE9kDt0mmYIazJO6EyKUJq
         zUZEpbyu7Ba+z6LEkjg7oYj9HfVNPy3zD5gvWvdJoVWZRmy/OGsCJg3w8wLAjUda6ACp
         IUtBmmwp6ypXcMHHo0iZtsROpPIytd3/VtiS2qXRxsmkz9qOYd4vkr1FbfzWesefRZCe
         xeXA==
X-Forwarded-Encrypted: i=1; AJvYcCVNbRsVSVS5ZlNgi/jbbiysTf+xrzrMoL6CXQ8HteiPRZ5QPcG6Epq3va0i6u3TrCHXaAe3ffG2Di944RY5@lists.infradead.org
X-Gm-Message-State: AOJu0YwUPeCNUMEkwlRx/NHG4Mus+0ZkgPD9xHWQTcxpNyMNXqfdPDW7
	DlmHd2KEaWgnJZYUnJaRCAVjUcXyWXLtlqVx5k2VRK4zeSvxnTl8EbWjmtY21g+tou39aNAxeN8
	ESSiIKlQTnBmNlB8gduXtcZPzZjHXTgs=
X-Gm-Gg: ASbGnctTJX9t/cHvI6q0GTcTuA+uaiJ2khU6dm0pGEi1BfK9wfqjWG9aJZTysIEwPKC
	ewxat1pyAJS/hNpWj1uAZFEbYGlb0P68hgSZrD2/4hceVeui+kYzfLH8shXqb22yQxpybnu6wP9
	vBeWijNj8OsGEL8CpAyGbIMYx5XY0+5s9983kKGHzul9qjECZ82Mw+M82f3EyiBzCIHg==
X-Google-Smtp-Source: AGHT+IEM3YZaQX/A60Zzpx+ejHtbnFOdvWodIDgGuggyqOdN87fV84SwLE33oXuthYUpwqvTC8pwe0V3yf770qdNxi8=
X-Received: by 2002:a17:902:e80c:b0:22f:b6d6:2737 with SMTP id
 d9443c01a7336-235e112bd77mr3137775ad.10.1748983769781; Tue, 03 Jun 2025
 13:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748933789.git.zhoubinbin@loongson.cn> <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
In-Reply-To: <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 22:49:18 +0200
X-Gm-Features: AX0GCFteOM7ZMyh-EJrDItvjGO_dZWpdc3mR1pxM7ueqGcCcSsZZMDA6354FhmQ
Message-ID: <CAFBinCA6f6jJQZEgHTiK8FqXW=v465a5rB0BZutDhct-4yhX_Q@mail.gmail.com>
Subject: Re: [PATCH v3 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_134930_806433_05F54DF1 
X-CRM114-Status: GOOD (  18.63  )
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

SGVsbG8sCgpPbiBUdWUsIEp1biAzLCAyMDI1IGF0IDI6MjjigK9QTSBCaW5iaW4gWmhvdSA8emhv
dWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiBVc2UgbmV3IGZ1bmN0aW9uIGRldm1fbW1j
X2FsbG9jX2hvc3QoKSB0byBzaW1wbGlmeSB0aGUgY29kZS4KPgo+IENjOiBOZWlsIEFybXN0cm9u
ZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFu
QGJheWxpYnJlLmNvbT4KPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+
Cj4gQ2M6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4gQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFJldmlld2Vk
LWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4KPiBTaWduZWQtb2ZmLWJ5
OiBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4KPiAtLS0KPiAgZHJpdmVycy9t
bWMvaG9zdC9tZXNvbi1teC1zZGlvLmMgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaW8uYyBiL2RyaXZlcnMvbW1jL2hvc3Qv
bWVzb24tbXgtc2Rpby5jCj4gaW5kZXggZTBhZTVhMGM5NjcwLi5iNmNiNDc1ZjFhNWYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1teC1zZGlvLmMKPiArKysgYi9kcml2ZXJz
L21tYy9ob3N0L21lc29uLW14LXNkaW8uYwo+IEBAIC02NDAsNyArNjQwLDcgQEAgc3RhdGljIGlu
dCBtZXNvbl9teF9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAg
ICAgIGVsc2UgaWYgKElTX0VSUihzbG90X3BkZXYpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihzbG90X3BkZXYpOwo+Cj4gLSAgICAgICBtbWMgPSBtbWNfYWxsb2NfaG9zdChzaXpl
b2YoKmhvc3QpLCAmc2xvdF9wZGV2LT5kZXYpOwo+ICsgICAgICAgbW1jID0gZGV2bV9tbWNfYWxs
b2NfaG9zdCgmc2xvdF9wZGV2LT5kZXYsIHNpemVvZigqaG9zdCkpOwpUaGlzIGNoYW5nZSBpcyBm
aW5lIGF0IHJ1bnRpbWUgKG9uIG15IE9kcm9pZC1DMSBib2FyZCkgYnV0IGl0IGNhbiBsZWFkCnRv
IGEgdXNlLWFmdGVyLWZyZWUgaXNzdWUuCm1lc29uX214X21tY19yZWdpc3Rlcl9jbGtzKCkgZGV2
bV8gcmVnaXN0ZXJzIHR3byBjbG9ja3MgYW5kIHVzZXMKaG9zdC0+Y29udHJvbGxlcl9kZXYgYXMg
ZGV2aWNlLgpUaGlzIGxlYWRzIHRvIHRoZSBmYWN0IHRoYXQgZHVyaW5nIGRyaXZlciByZW1vdmFs
IHN0cnVjdAptZXNvbl9teF9tbWNfaG9zdCBpcyBmcmVlJ2QgYmVmb3JlIGhvc3QtPmNvbnRyb2xs
ZXJfZGV2LCB3aGljaCBtZWFucwp0aGUgY2xvY2tzIGFyZSBhbHNvIGZyZWUnZCBhZnRlciBzdHJ1
Y3QgbWVzb25fbXhfbW1jX2hvc3QgaXMgYWxyZWFkeQpnb25lLiBUaGUgcHJvYmxlbSBoZXJlOiB0
aGUgY2xvY2tzIG5lZWQgdGhlIHN0cnVjdCBjbGtfZGl2aWRlciBhbmQKc3RydWN0IGNsa19maXhl
ZF9mYWN0b3IgZnJvbSBzdHJ1Y3QgbWVzb25fbXhfbW1jX2hvc3QuCgpJIGRvbid0IHVuZGVyc3Rh
bmQgd2h5IEknbSBub3Qgc2VlaW5nIGFueSBwcm9ibGVtcyB3aXRoIHRoaXMgcGF0Y2ggYXQKcnVu
dGltZSAtIG1heWJlIHdoYXQgSSdtIGRlc2NyaWJpbmcgaXMganVzdCBhIHRoZW9yZXRpY2FsIGlz
c3VlCihiZWNhdXNlIGl0IHdvdWxkIG9ubHkgaXQgaWYgc29tZXRoaW5nIHdvdWxkIGFjY2VzcyB0
aGUgY2xvY2tzIGJldHdlZW4KZnJlZWluZyBzdHJ1Y3QgbWVzb25fbXhfbW1jX2hvc3QgYW5kIHJl
bW92YWwgb2YgdGhlIGNsb2NrcyBhIGZldwptaWxsaXNlY29uZHMgbGF0ZXIpLgoKV2hhdCBhcmUg
eW91ciB0aG91Z2h0cyBvbiB0aGlzPwpJZiB3ZSdyZSBjb25jZXJuZWQgYWJvdXQgdGhlIHBvdGVu
dGlhbCBVQUYgdGhlbiBJIGNhbiByZWZhY3RvcgptZXNvbl9teF9tbWNfcmVnaXN0ZXJfY2xrcygp
IGZpcnN0IGFuZCB0aGVuIGFwcGx5IHRoaXMgcGF0Y2gKYWZ0ZXJ3YXJkcy4KCgpCZXN0IHJlZ2Fy
ZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
