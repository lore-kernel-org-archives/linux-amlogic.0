Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8259C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOZ/tihtv1cSl33HR6vQ3r2s7bV5qvLFMxCxZlMwduQ=; b=TZ2Z6VG4r2/79/
	ULtC9rgfSdCmqcgERL2vQAPa1E0gMA+pX+/2dPqOLnCam3qrA+X0lC8ZibXE7uldXEwo0BJ7r/SmI
	ozCvVMQ2KuzEfJn9Di0tlxSEg4V4N16cHg2gc75h9ecGPd3uR5vTAQpWlu6f8AFrWU9+fFaLOfTm5
	JTICcUOn4XrQVJqaiZnPh5oa3DZXnktp6ocXuMq0MT+T0nglXfgeIxGZrmNfpzbXzGrH4dEdrXjpL
	kPc2ZBjvt/9g3mfgRUakoqK7N3YEPIv809UrLawUniLcUBxcM5L/S4q/TxRQXzxNFMaK3fZl3g5EE
	PGeIxGYA1vC38ni+cnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJmD-0000000BSKF-3SVr;
	Thu, 03 Jul 2025 13:14:57 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIbK-0000000BF8r-3bHF
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 11:59:40 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-710f39f5cb9so77765657b3.3
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751543978; x=1752148778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pefmerJdn8/jbn5cGxudCHFA3qaC/GYL41dyFZHwfn8=;
        b=ul8mCo+2Ow9anvTBA4YL+P1zp1zvbDsPqPG806djlPXqSodF1bCYqkiPCe5s5gvNi2
         cjA7wXJNu04rMQlctatcIRRQ3WMxnKAFKx+edV8VMbTvvojnYNCCXucc9gl5YTTgLURo
         Pw5rjgfVDo/sJw9AevoLoDQ8PsA8V9dInOzZymseOpfmHpQEEF3rE4fj6hZ0Bhfs3gLj
         yuI0R+hO6iF9s8ckAVpd8u7jiCzcU6Udiru5+Phfq0TyYMP/n9sfAKe30vSY5U5ZYyvK
         YuW5j3Z0k9HM8BUqGTZzi6MaMv5RNiSy8f8T7+PtElaVkZcwrSogf7vB7kvqraVrBmwZ
         Sn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543978; x=1752148778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pefmerJdn8/jbn5cGxudCHFA3qaC/GYL41dyFZHwfn8=;
        b=BUHOORmSeCYmVy3g4gArqsKBUzxuQERDz4svjXZiW1TqdxCjCM9D4PFHGsH13VzFUS
         UrdGsKTuDruijY0r/Q+hU57wDYh7xZb22hOFbGLc5Z+Q+jGLHIPmdJaNZuOndT0II9G0
         AjNC7d/w7w+wJDZkrYC0uwuABKIgJVbYY109iJVLNGcHVE8xy/gon9ikIezRP0BzzU52
         lxl8oDwmN6ipdEFedFHCptgthsbJZuxKl4RH2L2grOBXjiVLQDrI8bI03/308MEBhoFh
         5/m2xgFtssdDDfBQItWDgsBFre6DHgrrBzhcUs14UVqgm1j+fyjoMREfpnrWLhE8fFw6
         yhXw==
X-Forwarded-Encrypted: i=1; AJvYcCXpfSpXltBJZwg0RFsvO+ITnWUB88zLm7hnZYcLdVS43foVRsCThKy5RdfxNh+2nYC9YOLkAY12SNyTRm3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkm9gpeMF37FUdBuXOIV40JYSE7xyljlCeutZHH3ghPF3aCZ8l
	h4oeykrqakB0HUhiFdqj3Ozz8ZHuLaOgcR1p/9Uk3/IBsW4VZnq4LimMgPjSx+SdX02x30C4gFi
	SFVhQDR3zUM/pipnf09hTSL8+7M7gIICeo+vtlNQLoQ==
X-Gm-Gg: ASbGncuL0De5ExGOdnqHBeGWptilpjOFBTs0dCi8rMLQhLrsiITcThPUQb0g+tQk7xL
	Tdxs5Pk5G+kF/iWujpSPlp7/lwyb1VNJ47VoqPmHqFYI3n+ErwR8MsRm+nXrQHa/2RDfpD2RZyL
	rJs99RkDVgHWRtaVo6hNY1fWynirXz6KAUXq7j++iLyk98
X-Google-Smtp-Source: AGHT+IE4ABxmPlTweefnMNsTpO2kCyQ9vfeRptaKcZLVagFwBqIk7hKHDQ6xwciT22sGwc042fPZVZE0KvPkjt/nFfA=
X-Received: by 2002:a05:690c:ec7:b0:70e:779:7e84 with SMTP id
 00721157ae682-7165a3d82bcmr36904677b3.27.1751543977760; Thu, 03 Jul 2025
 04:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
 <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
 <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com> <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
