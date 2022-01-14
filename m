Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE6C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 05:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXLIWSbkHsquVtqYky++Jrjw8dhls/SnVwqERvsFWGw=; b=ptvJz87EuxQxrD
	r04BrN9fGmocWJ92HT3aIiu4QJCfkNxdaOdlVmjLFTJagaq2KL5BQ+NghtkZp8n0owKb0+8wmFH47
	Z5SSeBgLEjjNuJNinbA/0ehkIRF4zA3huYv0d6Qc3/Yng3qqZxoemxFLSxodsWh+GkusTpomglMBc
	eqlcCnwfIqxSaiqfkPUx+v/JCGBqHx3MRRBf3FYlHcQj+l2xNqTlAbGz9qMlpe+T9aqURYIoJ2BhS
	XmUu2DlmYClnV6tbIb+MhhUzkj/IKXE2Ly1QQ1B8Y+vfQA3QtTA1B9q3O/iJ1wlGunwBkIQVn5Ue3
	Pk63ge0a/aDGGd7/Y4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8F8u-007mnm-Ng; Fri, 14 Jan 2022 05:28:52 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8F8s-007mmx-76
 for linux-amlogic@lists.infradead.org; Fri, 14 Jan 2022 05:28:51 +0000
Received: from [10.28.39.96] (10.28.39.96) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2176.2;
 Fri, 14 Jan 2022 13:28:46 +0800
Message-ID: <29172360-024b-c4d4-e330-b89edfa698e2@amlogic.com>
Date: Fri, 14 Jan 2022 13:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pwm: meson: external clock configuration for s4
From: Jiayi Zhou <Jiayi.Zhou@amlogic.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Lee Jones
 <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, <linux-amlogic@lists.infradead.org>
References: <20211223055833.23466-1-Jiayi.Zhou@amlogic.com>
 <CAFBinCCscyxiTq3-9n8Eq-m+avo19+14DiRke+wGKcRmSmyi4g@mail.gmail.com>
 <ee1b72e6-f18a-2dcc-cba9-6816e6fadc33@amlogic.com>
In-Reply-To: <ee1b72e6-f18a-2dcc-cba9-6816e6fadc33@amlogic.com>
X-Originating-IP: [10.28.39.96]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_212850_296671_08CA74B2 
X-CRM114-Status: GOOD (  27.42  )
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

