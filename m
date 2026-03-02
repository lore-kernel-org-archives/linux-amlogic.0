Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F3EB3632
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYT3CAkWznYsLI/9bFFXJwc2Hx1CXu9I2PJLtUy9BzY=; b=M6Mog/8dPMjOSy
	I5ZJUGhSZeXU1wp3zBbNoyiVE1GxFT9tXBxoeqo5RrOpSs7bZRCQNhRyv9U9p0H789Z2cCRBJiaQo
	1+xtiBmla8zCj9bzyL9i/x5q2UL3hkk6vz7lW2deN4EMzupLxKpd9LUWsFG4/SPgiSOXqfhEUp1Et
	KZEEiHudVnDCHGNVt5iGEtdLyUl9KkH5o9NpUvsx0qmR02agoARwNpc9LqTv4yIU0uLv0KM8k1oWL
	KtA2pGSOlz1iZP3XVs7LYp8pXXpuCx16qeNF3KzS1E5koz0rhuRvZlhAy50oxMpVuWpawYZjLm5Re
	3MPOxMoebatlz6xmWCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxASj-0000000DzeB-2cbW;
	Mon, 02 Mar 2026 21:05:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxASh-0000000DzPw-3mCN
	for linux-amlogic@bombadil.infradead.org;
	Mon, 02 Mar 2026 21:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=; b=vrtArTF3pfhOmeEb8gxAld567J
	b4X2cDNNJblEx/zhINxxA99OGwpMh0JdEmOZXbUZs3bGlizwfmoVs1n/jH9YNGIQ21IVYe5r0wbuS
	yaizLPHijPtHZGZozAOJqZqiqMj+Lnusmq/68FBpiGQNoFOCyZdDm82iQhOZQuIWU3quZCWwXghyx
	Ygd98uV3i2ZwANY/SeR4FQNB5T3nSsjlbY5ybAPuWFF2vJ4sR3lO3NIHDSDf1Hz1jKE5FQFcT0bBG
	4GDiNRP+6laUD3ViSQ5XZwa2P47Mcde9xoIFIYOL7kLp2NbSWzBNx3QLz3ZAnfL3DwcB0HypFTde5
	Wugit0YA==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAR0-0000000A6sI-26e7
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 21:04:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c7350fd4efdso756733a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 13:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772485447; cv=none;
        d=google.com; s=arc-20240605;
        b=ITBvpf9aOFOqfrPaKUliM21r9DcR/xOJh6m1ThzY/vPZZ1InSElpFwEUKy2qFLBdK/
         izenq22x6BtpJcveUNJhaWpz2xX0hXk3rHMu7nzMAMlM5IJTz4rGYrhICDXOOcx+gd7i
         XBU2Sg6gSlXWvS7iJbqzlEwU6DVJIfiibuhMyCUzxlYMD8pFDCW8xYjnzEFkL6sZEQSL
         xleLcMpNFZns7vXRhDug1k4Bo0BzbY5wcwZOUp0yKam/egoRrimF7hmN3h2vT1Kc8EfO
         lbBsg4ILg/AZpa/yY2epF4xg6oDDdnGWsvWHoft3l4vk6FzyIgQmR1JGNwz9BKsOe92p
         zA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        fh=7h3O/BEmdITDFd4CvZMXzrNWQxQAbnrkDdDDbRhzUg8=;
        b=T0q26zI6t/To/fEV3IxsvGW0af907iUmgiGTehJ8R3QZmu8mn61k2SqF0OAWKj6sJb
         GpTPkYj+yM8JbpUEVwV+DTRez3DnpoxVdtGNNZxz8vhZRDs+0/ZjB4tSsit1j3WblLc6
         +0yt+HbA08ozhW+GBmfjphTZOGX+zB5fHkLQ3oO/nJTS/nj330yGjY2tg/hN/WqlDUbt
         HAxuY3L5h6jMx3hAt9yV5gaRZIgCO4TMZdg1oMC7xKpfX3+JZjsUU2cu/r2xrbzk1RQ3
         //SBbG/wrKc7W0G+LDll7bdXpIO/tZ13p4QDa8NqqrVuZmNLe35ft0/wCPBZN5mY1ps/
         glyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772485447; x=1773090247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        b=m63SzPOWkd+HwDk3QVhFANKgUQrr8Nj7Cq600B53dZbLFBPN7/sBNfVWIxD0UNBbAU
         v/cqUd2yv4O/W/QNmgNy+NU1kGLPxTMhrcXiyyoxm3eqFWK0BsC6KeWfSZOxhxn75ZCE
         eZ4aL/FgwuVd83Wy3baH3yVaRe09p235zFKjexkztVfuAZN+WxZss3XGd94Ku7dFvIYB
         4nBBRqiSPpL3p45Ft/WDjhsR4x07QQ8GUz64n53Ssb6wEkxD1JRrJc+ZtIckTgxuBEDQ
         UXUkpZ6X4tsk5/nEj916/lHUflJjSaQcYaDDQbU1Jrl6OwbAZalyLrLWqSrn0n3ouB3j
         JGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485447; x=1773090247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        b=PNZIyDq1NrGGwQU6Je3qcEyaFIUFSaawJJNVY7Zl5ToHGwSjTSQzxKOtR7+wazesIa
         pTxGpxCHGgxX58VKUGLk/op3+t3ZUorfnqXF2S8WFxO/HOPeIBHnmTneXI5ESGloPDBk
         TZEZ+AXy7op7B3z7nYVGT244bcbMKs/Di5iz6Osa6alqp8xlhiWN5QUaohA3+Z2QK8W1
         l/aRbXlLQzqAT29ezfZ385g4yZq+i1gSYDv5X0bVoGBUNBg34jcW0FLTzX5L8uX+ajrq
         KRgkOpL7nPY8MwebF9HgI5Bl5XZkXUrUbI2zdi3AUQ6c7EB0+Lt8O6wcf701O0ea9xP+
         DgQA==