In-Reply-To: <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 13:59:02 +0200
X-Gm-Features: Ac12FXxCb6oqZOa8O1MizlWOqoPM1IT9eH5G_i8Ay4xusdukzHzWPjGOuUZDyNo
Message-ID: <CAPDyKFo_1KHLw0_OE2ppJnA1TKmmd4EKjMKcSqOdGo91bMgMTw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_045938_903224_73540628 
X-CRM114-Status: GOOD (  30.58  )
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

T24gV2VkLCAyIEp1bCAyMDI1IGF0IDIzOjA1LCBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPiB3
cm90ZToKPgo+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgNDo1N+KAr1BNIE1hcnRpbiBCbHVtZW5z
dGluZ2wKPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA5OjA34oCvUE0gRGEgWHVlIDxkYUBsaWJyZS5jb21w
dXRlcj4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgMjo0MOKAr1BN
IE1hcnRpbiBCbHVtZW5zdGluZ2wKPiA+ID4gPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjIy
4oCvUE0gRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjA34oCvUE0gSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gLi4uCj4gPiA+ID4gPiA+IElmLCBhcyB0
aGUgZGVzY3JpcHRpb24gc3VnZ2VzdCwgdGhlIHJlZ3VsYXRvciBmcmFtZXdvcmsgc29tZWhvdyBp
Z25vcmUKPiA+ID4gPiA+ID4gdGhlIHRpbWluZyBzZXQgaW4gRFQsIG1heWJlIHRoaXMgaXMgd2hh
dCBuZWVkcyB0byBiZSBjaGVja2VkID8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgcmVndWxhdG9y
IGZyYW1ld29yayBvbmx5IGNhcmVzIGFib3V0IHRpbWluZyBmb3IgcmVndWxhdG9yIG9uLgo+ID4g
PiA+ID4gUmVndWxhdG9yIG9mZiBqdXN0IHR1cm5zIG9mZiB0aGUgcmVndWxhdG9yIGFuZCByZXR1
cm5zIHdpdGhvdXQgZGVsYXkuCj4gPiA+ID4gVGhlcmUncyBhbiBleGNlcHRpb24gdG8gdGhpczog
Z3Bpby1yZWd1bGF0b3JzIHdpdGhvdXQgYW4gZW5hYmxlLWdwaW9zCj4gPiA+ID4gcHJvcGVydHku
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCByZWd1bGF0b3JfZGlzYWJsZSgpIGlzIGEgbm8tb3Ag
aW4KPiA+ID4gPiB0aGF0IGNhc2UgKG1lc29uX21tY19zZXRfaW9zKCkgZXZlbiBoYXMgYSBjb21t
ZW50IGFib3ZlIHRoZQo+ID4gPiA+IHN3aXRjaC9jYXNlIHN0YXRlbWVudCksIHNlZSBbMF0uCj4g
PiA+ID4KPiA+ID4gPiA+IFRoZSBjb2RlIG1ha2VzIGluY29ycmVjdCBhc3N1bXB0aW9ucy4gVGhl
biB0aGUga2VybmVsIHJlc2V0cyB0aGUgYm9hcmQKPiA+ID4gPiA+IHdpdGhvdXQgaGF2aW5nIGVu
b3VnaCB0aW1lLgo+ID4gPiA+IENhbiB5b3UgcGxlYXNlIG5hbWUgdGhlIGJvYXJkIHlvdSdyZSB0
ZXN0aW5nPyBJJ20gd29ycmllZCB0aGF0IEknbGwgYmUKPiA+ID4gPiBsb29raW5nIGF0IG9uZSAu
ZHRzIGJ1dCB5b3UncmUgbG9va2luZyBhdCBhbm90aGVyIG9uZS4KPiA+ID4KPiA+ID4gaHR0cHM6
Ly9naXRodWIuY29tL2xpYnJlLWNvbXB1dGVyLXByb2plY3QvbGlicmV0ZWNoLWxpbnV4L2Jsb2Iv
bWFzdGVyL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1saWJyZXRlY2gtY290dG9u
d29vZC5kdHNpI0w0ODEKPiA+ID4KPiA+ID4gdmNjX2NhcmQgaXMgYSBncGlvIHJlZ3VsYXRvciB0
aGF0IGdldHMgdG9nZ2xlZCBvbi0+b2ZmLT5vbi4KPiA+IFRoYW5rcywgdGhhdCBjbGVhcnMgdGhp
bmdzIHVwIGFzIEkgd2FzIGluZGVlZCBsb29raW5nIGF0IGEgZ3Bpbwo+ID4gcmVndWxhdG9yIHdo
aWxlIHRoaXMgaXMgYSBmaXhlZCByZWd1bGF0b3IhCj4gPgo+ID4gPiBJIHRyYWNlZCB0aGUgcmVn
dWxhdG9yIGZyYW1ld29yayBhIGZldyB3ZWVrcyBhZ28gYW5kIGZvcmdvdCB0aGUgZmluYWwKPiA+
ID4gcmVndWxhdG9yIGRpc2FibGUgZnVuY3Rpb24gY2FsbCwgYnV0IHRoYXQgY2FsbCBiYXNpY2Fs
bHkgcmV0dXJuZWQKPiA+ID4gaW1tZWRpYXRlbHkgd2hpbGUgdGhlIHJlZ3VsYXRvci1lbmFibGUg
ZnVuY3Rpb24gY29tcGxlbWVudCBoYWQgZGVsYXlzCj4gPiA+IGltcGxlbWVudGVkLgo+ID4gWWVw
LCBmb3IgZml4ZWQgcmVndWxhdG9ycyB0aGVyZSdzIGFuICJvZmYtb24tZGVsYXktdXMiIGRldmlj
ZS10cmVlCj4gPiBwcm9wZXJ0eSAod2hpY2ggdHJhbnNsYXRlcyB0byAib2ZmX29uX2RlbGF5IiBp
biB0aGUgY29kZSkuCj4gPiBJdHMgaW1wbGVtZW50YXRpb24gaXMgc21hcnQgZW5vdWdoIHRvIG5v
dCB3YXN0ZSB0aW1lIGJ5IGFkZGluZyBkZWxheXMKPiA+IGF0IHJ1bnRpbWUgYnkgaW1wbGVtZW50
aW5nOiBvbiAtPiBvZmYgKyByZW1lbWJlciB0aW1lIC0+IHdhaXQKPiA+IHJlbWFpbmluZyB0aW1l
ICsgb24gKG1lYW5pbmc6IGlmIHRoZXJlIHdhcyBlbm91Z2ggdGltZSBiZXR3ZWVuIG9mZiBhbmQK
PiA+IHRoZSBzZWNvbmQgb24gdGhlcmUncyBubyBhZGRpdGlvbmFsIHdhaXQpIFswXS4gT24gc3lz
dGVtIHNodXRkb3duIGl0Cj4gPiB3aWxsIG5vdCBhZGQgYW55IGRlbGF5IHVuZm9ydHVuYXRlbHkg
KHdoZXJlIExpbnV4IGxvc2VzIGNvbnRyb2wgb3Zlcgo+ID4gdGltZS1rZWVwaW5nKSwgbWVhbmlu
ZyB3ZSBjYW4gZW5kIHVwIHdpdGggdG9vIGxpdHRsZSB3YWl0aW5nIHRpbWUuCj4KPiBZZXMsIHRo
aXMgaXMgZXZpZGVudCBvbiBxdWl0ZSBhIGZldyBBbWxvZ2ljIGJvYXJkcyBidXQgb2NjdXJyZWQg
cmFyZWx5Cj4gZW5vdWdoIHRoYXQgaXQgY2FuIGJlIG92ZXJsb29rZWQgYnV0IG5ldmVyLXRoZS1s
ZXNzIHNob3VsZCBiZQo+IGFkZHJlc3NlZC4KPgo+IE9uIG91ciBTTTEgYm9hcmQsIHRoaXMgb2Nj
dXJzIG1vcmUgb2Z0ZW4gdGhhbiBub3QuIFdpdGggdGhpcyBwYXRjaCwgd2UKPiBjYW4gcmVib290
IHRoZSBsb29wIGluZGVmaW5pdGVseS4KCkV2ZW4gaWYgdGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJv
YmxlbSwgaXQgZG9lc24ndCByZWFsbHkgc2VlbSBsaWtlIHRoZQpjb3JyZWN0IHNvbHV0aW9uIHRv
IG1lLgoKV291bGQgeW91IG1pbmQgdHJ5aW5nIHRvIGV4dGVuZCB0aGUgcmVndWxhdG9yIHN1YnN5
c3RlbSB0byBkZWFsIHdpdGgKdGhpcyBpbnN0ZWFkPyBGZWVsIGZyZWUgdG8ga2VlcCBtZSBpbiB0
aGUgbG9vcCBpZiB5b3UgcG9zdCBzb21ldGhpbmcKdGhlcmUuCgo+Cj4gPgo+ID4gQWxzbyBteSB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQncyBub3Qgc29tZXRoaW5nIHRoYXQgY2FuIGJlIGZpeGVk
IGluCj4gPiB1LWJvb3Qgb3IgVEYtQS4gVGhpcyBpcyBiZWNhdXNlIGJvb3Ryb20gYWxyZWFkeSBo
YXMgdHJvdWJsZSByZWFkaW5nCj4gPiB0aGUgbmV4dCBzdGFnZSBmcm9tIGFuIFNEIGNhcmQgKHdo
aWNoIGlzIGEgdmFsaWQgYm9vdCBtZWRpYSkuCj4KPiBDb3JyZWN0LCBub3QgZml4YWJsZSBpbiBU
Ri1BIG9yIHUtYm9vdC4KPgo+ID4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuMTUvc291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMMjc1NAoKS2lu
ZCByZWdhcmRzClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
