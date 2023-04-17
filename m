Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BE9C77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+g1mXmYf6vcav73GFY+jIrsBydxD/PRQlLuQcpWr+xg=; b=bHi2VpvKb54K1o
	IWP/0IJ/vS0XemudYiPnl8yUfwz+D/dkydjBQFWNjC9t8me4g0DHcFIWZw518V60PWvuN/OPA3C4E
	AxeJKmo14gFNHt+XP2TUTURYLQf4y3H6ICuunZbQ+yn8QbjHOdf1xae/uwAYdOJlukAj6U97X7tI2
	wdslrE2/2DkcPFBhkN0BIg0ECdtUzl0qJLlp7hchjohydNNA1a/fO49fhKHhc1Z0RlcsLNnVhdUQs
	g7GBQZtV6jjhvsSqOz8FM/y1gjZar15MkyRFmR2xgB37gFFjhABn9lUK+OZB8PtGT+mSOqXgJPpO3
	fNZGDs4vXLCJ6v8HnMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOxL-00GP2x-0w;
	Mon, 17 Apr 2023 13:31:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOxH-00GP1R-1y;
	Mon, 17 Apr 2023 13:31:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 362D8624A3;
	Mon, 17 Apr 2023 13:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940DFC4339B;
	Mon, 17 Apr 2023 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681738296;
	bh=Z1E7VRImbk5O8ynjKxbGEPL5/pNRjHf9QbC2IrDjeEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ApQLt+5hMKVQIvzY5fCsHXN1O9d66Vkqdbnf/xozhB9nuWuwLcZf/MN0ppBlfhFIt
	 HQDUV2nEhzb6hm2lIFc6FOWsKV/xtHSrJDm16DGEKIk7rmSl1kCXD+7UtJki0cUM41
	 8okXBMRnAHqFb3pXt6yy8HLqPKgBBH01IvciEYmbPaO9iX7on0mQpD89z1YsQnCqhL
	 q322Ce5KqizgqcdNbLPtssnzKOay7XNC41dL/SlQYjEfg4XGzbmnPKW+wXhduIwJN+
	 v6rbKR36oXKryWyC6KbHqtudzstgkxltXOwyhoC5jg1NY3BT/2BLRzyKhheW+Oby7i
	 1ToU1aRNddTrw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54f21cdfadbso366206607b3.7;
        Mon, 17 Apr 2023 06:31:36 -0700 (PDT)
X-Gm-Message-State: AAQBX9es1/GQeDijzvdrvGBIyNtKGDOJghzeI/q2gV4rkPpYCe17coZA
	PY2nohVkfOLWduYvoCMvvtqwoNfTG1rzlWaHNA==
X-Google-Smtp-Source: AKy350bviA6nMrYItp2UFoijYxMfOof9zLeZI1Waml/VUI/79m2nqsKw6eSDud+5a83sS7abqkKDxQ68edHzGfQfRRo=
X-Received: by 2002:a81:b60c:0:b0:54c:a67:90b with SMTP id u12-20020a81b60c000000b0054c0a67090bmr9245222ywh.5.1681738295535;
 Mon, 17 Apr 2023 06:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224620.8909-1-tanure@linux.com> <20230412224620.8909-2-tanure@linux.com>
