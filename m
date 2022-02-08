Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DE1C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Feb 2022 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYMrFN22FVu9RLiXRq+GFVNkP2+QqdfNGk6Ess98Hy4=; b=4caiehKRx2WACm
	A/Po7QrQOqMPXLuCXtZTQXLHANWgQVXQJ/dTY2Jq3dB3Hf8/VOhbHG/91+TVWvV9g7jHIXNrU1j4t
	akKXX+BKMeb1dmgXumvi1u3lNjmDknum4RrJNPYJ+QCp+Bm8yvApn2mPQJUjBYGF5K6Oxi1D//Cok
	xjx/4ujZnsr+Cxj15cSBGTq7n29Blo4IJQxPyWmO8aDPjnTbrYxKL0MkdUAwxz9jeTBP/i+lkysJ+
	/qJ1DnFnh5yvAY1IjVoqYhaYCFeIjqkOtVIX2vxTIwd8eBF9fwz9je8d03szttYUn6e6lqLUxN4fz
	6BB7A1X7jlhr0PqkPLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHT3p-00ElZY-Te; Tue, 08 Feb 2022 16:09:46 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHSx6-00EiIm-MT; Tue, 08 Feb 2022 16:02:50 +0000
Received: by mail-io1-xd30.google.com with SMTP id n17so21702179iod.4;
 Tue, 08 Feb 2022 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9goKUSm5hEh6zlQeP4WV+0zcx7w4KqUffXj4iFvvaS0=;
 b=AVstRejd2OfpszBwtTV2ky988zRsfxnGQUkq0k1RmrQtI25OvWncplA9iicci4eQt0
 Ky8Dr//S3zlXAMo08w4wiRrMYsJfIlpQD4tBONa/Z1Z67PosM+KZkS6sNkwN6TQuMade
 eQEPJ+JF7LCNrncDgF/jgMH+i+crNi3NaodYW/pofD8rxSbjxwgWdL69U457LGXhVNVt
 QFn8p0MWEWr851+fuKWQqVRUyeADhY61Mlnn9dVsZNFUpKROXkjDOX7q3XO36r0S5K+E
 H+CxeZ3OGDoOcO9Ff/kOOq26q3tgMjqZJJoViWfaLOTJ3J8D5kVF0GTg8vqBLelFEIyY
 gZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9goKUSm5hEh6zlQeP4WV+0zcx7w4KqUffXj4iFvvaS0=;
 b=TjMYs1zQe9FZmwjrsNRrs+coGrzn+/jYeONA/wWqm8S3p9mWnYNJpgi8gT97MOWTit
 KXwEoLbIdnwnh+rXW3VC7xy5ns39S1FaIlzXlAStrzspPlD26oYJDYtyDSx/Dinl24P7
 fKOmVDVXMZ0RKi90MUDzAPlmpF+mF5yyIlXOyoFBrPGPsUZidC6oJCZMTv0D94/7UJN3
 cybbb/UgCj0WOatbP7sdL9phcMqlRks5L7C5nGrQn2ipnvIep13h1Cx9kqLfrJfajMJ3
 AuKfFp3dZKtaBTbvz/evpuGjbb0vy1Amqg98IOCKFjzqEV3XcrnZz2GGjgjSdLdik8K+
 806w==
X-Gm-Message-State: AOAM530XwvGv/UdeYfrKRPQMGyXQxCf+ixM5ddMFUjE1v/u0JvsUeosg
 Y1X5PVftpcQ6dkOCCCUB/RaH2+xKXf68fk9J/Zs=
X-Google-Smtp-Source: ABdhPJxWd9NehdR0IUPTRQ3dI+8R4e08IACkgQZpt3VtxA6mH4xxNRR/QrS3S9EIlkGRDVBZFd0c4npXTVLinIvrVEc=
X-Received: by 2002:a05:6638:1388:: with SMTP id
 w8mr2464511jad.81.1644336163369; 
 Tue, 08 Feb 2022 08:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
 <20220206144343.2194-1-crawford.benjamin15@gmail.com>
 <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
 <65cde84a-8f8b-ac57-9b66-2b8d6378dbfa@arm.com>
 <CANtEDzSVxnUsC05Vhr5gG3KRBAX_X564ZiY2nBSoBFoy54RQ5w@mail.gmail.com>
 <a7adf12d-f949-9a95-9c6a-b73017107dc7@arm.com>
In-Reply-To: <a7adf12d-f949-9a95-9c6a-b73017107dc7@arm.com>
From: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
Date: Tue, 8 Feb 2022 16:02:32 +0000
Message-ID: <CANtEDzQDOiLKWW7c1VwnhjE-kjZ3tWYVKxBA4j1twOOjyEPcwQ@mail.gmail.com>
Subject: Re: [PATCH v2] add pmu to amlogic meson sm1
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_080248_813033_8438B69E 
X-CRM114-Status: GOOD (  25.59  )
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

