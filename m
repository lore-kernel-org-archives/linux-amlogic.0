Return-Path: <SRS0=DSrP=W7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD01C3A5AA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 22:47:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35E220674
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 22:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXYPudO8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qx5Z70Jb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C35E220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRAJn2N2uJZi96he0n5B66xE8nDNG/dFe0Yv/DMVhCM=; b=DXYPudO8RwP0jh
	ST+AeIx6L3QTGfm2c2/L5WSecob2KG0g953PxkxL1dJK6h/1lGanvJehBSUk4/6WGpDkJ43AKm6JO
	8e/ZKOVdjY/icay8NcHYGbFPQ5JhGvbBNE3OgJiEeSavFuSGx9iHhsicPbPel1sv454ar//u0abSh
	oT90dHmuMtIc43jyra7NcPAD0hNeZF5fu5e/VdX4wtxURb2ud8lyphPunW/YRAzvQVPlTcyhgzJjK
	BlOtN0RdbOVn1F8F2Us4N5aHSxzluQRXRarwX51tEKYipXpBm0SHjBUZa+BGu4Chqzq9Em4jCUqVS
	546BxGdZS8rYyTu+2XFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5e47-0006iI-Jl; Wed, 04 Sep 2019 22:47:51 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5e45-0006hv-EH; Wed, 04 Sep 2019 22:47:50 +0000
Received: by mail-qt1-x841.google.com with SMTP id a13so484212qtj.1;
 Wed, 04 Sep 2019 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CKyHosvEnb91lwk3iCp8C93MqyR+kvMHU7ULcRus+7I=;
 b=qx5Z70JbBnAHWChlfXFE5EcvHvuUeZjp0pNuSkBiAK4wxUKeeemJ240MWaAqAXJup6
 L/6DwaJW80L776VdT8vX/kDYIxrwUBFUh47iJCETmYZBlzVeRhrRF2qfTKQUfNg9CwsU
 bHCYMewVtXjnvT5I2plewmkYMEK4oLVLz2poKjWltxRLermJ/7BHUoF8eMhgUEeRpUss
 e3g1nDrySwS29cKYneZUgpPDWvio7J0SPrXVpCLqxLX7/xfeEgG309tTWjTXe1hlNTls
 8CTgWlig0f9VUs7K3VJKAG3bJ7HOJI/E2R/FiF4l8GPGV1otIkvvq75A/CxAALguD7PZ
 /PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CKyHosvEnb91lwk3iCp8C93MqyR+kvMHU7ULcRus+7I=;
 b=frdmb4atGfWtTKJI+O2zLZQgczFd7/5jbpZzuWxQYaFYkPKH8SXE6kN33tpuupcmrL
 8ZKVo3aPQzYk7kHI5iZ0VaUtXV6uwfJ68fTZ5fCPKTPHhxCTKGsYNQzK9aLF/RSj9TST
 CwVI8OP64t/o4n2s2PIiN38OxzuFwyCOJvDSpdbxWklPEPACFmfn6n2GkxypTqT6pUb1
 wHlkFiBVF1fNZ0CEqkNVvRlPo4y5380lFWL05m0l3Nk3pIvONYhtHw88vAu6jQ9HKRi+
 selRASIKIiaGVDdEej1kxEwaARlrMlBb89KxWsMgXCJqk2RLZrAbJ+ysVWGsiA4Lwezq
 rH6A==
X-Gm-Message-State: APjAAAW4ZglrCi76ZKaC5iJlWY48e3sMyuaKZOwyeEHBSlhvcqhDLOGd
 ZJORuO1i0PjBdX9cs6Ln7HLSo2Xc5Cmamgxvf/4=
X-Google-Smtp-Source: APXvYqxHz3NP2NmOFPlG2V4YfgrtnS7CaVm8XSVUZfgCbTTa3LE71JKOBFGtZLN4+eA+Rjux7wZV78pzYvlgwg0s/qE=
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr543637qtn.17.1567637268581;
 Wed, 04 Sep 2019 15:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190904082232.GA171180@LGEARND20B15>
 <a9ca05ec-55a9-a58c-267a-334771a1480a@rasmusvillemoes.dk>
