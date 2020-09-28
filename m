Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AF5C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 13:37:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA1821D7F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 13:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qu8eyfHo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F70VgFIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EA1821D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zJXu9sfghUvjUWW4AwXpvJqeMqqYyvY48cinLOBIfjs=; b=Qu8eyfHoFoBLyUNo+hMaSRQkZ
	h4flQioVWiAdrKlh10UFHjKhWYESgEoD64MuiO83ksLY8hnGxbL+ebrqwSPIbSltn/xra94lbg9BM
	WyucFLlpK3x6ILvhDCYnLMPTtiMqs4AI8z5W6kzbsEqgelgmHpPYz6/EGeGB48hAbEJYEKrFvJZU/
	Y64bYNRWO7x7XUQGfl/WgCiFwU9rHBY2hiUUWDcHlZxZAQg4wjBxkU4aqOAEiby4bqgZQCCj/8yvk
	r6gnTo5qo+ELErColIrzwHV8/AmoFm7yD5qyTUQ4VRC2B2uJvB1L2vHHiwHijCIefE7fbKcygaQIP
	izi93cgYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMtKm-0005ti-Cr; Mon, 28 Sep 2020 13:36:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMtKj-0005tO-HX
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 13:36:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id k10so1376361wru.6
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vy4kzQyF2IDjqBaHr91Kux6zbP14BgENrqcc/gCSvtU=;
 b=F70VgFIeZnxmC7YhnypgTCceCkjK/weqIX8EuHz4pUzDKCdTY/AMS2Zy9esi7dMN4n
 KUiUt2Kl6y6lB1Urttr2xAfQvB3WRAHd5sEEl7XvZTid5M8KNAN0iJvao9TeuofQ4HKE
 UrpTSC7fT8aOyq6E0a2gQl1it9hi7mfoV9PnxbYyF2db33MSNcKiK1JRlLco2AbsBBUo
 smO3mP6HZKjZgWtABxV04mJ58D50DxdeU8GbCvNvXZ6wXbIVajx8TolTxk0jiB7+Qvdy
 71ZyPZauU3UesKs3HpoT9QHzyBdMHYn/aaueJg3xaN+ZQaPokBPCV0/UXT9y1hHoHSTS
 XMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vy4kzQyF2IDjqBaHr91Kux6zbP14BgENrqcc/gCSvtU=;
 b=p8jWFwZ2ynpHbzh7/aLAVT1l7IIHZus6gVkgP98CRLI4M/GDLGbXvbzPNAUyAOPm11
 KU2u3Ik3DHtnTrApP5ZCKhdaBxTV6HJyr9y/SukSriUEm0BP54/eYBWVJhBvJNueYTAS
 J7D6LIClZ3b0Jf2Zv+wr5ocC18Tx37HiqSWk4jTZ8S2kOa26XwAK8YH4+hXlkUZL4B6I
 1kAdVihMwczGrTQougzy8RCwie2YObWbBvEGEAEeEBb+KxB4ho8wEUvLj214tUt3Zy01
 rtIsJTOai2jezVGByhl/Af6QRzy9VyqvbgAsb3Wig0Ts4FcTPlisiRN/snkCT+JK4/+a
 n2Qw==
X-Gm-Message-State: AOAM532DLliqVHnsLN3c0D/4ggRhljBf3X34dhbJtPd1AQ1TZU4+Guh1
 gk6iC/W/vywNKJJnMui4hmk=
X-Google-Smtp-Source: ABdhPJxXUsKq6vGViYR/BdWe4EnU5l/DPOLaiuqTZOfuzeXXujV7aoWwEqc2tWUm0BQCR7YD85b3yg==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr1765699wrs.48.1601300208373;
 Mon, 28 Sep 2020 06:36:48 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y6sm1508341wrn.41.2020.09.28.06.36.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Sep 2020 06:36:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <c05ae5ee-535d-ad2a-ce7e-137c428eb83b@gmail.com>
Date: Mon, 28 Sep 2020 17:36:44 +0400
Message-Id: <CE8CADEC-593D-4712-A422-97AF44D95210@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
 <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
 <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
 <91886A80-8164-4699-8662-E7D3444A4F12@gmail.com>
 <BA41AA25-8647-474E-87E6-64D4F030E590@gmail.com>
 <c05ae5ee-535d-ad2a-ce7e-137c428eb83b@gmail.com>
