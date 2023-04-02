Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B961C7619A
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Apr 2023 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FJIZtx9t0qHXu4062TC9LR8KWgfrePehcJAOQTyyh0=; b=sg3qX1b19tm55q
	BLLe991D8LxyVhzbV7YtfutkvLwyXtX8e2bmusi3fV/BY0Kw/lhHjrljFMSbvCuCiQa/qaCB6br+5
	L8WbBgQPpMm2qQ8mLucOx7ovNYBdVjXCoYekSP0rSouuYAG5DXqD8/yA25se1ss6OGhcqO7I4DRFT
	v71lm9/H9lUHsTz0OpGOa1MTKK078Etztmm6CE15ICGy4T0e4q6cGxOWS8sS8U4lOuRX5JXCwjpUj
	OGOkdQQ8q45cIUSV46lrsvDN1/4nq6aCuily0SiFdSo1nF2i+5bsjaqklnytaVjjx+lS8eXH3RTfl
	W6mpu6P2xMHP0DynPy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pixUt-00CV2M-0p;
	Sun, 02 Apr 2023 13:11:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pixUp-00CV1o-2i
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Apr 2023 13:11:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso18192203wmb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 02 Apr 2023 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680441105; x=1683033105;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnKA/rJs/YqdQyIRLVbwT2UTWdW3DnAQlOaSJno/au0=;
        b=Ymd35wN2lMaWHqCqSopqFnECFfw8b8flj6TTeYkZ2I7gLilnjtJmC4lM0xAfFwuTAI
         AmrPN+fXKqN7l4VnIHmEeu//ekJkI/0J7l85WZk2FwMxMtOfbXLHfeYkMSPXJ499ArqF
         NJD7ZoaPY/1WRrYvKxmpn53lAeOPpMaNtQoxw3xqvoLULqMiJFZ8LzLL12Zx7K45H4yq
         nfRapQyc+LAVNYt57uyA4R4+4j8k+n0MZymZxy0+2B2euTAYktFjdLZ6XpWePyeDG3dO
         hmTPYEoyfzHEPgw0GNXswE1siKsfuYtaCIOsCTwwn+bIb9dnh2OYIiacznUjSQXnODIF
         TRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680441105; x=1683033105;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnKA/rJs/YqdQyIRLVbwT2UTWdW3DnAQlOaSJno/au0=;
        b=3A3YPFcsyLKsErTgqYeIksSQojEgjinmgd0Q7bY5soyqMrUjYbCzWlR1oYWO42eNXR
         R9KcEWKDFgDH3xIaRQ5HpOVcQyyYs+fXp8DzrDDjzAvk4f88QqaKE8uDUAkw7A5iRoRJ
         1ElFXecWLdUSWheRxdQ3288nI9aMP8fb4WAruz1w2wai8JJFMYtsZsYi9vk4gEgP0Mcy
         3MfWnvycFZsyzWy9tIrriWIHb6gS/dGpJi+9A1tUT0cNikweAfFOKJHRxOlQeE+AbMMU
         pdBnERq21LFGSN/caLd2XRDYXidOQZ1HpBJ5Ry3LmT2xfmpgxaPzseHGcrkDoffSnPU/
         uhdw==
X-Gm-Message-State: AO0yUKWHZb/s9Fs7zwuHJdSB6cMOaqxhc4j7M+tFKCc81LO4AN/4Li5k
	WgocGwVA/Qp1PxZM2Yqdpbc=
X-Google-Smtp-Source: AK7set+BE9+1XY1jQ2bVkiXLFXArtJVu5K69SzBLX7UK84QvLfETulq5BPtiC2yulCArNHPmSc9hOg==
X-Received: by 2002:a1c:790e:0:b0:3ed:a82d:dfe2 with SMTP id l14-20020a1c790e000000b003eda82ddfe2mr23897436wme.29.1680441104976;
        Sun, 02 Apr 2023 06:11:44 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c228500b003e91b9a92c9sm9025808wmf.24.2023.04.02.06.11.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Apr 2023 06:11:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: Kernel Panic - V6.2 - Reseved memory issue
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
Date: Sun, 2 Apr 2023 17:11:41 +0400
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>,
 Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
