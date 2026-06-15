Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C4DCD98C5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Si+DO8u3gcFe9I2GP4TgCX5cD5JhRoNIsE6K+YpcFqI=; b=wDLJbqmIGcsiPa
	3O5LwKJP+kQiE4eFds5uwHlS1a9zM6GgL0xQBNoKbvnUI0Gx2qCrTrDrWnQCUp7esQsoE0ivdzMa/
	ZaVa1IDHRNj1V2hrgFlnhG+WQf2m5f4CGUo3LIYrfviR6nIfADnqkqY1+u+ufffZ/c6UiPNQW3R9A
	IzTFs+C+Ya0kwTJTrQWU1i5k0ety10dWOY92qNpui6nH7t8YRaumkS2pwA4uOVKAInUXPikhd2obm
	o/aVZt7qNjhqui8FGAe8+VVG7pnJYI6Erx0SggvlAiVapbCvW3YwGl9bWRjgiZYmP43nsamhcSwGU
	10DQVEZpVWoyOYnC9Mcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6vL-0000000EFdJ-46v7;
	Mon, 15 Jun 2026 13:00:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6vG-0000000EFcW-2Uny
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jun 2026 13:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B681143D72
	for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 13:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0291F00AC4
	for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528413;
	bh=9AfeWhadO1v9+SOwJHNDv9yxD8mKNaO32U/4W8IqQks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OtAYO8G1iTz93pqIG95Bt5ygW6csEa09rVqLyrXI6Fcw0vMP1/t3zvd5iLq3O51+H
	 P3gWBKO5f2DujiUFvJ4XZlLmd/dAKxzQdAzmBAgKt6bf95AzqcfaxVuJWwezRBpcnB
	 KazPgpaISQA0Rt3QKRhDJ4uIwkr9UflXUkHo/PF7SUmclwcswC+qiVBTpwAUPEx7zP
	 RXT8GdWSOoOjccxEzOf2WL5f+lK1uVAJr5/MW/bS/+SCBxLVmy6jhf3eYzgco1H1bl
	 sH49ShaxRAnJfzPof0Qb8n52UVjgBZMSysdEfSIIu5rWWZ3wiL/Ku9qTD6eB1FFx6U
	 yR+L5yZR+jFpQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39676ff4674so29138701fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 06:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+enrPK7IFdxWUH1mTuKwNLm2JxB006hOMNqmgWItJ96SQKRcHdlAQ2UMJQ6zp+xvHYJcjhl2+tlyaW0NsB@lists.infradead.org
X-Gm-Message-State: AOJu0YxXnBSVcYtSTdQE+yz1AfRgT8D8zuMFek7T8akAYF/1haksuQjF
	gpPz5s5CAIOKuwHf3NJV+sQpDgILhzrXEu4XxmRFldnyQw1TziK3g0XdDHeU4udZ/pzLyHbRBsL
	C27nfneEtiCaHmrXvlQfItHBANyXvX4c=
X-Received: by 2002:ac2:4842:0:b0:5ad:a25:b8a3 with SMTP id
 2adb3069b0e04-5ad30dc3332mr1847615e87.29.1781528412405; Mon, 15 Jun 2026
 06:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com> <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
