Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F59AC54735
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2024 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ps/qYxaxvBgkP2yb7nEYY8dFVeNNcqEkRLw19Y3F2Bs=; b=v7vWX+7CfvZyCk
	gEUNTIGaEPYjE72qIOdZfYKnY52b7hmFHQjbxtosTOuKsI9IwDH33mTUz1yrN2vD46+XRWR3Vma8Q
	J5hUTKm7rtCBL5+qnSZh3AshQ1ZGhwQMMrQu8ZYZ2no8IuFbxMI0YBKoAxnxKm2dIQHTGFT70WWHK
	DiwjN83aLI3vHWWuugM6dJ5UFuXVUCsxlBK6l+6NDFL6Fhnz4wX0wqFFsC4r6iGVLFthdVjx1kr48
	PVTCloKplViqY/N9wJ/TCVEUlhvoFPoHe5IB1cNTtTZ1AxL/5/67XtdjXEORQg4Bg+XLaDJYeXmKi
	/2WSiqdkCiv6fzoTnWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siufd-0000000B5k8-1qSW;
	Tue, 27 Aug 2024 11:47:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siufZ-0000000B5hp-0b7d
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Aug 2024 11:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E944A41926
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2024 11:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A003DC4CB09
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2024 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724758788;
	bh=5aiCA1KifFkP5iaGWPQMv96TRmb7TG8TWiOnSHnr4Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YKhx1CcTr13AVlW0lGluSP/OG0ne45wnDwcoKh8pDLTC0OIk+BAsyIUXH9ItJe4t8
	 t1ZpjPPAeOA+ppxDYHyXDRye0UcGIc3txxzQvZCV5tSKUJZUzNpr2i/BD0MRz19pMR
	 TV5SBzTc6CmNVfWHfwkDtO7AzFh0S4McBfL/bW6qA/ERj24Tqwt+CpGLj8EATxTibM
	 dKLGdtQLm/kM/utcSOUjycu1NYjbmzCRJkeGMtzz8PEDTiBOwaAO8dVOhScTd7gUlz
	 9YZtq+saUkSTu/cGyYUKAuqA9RyFRFEr80QDkJNCHo5Ez7vsq/9b1A/C3LUWfTEFVi
	 KFEEzgc10Ct5A==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2700d796019so3670404fac.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2024 04:39:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc2vpu23m+ARVDSTfwEsBxvigXt2Anm/fZSuiaOIASdaqSCxIMBzIZF/GWoAQ+5mhaMpbXY/TCkchSp5xx@lists.infradead.org
X-Gm-Message-State: AOJu0YxYpFM0KSRc5csmza/8H9bK61jLOf8iEL9H5mHR+Zk+gWMqoHkN
	TD0EMC1feH2N6J7fOZicIo5nkOBV8ejvk6fIvim8vqr3tFKnq5Vewbl+9TxcsCrbHQ2J3kYYqWB
	3nvnLpNUc2LqkujxsQPdp9zgpnOQ=
X-Google-Smtp-Source: AGHT+IF/Xn74FPzWxUMpobK5eYPXxi3H+e7CiAt/e1busK+TNSBvd20Vw3Rlp2wN4ZY8to/DMozxHrLIKv+WBrNjWJ4=
X-Received: by 2002:a05:6870:e249:b0:270:4637:40fa with SMTP id
 586e51a60fabf-273e675c7a1mr13625626fac.48.1724758787990; Tue, 27 Aug 2024
 04:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <2205737.irdbgypaU6@rjwysocki.net> <CGME20240826113153eucas1p110e90b4cd98aa70601770fe93d7aa1e5@eucas1p1.samsung.com>
 <2236794.NgBsaNRSFp@rjwysocki.net> <ef729a47-b7f9-48b6-a14d-692565ef1d38@samsung.com>
 <CAJZ5v0gOqNi+-Hi8uyeEJ9dHzhwU6GyL6t_7Xjt5Knf2yJmH-w@mail.gmail.com> <0e710ff1-4ff4-403a-b85d-b1e51c03378a@samsung.com>
