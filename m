Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC1CCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nv4pxzw2a2STUeiy0lwTh0K4u1Tyt77B+nSu6KuaFS0=; b=QExZggZg2cxYqXlVupXfsUUe5Q
	2PBphBOMDurCtMIKzraZN2l7Qn2XEShOk0ikwr522y27nWiN3MUUzLoc6oBdO3Q4OZqIABPh3ebmW
	99Hc5UCHgbtw0bDFLG8tuMtpo8pTm+xYazvkQ9z8/oPozKa/HMRjES6BDSHktBEc0Fem9rfUDYYsN
	Ck9f7a5ax/cEkKYAyruuOD+6vnyjHDc9FTeBinffVPfdKLCu+K5S69ITpAT/KecWrbwwvEVH3VEOc
	W6ROF+O2yKmUB+MvTcVVTHvrJCTZWvH8Z8hd8zjjfdR52h7icClcq1D2MfuQ1+6Gh4J0zpeL/dc/e
	i+f8ihUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQGW-000000041dt-1ijy;
	Thu, 30 Oct 2025 10:52:24 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQGS-000000041cn-0rPD
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 10:52:22 +0000
Date: Thu, 30 Oct 2025 10:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1761821531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBHnBHSuMYckJCLbgZCu2OahfUnKzTUzjWVCcpE6wBc=;
	b=fRb0pGmiX3dK8gJZa/zjS1z3dJEB9uuqxQT5osdza1NGSdi0lHhhDfiqNCTqSSxuOdCutE
	TtGUGf9YypwzUGmubEkjG8lMMFdFXkWq9Lcd9riJSOPKCwMrurjtuoaW0qPhUJVlSAoTSe
	qrkkfOoffCkvPDrPNLwWaVNmC2KCRUdGnHnarRcYSyxSZejDIqqhLkGL/hkf3VdmefsS5v
	pYr+ao12rw7hjomsHXvZDxGHRRFnM9fASbnSRDTeJD4UnlwwHQRx46IiWPbMFatzp2e8kv
	3OmV6LQF5OfTwin8zGkIA17VE42nTlRvvZtWg1MV9FaXs/JWAkBnh5gqDsx7gw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>, Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com> <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com> <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