In-Reply-To: <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:59:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
X-Gm-Features: AVVi8CcBb6WQACvc7gkaicyjvy5mkWEAD_WR6myDRZYFSecbNnPJmhQJczsoxDs
Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgNToxN+KAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKPiBPbiAyMDI2LzYvMTEgMjA6NTEsIExpbnVzIFdhbGxl
aWogd3JvdGU6Cj4gPiBIaSBYaWFud2VpLAo+ID4KPiA+IHRoYW5rcyBmb3IgeW91ciBwYXRjaGVz
IQo+ID4KPiA+IE9uIFRodSwgSnVuIDExLCAyMDI2IGF0IDk6NTTigK9BTSBYaWFud2VpIFpoYW8g
dmlhIEI0IFJlbGF5Cj4gPiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gIHdyb3RlOgo+ID4KPiA+PiBTb21lIHVzZXJzIG5lZWQgdG8gb2J0YWluIGFuIElSUSBk
aXJlY3RseSBmcm9tIGEgR1BJTyBkZXNjcmlwdG9yIHRocm91Z2ggZ3Bpb2RfdG9faXJxKCkuCj4g
Pj4gQWRkIHRoZSByZXF1aXJlZCBEVCBiaW5kaW5nIGFuZCBpbXBsZW1lbnRhdGlvbiB0byBzdXBw
b3J0IHRoaXMgdXNlIGNhc2UuCj4gPj4gU2luY2UgdGhpcyBpbnRyb2R1Y2VzIGEgbmV3IERUIHBy
b3BlcnR5LCB0aGUgcHJvcGVydHkgaXMga2VwdCBvcHRpb25hbCB0bwo+ID4+IG1haW50YWluIGNv
bXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBTb0NzIGFuZCBEVFMgZmlsZXMuCj4gPiBUbyBtZSBp
dCBsb29rcyBsaWtlIHlvdSBoYXZlIGp1c3QgcmUtaW1wbGVtZW50ZWQgaGllcmFyY2hpY2FsCj4g
PiBpcnFzLgo+ID4KPiA+IExvb2sgaW50byB0aGUgc2VjdGlvbiAiSW5mcmFzdHJ1Y3R1cmUgaGVs
cGVycyBmb3IgR1BJTyBpcnFjaGlwcyIKPiA+IGluIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9n
cGlvL2RyaXZlci5yc3QsIGVzcGVjaWFsbHkgdG93YXJkcwo+ID4gdGhlIGVuZC4KPiA+Cj4gPiBT
b2x2ZSB0aGlzIGJ5IHVzaW5nIEdQSU9MSUJfSVJRQ0hJUCBhbmQgYSBjdXN0b20KPiA+IGNoaWxk
X3RvX3BhcmVudF9od2lycSgpIGNhbGxiYWNrIHRvIHRyYW5zbGF0ZSB0aGUgR1BJTyBpbnRvCj4g
PiBhbiBJUlEuCj4gPgo+ID4gVG8ganVzdCBpbXBsZW1lbnQgZ3Bpb2RfdG9faXJxKCkgd2l0aG91
dCBhbnkgaXJxY2hpcCBhYnN0cmFjdGlvbgo+ID4gaXMgYWxzbyBicm9rZW46IHlvdSBjYW4ndCBm
b3JjZSBhbGwgdXNlcnMgdG8ganVzdCB1c2UgdGhpcyB3YXkKPiA+IHRvIGdldCBhbiBJUlEgaXQn
cyBleGNlc3NpdmVseSByZXN0cmljdGluZy4KPiA+Cj4gPiBBZGQKPiA+Cj4gPiAgICBpbnRlcnJ1
cHQtY29udHJvbGxlcjogdHJ1ZQo+ID4KPiA+ICAgICIjaW50ZXJydXB0LWNlbGxzIjoKPiA+ICAg
ICAgY29uc3Q6IDIKPiA+Cj4gPiB0byB0aGUgcGluY3RybCBub2RlIGFzIHdlbGwgc28gdGhhdCBE
VCB1c2VycyBjYW4gc2ltcGx5IHJlcXVlc3QKPiA+IHRoZSBJUlEgZnJvbSB0aGUgaXJxY2hpcCBp
bnNpZGUgb2YgdGhlIHBpbiBjb250cm9sbGVyLiBJdCB3aWxsCj4gPiBiZSBoaWVyYXJjaGljYWwg
YW5kIGxpZ2h0d2VpZ2h0IGJ1dCBhbiBpcnFjaGlwIG5ldmVydGhlbGVzcy4KPiA+Cj4gPiBUaGUg
R1BJT0xJQl9JUlFDSElQIGFwcHJvYWNoIHdpbGwgaGVscCB5b3UgdG8gZ2V0IHRoaXMKPiA+IHJp
Z2h0Lgo+ID4KPgo+IEkgcmVhZCB0aGUgZG9jdW1lbnQgKERvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS9ncGlvL2RyaXZlci5yc3QpIHlvdQo+IHBvaW50ZWQgbWUgdG8gYW5kIGZvdW5kIHRoYXQgdGhl
IGNvcnJlc3BvbmRpbmcgaW1wbGVtZW50YXRpb24gaGFzCj4gYWxyZWFkeSBiZWVuIGFkZGVkIGlu
IHRoaXMgZmlsZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21h
c3Rlci9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYwoKVGhhdCBpcyB0aGUgcGFyZW50
IGludGVycnVwdCBjb250cm9sbGVyIHRvIHRoZSBwaW5jdHJsK2dwaW8gaXNuJ3QgaXQuCgpJdCB3
aWxsIGJlIGV2ZW4gY2xlYXJlciBvbmNlIHlvdSB1c2UgaW50ZXJydXB0cyA9IDw+OyBpbnN0ZWFk
IG9mCnRoZSBod2lycSA9IDw+OyBoYWNrLgoKPiBIb3dldmVyLCBpdCBpcyBpbXBsZW1lbnRlZCBh
cyBhIHN0YW5kYWxvbmUgaXJxY2hpcCBhbmQgaXMgbm90IGludGVncmF0ZWQKPiB3aXRoIHRoZSBH
UElPIGNvbnRyb2xsZXIuCgpSaWdodCwgc28gaXQgaXMgdGhlIHBhcmVudC4gT2YgY291cnNlIGl0
IGl0IHN0YW5kIGFsb25lLgoKPiBJbiB0aGlzIHBhdGNoLCBJIGltcGxlbWVudGVkIHRoZSBHUElP
LXRvLUlSUSBjb252ZXJzaW9uIHRocm91Z2gKPiBncGlvZF90b19pcnEoKS4gVXNlcnMgY2FuIHN0
aWxsIG9idGFpbiB0aGUgaW50ZXJydXB0IGRpcmVjdGx5IHRocm91Z2gKPiB0aGUgaW50ZXJydXB0
IHByb3BlcnR5LCBmb3IgZXhhbXBsZToKPgo+IGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW9f
aW50YyAxNiAxPjsKPgo+IFRoZSBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlIGlzIHRvIG1ha2UgR1BJ
Ty10by1JUlEgY29udmVyc2lvbiBlYXNpZXIgZm9yCj4gdXNlcnMgd2hvIGRvIG5vdCB3YW50IHRv
IGtub3cgdGhlIGFjdHVhbCBpbnRlcnJ1cHQgbnVtYmVyLiBUaGUgaW50ZXJydXB0Cj4gbWFwcGlu
ZyBpcyBub3QgZml4ZWQgYW5kIHZhcmllcyBiZXR3ZWVuIGRpZmZlcmVudCBTb0NzLCBzbyB1c2Vy
cyBzaG91bGQKPiBub3QgbmVlZCB0byBoYW5kbGUgdGhlIGhhcmR3YXJlIGludGVycnVwdCBhbGxv
Y2F0aW9uIGRldGFpbHMuCgpUaGlzIGlzIG5vdCB3aHkgZ3Bpb2RfdG9faXJxKCkgZXhpc3RzLiBJ
dCBpcyBub3QgYSBjb252ZW5pZW5jZSBmdW5jdGlvbgp0aGF0IGlzIHZvbHVudGFyeSB0byBpbXBs
ZW1lbnQuCgpJZiB5b3UgaW1wbGVtZW50IGdwaW9kX3RvX2lycSgpIHlvdSBpbXBsZW1lbnQgYW4g
ZW50aXJlCmlycWNoaXAgb3RoZXJ3aXNlIGl0IGlzIGEgYnVnLgoKSWYgdGhlIHBpbiBjb250cm9s
ICsgR1BJTyBkcml2ZXIgc2hvdWxkIHNlcnZlIElSUSBudW1iZXJzIGluIGFueQpzaGFwZSBvciBm
b3JtLCB5b3UgbmVlZCB0byBnbyB0aGUgd2hvbGUgd2F5IGFuZCBwcm92aWRlIGEKaGllcmFyY2hp
Y2FsIGlycWNoaXAuCgpJdCBkb2Vzbid0IG1hdHRlciBpZiB5b3UgZG9uJ3QgbmVlZCB0byBzZXQg
YSBzaW5nbGUgYml0IGluIHRoZQpwaW5jdHJsICsgR1BJTyBoYXJkd2FyZSBmb3IgdGhlc2UgSVJR
cywgdGhlIGZhY3QgdGhhdCB0aGV5IGFyZQpyb3V0ZWQgaW50ZXJuYWxseSBvbiB0aGUgU29DIG91
dCB0aHJvdWdoIHRoZSBwaW4gY29udHJvbCBhbmQKR1BJTyBibG9jayBieSBkZWZpbml0aW9uIG1h
a2VzIGl0IGhpZXJhcmNoaWNhbC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