X-Forwarded-Encrypted: i=1; AJvYcCXPVc077EubZZcCy3WJ3+a39+XN1r+l8NpSUKl3m2WM+IOY8YfglM0V96ke64O/Cl8Y0eQsnOBqN8peT7rc@lists.infradead.org
X-Gm-Message-State: AOJu0YwYtFQzKllKOIFN8MRvw+h8Fv0eAgNFtc+5HuSBeRANFhTfaMe8
	M+Z695e+eByYQ3XVtlYw8WxY2+GnCdnUStsGAunm69DnYV0bRd00nOtxhWJtrgp2l9Jona3AM4A
	xjyfuC/bHgx/BGcbsgh/mqTrZYojy+j0=
X-Gm-Gg: ATEYQzyoKpDl5v6j9ML5lMwrh9Qz1u0txSDJwa1k34Fj30BzNJEbDwrsX3na811pz4H
	W9VSHz9XTU3qWvh5EbH2lyyDYo5rK2L0Vut0SCJ0EwbDBFxbPAIP0Dton+4SCVjx69mxDEtWxR2
	DF3Mxnf7Fxs0tYndQoP3bQOB6ojxcSO2x8eQKSnkmCiq1Boe+ffcbtJk9pPzY53UVCDpkvyN8QN
	dYjJLE/x10+z29lG04uNl2QOmtdSYppsvgOlrizZLgNanyF/ls63Zd/G1MrsQwn5FE8iMlsVjHS
	LZU0ie9Nd3acy4bdkfuI422O7my6LFoTPOf+m4wd
X-Received: by 2002:a17:902:ccc8:b0:2ae:5628:a170 with SMTP id
 d9443c01a7336-2ae5628afe4mr43796855ad.46.1772485446798; Mon, 02 Mar 2026
 13:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-2-nick@khadas.com>
 <20260228-quirky-lemon-reindeer-1045f6@quoll> <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
 <49b3a87d-7ea0-4da1-871e-35ddf5d5b454@kernel.org>