In-Reply-To: <0e710ff1-4ff4-403a-b85d-b1e51c03378a@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Aug 2024 13:39:36 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h2pF3E_Ni1D7_6jB0NpQrkhcZ6tCCmww8CX02-5qAYEw@mail.gmail.com>
Message-ID: <CAJZ5v0h2pF3E_Ni1D7_6jB0NpQrkhcZ6tCCmww8CX02-5qAYEw@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] thermal/of: Use the .should_bind() thermal zone callback
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Zhang Rui <rui.zhang@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
	Mateusz Majewski <m.majewski2@samsung.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_044729_345222_098CCAD6 
X-CRM114-Status: GOOD (  22.14  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTA6NDnigK9QTSBNYXJlayBTenlwcm93c2tpCjxtLnN6
eXByb3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gT24gMjYuMDguMjAyNCAxNDoxNCwgUmFm
YWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyAyNiwgMjAyNCBhdCAxOjMy4oCv
UE0gTWFyZWsgU3p5cHJvd3NraQo+ID4gPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6
Cj4gPj4gT24gMTkuMDguMjAyNCAxODozMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPj4+
IEZyb206IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNvbT4KPiA+
Pj4KPiA+Pj4gTWFrZSB0aGUgdGhlcm1hbF9vZiBkcml2ZXIgdXNlIHRoZSAuc2hvdWxkX2JpbmQo
KSB0aGVybWFsIHpvbmUgY2FsbGJhY2sKPiA+Pj4gdG8gcHJvdmlkZSB0aGUgdGhlcm1hbCBjb3Jl
IHdpdGggdGhlIGluZm9ybWF0aW9uIG9uIHdoZXRoZXIgb3Igbm90IHRvCj4gPj4+IGJpbmQgdGhl
IGdpdmVuIGNvb2xpbmcgZGV2aWNlIHRvIHRoZSBnaXZlbiB0cmlwIHBvaW50IGluIHRoZSBnaXZl
bgo+ID4+PiB0aGVybWFsIHpvbmUuICBJZiBpdCByZXR1cm5zICd0cnVlJywgdGhlIHRoZXJtYWwg
Y29yZSB3aWxsIGJpbmQgdGhlCj4gPj4+IGNvb2xpbmcgZGV2aWNlIHRvIHRoZSB0cmlwIGFuZCB0
aGUgY29ycmVzcG9uZGluZyB1bmJpbmRpbmcgd2lsbCBiZQo+ID4+PiB0YWtlbiBjYXJlIG9mIGF1
dG9tYXRpY2FsbHkgYnkgdGhlIGNvcmUgb24gdGhlIHJlbW92YWwgb2YgdGhlIGludm9sdmVkCj4g
Pj4+IHRoZXJtYWwgem9uZSBvciBjb29saW5nIGRldmljZS4KPiA+Pj4KPiA+Pj4gVGhpcyByZXBs
YWNlcyB0aGUgLmJpbmQoKSBhbmQgLnVuYmluZCgpIHRoZXJtYWwgem9uZSBjYWxsYmFja3Mgd2hp
Y2gKPiA+Pj4gYXNzdW1lZCB0aGUgc2FtZSB0cmlwIHBvaW50cyBvcmRlcmluZyBpbiB0aGUgZHJp
dmVyIGFuZCBpbiB0aGUgdGhlcm1hbAo+ID4+PiBjb3JlICh0aGF0IG1heSBub3QgYmUgdHJ1ZSBh
bnkgbW9yZSBpbiB0aGUgZnV0dXJlKS4gIFRoZSAuYmluZCgpCj4gPj4+IGNhbGxiYWNrIHdvdWxk
IHdhbGsgdGhlIGdpdmVuIHRoZXJtYWwgem9uZSdzIGNvb2xpbmcgbWFwcyB0byBmaW5kIGFsbAo+
ID4+PiBvZiB0aGUgdmFsaWQgdHJpcCBwb2ludCBjb21iaW5hdGlvbnMgd2l0aCB0aGUgZ2l2ZW4g
Y29vbGluZyBkZXZpY2UgYW5kCj4gPj4+IGl0IHdvdWxkIGNhbGwgdGhlcm1hbF96b25lX2JpbmRf
Y29vbGluZ19kZXZpY2UoKSBmb3IgYWxsIG9mIHRoZW0gdXNpbmcKPiA+Pj4gdHJpcCBwb2ludCBp
bmRpY2VzIHJlZmxlY3RpbmcgdGhlIG9yZGVyaW5nIG9mIHRoZSB0cmlwcyBpbiB0aGUgRFQuCj4g
Pj4+Cj4gPj4+IFRoZSAuc2hvdWxkX2JpbmQoKSBjYWxsYmFjayBzdGlsbCB3YWxrcyB0aGUgdGhl
cm1hbCB6b25lJ3MgY29vbGluZyBtYXBzLAo+ID4+PiBidXQgaXQgY2FuIHVzZSB0aGUgdHJpcCBv
YmplY3QgcGFzc2VkIHRvIGl0IGJ5IHRoZSB0aGVybWFsIGNvcmUgdG8gZmluZAo+ID4+PiB0aGUg
dHJpcCBpbiBxdWVzdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UgYW5kIHRoZW4gaXQgdXNlcyB0aGUK
PiA+Pj4gY29ycmVzcG9uZGluZyAnY29vbGluZy1kZXZpY2UnIGVudHJpZXMgdG8gbG9vayB1cCB0
aGUgZ2l2ZW4gY29vbGluZwo+ID4+PiBkZXZpY2UuICBUbyBiZSBhYmxlIHRvIG1hdGNoIHRoZSB0
cmlwIG9iamVjdCBwcm92aWRlZCBieSB0aGUgdGhlcm1hbAo+ID4+PiBjb3JlIHRvIGEgc3BlY2lm
aWMgZGV2aWNlIG5vZGUsIHRoZSBkcml2ZXIgc2V0cyB0aGUgJ3ByaXYnIGZpZWxkIG9mIGVhY2gK
PiA+Pj4gdHJpcCB0byB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2Ugbm9kZSBwb2ludGVyIGR1cmlu
ZyBpbml0aWFsaXphdGlvbi4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+ID4+IFRoaXMgcGF0Y2ggbGFuZGVk
IHJlY2VudGx5IGluIGxpbnV4LW5leHQgYXMgY29tbWl0IDZkNzFkNTVjM2IxMgo+ID4+ICgidGhl
cm1hbC9vZjogVXNlIHRoZSAuc2hvdWxkX2JpbmQoKSB0aGVybWFsIHpvbmUgY2FsbGJhY2siKQo+
ID4gSXQgaGFzIGJlZW4gZml4ZWQgc2luY2UgYW5kIGl0IGlzIGNvbW1pdCAgOTRjNjExMGIwYjEz
YzY0MTYxNDYgbm93Lgo+Cj4KPiBDb25maXJtZWQuIFRoYW5rcyBmb3IgZml4aW5nIGl0IGFuZCBz
b3JyeSBmb3IgdGhlIG5vaXNlLgoKVGhhbmsgeW91IQoKQW5kIGl0IHdhc24ndCBub2lzZS4gIFlv
dSByZXBvcnRlZCB0aGUgcHJvYmxlbSBhcyBzb29uIGFzIHlvdSBzYXcgaXQKYW5kIGJlZm9yZSB5
b3UgY291bGQgc2VlIHRoZSBmaXguICBTb21lYm9keSBlbHNlIHNhdyBpdCBlYXJsaWVyLCBidXQK
dGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggdGhhdC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
