Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB1C77B76
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 01:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykUzKJ61J77lgwLWbxrx+Sr0L1tJtz9je9Iua85Igr4=; b=yxo2wMq057efEs
	Eqg4EC+xSjQ7zNnx7QcSG4VgVxMAWuCtrurkYm0snrrTFiwd5B+NWcttZ3cxKgj3tEMSYMMIOVSb8
	YiUjTBsvyLcWibDxNKf4kYd0fUbVo+sM24O7krufK5Dw7quZ2Yv5zJny9AhBOOgaiggguPg6iPVu+
	4vGyLc3t18YiSrn5QcMh++yQc3RSnpJC3ry6isMdeg1rBOQKpFeDaf+nVRrI0COK8WYSntQiiMSL0
	QcxA00zCBjYStKB0V5taBWBaR7Me1dUVR7VPJIV0qZa25FH4U0kwypvNcZKH/asiEG2+W8vIyJoH9
	OZKIo2MMqAYSZ2uMUilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1powyA-003jXh-1Y;
	Wed, 19 Apr 2023 01:50:50 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1powy7-003jXF-1Y
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 01:50:49 +0000
Received: by mail-yb1-xb36.google.com with SMTP id t16so17884852ybi.13
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Apr 2023 18:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681869040; x=1684461040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdhbeEs9x4QPTCJYnSinfpBc4X/hgoCOeRJKEsf9C98=;
        b=fJKtoCcN4gIq6JfyainqS/2XMSmllqJz8cxZYdwR2MryXapkHHx5OHWSoTI8a2xMw8
         PWKzu+LQQzN8sjg2PCqU/rj57W+ZLeXOuqOJRd2USCJVS//pt8kEStO1S81w2OskcBB8
         B5yYKVaAbGsmOsV/oWmPNdfZh0PumBLlpCA1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681869040; x=1684461040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdhbeEs9x4QPTCJYnSinfpBc4X/hgoCOeRJKEsf9C98=;
        b=k5Ltx6WdUz5e0g4ousDrZit+4wmjVfLVXqOGQ+X4+I/FIm89TE0KgYuvOWVo43rAhF
         EjAbJh/geYULKoa/z0BJ78ZEnsWgxGwAPDRelBwgpOxFSrJ6K4WujkLr0UmeUwsC9Hvn
         gfOUmFxkfkJtBOehiHf43O95agAzzg3Ffg06HLFRoxrU+dpfscveoUDVO8Qw73ylM6df
         5drhRs41x1xlj5/ne/e91vJDzEKserCRTPJ9Ml+DUkzHqnUGFlVZOJOaBxgecFQmSno+
         tCdZUAi6AifH60i7DTiMDwu8rrpgvGsKXTud22h3ROwpEsWHv/4hUa1P7gZhTb0ceoE/
         LZJQ==
X-Gm-Message-State: AAQBX9cpfKCqMQ5i3AiqgkBnSEPz40ZRVamPXpScVjXeYvDIut9ePNnX
	Qhl3BwG7oTblh6IS0Wru1dmhPv78FIjGHLXeGTxJPA==
X-Google-Smtp-Source: AKy350ZmTR1QoZRoUNISGaXgGR/IG8MPKt/JeRGzDnEDNqOWkreuQbEHq5zko/EklMJ7saYla1poha3eJ009b1zYeEg=
X-Received: by 2002:a25:db43:0:b0:b96:7d4b:7aeb with SMTP id
 g64-20020a25db43000000b00b967d4b7aebmr904839ybf.34.1681869040394; Tue, 18 Apr
 2023 18:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230401185458.2280200-1-sjg@chromium.org> <87zg7rb8dd.fsf@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0Js43JOi3xaeY8tYuELSPXWL-PCBq1-iANLs1074MzbQ@mail.gmail.com>
 <1973D65D-692D-4AA7-B074-942D4E9ADB4B@gmail.com> <CAPnjgZ14t6KR5sPzaq9HbLG1ocUHtbpLrwfBPMJZXQdaq2ALRA@mail.gmail.com>
 <CACdvmAj2L4YdOZ3ykVTN+ZfJLupA4_Hk7rDG4jC2_p=+0pJphg@mail.gmail.com>