In-Reply-To: <20230412224620.8909-2-tanure@linux.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Apr 2023 08:31:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1L4EOpVm7nXbZ0t8-9wHVq4531MN4Csemi-4SBd=zig@mail.gmail.com>
Message-ID: <CAL_JsqL1L4EOpVm7nXbZ0t8-9wHVq4531MN4Csemi-4SBd=zig@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] of: fdt: Scan /memreserve/ last
To: Lucas Tanure <tanure@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jbrunet@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	martin.blumenstingl@googlemail.com, narmstrong@baylibre.com, stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_063139_743996_1167EBF7 
X-CRM114-Status: GOOD (  20.08  )
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgNTo0NuKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBDaGFuZ2UgdGhlIG9yZGVyIG9mIHNjYW5uaW5nIC9tZW1yZXNl
cnZlLyBhbmQgL3Jlc2VydmVkLW1lbW9yeSBub2RlLgo+IC9yZXNlcnZlZC1tZW1vcnkgbm9kZSBz
aG91bGQgZ28gZmlyc3QsIGFzIGl0IGhhcyBhIG1vcmUgdXBkYXRlZAo+IGRlc2NyaXB0aW9uIG9m
IHRoZSBtZW1vcnkgcmVnaW9ucyBhbmQgaXQgY2FuIGFwcGx5IGZsYWdzLCBsaWtlIG5vbWFwLgo+
IEFsc28sIC9tZW1yZXNlcnZlLyBzaG91bGQgYXZvaWQgcmVzZXJ2aW5nIHJlZ2lvbnMgZGVzY3Jp
YmVkIGluCj4gL3Jlc2VydmVkLW1lbW9yeSBub2RlLgoKUGxlYXNlIGdpdmUgc29tZSBiYWNrZ3Jv
dW5kIGRldGFpbHMgd2h5IHdlIG5lZWQgdG8gbWFrZSB0aGlzIGNoYW5nZS4KQXMtaXMsIHNvdW5k
cyBsaWtlIHNvbWUgdGhlb3JldGljYWwgaXNzdWUuIElPVywgaW5jb3Jwb3JhdGUgc29tZSBvZgp0
aGUgZGV0YWlscyBpbiB0aGUgY292ZXIgbGV0dGVyIGhlcmUuIEZvciBzaW5nbGUgcGF0Y2hlcywg
eW91IGRvbid0Cm5lZWQgYSBjb3ZlciBsZXR0ZXIgYW55d2F5cy4KClBvd2VycGMgZm9sa3MsIHBs
ZWFzZSBjb21tZW50IGFuZC9vciB0ZXN0LiBJIHdvcnJ5IHRoZXJlIGNvdWxkIGJlIHNvbWUKc3Vi
dGxlIGRpZmZlcmVuY2VzIHdpdGggdGhpcyBjaGFuZ2UuCgo+Cj4gU2lnbmVkLW9mZi1ieTogTHVj
YXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+IC0tLQo+ICBkcml2ZXJzL29mL2ZkdC5jIHwg
NSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZmR0LmMgYi9kcml2ZXJzL29mL2ZkdC5jCj4g
aW5kZXggZDFhNjhiNmQwM2IzLi5jMjhhZWRkN2FlMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9v
Zi9mZHQuYwo+ICsrKyBiL2RyaXZlcnMvb2YvZmR0LmMKPiBAQCAtNjM1LDYgKzYzNSw5IEBAIHZv
aWQgX19pbml0IGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKHZvaWQpCj4gICAgICAg
ICBpZiAoIWluaXRpYWxfYm9vdF9wYXJhbXMpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+
ICsgICAgICAgZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7Cj4gKyAgICAgICBmZHRfcmVzZXJ2ZV9l
bGZjb3JlaGRyKCk7Cj4gKwo+ICAgICAgICAgLyogUHJvY2VzcyBoZWFkZXIgL21lbXJlc2VydmUv
IGZpZWxkcyAqLwo+ICAgICAgICAgZm9yIChuID0gMDsgOyBuKyspIHsKPiAgICAgICAgICAgICAg
ICAgZmR0X2dldF9tZW1fcnN2KGluaXRpYWxfYm9vdF9wYXJhbXMsIG4sICZiYXNlLCAmc2l6ZSk7
Cj4gQEAgLTY0Myw4ICs2NDYsNiBAQCB2b2lkIF9faW5pdCBlYXJseV9pbml0X2ZkdF9zY2FuX3Jl
c2VydmVkX21lbSh2b2lkKQo+ICAgICAgICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKGJhc2Us
IHNpemUpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBmZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsK
PiAtICAgICAgIGZkdF9yZXNlcnZlX2VsZmNvcmVoZHIoKTsKPiAgICAgICAgIGZkdF9pbml0X3Jl
c2VydmVkX21lbSgpOwo+ICB9Cj4KPiAtLQo+IDIuNDAuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
