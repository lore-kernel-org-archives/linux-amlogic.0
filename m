Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45889D0C5E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2024 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHmWkjuCG7tmaTfLMgiN7gx68IAI8JHkqxsghY2Qb08=; b=HZP1tqyMMknlYY
	04QrEA8bxHt3QdHFV6m4jvGXr8o6n4qwDUAgUgUr1O1PQ5kvbPaDZKNUr/Q1lvY7TDzKc3HKjzUdY
	Dx/YAn11Kdk4y25btL0aFNcySCMurtgGqUYIAgIQcg0asNGnGjcU0gZi5J2MJPqvDVwT66Vd3pAEK
	pub5aqBN+tdxElvqxVIlw7omcPvjJgX+/LZCXwYtAM8MNbHZyoiycgfPt2dx1R086ScHWIZ7fLfdi
	Iz6QD+kIqyHccwXX64oZ79KpCfVMM6bU0kcesErWXpGDH3ktdU1/W2y3SmRslCvlZtLAO6aPYZkZa
	PQm+fTC/QKG5Rj+8O9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GBc-000000035CM-0Ipc;
	Fri, 25 Oct 2024 09:00:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4G8T-0000000344z-31iJ
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Oct 2024 08:57:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so209584466b.2
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Oct 2024 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=videowindow.eu; s=google; t=1729846651; x=1730451451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0YNbJXqdYsU+hC15A4NcGEh4EkxDUO3EG3zkmNsqcI=;
        b=eHF7Solzp8gHAgXnQq4/oizYK1AUHYf76qr5XUlZB2//4jg4TTyrpxUk2RXoBUQaKx
         Xajhd+J8JT7waBdlimEtnFP+zO1Prc5600rgpvmE2r9l52qz8YYkAGb5+N1xosgAYvpW
         Kxv42k6A9y3gd3Hb/P68LOLLgZ8dzibK/EenaENai8fPKJ9jlHVQhlONdK7kNBeLGXJ/
         i1tP+IhC2ePVd9Oan/BwfkTR8T9tSrrZqS1Q/49g4qkb6kJebXBMXiq2atc3NUCAWAuR
         /nbbrH0wFYIGdAQA/rZ/Y+79SBTSDXgoB+oQ1oxB4aj2zelVUK/UqS6YAMDiPXLdNkzC
         PR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729846651; x=1730451451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0YNbJXqdYsU+hC15A4NcGEh4EkxDUO3EG3zkmNsqcI=;
        b=m2lUGtPv2/5kFqxyK8VbnCQOA3r39OzcW4B+m+EfC0aff3xPiAJ6PgmpjvUe40fAB7
         3syG+U9tLdDoX6syx5eo1rYazc/a2DXwQdnnoBcDyI2x9JZ5T+Mn+8l8ez0JgPyMOv9E
         UBBzaTnyzvdAc3oCaGkUCBJJhyoq4wcNcr3AdM9f58muWC9LQIPTTNiZ7W8p912A9StR
         8mfEDO3AuUWbHA9e0VE+XOMOy/kj1FAdSnqsP/dpbqdulyjf8FHee7J54H+QwPU7xy9z
         jMbUT4GWtwgrhKdh9nowvgp3L5WzsGthtqLi2WRfUFJfdGvKmttr0xChwEVcmDfuaeF8
         O4iA==
X-Gm-Message-State: AOJu0Yx9HatZQovRGf/dnMBHUVYnehp3AjBK/IXGaDOFiPXnyX4m1jd8
	Yp3050MVoo0ZjRHLrnnI1M2+vwJNraxpybMWK3F8xCD1+M4YxrQGGId+mFoOdOBzE056ZkDZBLG
	CMP/vogKjMPu7wOi9aXNAS4o1srYydJcb0UzQJw==