Message-Id: <9BAD677A-74AF-4515-B19C-A15A69CE53EF@gmail.com>
References: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
To: tanure@linux.com,
 Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_061147_919373_1CBB0EA6 
X-CRM114-Status: GOOD (  27.20  )
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

PiBPbiAyIEFwciAyMDIzLCBhdCAxMjoxMCBwbSwgTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXgu
Y29tPiB3cm90ZToKPiAKPiBIaSwKPiAKPiBJIGFtIHRyeWluZyB0byBmaXggYSBrZXJuZWwgcGFu
aWMgSSBhbSBzZWVpbmcgb24gbXkgdmltMyBib2FyZCAoQW1sb2dpYyBBMzExRCkuCj4gSSBkb24n
dCBoYXZlIGVub3VnaCBrbm93bGVkZ2UgYWJvdXQgdGhpcyBhcmVhLCBidXQgbXkgY3VycmVudCBn
dWVzcyBpcwo+IHRoZSBrZXJuZWwgaXMgdXNpbmcgYSBwaWVjZSBvZiBtZW1vcnkgYmVsb25naW5n
IHRvIEFSTS10cnVzdGVkCj4gZmlybXdhcmUgdGhhdCBJIHNob3VsZG4ndC4KPiBMb2c6Cj4gCj4g
WyA5Ljc5Mjk2Nl0gU0Vycm9yIEludGVycnVwdCBvbiBDUFUzLCBjb2RlIDB4MDAwMDAwMDBiZjAw
MDAwMCAtLSBTRXJyb3IKPiBbIDkuNzkyOTgwXSBDUFU6IDMgUElEOiAzNDcxIENvbW06IGtkZWQ1
IFRhaW50ZWQ6IEcgQyA2LjIuMCAjMQo+IFsgOS43OTI5ODVdIEhhcmR3YXJlIG5hbWU6IEtoYWRh
cyBWSU0zIChEVCkKPiBbIDkuNzkyOTg3XSBwc3RhdGU6IDIwMDAwMDA1IChuekN2IGRhaWYgLVBB
TiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkKPiBbIDkuNzkyOTkxXSBwYyA6IGttZW1f
Y2FjaGVfZnJlZV9idWxrLnBhcnQuOTgrMHgxZjAvMHg1MjgKPiBbIDkuNzkzMDA0XSBsciA6IGtt
ZW1fY2FjaGVfZnJlZV9idWxrLnBhcnQuOTgrMHgyZjgvMHg1MjgKPiBbIDkuNzkzMDA4XSBzcCA6
IGZmZmY4MDAwMGEyZWI3ZjAKPiBbIDkuNzkzMDA5XSB4Mjk6IGZmZmY4MDAwMGEyZWI3ZjAgeDI4
OiBmZmZmMDAwMDFmMzU4NTE4IHgyNzogZmZmZjAwMDAwMDAwODgwMAo+IFsgOS43OTMwMTZdIHgy
NjogZmZmZjAwMDAwMjYyYjMwMCB4MjU6IGZmZmYwMDAwMDI2MmIzMDAgeDI0OiAwMDAwMDAwMDAw
MDAwMDAxCj4gWyA5Ljc5MzAxOV0geDIzOiBmZmZmMDAwMDAyNjJiMDAwIHgyMjogMDAwMDAwMDAw
MDAwMDAwMCB4MjE6IGZmZmYwMDAwMWYzNTg1MzgKPiBbIDkuNzkzMDIyXSB4MjA6IGZmZmZmYzAw
MDAwOThhYzAgeDE5OiAwMDAwMDAwMDAwMDAwMDA0IHgxODogMDAwMDAwMDAwMDAwMDA0MAo+IFsg
OS43OTMwMjVdIHgxNzogMDAwMDAwMDAwMDAwMDAxOCB4MTY6IDAwMDAwMDAwMDAwMDA3ZjggeDE1
OiAwMDAwMDAwMDAwMDAwMDAzCj4gWyA5Ljc5MzAyOF0geDE0OiAwMDAwMDAwMDAwMDAwMDA2IHgx
MzogZmZmZjgwMDAwOGU0ODU1MCB4MTI6IDAwMDBmZmZmOWRjOTFmZmYKPiBbIDkuNzkzMDMxXSB4
MTE6IDAwMDAwMDAwMDAwMDAwMDQgeDEwOiAwMDAwMDAwMDAwMDAwMDAxIHg5IDogZmZmZjAwMDAw
N2U5MzY4MAo+IFsgOS43OTMwMzVdIHg4IDogMDAwMDAwMDAwMDAwMDAyMCB4NyA6IGZmZmYwMDAw
MDFkMmIxMDAgeDYgOiAwMDAwMDAwMDAwMDAwMDA3Cj4gWyA5Ljc5MzAzN10geDUgOiAwMDAwMDAw
MDAwMDAwMDIwIHg0IDogZmZmZjAwMDAwMDAwODgwMCB4MyA6IDAwMDAwMDAwMDAwMDAwMDEKPiBb
IDkuNzkzMDQwXSB4MiA6IDAwMDAwMDAwMDAwMDAwMDcgeDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgw
IDogZmZmZjAwMDAxZjM1ODU0MAo+IFsgOS43OTMwNDVdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBBc3luY2hyb25vdXMgU0Vycm9yIEludGVycnVwdAo+IAo+IFRoaXMgZG9lc24ndCBoYXBw
ZW4gd2l0aCBkb3duc3RyZWFtIEtoYWRhcyA2LjIga2VybmVsLCBhbmQgdGhhdCdzCj4gYmVjYXVz
ZSB0aGUgZG93bnN0cmVhbSBrZXJuZWwgcmVtb3ZlZCB0aGlzIGZyb20KPiBlYXJseV9pbml0X2R0
X3Jlc2VydmVfbWVtb3J5IChkcml2ZXJzL29mL2ZkdC5jKToKPiAKPiAvKgo+ICogSWYgdGhlIG1l
bW9yeSBpcyBhbHJlYWR5IHJlc2VydmVkIChieSBhbm90aGVyIHJlZ2lvbiksIHdlCj4gKiBzaG91
bGQgbm90IGFsbG93IGl0IHRvIGJlIG1hcmtlZCBub21hcCwgYnV0IGRvbid0IHdvcnJ5Cj4gKiBp
ZiB0aGUgcmVnaW9uIGlzbid0IG1lbW9yeSBhcyBpdCB3b24ndCBiZSBtYXBwZWQuCj4gKi8KPiBp
ZiAobWVtYmxvY2tfb3ZlcmxhcHNfcmVnaW9uKCZtZW1ibG9jay5tZW1vcnksIGJhc2UsIHNpemUp
ICYmCj4gICAgbWVtYmxvY2tfaXNfcmVnaW9uX3Jlc2VydmVkKGJhc2UsIHNpemUpKQo+ICAgICAg
ICAgIHJldHVybiAtRUJVU1k7Cj4gCj4gCj4gQW5kIHRoaXMgY2F1c2VzIDMgTWlCIG9mIG1lbW9y
eSBiZWxvbmdpbmcgdG8gQVJNIFRydXN0ZWQgZmlybXdhcmUgdG8KPiBiZSByZXNlcnZlZC4KPiAK
PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIDoKPiAv
KiAzIE1pQiByZXNlcnZlZCBmb3IgQVJNIFRydXN0ZWQgRmlybXdhcmUgKEJMMzEpICovCj4gc2Vj
bW9uX3Jlc2VydmVkOiBzZWNtb25ANTAwMDAwMCB7Cj4gICAgICAgIHJlZyA9IDwweDAgMHgwNTAw
MDAwMCAweDAgMHgzMDAwMDA+Owo+ICAgICAgICBuby1tYXA7Cj4gfTsKPiAKPiBBbmQgdGhlIG1h
aW5saW5lIGtlcm5lbCBmYWlscyB0byByZXNlcnZlIHRoYXQgbWVtb3J5Ogo+IFsgICAgMC4wMDAw
MDBdIE9GOiBmZHQ6IFJlc2VydmVkIG1lbW9yeTogZmFpbGVkIHRvIHJlc2VydmUgbWVtb3J5IGZv
cgo+IG5vZGUgJ3NlY21vbkA1MDAwMDAwJzogYmFzZSAweDAwMDAwMDAwMDUwMDAwMDAsIHNpemUg
MyBNaUIKPiAKPiBJdCBmYWlscyB0byByZXNlcnZlIGJlY2F1c2UgbWVtYmxvY2tfb3ZlcmxhcHNf
cmVnaW9uIGFuZAo+IG1lbWJsb2NrX2lzX3JlZ2lvbl9yZXNlcnZlZCByZXR1cm4gb25lLgo+IEkg
dGhpbmsgbWVtYmxvY2tfaXNfcmVnaW9uX3Jlc2VydmVkIGlzIHNheWluZyB0aGUgbWVtb3J5IGlz
IGFscmVhZHkKPiByZXNlcnZlZCBieSB1Ym9vdCBhbmQgc2hvdWxkbid0IGJlIG5vbWFwLCBidXQg
aXQgc2hvdWxkLgo+IAo+IElzIHRoZXJlIGEgYnVnIGhlcmU/Cj4gV2h5IHRoZSBrZXJuZWwgaXMg
ZmFpbGluZyB0byByZXNlcnZlIHRoaXMgbWVtb3J5Pwo+IElzIHRoaXMgYW4gdS1ib290IGlzc3Vl
Pwo+IAo+IEkgd291bGQgYXBwcmVjaWF0ZSBhbnkgaGVscC4gVGhlIGN1cnJlbnQgbWFpbmxpbmUg
a2VybmVsIGZhaWxzIDkwJSBvZgo+IHRoZSB0aW1lIHRvIGJvb3QgaW50byB0aGUgVmltMyBib2Fy
ZC4KClRoZSBpc3N1ZSB3YXMgcmFpc2VkIGJlZm9yZSBieSBTdGVmYW4gQWduZXIgaGVyZToKCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvNDBjYTExZjg0YjdjZGJmYjlh
ZDJkZGQ0ODBjYjIwNGFAYWduZXIuY2gvCgpUaGUgdGhyZWFkIHNvcnQgb2YgcG9pbnRzIGF0IHRo
ZSBnZW5lcmFsIGlzc3VlIGJ1dCB0aGUgY29udmVyc2F0aW9uCmZpenpsZWQgb3V0IGFuZCBkaWRu
4oCZdCBsZWFkIHRvIGFueSBjaGFuZ2VzLiBBdCBvbmUgcG9pbnQgU3RlZmFuIG1hZGUKYSBzdWdn
ZXN0aW9uIGFib3V0IHJldmVydGluZyBwYXJ0IG9mIHRoZSBjb2RlLCBsZWFkaW5nIHRvIHRoaXMg
cGF0Y2gKaW4gbXkgb3duIHBhdGNoc2V0OgoKaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvbGlu
dXgvY29tbWl0Lzk2MzNjOWIyNGY2ZjE2YWZkYjdmYThjMmUxNjNiNmVhN2E3YWM1ZjgKClRoZSBp
c3N1ZSBpcyBzdGlsbCBwcmVzZW50IGFuZCB0aGUgcGF0Y2ggZG9lcyB3b3JrIGFyb3VuZCBpdC4g
VGhlCmNyYXNoZXMgd291bGQgcHJvYmFibHkgc2hvdyB1cCBtb3JlLCBvbmx5IGEgbGFyZ2UgcGVy
Y2VudGFnZSBvZgpkaXN0cm9zIHRoYXQgYWN0aXZlbHkgc3VwcG9ydCBBbWxvZ2ljIGJvYXJkcyAo
YW5kIHNldmVyYWwgdmVuZG9ycykKYXJlIHBpY2tpbmcgY2h1bmtzIG9mIG15IGN1cmF0ZWQgTGli
cmVFTEVDIHBhdGNoc2V0IGZvciB0aGVpciBvd24Ka2VybmVscyBhbmQgdGh1cyB0aGF0IHBhdGNo
IGlzIHF1aXRlIHdpZGVseSB1c2VkLgoKQ2hyaXN0aWFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