In-Reply-To: <49b3a87d-7ea0-4da1-871e-35ddf5d5b454@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 22:03:54 +0100
X-Gm-Features: AaiRm50TpdWh3Y_pvxvTMNOeIVTyBRxIzdF8SrzpLj8ML0Xjz_0wayl9w2nZ3rY
Message-ID: <CAFBinCDyhvzWO3gOL=GtnH56Guh2fkZyhmSjn2k3iJdhtmTdBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_210411_113238_D738394A 
X-CRM114-Status: GOOD (  26.16  )
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

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBNYXIgMiwgMjAyNiBhdCAyOjU54oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAyLzAzLzIwMjYgMTI6
NTgsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPgo+ID4g
T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMTI6MTjigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gU2F0LCBGZWIgMjgsIDIwMjYgYXQg
MDI6NTg6MzdQTSArMDgwMCwgTmljayBYaWUgd3JvdGU6Cj4gPj4+IEFkZCB0aGUgY29tcGF0aWJs
ZSBzdHJpbmcgZm9yIHRoZSBTQVJBREMgKFN1Y2Nlc3NpdmUgQXBwcm94aW1hdGlvbgo+ID4+PiBS
ZWdpc3RlciBBREMpIElQIGJsb2NrIGZvdW5kIGluIHRoZSBBbWxvZ2ljIE1lc29uIFM0IFNvQy4K
PiA+Pgo+ID4+IC4uLiB3aGljaCBpcyBmdWxseSBjb21wYXRpYmxlIHdpdGggZzEyYT8KPiA+Pgo+
ID4+IFdyaXRlIHByb3BlciBleHBsYW5hdGlvbnMuCj4gPiBXb3VsZCB5b3UgYmUgZmluZSB3aXRo
Ogo+ID4gIlRoZXJlIGFyZSBubyBrbm93biBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBTQVJBREMg
b24gUzQgYW5kIHRoZSBvbmUKPiA+IG9uIEcxMkEuIEluIHRoZSBwYXN0IGRpZmZlcmVuY2VzIGJl
dHdlZW4gU0FSQURDIG9uIHRoZSBkaWZmZXJlbnQgU29Dcwo+ID4gZ2VuZXJhdGlvbnMgaGF2ZSBi
ZWVuIHVuY292ZXJlZCBsYXRlLCBtZWFuaW5nIHRoYXQgYSBkZWRpY2F0ZWQKPiA+IGNvbXBhdGli
bGUgc3RyaW5nIGhhcyBwcm92ZW4gdG8gYmUgdXNlZnVsLiIKPgo+IE5vLCBsYXN0IHNlbnRlbmNl
IGlzIHJlZHVuZGFudC4gWW91IGRvIG5vdCBuZWVkIHRvIGV4cGxhaW4gaW4gdGhlIGNvbW1pdAo+
IG1zZyBydWxlcyBvZiBiaW5kaW5ncywgYmVjYXVzZSB0aGV5IGFyZSBvYnZpb3VzL2tub3duLiBZ
b3UgbmVlZCB0bwo+IGV4cGxhaW4gdGhlIGhhcmR3YXJlLCBlLmcuIGluIHRoaXMgY2FzZSB0aGUg
Y29tcGF0aWJpbGl0eSBiZXR3ZWVuIGRldmljZXMuClVuZGVyc3Rvb2QsIHRoYW5rcy4KCj4gPgo+
ID4gRG8geW91IGFsc28gcmVxdWlyZSBOaWNrIHRvIGFkZCBhbWxvZ2ljLG1lc29uLWcxMmEtc2Fy
YWRjIGFzIGZhbGxiYWNrCj4gPiBjb21wYXRpYmxlIHN0cmluZyBmb3IgYW1sb2dpYyxtZXNvbi1z
NC1zYXJhZGM/Cj4gPgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFhpZSA8bmlja0Br
aGFkYXMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9h
ZGMvYW1sb2dpYyxtZXNvbi1zYXJhZGMueWFtbCAgICAgICAgfCAxICsKPiA+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYW1sb2dpYyxtZXNvbi1zYXJhZGMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FtbG9naWMsbWVz
b24tc2FyYWRjLnlhbWwKPiA+Pj4gaW5kZXggYmI5ODI1ZTczNDZkZC4uNTQ5NmEwZGM3MTRhYSAx
MDA2NDQKPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9h
ZGMvYW1sb2dpYyxtZXNvbi1zYXJhZGMueWFtbAo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hbWxvZ2ljLG1lc29uLXNhcmFkYy55YW1sCj4gPj4+
IEBAIC0yNyw2ICsyNyw3IEBAIHByb3BlcnRpZXM6Cj4gPj4+ICAgICAgICAgICAgICAgIC0gYW1s
b2dpYyxtZXNvbi1neG0tc2FyYWRjCj4gPj4+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNv
bi1heGctc2FyYWRjCj4gPj4+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLXNh
cmFkYwo+ID4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tczQtc2FyYWRjCj4gPj4K
PiA+PiBJZiB0aGlzIGlzIGNvbXBhdGlibGUgd2l0aCBvdGhlciBkZXZpY2UsIHlvdSBuZWVkIHBy
b3BlciBmYWxsYmFjay4KPiA+Pgo+ID4+PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVz
b24tc2FyYWRjCj4gPj4KPiA+PiBBbmQgdGhpcyBvbmUgaXMgbm93IGtpbmQgb2YgZmFrZSAtIGhv
dyBkb2VzIHRoaXMgZGV2aWNlIHVzZSBpdD8KPiA+IEFzIHlvdSBoYXZlIG5vdGljZWQgbGF0ZXIs
IGl0IGlzIGN1cnJlbnRseSBub3QgdXNlZC4KPiA+IENhbiB5b3UgcGxlYXNlIGNvbmZpcm0gdGhh
dCBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBuZXh0IHN0ZXBzIGlzIGNvcnJlY3Q6Cj4gPiAtIHlv
dSdyZSBleHBlY3RpbmcgTmljayB0byBvbWl0IHRoZSBhbWxvZ2ljLG1lc29uLXNhcmFkYyBmYWxs
YmFjawo+ID4gY29tcGF0aWJsZSBzdHJpbmcgZm9yIGFtbG9naWMsbWVzb24tczQtc2FyYWRjCj4K
PiBOb3Qgb21pdCBidXQgcmVwbGFjZSB3aXRoIHByb3BlciBmYWxsYmFjayB0byBzcGVjaWZpYyBj
b21wYXRpYmxlLgpTbyBpbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byBlbmQgdXAgd2l0aDoKY29tcGF0
aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXNhcmFkYyIsICJhbWxvZ2ljLG1lc29uLWcxMmEtc2Fy
YWRjIgpTdGF0aW5nIHRoYXQgdGhlIFM0IFNBUkFEQyBJUCBpcyBjb21wYXRpYmxlIHdpdGggdGhl
IEcxMkEgU0FSQURDIElQLgpBbnkgUzQgc3BlY2lmaWMgcXVpcmtzIHRoYXQgd2UgbmVlZCAoaW4g
Y2FzZSB3ZSBldmVyIGZpbmQgc29tZXRoaW5nKQpjYW4gdGhlbiBiZSBtYW5hZ2VkIGluIHRoZSBk
cml2ZXIuCgo+ID4gLSBhbmQgeW91IHdvdWxkIGxpa2UgdG8gc2VlIGFtbG9naWMsbWVzb24tc2Fy
YWRjIHJlbW92ZWQgKGZyb20gdGhlCj4gPiBiaW5kaW5ncyBhbmQgLmR0cyBmaWxlcyB0aGF0IGFy
ZSBhbHJlYWR5IHVwc3RyZWFtKSAtIEkgd2lsbCB0YWtlIGNhcmUKPiA+IG9mIHRoaXMgb25jZSBT
NCBzdXBwb3J0IGxhbmRzIHVwc3RyZWFtCj4KPiBUaGlzIG5vLiBJdCdzIGFuIEFCSSwgeW91IGNh
bm5vdCBjaGFuZ2UgaXQuIE5vdCB3b3J0aCBpdCwgZWl0aGVyLgpZb3Ugc3VnZ2VzdGVkIGFkZGlu
ZyBhIGNvbW1lbnQgc3RhdGluZyB0aGF0IGZ1dHVyZSBiaW5kaW5ncyBtdXN0IG5vdAp1c2UgdGhl
ICJhbWxvZ2ljLG1lc29uLXNhcmFkYyIgY29tcGF0aWJsZSBzdHJpbmcgYW55bW9yZS4KU2luY2Ug
aXQncyBwYXJ0IG9mIEFCSSB3ZSBuZWVkIHRvIGtlZXAgaXQuIFNvIGFkZGluZyBhIGNvbW1lbnQg
aXMgYWxsIEknbGwgZG8uCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