To: Patrik Nilsson <nipatriknilsson@gmail.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_093649_595632_C641F230 
X-CRM114-Status: GOOD (  24.22  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-usb@vger.kernel.org,
 linux-block@vger.kernel.org, furkan@fkardame.com,
 linux-amlogic@lists.infradead.org, Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjggU2VwIDIwMjAsIGF0IDM6MDYgcG0sIFBhdHJpayBOaWxzc29uIDxuaXBhdHJpa25p
bHNzb25AZ21haWwuY29tPiB3cm90ZToKPiAKPiBIaSEKPiAKPiBUbyBtZSB0aGlzIGJ1ZyBkZXNj
cmlwdGlvbiBpcyB2ZXJ5IHNpbWlsYXIgdG8gd2hhdCBJJ20gc3RydWdnbGluZyB3aXRoIG9uIGFu
IGFtZDY0LXBsYXRmb3JtLgo+IAo+IFdoZW4gSSBnZXQgdG9vIG11Y2ggZGF0YSBzZW50IHZpYSB1
c2IsIGl0IHNlZW1zIGFzIHRoZSB1c2IgY29udHJvbG1zZyBpcyBkZWxheWVkIHNvIGl0IHRpbWVz
IG91dCBhbmQgdW5tb3VudHMgdGhlIGJsb2NrIGRldmljZS4KPiAKPiBJIGhhdmUgYmVlbiB3b3Jr
aW5nIG9uIG15IHJlbGF0ZWQgYnVnIGZvciBsb25nIHRvIGdldCBpdCBlYXNpbHkgcmVwcm9kdWNp
YmxlLCBidXQgZmFpbGVkLiBJdCBpcyB0aGVyZSBhbGwgdGhlIHRpbWUuIE5ldyBoYXJkd2FyZSBp
cyBvbiBpdHMgd2F5IHNvIEkgY2FuIGNvbnRpbnVlIG15IHRlc3RpbmcuCj4gCj4gTWF5YmUgeW91
IGNhbiB0ZXN0IHRoZSBwYXRjaCBJJ20gdXNpbmcgdG8gc2VlIGlmIGl0IHdvcmtzIGJldHRlciBm
b3IgeW91Pwo+IAo+IEluIHRoZSBtZWFud2hpbGUgaGVyZSBpcyBteSBkZXNjcmlwdGlvbiBvZiBt
eSBidWc6Cj4gCj4+IEkgaGF2ZSBzdHJlc3MgdGVzdGVkIHRoZSB1c2Igc3lzdGVtLiBUbyB0aGUg
VVNCIGlzIG5vdyBzZXZlbiBtZWNoYW5pY2FsIGhhcmQgZGlza3MgYW5kIHR3byBzc2QgZGlza3Mg
Y29ubmVjdGVkLiBTaXggcHJvY2Vzc2VzIGFyZSBhdCB0aGUgc2FtZSB0aW1lIHdyaXRpbmcgcmFu
ZG9tIGRhdGEgdG8gdGhlIGRpc2tzLiBPbmUgb2YgdGhlbSBpcyB0byB0aGUgc3NkIGRpc2sgSSBj
b3VsZG4ndCB3cml0ZSBkYXRhIHRvIGJlZm9yZSB3aXRob3V0IGl0IGZhaWxlZC4gQWxzbyB0aGUg
b3RoZXIgdXNiLXNzZCBkaXNrIGlzIG15IHJvb3QgcGFydGl0aW9uLgo+PiAKPj4gQmVmb3JlIEkg
YXBwbGllZCB0aGUgcGF0Y2gsIG15IHJvb3QgcGFydGl0aW9uIHNvbWV0aW1lcyBmYWlsZWQgdG8g
YmUga2VwdCBtb3VudGVkLiBOb3cgSSBoYXZlIG5vdCBoYWQgYW55IGNyYXNoZXMuCj4+IAo+PiBU
aGlzIGlzIGEgcXVpY2sgZml4IGZvciBoYXJkIGRpc2tzLCBidXQgd29ya2luZy4gSXQgY29udGlu
dWVkIHRvIHdvcmsgd2hlbiBJIHN0YXJ0ZWQgdGhyZWUgdmlydHVhbGJveCBndWVzdHMgYW5kIGxl
dCB0aGVtIGFsc28gZG8gd29yay4gVGhlIGd1ZXN0cycgaGFyZCBkaXNrcyBpcyBvbiBteSB1c2It
cm9vdCBwYXJ0aXRpb24uCj4+IAo+PiBJdCBkb2Vzbid0IHdvcmsgaWYgSSBhbHNvIHVzZSBteSB1
c2IyZXRoZXJuZXQgYWRhcHRlciAoSUQgMjAwMTo0YTAwIEQtTGluayBDb3JwLiksIGFsdGhvdWdo
IG15IHJvb3QgcGFydGl0aW9uIGFuZCB0d28gcmFuZG9taXplIHRlc3RzIHN1cnZpdmVkLiBNYXli
ZSBhIG11Y2ggbGFyZ2VyIHRpbWVvdXQgaW4gdGhpcyBjYXNlIHdpbGwgaGVscD8gQnV0IHRoaXMg
SSBkb24ndCBmaW5kIGFzIGEgZ29vZCBzb2x1dGlvbi4KPj4gCj4+IFRoZSBiZWhhdmlvciBpcyB0
aGUgc2FtZSBvbiB0aGUgb3RoZXIgKG11Y2ggc2xvd2VyKSBjb21wdXRlciB3aXRoIGEgZGlmZmVy
ZW50IHVzYiBodWIuIEkgaGF2ZSBhbHNvIHRlc3RlZCBpdCB3aXRoIGV4YWN0bHkgdGhlIHNhbWUg
c2V0dXAgYXMgZWFybGllciwgd2l0aCBubyBtZWNoYW5pY2FsIGhhcmQgZGlza3MsIGFuZCBpdCB3
b3JrcyB3aXRoIHRoZSBwYXRjaCBhbmQgbm90IHdpdGhvdXQgaXQuCj4gCj4gQmVzdCByZWdhcmRz
LAo+IFBhdHJpawo+IAo+IC0tLXN0YXJ0IG9mIGRpZmYtLS0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvY29yZS9odWIuYyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKPiBpbmRleCA1Yjc2OGI4
MGQxZWUuLjNjNTUwOTM0ODE1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5j
Cj4gKysrIGIvZHJpdmVycy91c2IvY29yZS9odWIuYwo+IEBAIC0xMDUsNyArMTA1LDcgQEAgTU9E
VUxFX1BBUk1fREVTQyh1c2VfYm90aF9zY2hlbWVzLAo+ICBERUNMQVJFX1JXU0VNKGVoY2lfY2Zf
cG9ydF9yZXNldF9yd3NlbSk7Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGVoY2lfY2ZfcG9ydF9yZXNl
dF9yd3NlbSk7Cj4gCj4gLSNkZWZpbmUgSFVCX0RFQk9VTkNFX1RJTUVPVVQgICAgMjAwMAo+ICsj
ZGVmaW5lIEhVQl9ERUJPVU5DRV9USU1FT1VUICAgIDEwMDAwCj4gICNkZWZpbmUgSFVCX0RFQk9V
TkNFX1NURVAgICAgICAyNQo+ICAjZGVmaW5lIEhVQl9ERUJPVU5DRV9TVEFCTEUgICAgIDEwMAo+
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3VzYi5oIGIvaW5jbHVkZS9saW51eC91c2Iu
aAo+IGluZGV4IDIwYzU1NWRiNDYyMS4uZTY0ZDQ0MWJiNzhmIDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvbGludXgvdXNiLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3VzYi5oCj4gQEAgLTE4NDEsOCAr
MTg0MSw4IEBAIGV4dGVybiBpbnQgdXNiX3NldF9jb25maWd1cmF0aW9uKHN0cnVjdCB1c2JfZGV2
aWNlICpkZXYsIGludCBjb25maWd1cmF0aW9uKTsKPiAgICogVVNCIGlkZW50aWZpZXMgNSBzZWNv
bmQgdGltZW91dHMsIG1heWJlIG1vcmUgaW4gYSBmZXcgY2FzZXMsIGFuZCBhIGZldwo+ICAgKiBz
bG93IGRldmljZXMgKGxpa2Ugc29tZSBNR0UgRWxsaXBzZSBVUFNlcykgYWN0dWFsbHkgcHVzaCB0
aGF0IGxpbWl0Lgo+ICAgKi8KPiAtI2RlZmluZSBVU0JfQ1RSTF9HRVRfVElNRU9VVCAgICA1MDAw
Cj4gLSNkZWZpbmUgVVNCX0NUUkxfU0VUX1RJTUVPVVQgICAgNTAwMAo+ICsjZGVmaW5lIFVTQl9D
VFJMX0dFVF9USU1FT1VUICAgIDEwMDAwCj4gKyNkZWZpbmUgVVNCX0NUUkxfU0VUX1RJTUVPVVQg
ICAgMTAwMDAKPiAKPiAKPiAgLyoqCj4gLS0tZW5kIG9mIGRpZmYtLS0KCk5vIG9idmlvdXMgY2hh
bmdlcyB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZC4gSGVyZeKAmXMgb3V0cHV0IGh0dHBzOi8vcGFz
dGViaW4uY29tL3Jhdy9aTWd3TnFnbQoKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
