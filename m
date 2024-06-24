Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831B2C2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpQHaWhbGWArR+nPIPgG3hA+tjO4xeevxVvT7UVl7kw=; b=XvfnaZTNUM9FPT
	8spW5LgrtblQ0SHkkDeGk+BN1EBzv2CbYNXOUlfi0WzYVBaCox+QDJQZB3JG/p2iLKvOJJjrndEBI
	IjHw/srkHuaNDYR/2LEA74VZnFKYAwA87/eMKVmzGxrYxf7hSIPQBKjGuut3litr+IKg59SiKpF6o
	CCi7ATc/+pBlmLn9DjyYg1GKWDdyaXZgUkcf854l5C/iRL6OYEE2YrvIDL72mm4jfJ7Us0dyC4ycg
	COhbSsDoXaYGyszvOD0uhezqz3EdlhPyzYmj5MqSNNkK9MM/BAhKen4MhapO9S3Z0Dm4DfGhpfygq
	z0o5Gl2KlYAnXcnFi29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgHX-0000000GIv5-3H14;
	Mon, 24 Jun 2024 09:46:39 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgHR-0000000GIqE-08mT;
	Mon, 24 Jun 2024 09:46:34 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5b97a071c92so1959120eaf.1;
        Mon, 24 Jun 2024 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222385; x=1719827185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbYplUMzhR1IxUvNZWKsrLoE8LHYWjW6BSc/xXyUo+M=;
        b=JkvjCTp6Q9PRu1WWxljdoADHFZPcLldE/sA8/sxcXWanX4dykc063klL9TRkn4+vtK
         XEq1bzh0BdI703baaxYjpNzW+Jgrg74klUzvtBKILBUkjPGKTjQYhUVwoHDNDlWvDo8d
         8UORlPx7mcsC5DVJ1sKu3AhGaHN28XaOjz7olOCPtNZzU29tYEz53C/V6XLVbBo3jZI3
         tEXQukjwl+r7O1Cn3oGiIOLxd4GDwzn/HbqQlgRR8oEHXv3KJ5cOSTcCdHjzr0Wh/rsm
         W5BbFugcsH19v+UfDwQT9TMfnaGG0UA/Hj6GnAJlqDmKpVALSa/kL2e60ZX2cT6tYUtl
         /3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222385; x=1719827185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbYplUMzhR1IxUvNZWKsrLoE8LHYWjW6BSc/xXyUo+M=;
        b=AFUz9idFgDs8N/9sSwl5eP3p8eLUQ8hQuAf3jQ2vEBUhaUF/OEjoGlDjoSeI96CXuZ
         GWBSZ+fqFYt8MrZF5mTyXYChHEcrqVNv0dR2D8LNpeKg9eOV7xPemTimtlsCabDfuLbT
         yfbRWFKle2eLkCnPmuxSFLHifunK4zQUMWNq01W8hYtD7N5fupjboyVeKgvR3kj2FS73
         6feDu1/jRt2TDByUlW/b/bGd3ks460CYxUePGYgzjw1S5QSmNxplgwUav0iVMUksvYfj
         2WLPl189VjTJoMhAP0antbiS0Yqvtrf/cIx4IURlHL6XwfW7g7MQUB7WY0l9fqiBUhvi
         nwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8zE4Lh0RI8MsMStfznp02a6qIFiEQVI7jeqyi0kx0/3/lkeebL8w+Fzg74V84jx+6dWAcjVdP8MhzZVYVp/PJdI/Q470IMOz5/kM3DnOmm4Rua8ZtWkP6ndLXZOelpcAPbfsK02noOvaAUE2oLLK6GhgcY0a+Uw==
X-Gm-Message-State: AOJu0YxtjGBsxZa3fdmoKTd3ovbmCUAv2SHfKbr7x8D+l+rgm1ifwW5g
	8J22hXa2Lr/QZgKIPGLa/sSdsDcuUUakPZAwgVmlAnCQKzKK7d2LDw32pc2mZ7MK+yR5m4KgNqJ
	u3BGwebLENp6tOwcQ4s6ZXxbMzlM=
X-Google-Smtp-Source: AGHT+IHSR6rbq3FIuKqHp0ot3ROxaxKLl2NcsdfsVuRhutbdT72OR6D67vRm8iSBissHjEm1b03lKoYZIYpEZCpukGY=
X-Received: by 2002:a4a:6c55:0:b0:5bb:672:4067 with SMTP id
 006d021491bc7-5c1e96b6632mr4696719eaf.7.1719222385363; Mon, 24 Jun 2024
 02:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240613123020.43500-1-linux.amoon@gmail.com> <20240613123020.43500-2-linux.amoon@gmail.com>
 <dbea269e-2de6-470d-96b7-ce1e07c8de07@linaro.org>