T2theSBzbyB0aGlzIGRvZXMgYXBwZWFyIHRvIGJlIGJlaGF2aW5nIHdpdGggc29tZSBpc3N1ZXMg
KHVubGVzcyBJJ3ZlCmp1c3QgZ290IDIgb2YgdGhlIGludGVycnVwdCBudW1iZXJzIHdyb25nLCBi
dXQgaXQgc2VlbXMgdW5saWtlbHkgYXQKdGhpcyBzdGFnZSkuCgpDUFVzIDAgYW5kIDEgc2VlbSB0
byBiZSBiZWhhdmluZyBzb21ld2hhdCBzZW5zaWJseSwgd2hpbGUgYHBlcmYgc3RhdGAKcmVwb3J0
cyBgPG5vdCBzdXBwb3J0ZWQ+YCBmb3IgY2FjaGVzIGFuZCBicmFuY2hlcyB3aXRoIENQVXMgMiBh
bmQgMy4KV291bGQgdGhpcyBzdWdnZXN0IHRoaXMgaW1wbGVtZW50YXRpb24gaXMgaW5kZWVkIGJy
b2tlbj8KClRoYW5rcywKQmVuCgoKT24gTW9uLCBGZWIgNywgMjAyMiBhdCAxOjQ3IFBNIFJvYmlu
IE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMi0wMi0wNyAx
MzozMywgQmVuamFtaW4gTW9yZGF1bnQgd3JvdGU6Cj4gPiBUaGUgUzkwNVgz4oCZcyAoT2Ryb2lk
IEM0KSBkYXRhc2hlZXQgYXBwZWFycyB0byByZXBvcnQgNCBpbmRpdmlkdWFsIFBNVUlSUXMsCj4g
PiBtdWNoIGluIHRoZSBzYW1lIHdheSBhcyBHWC4gSWYgdGhhdCBpcyBpbmRlZWQgdGhlIGNhc2Us
IEkgdGhpbmsgdGhpcyBwYXRjaAo+ID4gYXBwbGllcy4gT3RoZXJ3aXNlLCBpcyB0aGUgZGF0YXNo
ZWV0IHdyb25nIGlmIE1hcmPigJlzIGNvbW1lbnRzIGFwcGx5Pwo+Cj4gQSBmYWlybHkgc29saWQg
dGVzdCB3b3VsZCBiZSB0byBydW4gYSBzYW1wbGluZyBldmVudCAoZS5nLiBgcGVyZiBzdGF0YCkK
PiB0YXNrc2V0IHRvIGEgc2luZ2xlIENQVSBhbmQgb2JzZXJ2ZSB0aGUgY29ycmVzcG9uZGluZyBJ
UlEgY291bnQgaW5jcmVhc2UKPiBpbiAvcHJvYy9pbnRlcnJ1cHRzLCBmb3IgZWFjaCBjb3JlIGlu
IHR1cm4uIElmIHRoYXQgYmVoYXZlcyBhcyBleHBlY3RlZAo+IHRoZW4gY2hhbmNlcyBhcmUgZXZl
cnl0aGluZyBpcyBpbmRlZWQgc2FuZS4KPgo+IENvdXBsZSBvZiBuaXRwaWNrcyBmb3IgdGhlIHBh
dGNoIGl0c2VsZiAtIHlvdSdyZSBhbG1vc3QgdGhlcmUsIGJ1dAo+IHlvdSd2ZSBnb3Qgc3B1cmlv
dXMgdGFicyBvbiB0aGUgYmxhbmsgbGluZXMsIHBsdXMgeW91IG5lZWQgYSBwcm9wZXIKPiBjb21t
aXQgbWVzc2FnZSBhbmQgeW91ciBzaWduLW9mZiBhYm92ZSB0aGUgIi0tLSIgbGluZSAtIGFueXRo
aW5nIHlvdSBhZGQKPiBiZWxvdyB0aGVyZSBpcyB0cmVhdGVkIGFzIGFkZGl0aW9uYWwgY29tbWVu
dGFyeSBmb3IgcmV2aWV3ZXJzJyBiZW5lZml0Cj4gYW5kIHdpbGwgYmUgZGlzY2FyZGVkIGJ5IGBn
aXQgYW1gLgo+Cj4gQ2hlZXJzLAo+IFJvYmluLgo+Cj4gPgo+ID4gLyBCZW4KPiA+Cj4gPiBPbiBN
b24sIDcgRmViIDIwMjIgYXQgMTM6MjAsIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5j
b20+IHdyb3RlOgo+ID4KPiA+PiBPbiAyMDIyLTAyLTA3IDA4OjE0LCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiA+Pj4gSGksCj4gPj4+Cj4gPj4+IE9uIDA2LzAyLzIwMjIgMTU6NDMsIEJlbmphbWlu
IE1vcmRhdW50IHdyb3RlOgo+ID4+Pj4gLS0tCj4gPj4+PiBUaGUgZHRzIGZvciBtZXNvbiBzbTEg
YXBwZWFycyB0byBvbWl0IHRoZSBTb0MncyBQTVUsCj4gPj4+PiB3aGljaCBpcyBlc3NlbnRpYWwg
Zm9yIGFjY2Vzc2luZyBwZXJmIGV2ZW50cyByZWdhcmRpbmcKPiA+Pj4+IGUuZy4gY2FjaGUgb24g
ZS5nLiB0aGUgT2Ryb2lkIEM0IHBsYXRmb3JtLiBBZGQgaXQuCj4gPj4+Pgo+ID4+Pj4gICAgYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS5kdHNpIHwgMTMgKysrKysrKysrKysr
LQo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXNtMS5kdHNpCj4gPj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1zbTEuZHRzaQo+ID4+Pj4gaW5kZXggM2Q4YjFmNGYyLi40MTQ3ZWVjZDIgMTAwNjQ0Cj4gPj4+
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0c2kKPiA+Pj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+ID4+Pj4g
QEAgLTYsNiArNiw4IEBACj4gPj4+PiAgICAjaW5jbHVkZSAibWVzb24tZzEyLWNvbW1vbi5kdHNp
Igo+ID4+Pj4gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2F4Zy1hdWRpby1jbGtjLmg+
Cj4gPj4+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
Pgo+ID4+Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0t
Z2ljLmg+Cj4gPj4+PiAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbWVzb24tc20xLXBv
d2VyLmg+Cj4gPj4+PiAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNv
bi1heGctYXVkaW8tYXJiLmg+Cj4gPj4+PiAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQv
YW1sb2dpYyxtZXNvbi1nMTJhLWF1ZGlvLXJlc2V0Lmg+Cj4gPj4+PiBAQCAtOTAsNyArOTIsMTYg
QEAgbDI6IGwyLWNhY2hlMCB7Cj4gPj4+PiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNh
Y2hlIjsKPiA+Pj4+ICAgICAgICAgICAgfTsKPiA+Pj4+ICAgICAgICB9Owo+ID4+Pj4gLQo+ID4+
Pj4gKwo+ID4+Pj4gKyAgICBhcm0tcG11IHsKPiA+Pj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAi
YXJtLGNvcnRleC1hNTUtcG11IjsKPiA+Pj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQ
SSAxMzcgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gPj4+PiArICAgICAgICAgICAgICAgICA8R0lD
X1NQSSAxMzggSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gPj4+PiArICAgICAgICAgICAgICAgICA8
R0lDX1NQSSAxNTMgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gPj4+PiArICAgICAgICAgICAgICAg
ICA8R0lDX1NQSSAxNTQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPj4+PiArICAgICAgICBpbnRl
cnJ1cHQtYWZmaW5pdHkgPSA8JmNwdTA+LCA8JmNwdTE+LCA8JmNwdTI+LCA8JmNwdTM+Owo+ID4+
Pj4gKyAgICB9Owo+ID4+Pj4gKwo+ID4+Pj4gICAgICAgIGNwdV9vcHBfdGFibGU6IG9wcC10YWJs
ZSB7Cj4gPj4+PiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7
Cj4gPj4+PiAgICAgICAgICAgIG9wcC1zaGFyZWQ7Cj4gPj4+Cj4gPj4+IFBsZWFzZSBzZWUgTWFy
YydzIGNvbW1lbnRzIGFib3V0IFBNVSBzdXBwb3J0Ogo+ID4+PiBodHRwOi8vbG9yZS5rZXJuZWwu
b3JnL3IvODczNXBjcTYzby53bC1tYXpAa2VybmVsLm9yZwo+ID4+Cj4gPj4gSWYgU00xIGFjdHVh
bGx5IGhhcyBkaXN0aW5jdCBwZXItY29yZSBpbnRlcnJ1cHRzIGFzIHRoZSBwYXRjaCBpbXBsaWVz
Cj4gPj4gdGhlbiBpdCdzIGZpbmUgLSBpdCdzIG9ubHkgRzEyQiBhbmQgYW55dGhpbmcgZWxzZSB0
aGF0IGNvbWJpbmVzIG11bHRpcGxlCj4gPj4gUE1VIElSUXMgaW50byBhIHNpbmdsZSBTUEkgd2hp
Y2ggYXJlIHVuc3VwcG9ydGFibGUuCj4gPj4KPiA+PiBSb2Jpbi4KPiA+Pgo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