In-Reply-To: <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
Message-ID: <t4xy6q.vhi5j58gpfcw@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_035220_991637_AEE2BEF9 
X-CRM114-Status: GOOD (  13.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBPY3QgMjAyNSAxMTowOCwgWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9n
aWMuY29tPiB3cm90ZToKPgo+5ZyoIDIwMjUvMTAvMjcgMjA6NTcsIENocmlzdGlhbiBIZXdpdHQg
5YaZ6YGTOgo+PiBbY2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20gYXBwZWFycyBzaW1pbGFyIHRv
IHNvbWVvbmUgd2hvIHByZXZpb3VzbHkgc2VudCB5b3UgZW1haWwsIGJ1dCBtYXkgbm90IGJlIHRo
YXQgcGVyc29uLiBMZWFybiB3aHkgdGhpcyBjb3VsZCBiZSBhIHJpc2sgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Cj4+PiBPbiAyNyBPY3QgMjAyNSwgYXQgOTo0MuKAr2FtLCBaaGVudGFvIEd1byB2aWEg
QjQgUmVsYXkgPGRldm51bGwremhlbnRhby5ndW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Pgo+Pj4gSW50cm9kdWNlIGluaXRpYWwgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMn
cyBuZXcgdmlkZW8gYWNjZWxlcmF0aW9uCj4+PiBoYXJkd2FyZSBhcmNoaXRlY3R1cmUsIGRlc2ln
bmVkIGZvciB2aWRlbyBzdHJlYW0gZGVjb2RpbmcuCj4+Pgo+Pj4gQ29tcGFyZWQgdG8gdGhlIGN1
cnJlbnQgQW1sb2dpYyB2aWRlbyBkZWNvZGVyIGhhcmR3YXJlIGFyY2hpdGVjdHVyZSwKPj4+IHRo
aXMgbmV3IGltcGxlbWVudGF0aW9uIGVsaW1pbmF0ZXMgdGhlIEVzcGFyc2VyIGhhcmR3YXJlIGNv
bXBvbmVudCwKPj4+IGVuYWJsaW5nIGRpcmVjdCB2YjIgYnVmZmVyIGlucHV0LiBUaGUgZHJpdmVy
IGlzIGRlc2lnbmVkIHRvIHN1cHBvcnQKPj4+IHRoZSBWNEwyIE0yTSBzdGF0ZWxlc3MgZGVjb2Rl
ciBBUEkuIFRoZSBpbml0aWFsIHBoYXNlIGluY2x1ZGVzIHN1cHBvcnQKPj4+IGZvciBILjI2NCBk
ZWNvZGluZyBvbiBBbWxvZ2ljIFM4MDVYMiBwbGF0Zm9ybS4KPj4gSXQgd291bGQgYmUgbmljZSBp
ZiB5b3UgY2FuIG91dGxpbmUgdGhlIGFkZGl0aW9uYWwgaGFyZHdhcmUgdGhlIGRyaXZlcgo+PiBw
bGFucyB0byBzdXBwb3J0IHNvIHJldmlld2VycyBoYXZlIHBlcnNwZWN0aXZlIG9uIHdoZXJlIHdl
IGFyZSBub3csIGFuZAo+PiB3aGF0IG1vcmUgYmUgY29taW5nPyAtIHRoZSBjb21tdW5pdHkgd291
bGQgYWxzbyBsaWtlIHRvIHVuZGVyc3RhbmQgaWYKPj4gdGhpcyBkcml2ZXIgd2lsbCBzdXBlcnNl
ZGUgdGhlIHN0YWxsZWQgZHJpdmVyIGF0dGVtcHQgaW4gc3RhZ2luZy4KPlllcywgd2Ugd2lsbCBm
b2xsb3cgQW1sb2dpYydzIG92ZXJhbGwgdXBzdHJlYW0gcHJvZ3Jlc3MgdG8gc3VwcG9ydCBtb3Jl
IAo+aGFyZHdhcmUKPnBsYXRmb3JtcyBpbiB0aGUgZnV0dXJlLiBUaGUgbmV4dCBzdGVwIHdpbGwg
YmUgYWRkaW5nIHN1cHBvcnQgZm9yIAo+QTMxMUQyKFQ3KSBwbGF0Zm9ybS4KPldlIGFsc28gcGxh
biB0byByZXBsYWNlIHRoZSBzdGFsbGVkIGRyaXZlciB3aXRoIHRoZSBuZXcgc3RhdGVsZXNzIAo+
ZGVjb2RlciBkcml2ZXIuCj5UaGUgbmV3IHN0YXRlbGVzcyBkcml2ZXIgaXMgZnVsbHkgY29tcGF0
aWJsZSB3aXRoIHRoZSBvbGQgRzEyL1NNMSAKPnBsYXRmb3JtcywgbWFraW5nCj50aGlzIHRyYW5z
aXRpb24gZmVhc2libGUuCgpUaGF0J3MgYXdlc29tZSBuZXdzISBCdXQgaG93IGFib3V0IHRoZSBv
bGRlciBwbGF0Zm9ybXMgc3VjaCBhcyBHWEJCCihTOTA1KSwgR1hMIChTOTA1WCkgYW5kIEFYRyAo
QTExM0QpPyBXaWxsIHN1cHBvcnQgZm9yIHRoZW0gYWxzbyBiZSBhZGRlZApvciBub3Q/CgpJIGFu
ZCBwcm9iYWJseSBtYW55IG90aGVyIHBlb3BsZSBzdGlsbCBoYXZlIGludGVyZXN0IG9uIHRoZXNl
IG9sZGVyClNvQ3MuLiB0aGV5IG90aGVyd2lzZSBydW4gTWFpbmxpbmUgbGludXggbW9zdGx5IGZp
bmUsIHNvIGlmIGEgd29ya2luZwp2ZGVjIGRyaXZlciBjb21lcyBhbG9uZyBmb3IgdGhlc2UsIHRo
YXQgd291bGQgYmUgZ3JlYXQhCgpCZXN0IHJlZ2FyZHMsCkZlcmFzcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