In-Reply-To: <dbea269e-2de6-470d-96b7-ce1e07c8de07@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 24 Jun 2024 15:16:10 +0530
Message-ID: <CANAwSgQroyVKvy8zgTta+-Xgw8B1P-4OVYDxodriXmzn6qzApw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid n2
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_024633_098576_16B8F0CB 
X-CRM114-Status: GOOD (  20.77  )
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

SGkgTmVpbCwKCk9uIE1vbiwgMjQgSnVuIDIwMjQgYXQgMTM6NDUsIE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTMvMDYvMjAy
NCAxNDozMCwgQW5hbmQgTW9vbiB3cm90ZToKPiA+IE9uIE9kcm9pZCBuMi9uMisgcHJldmlvdXNs
eSB1c2UgZ3Bpby1ob2cgdG8gcmVzZXQgdGhlIHVzYiBodWIsCj4gPiBzd2l0Y2ggdG8gdXNlZCBv
bi1ib2FyZCB1c2IgaHViIHJlc2V0IHRvIGVuYWJsZSB0aGUgdXNiIGh1Ygo+ID4gYW5kIGVuYWJs
ZSBwb3dlciB0byBodWIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPgo+ID4gLS0tCj4gPiB2Nzpub25lCj4gPiBWNjpub25lCj4gPiBWNTpu
b25lCj4gPiBWNDpub25lCj4gPiBWMzpub25lCj4gPiBWMjpub25lCj4gPiBWMTpub25lCj4gPiAt
LS0KPiA+ICAgLi4uL2R0cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLmR0c2kgICAgIHwg
MzYgKysrKysrKysrKysrLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLmR0c2kKPiA+IGluZGV4IGQ4MGRkOWEz
ZGEzMS4uODZlYjgxMTEyMjMyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCj4gPiBAQCAtMzEsNiArMzEs
MzAgQEAgaHViXzV2OiByZWd1bGF0b3ItaHViLTV2IHsKPiA+ICAgICAgICAgICAgICAgZW5hYmxl
LWFjdGl2ZS1oaWdoOwo+ID4gICAgICAgfTsKPiA+Cj4gPiArICAgICAvKiBVU0IgaHViIHN1cHBv
cnRzIGJvdGggVVNCIDIuMCBhbmQgVVNCIDMuMCByb290IGh1YiAqLwo+ID4gKyAgICAgdXNiLWh1
YiB7Cj4gPiArICAgICAgICAgICAgIGRyX21vZGUgPSAiaG9zdCI7Cj4gPiArICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyogMi4wIGh1YiBvbiBwb3J0IDEgKi8KPiA+ICsg
ICAgICAgICAgICAgaHViXzJfMDogaHViQDEgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAidXNiNWUzLDYxMCI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBlZXItaHViID0gPCZodWJfM18wPjsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICB2ZGQtc3VwcGx5ID0gPCZ1c2JfcHdyX2VuPjsKPiA+ICsg
ICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyogMy4wIGh1YiBvbiBwb3J0
IDQgKi8KPiA+ICsgICAgICAgICAgICAgaHViXzNfMDogaHViQDIgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAidXNiNWUzLDYyMCI7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDI+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBlZXItaHViID0gPCZo
dWJfMl8wPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbyBH
UElPSF80IEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdmRkLXN1
cHBseSA9IDwmdmNjXzV2PjsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICsgICAgIH07Cj4KPiBX
aHkgaXMgdGhpcyBub2RlcyB1bmRlciAvIGFuZCBub3QgdGhlIGR3YzMgbm9kZSA/Pz8/CgppdCdz
IHNpbWlsYXIgdG8gdXNiLWh1Yi1ob2csIG1vc3RseSB1c2ItaHViIGlzIGp1c3QgdXNlZCB0byBy
ZXNldCB0aGUKVVNCIGh1YiBjb250cm9sbGVyCmFuZCBzZXQgdGhlIHBvd2VyIHNvdXJjZSBvZiB0
aGUgVVNCIGh1Yi4KCj4KPiBXaXRoIHRoaXMgY3VycmVudCBEVCwgdGhlcmUncyBubyB3YXkgZm9y
IHRoZSB1c2IgY29udHJvbGxlcgo+IHRvIGZpbmQgdGhvc2UgdXNiIGRldmljZXMgc3Vibm9kZXMg
aW4gL3VzYi1odWIsIGFuZCBpdCdzIGNsZWFybHkKPiBub3QgZGVzY3JpYmVkIGxpa2UgdGhpcyBp
biB0aGUgYmluZGluZ3MuCgpVU0IgaHViIGlzIGluZGVwZW5kZW50IG9mIHRoZSBkd2MyIGFuZCBk
d2MzIGluaXRpYWxpemF0aW9uIChwaHksIHVzYikuCgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCBv
biBteSBvZHJvaWQtbjJwbHVzICwKSSBjb3VsZCBzZWUgdXNiLWh1YiBlbnRyeSBpbiB0aGUgL3By
b2MvZGV2aWNlLXRyZWUgbm9kZXMuCgphbGFybUBvZHJvaWQtbjJwbHVzOn4kIHRyZWUgIC9wcm9j
L2RldmljZS10cmVlL3VzYi1odWIvCi9wcm9jL2RldmljZS10cmVlL3VzYi1odWIvCuKUnOKUgOKU
gCAjYWRkcmVzcy1jZWxscwrilJzilIDilIAgZHJfbW9kZQrilJzilIDilIAgaHViQDEK4pSCICAg
4pSc4pSA4pSAIGNvbXBhdGlibGUK4pSCICAg4pSc4pSA4pSAIG5hbWUK4pSCICAg4pSc4pSA4pSA
IHBlZXItaHViCuKUgiAgIOKUnOKUgOKUgCBwaGFuZGxlCuKUgiAgIOKUnOKUgOKUgCByZWcK4pSC
ICAg4pSU4pSA4pSAIHZkZC1zdXBwbHkK4pSc4pSA4pSAIGh1YkAyCuKUgiAgIOKUnOKUgOKUgCBj
b21wYXRpYmxlCuKUgiAgIOKUnOKUgOKUgCBuYW1lCuKUgiAgIOKUnOKUgOKUgCBwZWVyLWh1Ygri
lIIgICDilJzilIDilIAgcGhhbmRsZQrilIIgICDilJzilIDilIAgcmVnCuKUgiAgIOKUnOKUgOKU
gCByZXNldC1ncGlvcwrilIIgICDilJTilIDilIAgdmRkLXN1cHBseQrilJzilIDilIAgbmFtZQri
lJTilIDilIAgI3NpemUtY2VsbHMKCjMgZGlyZWN0b3JpZXMsIDE3IGZpbGVzCmFsYXJtQG9kcm9p
ZC1uMnBsdXM6fiQKCmFsYXJtQG9kcm9pZC1uMnBsdXM6fiQgbHN1c2IgLXR2Ci86ICBCdXMgMDAx
LlBvcnQgMDAxOiBEZXYgMDAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2ktaGNkLzJwLCA0
ODBNCiAgICBJRCAxZDZiOjAwMDIgTGludXggRm91bmRhdGlvbiAyLjAgcm9vdCBodWIKICAgIHxf
XyBQb3J0IDAwMTogRGV2IDAwMiwgSWYgMCwgQ2xhc3M9SHViLCBEcml2ZXI9aHViLzRwLCA0ODBN
CiAgICAgICAgSUQgMDVlMzowNjEwIEdlbmVzeXMgTG9naWMsIEluYy4gSHViCiAgICAgICAgfF9f
IFBvcnQgMDAzOiBEZXYgMDAzLCBJZiAwLCBDbGFzcz1NYXNzIFN0b3JhZ2UsCkRyaXZlcj11c2It
c3RvcmFnZSwgNDgwTQogICAgICAgICAgICBJRCAwNThmOjYzODcgQWxjb3IgTWljcm8gQ29ycC4g
Rmxhc2ggRHJpdmUKLzogIEJ1cyAwMDIuUG9ydCAwMDE6IERldiAwMDEsIENsYXNzPXJvb3RfaHVi
LCBEcml2ZXI9eGhjaS1oY2QvMXAsIDUwMDBNCiAgICBJRCAxZDZiOjAwMDMgTGludXggRm91bmRh
dGlvbiAzLjAgcm9vdCBodWIKICAgIHxfXyBQb3J0IDAwMTogRGV2IDAwMiwgSWYgMCwgQ2xhc3M9
SHViLCBEcml2ZXI9aHViLzRwLCA1MDAwTQogICAgICAgIElEIDA1ZTM6MDYyMCBHZW5lc3lzIExv
Z2ljLCBJbmMuIEdMMzUyMyBIdWIKICAgICAgICB8X18gUG9ydCAwMDQ6IERldiAwMDMsIElmIDAs
IENsYXNzPU1hc3MgU3RvcmFnZSwKRHJpdmVyPXVzYi1zdG9yYWdlLCA1MDAwTQogICAgICAgICAg
ICBJRCAxNzRjOjU1YWEgQVNNZWRpYSBUZWNobm9sb2d5IEluYy4gQVNNMTA1MUUgU0FUQSA2R2Iv
cwpicmlkZ2UsIEFTTTEwNTNFIFNBVEEgNkdiL3MgYnJpZGdlLCBBU00xMTUzIFNBVEEgM0diL3Mg
YnJpZGdlLApBU00xMTUzRSBTQVRBIDZHYi9zIGJyaWRnZQoKPgo+IE5laWwKPgoKVGhhbmtzCi1B
bmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