CuWcqCAyMDIyLzEvMTMgMjA6MjQsIEppYXlpIFpob3Ug5YaZ6YGTOgo+Cj4KPiDlnKggMjAyMS8x
Mi8yNSAyOjI0LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIOWGmemBkzoKPj4gSGVsbG8sCj4+Cj4+IEkg
YW0gYWRkaW5nIG15IHRob3VnaHRzIGluIHRoaXMgZW1haWwgd2hpY2ggYXJlIGluIGFkZGl0aW9u
IHRvIFV3ZSdzIGNvbW1lbnRzLgo+Pgo+PiBQbGVhc2UgYWx3YXlzIENjIHRoZSBsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdCB3aGVuIHlvdSBhcmUgc2VuZGluZyBwYXRjaGVzLgo+PiBDdXJyZW50
bHkgdGhpcyBwYXRjaCBjYW5ub3QgYmUgZm91bmQgaW4gdGhlIG1haWxpbmcgbGlzdCBhcmNoaXZl
cywKPj4gcGF0Y2h3b3JrLCAuLi4KPiDCoMKgwqAgT0ssIEknbGwgY2MgdGhlIGxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0IHdoZW4gSSBzZW5kIHRoZSB2MiByZWxlYXNlLgo+PiBPbiBUaHUsIERl
YyAyMywgMjAyMSBhdCA2OjU4IEFNIEppYXlpIFpob3U8SmlheWkuWmhvdUBhbWxvZ2ljLmNvbT4g
IHdyb3RlOgo+Pj4gRnJvbTogImppYXlpLnpob3UiPGppYXlpLnpob3VAYW1sb2dpYy5jb20+Cj4+
Pgo+Pj4gRm9yIFBXTSBjb250cm9sbGVyIGluIHRoZSBNZXNvbi1TNCBTb0MsCj4+PiBQV00gbmVl
ZHMgdG8gb2J0YWluIGFuIGV4dGVybmFsIGNsb2NrIHNvdXJjZS4KPj4+IFRoaXMgcGF0Y2ggdHJp
ZXMgdG8gZGVzY3JpYmUgdGhlbSBpbiB0aGUgRFQgY29tcGF0aWJsZSBkYXRhLgo+PiBJIHRoaW5r
IHRoaXMgcGF0Y2ggZG9lcyBtb3JlIHRoYW4gd2hhdCBpcyBkZXNjcmliZWQgaGVyZS4KPj4gSXQg
YWRkcyBzdXBwb3J0IGZvciB0aGUgY29uc3RhbnQgaGlnaC9sb3cgb3V0cHV0LCB3aGljaCBpcyBh
IGZlYXR1cmUKPj4gd2hpY2ggSSB0aGluayBoYXMgYmVlbiBpbnRyb2R1Y2VkIG9uIHRoZSBHMTJB
IFNvQy4gSSBzdWdnZXN0IGhhdmluZyBhCj4+IHNlcGFyYXRlIHBhdGNoIGZvciB0aGlzIGFuZCBh
bHNvIGVuYWJsaW5nIGl0IG9uIHN1cHBvcnRlZCBTb0NzIChub3QKPj4ganVzdCB0aGUgUzQpLgo+
IMKgwqDCoCBUaGUgcmVsZXZhbnQgY29kZSBoYXMgYmVlbiByZW1vdmVkIGluIHRoZSB2MiB2ZXJz
aW9uLgo+PiBbLi4uXQo+Pj4gKyNkZWZpbmUgUFdNX0RJU0FCTEUgICAgICAgICAgICAwCj4+IEkg
ZG9uJ3Qgc2VlIHRoaXMgYmVpbmcgdXNlZCBhbnl3aGVyZSBzbyBJIHRoaW5rIGl0IGNhbiBiZSBk
cm9wcGVkCj4gwqDCoMKgIGNvZGUgaGFzIGJlZW4gcmVtb3ZlZCBpbiB2MiB2ZXJpc29uLgo+PiBb
Li4uXQo+Pj4gKyAgICAgICAvKgo+Pj4gKyAgICAgICAgKiBkdXR5X2N5Y2xlIGVxdWFsIDAlIGFu
ZCAxMDAlLGNvbnN0YW50IHNob3VsZCBiZSBlbmFibGVkLAo+Pj4gKyAgICAgICAgKiBoaWdoIGFu
ZCBsb3cgY291bnQgd2lsbCBub3QgaW5jZWFzZSBvbmU7Cj4+IHR5cG86IGluY2Vhc2UgLT4gaW5j
cmVhc2UKPiDCoMKgwqAgSXQgaGFzIGJlZW4gbW9kaWZpZWQgaW4gdjIgdmVyc2lvbi4KPj4gWy4u
Ll0KPj4+ICsgICAgICAgaWYgKG1lc29uLT5kYXRhLT5leHRlcm5fY2xrKSB7Cj4+PiArICAgICAg
ICAgICAgICAgc2V0X2NsayA9IGNsa19nZXRfcmF0ZShjaGFubmVsLT5jbGspOwo+Pj4gKyAgICAg
ICAgICAgICAgIGlmIChzZXRfY2xrID09IDApCj4+PiArICAgICAgICAgICAgICAgICAgICAgICBk
ZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgImludmFsaWQgc291cmNlIGNsb2NrIGZyZXF1ZW5jeVxu
Iik7Cj4+PiArICAgICAgICAgICAgICAgc2V0X2NsayAvPSAoY2hhbm5lbC0+cHJlX2RpdiArIDEp
Owo+Pj4gKyAgICAgICAgICAgICAgIGVyciA9IGNsa19zZXRfcmF0ZShjaGFubmVsLT5jbGssIHNl
dF9jbGspOwo+Pj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgIiVzOiBlcnJvciBpbiBzZXR0aW5nIHB3
bSByYXRlIVxuIiwgX19mdW5jX18pOwo+Pj4gKyAgICAgICB9Cj4+PiArCj4+PiAgICAgICAgICB2
YWx1ZSA9IHJlYWRsKG1lc29uLT5iYXNlICsgUkVHX01JU0NfQUIpOwo+Pj4gICAgICAgICAgdmFs
dWUgJj0gfihNSVNDX0NMS19ESVZfTUFTSyA8PCBjaGFubmVsX2RhdGEtPmNsa19kaXZfc2hpZnQp
Owo+Pj4gICAgICAgICAgdmFsdWUgfD0gY2hhbm5lbC0+cHJlX2RpdiA8PCBjaGFubmVsX2RhdGEt
PmNsa19kaXZfc2hpZnQ7Cj4+IFdoeSBkb2VzIHRoaXMgbmV3IGNvbnRyb2xsZXIgdmVyc2lvbiBy
ZXF1aXJlIGNsa19zZXRfcmF0ZSB3aXRoIGEgcmF0ZQo+PiB0aGF0J3MgY2FsY3VsYXRlZCBiYXNl
ZCBvbiB0aGUgcHJlLWRpdmlkZXIgYW5kIHRoZW4gYWxzbyBjb25maWd1cmluZwo+PiB0aGUgcHJl
LWRpdmlkZXIgaW4gdGhlIE1JU0NfQUIgcmVnaXN0ZXI/Cj4+IFRoaXMgc2VlbXMgb2RkLCBjYW4n
dCB3ZSB1c2Ugb25seSBvbmUgb2YgdGhlbSAoZWl0aGVyIGNsa19zZXRfcmF0ZSBvcgo+PiBzZXR0
aW5nIE1JU0NfQUIpPwo+Pgo+PiBBbHNvIGlmIGNsa19zZXRfcmF0ZSBpcyB0aGUgd2F5IHRvIGdv
IGhlcmUgSSBzdWdnZXN0IHJlZmFjdG9yaW5nIHRoZQo+PiBleGlzdGluZyBjb2RlIHNvIHRoZSBw
cmUtZGl2aWRlciBpcyBhIGNsb2NrIGFzIHdlbGwgc28gd2UgY2FuIHVzZQo+PiBjbGtfc2V0X3Jh
dGUgZm9yIGJvdGgsIHRoZSAib2xkIiBhbmQgIm5ldyIgSVAgdmVyc2lvbi4KPgo+IMKgVGhpcyBw
YXJ0IG9mIHRoZSBjb2RlIHdhcyByZWZhY3RvcmVkIGluIHRoZSB2MiB2ZXJzaW9uLCB1c2luZyAK
PiBjbGtfc2V0X3JhdGUgdG8KPgo+IMKgZGlmZmVyZW50aWF0ZSB0aGUgIm9sZCIgYW5kICJuZXci
IElQIHZlcnNpb25zLgo+Cj4+IFsuLi5dCj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9w
d21fZGF0YSBwd21fbWVzb25fZGF0YSA9IHsKPj4+ICsgICAgICAgLmV4dGVybl9jbGsgPSB0cnVl
LAo+Pj4gICB9Owo+PiBbLi4uXQo+Pj4gK3N0YXRpYyBpbnQgbWVzb25fcHdtX3YyX2luaXRfY2hh
bm5lbHMoc3RydWN0IG1lc29uX3B3bSAqbWVzb24pCj4+PiArewo+Pj4gKyAgICAgICBzdHJ1Y3Qg
bWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWxzID0gbWVzb24tPmNoYW5uZWxzOwo+Pj4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtZXNvbi0+Y2hpcC5kZXY7Cj4+PiArICAgICAgIHVuc2ln
bmVkIGludCBpOwo+Pj4gKyAgICAgICBjaGFyIG5hbWVbMjU1XTsKPj4+ICsKPj4+ICsgICAgICAg
Zm9yIChpID0gMDsgaSA8IChtZXNvbi0+Y2hpcC5ucHdtIC8gMik7IGkrKykgewo+Pj4gKyAgICAg
ICAgICAgICAgIHNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgImNsa2luJXUiLCBpKTsKPj4+
ICsgICAgICAgICAgICAgICAoY2hhbm5lbHMgKyBpKS0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwg
bmFtZSk7Cj4+PiArICAgICAgICAgICAgICAgaWYgKElTX0VSUigoY2hhbm5lbHMgKyBpKS0+Y2xr
KSkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihtZXNvbi0+Y2hpcC5kZXYs
ICJjYW4ndCBnZXQgZGV2aWNlIGNsb2NrXG4iKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKChjaGFubmVscyArIGkpLT5jbGspOwo+Pj4gKyAgICAgICAgICAgICAg
IH0KPj4+ICsgICAgICAgICAgICAgICAoY2hhbm5lbHMgKyBpICsgMiktPmNsayA9IChjaGFubmVs
cyArIGkpLT5jbGs7Cj4+PiArICAgICAgIH0KPj4gSSB0aGluayB0aGlzIGlzIHdob2xlIGZ1bmN0
aW9uIGlzIGJyb2tlbi4KPj4gVGhlIHZlbmRvciBkcml2ZXIgdXNlcyBmb3VyIGNoYW5uZWxzIHBl
ciBQV00gY29udHJvbGxlciBvbiBuZXdlciBTb0NzLgo+PiBJbiB0aGUgbWFpbmxpbmUgZHJpdmVy
IHdlIG9ubHkgc3VwcG9ydCB0d28gUFdNIGNoYW5uZWxzIHBlciBjb250cm9sbGVyLgo+Pgo+PiBO
b3cgdGhlIHdob2xlIGxvb3Agc3RhcnRzIHdpdGggbnB3bSAvIDIgd2hpY2ggaXMgYWx3YXlzIDEg
aW4gdGhlCj4+IG1haW5saW5lIGRyaXZlci4KPj4gVGhpcyBpcyB0aGUgZmlyc3QgcHJvYmxlbTog
dGhpcyB3b3VsZCBuZXZlciBpbml0aWFsaXplIHRoZSBzZWNvbmQgUFdNLgo+PiBUaGUgc2Vjb25k
IHByb2JsZW0gaXMgdGhhdCAiY2hhbm5lbHMgKyBpICsgMiIgd291bGQgYWNjZXNzIGNoYW5uZWxz
WzAKPj4gKyAyXSB3aGljaCBpcyBvdXQgb2YgYm91bmRzIGZvciB0aGlzIGFycmF5ICh0aGF0IGFy
cmF5IG9ubHkgaG9sZHMgdHdvCj4+IHZhbHVlcyBzbyBvbmx5IGluZGV4IDAgYW5kIDEgYXJlIHZh
bGlkKS4uCj4KPiDCoFRoaXMgcGFydCBvZiB0aGUgY29kZSBoYXMgYmVlbiBmaXhlZCBpbiB0aGUg
djIgdmVyc2lvbi4KPgo+PiBCZXN0IHJlZ2FyZHMsCj4+IE1hcnRpbgo+Pgo+PiAuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