X-Google-Smtp-Source: AGHT+IFPJpNUn1futteA+hj0Dp5jv0hj24v884D/BYct9vlDVXaWtL62CBdSb+HPUJk5wS4n/imKz0tbz+uTORKxKIM=
X-Received: by 2002:a17:907:743:b0:a8a:8d81:97ac with SMTP id
 a640c23a62f3a-a9abf851e22mr763793766b.4.1729846650868; Fri, 25 Oct 2024
 01:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
 <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org> <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
 <0dea0c5d-62e8-4671-abd2-63790dcfb237@linaro.org> <e3224c02-3b5d-48af-828a-f01017fd0fd9@linaro.org>
In-Reply-To: <e3224c02-3b5d-48af-828a-f01017fd0fd9@linaro.org>
From: Francisco Ayala Le Brun <francisco@videowindow.eu>
Date: Fri, 25 Oct 2024 08:57:16 +0000
Message-ID: <CAN-StX04sLnx+zSSJau=7tngNBH0nikVro+_8RmpbD4cbSa8GA@mail.gmail.com>
Subject: Re: meson: Enabling full-range HDMI output
To: neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_015734_090072_BA0D4443 
X-CRM114-Status: GOOD (  42.90  )
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

T24gVGh1LCBPY3QgMjQsIDIwMjQgYXQgODo1MeKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDI0LzEwLzIwMjQgMTA6MzgsIG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4gPiBPbiAyMy8xMC8yMDI0IDE0OjEyLCBGcmFu
Y2lzY28gQXlhbGEgTGUgQnJ1biB3cm90ZToKPiA+PiBUaGFuayB5b3UgZm9yIHlvdXIgcmVzcG9u
c2UuIEkgY2FuIGNvbmZpcm0gcmV2ZXJ0aW5nIHRoZSBjb21taXQgc29sdmVzCj4gPj4gdGhlIGlz
c3VlLiBIb3dldmVyLCBpdCBvbmx5IGxlYXZlcyBtZSBtb3JlIGNvbmZ1c2VkIGFzIHRvIHRoZSBy
b290Cj4gPj4gY2F1c2UuCj4gPj4KPiA+PiBJZiBkdy1oZG1pIGlzIHNldCB0byBvdXRwdXQgUkdC
LCBhbmQgeW91IHNldCB0aGUgQ1NDIG1hdHJpeCB0byB6ZXJvZXMsCj4gPj4gdGhlbiBpdCB3aWxs
IHNob3cgYSBjb3JyZWN0bHkgY29tcGxldGVseSBibGFjayBvdXRwdXQuIEhvd2V2ZXIsIGlmIHlv
dQo+ID4+IHNldCB0aGUgZmlyc3QgY29sdW1uIG9mIHRoZSBZVVYtdG8tUkdCIG1hdHJpeCB0byBv
bmVzLCBhbmQgc2hvdyBhCj4gPj4gYmxhY2sgaW1hZ2UgdmlhIERSTSwgdGhlbiB0aGUgdG9uZSBp
cyBpbiB0aGUgbGltaXRlZCByYW5nZS4gVGhpcwo+ID4+IHNlZW1lZCB0byBpbmRpY2F0ZSBkdy1o
ZG1pIGNhbiBvdXRwdXQgZnVsbCByYW5nZSBSR0IsIGFuZCB0aGUgcHJvYmxlbQo+ID4+IHdhcyBm
YXJ0aGVyIHVwc3RyZWFtLgo+ID4+Cj4gPj4gUGVyaGFwcyB0aGUgcHJvYmxlbSBpcyB0aGUgQ1ND
IG1hdHJpY2VzPyBJIHdhcyB1bmRlciB0aGUgYXNzdW1wdGlvbgo+ID4+IDB4MjAwMCBjb3JyZXNw
b25kZWQgdG8gMSwgZXZlbiB0aG91Z2ggaS5NWDYgbWFudWFsIGNoYXB0ZXIgMzMgc2VlbXMgdG8K
PiA+PiBzdWdnZXN0IHdpdGggYSBjc2Nfc2NhbGUgb2YgMSwgdGhlbiAweDgwMCB3b3VsZCBjb3Jy
ZXNwb25kIHRvIDEuCj4gPj4gU3RpbGwsIEkgd291bGQgZXhwZWN0IGF0IGxlYXN0IGZ1bGx5IGJs
YWNrIHRvIGJlIGNvcnJlY3QgYXMgdGhhdCB3b3VsZAo+ID4+IGdpdmUgYSBtdWx0aXBsaWNhdGlv
biBieSB6ZXJvLgo+ID4+Cj4gPj4gT3IgdGhlIHN0YXRlIG9mIGR3X2hkbWkgaXMgYWZmZWN0aW5n
IHRoZSBWSVUgaW4gc29tZSB3YXk/IFBlcmhhcHMgdGhlCj4gPj4gVklVIGhhcmR3YXJlIGlzIG1h
ZGUgdG8gY2xhbXAgbHVtaW5hbmNlIHdoZW4gZHdfaGRtaSBpcyBvdXRwdXR0aW5nCj4gPj4gUkdC
PyBJIG5vdGljZWQgZm9yIHRoZSBDU0MgdGhlcmUgaXMgb25seSBhIHNwZWNpYWwgbWF0cml4IGZv
cgo+ID4+IFJHQi10by1saW1pdGVkLVJHQiwgYnV0IG5vIHNwZWNpYWwgbWF0cml4IGZvciBZVVYt
dG8tbGltaXRlZC1SR0IuIFRoYXQKPiA+PiBzZWVtcyB0byBzdWdnZXN0IHRoZSBjbGFtcGluZyBt
YXkgYmUgZG9uZSB1cHN0cmVhbSBpbiB0aG9zZSBjYXNlcy4KPiA+Pgo+ID4+IEZyYW5jaXNjbwo+
ID4+Cj4gPj4KPiA+PiBPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCA4OjMw4oCvQU0gPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Pgo+ID4+PiBIaSwKPiA+Pj4KPiA+Pj4gT24g
MjMvMTAvMjAyNCAxMDowMCwgRnJhbmNpc2NvIEF5YWxhIExlIEJydW4gd3JvdGU6Cj4gPj4+PiBI
ZWxsbywKPiA+Pj4+Cj4gPj4+PiBJIGFtIHNlZWtpbmcgc29tZSBndWlkYW5jZSByZWdhcmRpbmcg
ZW5hYmxpbmcgZnVsbC1yYW5nZSBIRE1JIG91dHB1dC4KPiA+Pj4+IFNwZWNpZmljYWxseSwgSSBh
bSB3b25kZXJpbmcgd2hpY2ggY29tcG9uZW50IGluIHRoZSB2aWRlbyBwaXBlbGluZQo+ID4+Pj4g
Y291bGQgYmUgY2xhbXBpbmcgSERNSSBvdXRwdXQgdmFsdWVzIHRvIDE2LTIzNT8gRnVydGhlciBk
ZXRhaWxzCj4gPj4+PiBmb2xsb3c6Cj4gPj4+Pgo+ID4+Pj4gSSBoYXZlIGJlZW4gdHJ5aW5nIHRv
IGdldCBmdWxsLXJhbmdlIEhETUkgb3V0cHV0IGZyb20gYSBMZSBQb3RhdG8KPiA+Pj4+IHM5MDV4
IFNCQy4gQXQgdGhlIG1vbWVudCwgSERNSSBvdXRwdXQgc2VlbXMgdG8gYmUgaGFyZC1jb2RlZCB0
byBjb2xvcgo+ID4+Pj4gcXVhbnRpemF0aW9uIGxpbWl0ZWQgcmFuZ2UgKDE2LTIzNSkuIFRoaXMg
Z3JlYXRseSBkaW1pbmlzaGVzIHRoZQo+ID4+Pj4gY29udHJhc3QgaW4gZnVsbCByYW5nZSBkaXNw
bGF5cy4KPiA+Pj4+Cj4gPj4+PiBTbyBmYXIgc2V0dGluZyB0aGUgVklVX09TRDEvMl9GVUxMX1JB
TkdFIGJpdCBpbiB0aGUKPiA+Pj4+IFZJVV9PU0QxLzJfQ1RSTF9TVEFUMiByZWdpc3RlciBkb2Vz
IG5vdCBzZWVtIHRvIHdvcmsuIEkgaGF2ZSBhbHNvCj4gPj4+PiBsb29rZWQgYXQgdGhlIGNvbG9y
IHNwYWNlIGNvbnZlcnNpb24gbWF0cml4IGluIGR3X2hkbWkgaW4gY2FzZSB0aGF0IGlzCj4gPj4+
PiB0aGUgY3VscHJpdCwgYnV0IHRoZSB2YWx1ZXMgc2VlbSBmaW5lIGFuZCBzZXR0aW5nIHRoYXQg
dG8gemVybyBkb2VzCj4gPj4+PiBwcm9kdWNlIGEgc2lnbmFsIGluIHRoZSBmdWxsIHJhbmdlICgw
KS4gVGhlIGJ1ZmZlciBmcm9tIHRoZSBWSVUgaXMKPiA+Pj4+IHVzaW5nIGEgWVVWIGZvcm1hdCBz
byBkd19oZG1pIGlzIG5vdCB1c2luZyB0aGUgZnVsbCB0byBsaW1pdGVkIHJhbmdlCj4gPj4+PiBj
b252ZXJzaW9uIG1hdHJpeC4KPiA+Pj4KPiA+Pj4gSW5kZWVkIHRoZSBpbnRlcm5hbCBWUFUgcGlw
ZWxpbmUgaXMgaW4gMTBiaXQgWVVWNDQ0LCBzbyBpdCByZXF1aXJlcyBlbmFibGluZwo+ID4+PiB0
aGUgZHctaGRtaSBDU0MsIHNvIHBlcmhhcHMgdGhvc2UgYXJlIG5vdCBkZXNpZ25lZCB0byBvdXRw
dXQgZnVsbC1yYW5nZSBSR0IgPwo+ID4+Pgo+ID4+PiBDb3VsZCB5b3UgcmV2ZXJ0Ogo+ID4+PiBk
M2Q2YjFiZjg1YWUgZHJtOiBicmlkZ2U6IGR3X2hkbWk6IGZpeCBwcmVmZXJlbmNlIG9mIFJHQiBt
b2RlcyBvdmVyIFlVVjQyMAo+ID4+Pgo+ID4+PiBUaGlzIHdvdWxkIGdpdmUgeW91IGRpcmVjdCBZ
VVY0NDQgSERNSSBvdXRwdXQgd2l0aG91dCBDU0MgaW52b2x2ZWQsIHJldmVydGluZwo+ID4+PiBp
cyBub3QgYW4gb3B0aW9ucyBiZWNhdXNlIG9mIGxvdy1jb3N0IEhETUkgcGFuZWxzIGx5aW5nIGlu
IHRoZWlyIEVESUQKPiA+Pj4gYW5kIG5vdCByZWFsbHkgc3VwcG9ydGluZyBZVVYgSERNSS4uLgo+
ID4+Pgo+ID4+PiBTbyBpZiB0aGUgb3JpZ2luYWwgWVVWIGlzIGluIGZ1bGwgcmFuZ2UsIHRoZSBj
dWxwcml0IGlzIGluIHRoZSBEVy1IRE1JIENTQwo+ID4+PiB0YWJsZS4KPiA+Cj4gPiBTbyBzZWVt
cyB0aGUgY3VycmVudCBDU0MgdGFibGVzIG91dHB1dHMgbGltaXRlZCByYW5nZSBmcm9tIFlVViwg
Y291bGQgeW91IHRyeToKPiA+Cj4gPiA9PT09PT09PT09PT09PT09PT48PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKPiA+IGluZGV4IDAwMzFmM2M1NDg4Mi4uOWUxY2I5YmU0NjIyIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiBAQCAtMTc2OSw4
ICsxNzY5LDExIEBAIHN0YXRpYyB2b2lkIGhkbWlfY29uZmlnX0FWSShzdHJ1Y3QgZHdfaGRtaSAq
aGRtaSwKPiA+ICAgICAgICAgIGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21v
ZGUoJmZyYW1lLCBjb25uZWN0b3IsIG1vZGUpOwo+ID4KPiA+ICAgICAgICAgIGlmIChoZG1pX2J1
c19mbXRfaXNfcmdiKGhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgYm9vbCBpc19pbnB1dF9yZ2IgPSBoZG1pX2J1c19mbXRfaXNfcmdiKGhk
bWktPmhkbWlfZGF0YS5lbmNfaW5fYnVzX2Zvcm1hdCk7Cj4gPiArICAgICAgICAgICAgICAgYm9v
bCBpc19saW1pdGVkX3JhbmdlID0gaGRtaS0+aGRtaV9kYXRhLnJnYl9saW1pdGVkX3JhbmdlIHwh
aXNfaW5wdXRfcmdiOwo+Cj4gT2YgY291cnNlOgo+Cj4gICAgICAgICAgICAgICBib29sIGlzX2xp
bWl0ZWRfcmFuZ2UgPSBoZG1pLT5oZG1pX2RhdGEucmdiX2xpbWl0ZWRfcmFuZ2UgfHwgIWlzX2lu
cHV0X3JnYjsKPgo+IFNvcnJ5IGZvciB0aGUgdHlwby4KPgo+ID4gKwo+ID4gICAgICAgICAgICAg
ICAgICBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX3F1YW50X3JhbmdlKCZmcmFtZSwgY29ubmVjdG9y
LCBtb2RlLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaGRtaS0+aGRtaV9kYXRhLnJnYl9saW1pdGVkX3JhbmdlID8KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2xpbWl0ZWRfcmFuZ2Ug
Pwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEhETUlfUVVBTlRJWkFUSU9OX1JBTkdFX0xJTUlURUQgOgo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEhETUlfUVVBTlRJWkFUSU9OX1JBTkdF
X0ZVTEwpOwo+ID4gICAgICAgICAgfSBlbHNlIHsKPiA+ID09PT09PT09PT09PT09PT09Pjw9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPgo+ID4gSXQgd29uJ3Qgb3V0cHV0IGZ1
bGwgcmFuZ2UsIGJ1dCBhdCBsZWFzdCB0aGUgbW9uaXRvciB3aWxsIGtub3cgdGhlIHJlYWwKPiA+
IHNpZ25hbCBxdWFudCByYW5nZS4KPiA+Cj4gPiBUaGUgcmVhbCBmaXggd291bGQgYmUgdG8gY2Fs
Y3VsYXRlIHNvbWUgbmV3IHBhcmFtZXRlcnMgZm9yIGZ1bGwgcmFuZ2UsCj4gPiBidXQgSSdtIG5v
dCBhYmxlIHRvIGRvIHRoYXQgcGVyc29uYWxseS4KPiA+Cj4gPiBOZWlsCj4gPgo+ID4+Pgo+ID4+
PiBOZWlsCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gVGhhbmsgeW91IGluIGFkdmFuY2UsCj4gPj4+PiBG
cmFuY2lzY28KPiA+Pj4+Cj4gPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiA+Pj4+IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+Pj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4gPj4+Cj4gPj4+Cj4gPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+IGxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gPj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gPiBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+CgpUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4gSG93ZXZlciwgaXQgZG9lcyBub3QgZml4IHRoZSBpc3N1ZSBpbiB0aGUKcGFuZWwgSSBh
bSB1c2luZy4gUGVyaGFwcyBpdCBkb2VzIG5vdCBzdXBwb3J0IGxpbWl0ZWQgcXVhbnRpemF0aW9u
CnJhbmdlIGF0IGFsbC4KCkhvcGVmdWxseSBJIGNhbiBoYXZlIGEgbG9vayBhdCB0aGUgQ1NDIHRh
YmxlcyBzb29uLgoKRnJhbmNpc2NvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
