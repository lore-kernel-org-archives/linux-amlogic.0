Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FADC282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 19:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BAB20863
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 19:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2n478oL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZjNz2R8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BAB20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mqpTdUFH4a+T03uOpxlNCxqYsOHHeybGaGwhN0JNfU=; b=K2n478oLGrpiQO
	p7oFJsmbQ1Xo9bIILfpifmZOIJ1brVdI1AH9iNot/b5zPqdM/xQfPMC11Mot19Z1qwYh/mbi855bT
	AgxxICImtxJAOnwmuroDR1Ty95ombLuuGnu3M6fNIOzx4HagjPn/9XpMBQrnwu8sBz3PjQouSIIkK
	Fc88oqGxGE5eE2eXdEWEguWnWwkdVd5SG1C57+TOtE0jBOGl+7ypqUBvfv+Z/dsOfxCCNuhRTIm05
	t+Rz53qgJpQO54CgWVSAi0h8t0+0UBmfIk5GSNbGBRjQ8pEA2UDyWbaQ/L8oICO7t/u2KM7LcoAyS
	OXkbuu7wLrAmy/FxVzYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDZbw-0000XT-Qa; Mon, 08 Apr 2019 19:07:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDZbt-0000X1-Bv; Mon, 08 Apr 2019 19:07:14 +0000
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BB9121473;
 Mon,  8 Apr 2019 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554750432;
 bh=notVvlJTG7arM70zO1IahXn3Vh6K7XI155hcDHLwU1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hZjNz2R8Q2SafNy2pkoLYE2nWy0m4FbIASaKghfokIfsFaKwWm135b33WGuSnldEW
 7CYXzmmkAo3KSgcWkIDJo2IhJkQfUKLilHVSZKJP0qI+Q4D4L4p5G3UDWavyp0Y8j7
 0vRWohpWd/gkv3Iqi8r+Q1GKNlKWqbaGziJ77slc=
Received: by mail-qt1-f178.google.com with SMTP id v20so16758520qtv.12;
 Mon, 08 Apr 2019 12:07:12 -0700 (PDT)
X-Gm-Message-State: APjAAAV2/lLhTtqXP1+X8db46+fVVUM1RuHReYBCS5S1AR7k7IN+CqPE
 LDFfMqGl2GThZS/xYaIQ3UYEUwwITQlqraNVXw==
X-Google-Smtp-Source: APXvYqxIuKEm6QsCuMyxKSYf9DqboCj2GF7kP4seEw0UvfqWpMMSM799AJ/qdwAB1r67wOrLq/VikJCRDnYIQud5B88=
X-Received: by 2002:a0c:b656:: with SMTP id q22mr25672380qvf.205.1554750431765; 
 Mon, 08 Apr 2019 12:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190401080949.14550-1-narmstrong@baylibre.com>
 <1640dd7b-3576-d9ce-0641-6b6a64a87275@arm.com>
 <d26f1ce9-c56c-5e51-37f5-0689aa198dc0@baylibre.com>
 <5CA9CE1A.6060109@baylibre.com>