In-Reply-To: <a9ca05ec-55a9-a58c-267a-334771a1480a@rasmusvillemoes.dk>
From: Austin Kim <austindh.kim@gmail.com>
Date: Thu, 5 Sep 2019 07:47:39 +0900
Message-ID: <CADLLry6WYJRWz1mkgO-fvKeRmOhOJQ3S_hXH1sBW11TujT-a1g@mail.gmail.com>
Subject: Re: [PATCH] media: meson: Add NULL check after the call to kmalloc()
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_154749_481217_3E117585 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mjourdan@baylibre.com, devel@driverdev.osuosl.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MjAxOeuFhCA57JuUIDTsnbwgKOyImCkg7Jik7ZuEIDU6NDMsIFJhc211cyBWaWxsZW1vZXMgPGxp
bnV4QHJhc211c3ZpbGxlbW9lcy5kaz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gMDQvMDkvMjAxOSAx
MC4yMiwgQXVzdGluIEtpbSB3cm90ZToKPiA+IElmIHRoZSBrbWFsbG9jKCkgcmV0dXJuIE5VTEws
IHRoZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2lsbCBvY2N1ci4KPiA+ICAgICAgIG5ld190
cy0+dHMgPSB0czsKPiA+Cj4gPiBBZGQgZXhjZXB0aW9uIGNoZWNrIGFmdGVyIHRoZSBjYWxsIHRv
IGttYWxsb2MoKSBpcyBtYWRlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1
c3RpbmRoLmtpbUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEv
bWVzb24vdmRlYy92ZGVjX2hlbHBlcnMuYyB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlh
L21lc29uL3ZkZWMvdmRlY19oZWxwZXJzLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24v
dmRlYy92ZGVjX2hlbHBlcnMuYwo+ID4gaW5kZXggZjE2OTQ4Yi4uZTdlNTZkNSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfaGVscGVycy5jCj4g
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjX2hlbHBlcnMuYwo+
ID4gQEAgLTIwNiw2ICsyMDYsMTAgQEAgdm9pZCBhbXZkZWNfYWRkX3RzX3Jlb3JkZXIoc3RydWN0
IGFtdmRlY19zZXNzaW9uICpzZXNzLCB1NjQgdHMsIHUzMiBvZmZzZXQpCj4gPiAgICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOwo+ID4KPiA+ICAgICAgIG5ld190cyA9IGttYWxsb2Moc2l6ZW9mKCpu
ZXdfdHMpLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmICghbmV3X3RzKSB7Cj4gPiArICAgICAg
ICAgICAgIGRldl9lcnIoc2Vzcy0+Y29yZS0+ZGV2LCAiRmFpbGVkIHRvIGttYWxsb2MoKVxuIik7
Cj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgIH0KPiA+ICAgICAgIG5ld190cy0+
dHMgPSB0czsKPiA+ICAgICAgIG5ld190cy0+b2Zmc2V0ID0gb2Zmc2V0Owo+Cj4gTm8gbmVlZCB0
byBwcmludGsoKSBvbiBlcnJvciwgQUZBSUsgdGhlIG1tIHN1YnN5c3RlbSBzaG91bGQgYWxyZWFk
eSBtYWtlCj4gc29tZSBub2lzZSBpZiBhbiBhbGxvY2F0aW9uIGZhaWxzLgoKVGhhbmtzIGZvciB2
YWx1YWJsZSBmZWVkYmFjay4KQlRXLCBpZiB0aGUga21hbGxvYyByZXR1cm4gTlVMTCwgbW0gc3Vi
c3lzdGVtIHRocm93cyBlcnJvciBsb2cgd2l0aCAxMDAlPwpJZiBubywgcGxlYXNlIHNoYXJlIGVy
cm9yIHNpZ25hdHVyZSBvZiBrZXJuZWwuCgo+IFRoaXMgaXMgbm90IGEgcHJvcGVyIGZpeCAtIHlv
dSBuZWVkIHRvIG1ha2UgdGhlIGZ1bmN0aW9uIHJldHVybiBhbiBlcnJvcgo+ICgtRU5PTUVNKSB0
byBsZXQgdGhlIGNhbGxlciBrbm93IGFsbG9jYXRpb24gZmFpbGVkLCBhbmQgYWxsb3cgdGhhdCB0
bwo+IHByb3BhZ2F0ZSB0aGUgZXJyb3IuIFRoZXJlJ3Mgb25seSBvbmUgY2FsbGVyLCB3aGljaCBh
bHJlYWR5IHNlZW1zCj4gY2FwYWJsZSBvZiByZXR1cm5pbmcgZXJyb3JzICh0aGVyZSdzIGFuIC1F
QUdBSU4pLCBzbyBpdCBzaG91bGRuJ3QgYmUKPiB0aGF0IGhhcmQgLSB0aG91Z2ggb2YgY291cnNl
IG9uZSBuZWVkcyB0byB1bmRvIHdoYXQgaGFzIGJlZW4gZG9uZSBzbyBmYXIuCj4KPiBBbHNvLCB1
bnJlbGF0ZWQgdG8gdGhlIGttYWxsb2MoKSBoYW5kbGluZzogYW12ZGVjX2FkZF90c19yZW9yZGVy
KCkgY291bGQKPiBiZSBtb3ZlZCB0byBlc3BhcnNlci5jIGFuZCBtYWRlIHN0YXRpYywgb3IgYXQg
dGhlIHZlcnkgbGVhc3QgdGhlCj4gRVhQT1JUX1NZTUJPTCBjYW4gYmUgcmVtb3ZlZCBzaW5jZSB2
ZGVjX2hlbHBlcnMubyBpcyBsaW5rZWQgaW4gdG8gdGhlCj4gc2FtZSBtb2R1bGUgYXMgdGhlIHNv
bGUgdXNlci4gVGhhdCBwcm9iYWJseSBnb2VzIGZvciBhbGwgdGhlCj4gRVhQT1JUX1NZTUJPTChh
bXZkZWNfKikuCgpJIGFncmVlZCB3aXRoIHlvdXIgZmVlZGJhY2suCi0gT24gbWVtb3J5IGFsbG9j
YXRpb24gZmFpbHVyZSwgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgKC1FTk9NRU0pCnJhdGhlciB0
aGFuICdyZXR1cm4nIHN0YXRlbWVudC4KLSBUaGUgY2FsbCB0byBhbXZkZWNfYWRkX3RzX3Jlb3Jk
ZXIoKSBpcyBvbmx5IG1hZGUgYnkgZXNwYXJzZXJfcXVldWUoKS4KCkxldCBtZSByZXNlbmQgdGhl
IHBhdGNoIGlmIG5lY2Vzc2FyeS4KClRoYW5rcywKQXVzdGluIEtpbQo+Cj4gUmFzbXVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
