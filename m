Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F20CF5366
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2024 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3rPoYhq0QOHsYr+FMN5XuRAEh1CtHsyQFbaaJr/IFk=; b=VMmlhvMRkN1NR/
	GpMprG0JUWOwrNTyiNtoeAgtcqPiaUPN1nKjQiA7xnlpAWTCya2Px7kf4hWbgrTbMntdwbaAxAGaz
	sASzkEFP14fsqBSJhMoVobwRqMlcKnrua1bBxJ4MpY14/IwDe/wnkzM0OphehkQ0lGicmAKRKugqs
	U0TIfNXgVrui6oHVaxuU00rVfbhCEENqTbvLiB1vtYOlKIgKhGFagAHdf+pzCn11Rc5zMmNLFK8/F
	PhhriQo0cMc7YjhNKQpMLIpYrtmwKf/7R5fxO1VaN1KaiyrKJSDbOHt8Se1I4GXdV2ZlmKn0xy6rU
	5fvGRVwxkDofK+/ORZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aM8-0000000EJ7L-1csn;
	Wed, 23 Oct 2024 12:20:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aE2-0000000EH7J-21LX
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Oct 2024 12:12:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71ec997ad06so2349197b3a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Oct 2024 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=videowindow.eu; s=google; t=1729685549; x=1730290349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFG1E25U9ERkhMI08BPPQ9FotYmza9yUBba8R8ewJXg=;
        b=oRs10RV/s6SIclGUFf6ju3JjQelEFBabZBsVuSHeR1PwOiHXLRetNpXJ/CWSEjJXyh
         QzqBZAZjvkthgVArr6fLAElkAW3gzE2jmwYsIQi1ZpodkGhSUfDUe5Ewwq5Sw/8+0VeT
         9kr1lfiwCaJZ6dZ2Fra89v/TcLtX6a2erG99vn95Ssh4r1/TnnwKZjThfNjG30AbUT1T
         aKBRm3JtWJLbQkLev5rOIdcoliiXPFx29jSh0Jim9hAje8TJazmbYRX8c/x+cDgDCia+
         /bKUEMCtn6DdbC0qk/iT/dtJh4FA8OpjK7y04fAjl9d4mSFcFosTBnbBk/UVogGVEccy
         Lh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685549; x=1730290349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFG1E25U9ERkhMI08BPPQ9FotYmza9yUBba8R8ewJXg=;
        b=Mmvls1P16AiWE3MfEz1dxc/7N9k8yiAotQT2LQNvKSapWyEf3kd9SP7I9aHPVQOIlF
         3VYSQrNInDUkfIIJRo+GoriwG+uDeojvkhuJPkAiexLE70gCFmLHRtromGhr6XwlBQFs
         cNg/4w0i/cr08+x5f4nrT/2sgCp0qWTAutSkaG70Y0Jl3//tQOlr87uqD+6Sushyxwxz
         FEkhMBe16YvYNexALSNWCWuA+AcUbEMHZ7eW2w6x4xPDPP0UVYwk/MM4jimxpeGsRHrt
         r0oaM19vBBHRuFN7en6XqJhvKHoHugCpDxXvyVEBuUYpDH9aWGC8NUsOmJXbfH0BTFgB
         luiA==
X-Gm-Message-State: AOJu0Yyt769G0cXw82XmiVrYf0udWxE6F2dazIqrnpwlh9USc689XHsX
	0kmsizFwW+/x9y5/L376uprvtbmHhdcuQ93hQvfwfTzuk4jSCjdt9NYbFJb7gb7Vgw5c4O0lBRY
	kJ3Qd0e0TsXYrDU6CeMoH4Lyp9eYP1k1U1dY67A==
X-Google-Smtp-Source: AGHT+IHTEeb7DeWahu+DTKwqg1qihkXPgEs7BSrU+y+Ktt3+nCiIkfN7/0lH0YmKx8QUhKWZLQ8SXDBolPIztn6RhRw=
X-Received: by 2002:a05:6a00:2382:b0:71e:702c:a680 with SMTP id
 d2e1a72fcca58-72030ba33f8mr3272725b3a.26.1729685548908; Wed, 23 Oct 2024
 05:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
 <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
In-Reply-To: <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
From: Francisco Ayala Le Brun <francisco@videowindow.eu>
Date: Wed, 23 Oct 2024 12:12:16 +0000
Message-ID: <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
Subject: Re: meson: Enabling full-range HDMI output
To: neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_051230_921802_D611C5AF 
X-CRM114-Status: GOOD (  28.38  )
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

VGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBJIGNhbiBjb25maXJtIHJldmVydGluZyB0aGUg
Y29tbWl0IHNvbHZlcwp0aGUgaXNzdWUuIEhvd2V2ZXIsIGl0IG9ubHkgbGVhdmVzIG1lIG1vcmUg
Y29uZnVzZWQgYXMgdG8gdGhlIHJvb3QKY2F1c2UuCgpJZiBkdy1oZG1pIGlzIHNldCB0byBvdXRw
dXQgUkdCLCBhbmQgeW91IHNldCB0aGUgQ1NDIG1hdHJpeCB0byB6ZXJvZXMsCnRoZW4gaXQgd2ls
bCBzaG93IGEgY29ycmVjdGx5IGNvbXBsZXRlbHkgYmxhY2sgb3V0cHV0LiBIb3dldmVyLCBpZiB5
b3UKc2V0IHRoZSBmaXJzdCBjb2x1bW4gb2YgdGhlIFlVVi10by1SR0IgbWF0cml4IHRvIG9uZXMs
IGFuZCBzaG93IGEKYmxhY2sgaW1hZ2UgdmlhIERSTSwgdGhlbiB0aGUgdG9uZSBpcyBpbiB0aGUg
bGltaXRlZCByYW5nZS4gVGhpcwpzZWVtZWQgdG8gaW5kaWNhdGUgZHctaGRtaSBjYW4gb3V0cHV0
IGZ1bGwgcmFuZ2UgUkdCLCBhbmQgdGhlIHByb2JsZW0Kd2FzIGZhcnRoZXIgdXBzdHJlYW0uCgpQ
ZXJoYXBzIHRoZSBwcm9ibGVtIGlzIHRoZSBDU0MgbWF0cmljZXM/IEkgd2FzIHVuZGVyIHRoZSBh
c3N1bXB0aW9uCjB4MjAwMCBjb3JyZXNwb25kZWQgdG8gMSwgZXZlbiB0aG91Z2ggaS5NWDYgbWFu
dWFsIGNoYXB0ZXIgMzMgc2VlbXMgdG8Kc3VnZ2VzdCB3aXRoIGEgY3NjX3NjYWxlIG9mIDEsIHRo
ZW4gMHg4MDAgd291bGQgY29ycmVzcG9uZCB0byAxLgpTdGlsbCwgSSB3b3VsZCBleHBlY3QgYXQg
bGVhc3QgZnVsbHkgYmxhY2sgdG8gYmUgY29ycmVjdCBhcyB0aGF0IHdvdWxkCmdpdmUgYSBtdWx0
aXBsaWNhdGlvbiBieSB6ZXJvLgoKT3IgdGhlIHN0YXRlIG9mIGR3X2hkbWkgaXMgYWZmZWN0aW5n
IHRoZSBWSVUgaW4gc29tZSB3YXk/IFBlcmhhcHMgdGhlClZJVSBoYXJkd2FyZSBpcyBtYWRlIHRv
IGNsYW1wIGx1bWluYW5jZSB3aGVuIGR3X2hkbWkgaXMgb3V0cHV0dGluZwpSR0I/IEkgbm90aWNl
ZCBmb3IgdGhlIENTQyB0aGVyZSBpcyBvbmx5IGEgc3BlY2lhbCBtYXRyaXggZm9yClJHQi10by1s
aW1pdGVkLVJHQiwgYnV0IG5vIHNwZWNpYWwgbWF0cml4IGZvciBZVVYtdG8tbGltaXRlZC1SR0Iu
IFRoYXQKc2VlbXMgdG8gc3VnZ2VzdCB0aGUgY2xhbXBpbmcgbWF5IGJlIGRvbmUgdXBzdHJlYW0g
aW4gdGhvc2UgY2FzZXMuCgpGcmFuY2lzY28KCgpPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCA4OjMw
4oCvQU0gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAy
My8xMC8yMDI0IDEwOjAwLCBGcmFuY2lzY28gQXlhbGEgTGUgQnJ1biB3cm90ZToKPiA+IEhlbGxv
LAo+ID4KPiA+IEkgYW0gc2Vla2luZyBzb21lIGd1aWRhbmNlIHJlZ2FyZGluZyBlbmFibGluZyBm
dWxsLXJhbmdlIEhETUkgb3V0cHV0Lgo+ID4gU3BlY2lmaWNhbGx5LCBJIGFtIHdvbmRlcmluZyB3
aGljaCBjb21wb25lbnQgaW4gdGhlIHZpZGVvIHBpcGVsaW5lCj4gPiBjb3VsZCBiZSBjbGFtcGlu
ZyBIRE1JIG91dHB1dCB2YWx1ZXMgdG8gMTYtMjM1PyBGdXJ0aGVyIGRldGFpbHMKPiA+IGZvbGxv
dzoKPiA+Cj4gPiBJIGhhdmUgYmVlbiB0cnlpbmcgdG8gZ2V0IGZ1bGwtcmFuZ2UgSERNSSBvdXRw
dXQgZnJvbSBhIExlIFBvdGF0bwo+ID4gczkwNXggU0JDLiBBdCB0aGUgbW9tZW50LCBIRE1JIG91
dHB1dCBzZWVtcyB0byBiZSBoYXJkLWNvZGVkIHRvIGNvbG9yCj4gPiBxdWFudGl6YXRpb24gbGlt
aXRlZCByYW5nZSAoMTYtMjM1KS4gVGhpcyBncmVhdGx5IGRpbWluaXNoZXMgdGhlCj4gPiBjb250
cmFzdCBpbiBmdWxsIHJhbmdlIGRpc3BsYXlzLgo+ID4KPiA+IFNvIGZhciBzZXR0aW5nIHRoZSBW
SVVfT1NEMS8yX0ZVTExfUkFOR0UgYml0IGluIHRoZQo+ID4gVklVX09TRDEvMl9DVFJMX1NUQVQy
IHJlZ2lzdGVyIGRvZXMgbm90IHNlZW0gdG8gd29yay4gSSBoYXZlIGFsc28KPiA+IGxvb2tlZCBh
dCB0aGUgY29sb3Igc3BhY2UgY29udmVyc2lvbiBtYXRyaXggaW4gZHdfaGRtaSBpbiBjYXNlIHRo
YXQgaXMKPiA+IHRoZSBjdWxwcml0LCBidXQgdGhlIHZhbHVlcyBzZWVtIGZpbmUgYW5kIHNldHRp
bmcgdGhhdCB0byB6ZXJvIGRvZXMKPiA+IHByb2R1Y2UgYSBzaWduYWwgaW4gdGhlIGZ1bGwgcmFu
Z2UgKDApLiBUaGUgYnVmZmVyIGZyb20gdGhlIFZJVSBpcwo+ID4gdXNpbmcgYSBZVVYgZm9ybWF0
IHNvIGR3X2hkbWkgaXMgbm90IHVzaW5nIHRoZSBmdWxsIHRvIGxpbWl0ZWQgcmFuZ2UKPiA+IGNv
bnZlcnNpb24gbWF0cml4Lgo+Cj4gSW5kZWVkIHRoZSBpbnRlcm5hbCBWUFUgcGlwZWxpbmUgaXMg
aW4gMTBiaXQgWVVWNDQ0LCBzbyBpdCByZXF1aXJlcyBlbmFibGluZwo+IHRoZSBkdy1oZG1pIENT
Qywgc28gcGVyaGFwcyB0aG9zZSBhcmUgbm90IGRlc2lnbmVkIHRvIG91dHB1dCBmdWxsLXJhbmdl
IFJHQiA/Cj4KPiBDb3VsZCB5b3UgcmV2ZXJ0Ogo+IGQzZDZiMWJmODVhZSBkcm06IGJyaWRnZTog
ZHdfaGRtaTogZml4IHByZWZlcmVuY2Ugb2YgUkdCIG1vZGVzIG92ZXIgWVVWNDIwCj4KPiBUaGlz
IHdvdWxkIGdpdmUgeW91IGRpcmVjdCBZVVY0NDQgSERNSSBvdXRwdXQgd2l0aG91dCBDU0MgaW52
b2x2ZWQsIHJldmVydGluZwo+IGlzIG5vdCBhbiBvcHRpb25zIGJlY2F1c2Ugb2YgbG93LWNvc3Qg
SERNSSBwYW5lbHMgbHlpbmcgaW4gdGhlaXIgRURJRAo+IGFuZCBub3QgcmVhbGx5IHN1cHBvcnRp
bmcgWVVWIEhETUkuLi4KPgo+IFNvIGlmIHRoZSBvcmlnaW5hbCBZVVYgaXMgaW4gZnVsbCByYW5n
ZSwgdGhlIGN1bHByaXQgaXMgaW4gdGhlIERXLUhETUkgQ1NDCj4gdGFibGUuCj4KPiBOZWlsCj4K
PiA+Cj4gPiBUaGFuayB5b3UgaW4gYWR2YW5jZSwKPiA+IEZyYW5jaXNjbwo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