In-Reply-To: <5CA9CE1A.6060109@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Apr 2019 14:07:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJj4pae6AuK=HGU5GuZogFKyAbU_y7Ls_CyTcV6qXH_rg@mail.gmail.com>
Message-ID: <CAL_JsqJj4pae6AuK=HGU5GuZogFKyAbU_y7Ls_CyTcV6qXH_rg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_120713_439421_DD4BEFF7 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgNywgMjAxOSBhdCA1OjE3IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBMZSAwMS8wNC8yMDE5IDEzOjI0
LCBOZWlsIEFybXN0cm9uZyBhIMOpY3JpdCA6Cj4gPiBPbiAwMS8wNC8yMDE5IDEyOjAwLCBTdGV2
ZW4gUHJpY2Ugd3JvdGU6Cj4gPj4gT24gMDEvMDQvMjAxOSAwOTowOSwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gPj4+IEFkZCB0aGUgYmluZGluZ3MgZm9yIHRoZSBCaWZyb3N0IGZhbWlseSBvZiBB
Uk0gTWFsaSBHUFVzLgo+ID4+Pgo+ID4+PiBUaGUgQmlmcm9zdCBHUFUgYXJjaGl0ZWN0dXJlIGlz
IHNpbWlsYXIgdG8gdGhlIE1pZGdhcmQgZmFtaWx5LAo+ID4+PiBidXQgd2l0aCBhIGRpZmZlcmVu
dCBTaGFkZXIgQ29yZSAmIEV4ZWN1dGlvbiBFbmdpbmUgc3RydWN0dXJlcy4KPiA+Pj4KPiA+Pj4g
QmluZGluZ3MgYXJlIGJhc2VkIG9uIHRoZSBNaWRnYXJkIGZhbWlseSBiaW5kaW5ncywgYnV0IHRo
ZSBpbm5lcgo+ID4+PiBhcmNoaXRlY3R1cmFsIGNoYW5nZXMgbWFrZXMgaXQgYSBzZXBhcmF0ZSBm
YW1pbHkgbmVlZGluZyBzZXBhcmF0ZQo+ID4+PiBiaW5kaW5ncy4KPiA+Pj4KPiA+Pj4gVGhlIEJp
ZnJvc3QgR1BVcyBhcmUgcHJlc2VudCBpbiBhIG51bWJlciBvZiByZWNlbnQgU29DcywgbGlrZSB0
aGUKPiA+Pj4gQW1sb2dpYyBHMTJBIEZhbWlseSwgYW5kIG1hbnkgb3RoZXIgdmVuZG9ycy4KPiA+
Pj4gVGhlIEFtbG9naWMgdmVuZG9yIHNwZWNpZmljIGNvbXBhdGlibGUgaXMgYWRkZWQgdG8gaGFu
ZGxlIHRoZQo+ID4+PiBzcGVjaWZpYyBJUCBpbnRlZ3JhdGlvbiBkaWZmZXJlbmNlcyBhbmQgZGVw
ZW5kZW5jaWVzLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgLi4uL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1iaWZyb3N0LnR4dCAgICAgICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKwo+ID4+
PiAgMSBmaWxlIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKykKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJv
c3QudHh0Cj4gPj4+Cj4gPj4+IENoYW5nZXMgc2luY2UgdjM6Cj4gPj4+IC0gQWRkZWQgbm90ZSBh
Ym91dCBkaXNjb3ZlcmFibGUgbW9kZWwvcmV2aXNpb24KPiA+Pj4gLSBFbmZvcmNlZCBmaXhlZCBk
ZWZpbmVkIGlycSBvcmRlcgo+ID4+PiAtIEZpeGVkIHR5cG8gaW4gYWNjb21tb2RhdGUKPiA+Pj4K
PiA+Pj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiA+Pj4gLSBtb3ZlZCB0byBhIHNpbmdsZSBjb21wYXRp
YmxlIHNpbmNlIEhXIGlzIGZ1bGx5IGRpc2NvdmVyYWJsZQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlm
cm9zdC50eHQKPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAw
MDAwLi43MTFjOWVhZDE3YTIKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0Cj4gPj4+
IEBAIC0wLDAgKzEsOTIgQEAKPiA+Pj4gK0FSTSBNYWxpIEJpZnJvc3QgR1BVCj4gPj4+ICs9PT09
PT09PT09PT09PT09PT09PQo+ID4+PiArCj4gPj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4+
PiArCj4gPj4+ICstIGNvbXBhdGlibGUgOgo+ID4+PiArICAqIFNpbmNlIE1hbGkgQmlmcm9zdCBH
UFUgbW9kZWwvcmV2aXNpb24gaWYgZnVsbHkgZGlzY292ZXJhYmxlIGJ5IHJlYWRpbmcKPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXgo+ID4+IHMvaWYv
aXMvCj4KPiBTaG91bGQgSSBzdGlsbCBzZW5kIGEgdjUgdG8gZml4aW5nIHRoaXMgdHlwbyA/IEkg
Y2FuIGZpeCBpdCB3aGlsZSBhcHBseWluZyBpdC4KCk5vIG5lZWQgdG8gcmVzZW5kLiBJIHBsYW5u
ZWQgdG8gYXBwbHkgaXQsIGJ1dCBpZiB5b3UgYXJlIGdvaW5nIHRvOgoKUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