In-Reply-To: <CACdvmAj2L4YdOZ3ykVTN+ZfJLupA4_Hk7rDG4jC2_p=+0pJphg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2023 19:49:54 -0600
Message-ID: <CAPnjgZ1OFQstvEXEOtu58OEnYO9-9=hMTjzkzP07FO4bbVDSFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
To: Da Xue <da@lessconfused.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_185047_521492_BCBDC766 
X-CRM114-Status: GOOD (  41.11  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io, U-Boot Mailing List <u-boot@lists.denx.de>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, AML <linux-amlogic@lists.infradead.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgRGEsCgpPbiBGcmksIDcgQXByIDIwMjMgYXQgMjE6MzQsIERhIFh1ZSA8ZGFAbGVzc2NvbmZ1
c2VkLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciA1LCAyMDIzIGF0IDI6MznigK9QTSBTaW1v
biBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgQ2hyaXN0aWFuLAo+
ID4KPiA+IE9uIE1vbiwgMyBBcHIgMjAyMyBhdCAyMDoxMCwgQ2hyaXN0aWFuIEhld2l0dAo+ID4g
PGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBPbiAyIEFw
ciAyMDIzLCBhdCA2OjQxIGFtLCBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBIaSBNYXJrLAo+ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCAyIEFwciAy
MDIzIGF0IDA5OjI4LCBNYXJrIEtldHRlbmlzIDxtYXJrLmtldHRlbmlzQHhzNGFsbC5ubD4gd3Jv
dGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGcm9tOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVt
Lm9yZz4KPiA+ID4gPiA+ID4gRGF0ZTogU3VuLCAgMiBBcHIgMjAyMyAwNjo1NDo1NyArMTIwMAo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgT2Ryb2lkLUMyIGlzIHF1aXRlIGEgY29tcGxpY2F0
ZWQgaW1hZ2Ugd2l0aCBtYW55IHN0ZXBzLiBJdCBpcyBhbiBpZGVhbAo+ID4gPiA+ID4gPiBleGFt
cGxlIGZvciBob3cgQmlubWFuIGNhbiBiZSB1c2VkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFlvdSBz
YXkgT2Ryb2lkLUMyLCBidXQgdGhlIHBhdGNoZXMgc2VlbSB0byBhZGRyZXNzIHRoZSBPZHJvaWQt
QzQuLi4KPiA+ID4gPgo+ID4gPiA+IEFoLCB5ZXMuIFRoZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJl
IGFuIEFtbG9naWMgUzkwNSBvbiB0aGUgQzIgYW5kIGFuIFM5MDJYMyBvbiB0aGUgQzQuIEkgd29u
ZGVyIGlmIHRoYXQgYWZmZWN0cyB0aGUgaW1hZ2UgbWFrZXVwPwo+ID4gPgo+ID4gPiBUaGVyZSBh
cmUgY3VycmVudGx5IGZvdXIgZGlmZmVyZW50IHNpZ25pbmcgcmVjaXBlcyB0aGF0IGRlcGVuZCBv
biB0aGUKPiA+ID4gYm9hcmQgZmFtaWx5IHRoYXQgeW91IGFyZSBidWlsZGluZyBmb3I6Cj4gPiA+
Cj4gPiA+IC0gR1hCQgo+ID4gPiAtIEdYTC9HWE0KPiA+ID4gLSBHMTJBL1NNMQo+ID4gPiAtIEcx
MkIKPiA+ID4KPiA+ID4gVGhlIEcxMkEvU00xIGFuZCBHMTJCIHJlY2lwZXMgYXJlIGlkZW50aWNh
bCBleGNlcHQgZm9yIGEgZGlmZmVyZW50Cj4gPiA+IHNpZ25pbmcgYmluYXJ5IHVzZWQuIFRoZSBs
YXRlc3QgQW1sb2dpYyBib2FyZHMgKFM5MDVYNCwgVDcsIGV0Yy4pCj4gPiA+IGFsc28gaGF2ZSBp
bmNyZW1lbnRhbCBjaGFuZ2VzLCBidXQgbm9uZSBhcmUgY3VycmVudGx5IHN1cHBvcnRlZCBpbgo+
ID4gPiBMaW51eCBvciB1LWJvb3QuCj4gPiA+Cj4gPiA+IE9uZSBvZiB0aGUgY2hhbGxlbmdlcyBm
b3IgYmlubWFuIHdpbGwgYmUgdGhlIHNpZ25pbmcgdG9vbHMuIEN1cnJlbnRseQo+ID4gPiB0aGlz
IHBhdGNoc2V0IGRlcGVuZHMgdXBvbiBBbWxvZ2ljIGJpbmFyaWVzLiBBcGFydCBmcm9tIHRoZW0g
YmVpbmcKPiA+ID4gY2xvc2VkLXNvdXJjZSBhbmQgdGh1cyB1bmRlc2lyYWJsZSwgdGhleSBhcmUg
YWxzbyB4ODZfNjQgb25seSBhbmQKPiA+ID4gdGhlcmUgYXJlIHF1aXRlIGEgZmV3IHVzZXJzIChh
bmQgYXQgbGVhc3Qgb25lIG1ham9yIGRpc3RybykgbmVlZGluZwo+ID4gPiB0byBidWlsZCBvbiBh
cm02NCBoYXJkd2FyZS4KPiA+ID4KPiA+ID4gVGhlcmUgaXMgYW4gb3Blbi1zb3VyY2UgdG9vbCBj
YWxsZWQgZ3hsaW1nIHdoaWNoIHN1cHBvcnRzIEdYTCBhbmQgbmV3ZXIKPiA+ID4gYm9hcmRzLiBJ
TUhPIGl0IHdvdWxkIG1ha2UgYSBsb3Qgb2Ygc2Vuc2UgZm9yIHUtYm9vdCB0byBhYnNvcmIgdGhl
Cj4gPiA+IGZ1bmN0aW9uYWxpdHkgb2YgZ3hsaW1nIChhbmQgZXh0ZW5kIHN1cHBvcnQgYmFja3dh
cmRzIHRvIEdYQkIpIGFzIHRoaXMKPiA+ID4gd291bGQgcmVtb3ZlIHRoZSBkZXBlbmRlbmN5IG9u
IEFtbG9naWMgYmluYXJpZXMgYW5kIGFsbG93IHUtYm9vdCBidWlsZAo+ID4gPiBhbmQgYmlubWFu
IHNpZ25pbmcgdG8gYmUgZG9uZSBhbnl3aGVyZS4KPiA+ID4KPiA+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL3JlcGsvZ3hsaW1nCj4KPiBneGxpbWcgYWxzbyBkb2VzIG5vdCBoYXZlIHRoZSBmdWxsIGZl
YXR1cmVzZXQgb2YgdGhlIEFtbG9naWMgc2lnbmVyLgo+IFRoZSBtb3N0IGltcG9ydGFudCB0byBt
ZSBiZWluZyBsejQgY29tcHJlc3Npb24uCj4gSSdtIHN0aWxsIHRyeWluZyB0byBnZXQgc3VwcG9y
dCBmcm9tIEFtbG9naWMgZm9yIG9wZW4gc291cmNlIEFURiBhdAo+IGxlYXN0IGZvciBHWFggYnV0
IHRoYXQgaGFzIG51bWVyb3VzIGh1cmRsZXMgdG8gb3ZlcmNvbWUgYW5kIG1vcmUKPiBodXJkbGVz
IGZvciBmdXR1cmUgZGVzaWducy4KClRoYXQncyBmaW5lLCBidXQgaXQgZG9lc24ndCBuZWVkIHRv
IGJlIG9wZW4gc291cmNlIGZvciBiaW5tYW4gdG8gdXNlIGl0LgoKPgo+ID4KPiA+IEZhaXIgZW5v
dWdoLCBidXQgYW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gYWxsb3cgJ2Jpbm1hbiB0b29sIC1m
Cj4gPiBneGxpbWcnIHRvIHdvcmssIHdoaWNoIHNob3VsZCBiZSBlYXN5LiBUaGVuIHdlIGNhbiBt
YWtlIHVzZSBvZiB0aGUKPiA+IGV4aXN0aW5nIEMgY29kZSwgdXNpbmcgYmluYXJ5IHRvb2xzIGZv
ciB0aGUgdW5zdXBwb3J0ZWQgb25lcy4KPiA+Cj4gPiA+Cj4gPiA+ID4gVGhlIHBhdGNoIGlzIGZv
ciB0ZXN0aW5nIGJ5IENocmlzdGlhbiwgd2hvIEkgaG9wZSBjYW4gaGVscCBnZXQgdGhpcyBsYW5k
ZWQgZm9yIGFsbCB0aGUgQW1sb2dpYyBib2FyZHMuCj4gPiA+Cj4gPiA+IEkgd2lsbCB0cnkgdG8g
ZmluZCB0aGUgdGltZSB0byB0ZXN0IHRoaXMsIGJ1dCBpdOKAmXMgbm90IHNvbWV0aGluZyBJCj4g
PiA+IGNvdWxkIGRvIG1vcmUgd2l0aCAoYXMgb25seSBzdXBwb3J0aW5nIDEvNCBvZiB0aGUgYm9h
cmQgZmFtaWxpZXMKPiA+ID4gdGhhdCBJIG5lZWQgdG8gYnVpbGQgZm9yLCBidSBJIGRvIGFwcHJl
Y2lhdGUgaXTigJlzIGEgUE9DKS4KPiA+Cj4gPiBZZXMsIGl0J3MgYSBzdGFydC4KPiA+Cj4gPiA+
Cj4gPiA+IEluIGNhc2UgeW914oCZcmUgbm90IGF3YXJlLCBNYWtlZmlsZSBiYXNlZCBzaWduaW5n
IGlzIGltcGxlbWVudGVkIGluCj4gPiA+IHRoZSBhbWxvZ2ljLWJvb3QtZmlwIHJlcG8gdGhhdCBJ
4oCZbSBjdXJyZW50bHkgdG9vbGVkIGFyb3VuZDoKPiA+ID4KPiA+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL0xpYnJlRUxFQy9hbWxvZ2ljLWJvb3QtZmlwCj4KPiBUaGUgaXNzdWUgd2l0aCB0aGUgYm9v
dCBmaXBzIGlzIHRoYXQgdGhleSBjb250cm9sIHRvbyBtYW55IHRoaW5ncyAoQ1BVCj4gZnJlcSwg
RERSIGZyZXEsIE0zIGNvbnRyb2wgY29kZSwgYW5kIG1vcmUpIHRvIG1ha2UgaXQgdW5pdmVyc2Fs
LgoKT0suCgpTbyBJIHdvbmRlciBob3cgYmVzdCB0byBtb3ZlIHRoaXMgZm9yd2FyZCBzbyB0aGF0
IHdlIGNhbiBidWlsZCB0aGluZ3MKdXNpbmcgYmlubWFuIGFuZCBldmVyeXRoaW5nIHdvcmtzPwoK
Cj4KPiA+ID4KPiA+ID4gVGhpcyBpcyB0aGUg4oCcY29tcGV0aXRpb27igJ0gc28gdG8gc3BlYWsu
IEl04oCZcyBxdWl0ZSBzaW1wbGUgYW5kIHdpZGVseQo+ID4gPiB1c2VkIGJ5IG1vc3Qgb2YgdGhl
IEFtbG9naWMgc3VwcG9ydGluZyBkaXN0cm9zIHJpZ2h0IG5vdy4KPiA+Cj4gPiBXZWxsIGF0IGxl
YXN0IHRoYXQgcHJvdmlkZXMgdGhlIHJlY2lwZXMuClJlZ2FyZHMsClNpbW9uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
