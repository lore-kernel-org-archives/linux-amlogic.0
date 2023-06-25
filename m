Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D9EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2F66RFVF5rDYS9DxI4yqmP5z9bZ4t+eXpmydVKQ3nU=; b=MsiHkKV5judy9C
	mi3OKEMFO1M3zw5tBv59fNmEQDL3K1mgpz5ckN/9Ehq8hB71w5Q9wmjV6NvlNNSSfAZMyaRcYTse3
	vmeWvCroLNrwZ20fU6f4oh5wUQ9CijYd8/Tjv7dCGEwnMGlroS1Z+tqGMK7Hv+Ud2L9CplgSGfRom
	jd+9U8qWemIv5nwP0lhPQ7z7o8qOi3udTdRhXinIK66V7RcHbrvdjrWmc3i2WQFMXMuEQCCFF0+d5
	bXH1tK4oF/fi40nZENqwZGOUasTTmV5QfMWwsU/mMoagutHDv2xym0TfzPKrk3exD4YxGcTWRn4Sa
	ueZCj02tBHJ7agLrqX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDNm4-007tUk-2U;
	Sun, 25 Jun 2023 11:19:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDNm1-007tUD-2I;
	Sun, 25 Jun 2023 11:19:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF58B60B50;
	Sun, 25 Jun 2023 11:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E7C433C0;
	Sun, 25 Jun 2023 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687691956;
	bh=hEp1OjdaVN0PtEjp+ys81l46h98FvHb8YXuLZMvAFec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B1U/XSSgqdZh3b6hmHBCSzG7eQvXjXQZWn2sKoy913drlrelOsKYlf9/H/SmR/SK9
	 VLt/cvKz7KKeZyPj+H5eSXaPjmRqgHawPCZZArVj30ZhkjrL5JZEKDQgwjrd7oVvky
	 TIsVXzehcXOMA90m5+G9dAbrJjQrGyJuwIRJMER3N/KJbuPxe6kvohd+rAY0GRuGYV
	 PeJuT8Ppf/Ja8WiCpW+1mgVIXEjz5IN52ty1WPUFdwL5BfBPU5Vm6MdpU41MUBbkHz
	 4rfS48C9cqXogiiFlzqZ8tKXe0SAeiD0vClfU+T/KipzEEcFejZA5IkE5NNLd+IzDu
	 mvnbMoJiX75aQ==
Date: Sun, 25 Jun 2023 12:19:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <stark.georgy@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, George Stark
 <gnstark@sberdevices.ru>, lars@metafoo.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 andriy.shevchenko@linux.intel.com, nuno.sa@analog.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@sberdevices.ru
Subject: Re: [PATCH v2 6/6] meson saradc: support reading from channel7 mux
 inputs
Message-ID: <20230625121916.32578914@jic23-huawei>
In-Reply-To: <a0d74f3f-4208-d7e3-7eed-481a06b13308@gmail.com>
References: <20230623022334.791026-1-gnstark@sberdevices.ru>
	<20230623022334.791026-7-gnstark@sberdevices.ru>
	<CAFBinCBv993Xv_wk9fE-U0Tw2mzTB1z22Tj6x8Uy1rRw_dztng@mail.gmail.com>
	<a0d74f3f-4208-d7e3-7eed-481a06b13308@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_041917_830151_C67BE52A 
X-CRM114-Status: GOOD (  36.52  )
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

T24gU2F0LCAyNCBKdW4gMjAyMyAxODo1OTozMSArMDMwMApHZW9yZ2UgU3RhcmsgPHN0YXJrLmdl
b3JneUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIZWxsbyBNYXJ0aW4KPiAKPiBUaGFua3MgZm9yIHJl
dmlldwo+IAo+IE9uIDYvMjMvMjMgMDk6MTYsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4g
PiBIaSBHZW9yZ2UsCj4gPgo+ID4gT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNDoyM+KAr0FNIEdl
b3JnZSBTdGFyayA8Z25zdGFya0BzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gPiBbLi4uXSAgCj4g
Pj4gTWVzb24gc2FyYWRjIGNoYW5uZWwgNyBpcyBjb25uZWN0ZWQgdG8gbXV4ZXIgdGhhdCBjYW4g
c3dpdGNoIGNoYW5uZWwgIAo+ID4gSSB0aGluayB0aGF0IHRoaXMgc2hvdWxkIHJlYWQ6IC4uLiBp
cyBjb25uZWN0ZWQgdG8gYSBtdXggdGhhdCAuLi4KPiA+Cj4gPiBbLi4uXSAgCj4gPj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IGlpb19jaGFuX3NwZWMgbWVzb25fc2FyX2FkY19paW9fY2hhbm5lbHNb
XSA9IHsKPiA+PiBAQCAtMjQ1LDYgKzI4MCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19j
aGFuX3NwZWMgbWVzb25fc2FyX2FkY19paW9fY2hhbm5lbHNbXSA9IHsKPiA+PiAgICAgICAgICBN
RVNPTl9TQVJfQURDX0NIQU4oSU5ERVhfQ0hBTl82KSwKPiA+PiAgICAgICAgICBNRVNPTl9TQVJf
QURDX0NIQU4oSU5ERVhfQ0hBTl83KSwKPiA+PiAgICAgICAgICBJSU9fQ0hBTl9TT0ZUX1RJTUVT
VEFNUChJTkRFWF9DSEFOX1NPRlRfVElNRVNUQU1QKSwKPiA+PiArICAgICAgIE1FU09OX1NBUl9B
RENfTVVYKElOREVYX01VWF8wX1ZTUywgMCksCj4gPj4gKyAgICAgICBNRVNPTl9TQVJfQURDX01V
WChJTkRFWF9NVVhfMV9WRERfRElWNCwgMSksCj4gPj4gKyAgICAgICBNRVNPTl9TQVJfQURDX01V
WChJTkRFWF9NVVhfMl9WRERfRElWMiwgMiksCj4gPj4gKyAgICAgICBNRVNPTl9TQVJfQURDX01V
WChJTkRFWF9NVVhfM19WRERfTVVMM19ESVY0LCAzKSwKPiA+PiArICAgICAgIE1FU09OX1NBUl9B
RENfTVVYKElOREVYX01VWF80X1ZERCwgNCksCj4gPj4gICAgICAgICAgTUVTT05fU0FSX0FEQ19U
RU1QX0NIQU4oKSwgLyogbXVzdCBiZSB0aGUgbGFzdCBpdGVtICovICAKPiA+IEkgaGF2ZW4ndCBo
YWQgdGhlIGNoYW5jZSB0byBydW4gdGhlc2UgcGF0Y2hlcyB5ZXQgYnV0OiBJIHRoaW5rIHRoZXkK
PiA+IGFyZSBicmVha2luZyB0aGUgdGVtcGVyYXR1cmUgc2Vuc29yIHJlYWRpbmdzIG9uIE1lc29u
OC84Yi84bTIgYm9hcmRzLgo+ID4gU2VlIGFyY2gvYXJtL2Jvb3QvZHRzL21lc29uLmR0c2kgd2hl
cmUgdGhlIHRlbXBlcmF0dXJlIGNoYW5uZWwgaXMKPiA+IGJlaW5nIHJlZmVyZW5jZWQ6Cj4gPiAg
ICBpby1jaGFubmVscyA9IDwmc2FyYWRjIDg+Cj4gPgo+ID4gV2l0aCB0aGlzIHNlcmllcyAodGhp
cyBwYXRjaCBhbmQgSSB0aGluayBhbHNvIHBhdGNoIDMvNiAibWVzb24gc2FyYWRjOgo+ID4gdW5p
dGUgaWlvIGNoYW5uZWwgYXJyYXkgZGVmaW5pdGlvbnMiKSB0aGUgbnVtYmVyaW5nIG9mIHRoZSB0
ZW1wZXJhdHVyZQo+ID4gc2Vuc29yIGNoYW5uZWwgY2hhbmdlcy4KPiA+Cj4gPiBUbyBtYWtlIHRo
aW5ncyB3b3JzZTogaW4gdGhlb3J5IHdlIGNhbiB1c2UgbWVzb25fc2FyYWRjIHRvIHJlYWQgdGhl
Cj4gPiBTb0MgdGVtcGVyYXR1cmUgc2Vuc29yIG9uIEdYQkIsIEdYTCBhbmQgR1hNIGJvYXJkcyAo
cG9zc2libHkgb24gQVhHIGFzCj4gPiB3ZWxsIGJ1dCBJIGNhbid0IHJlY2FsbCBmcm9tIHRoZSB0
b3Agb2YgbXkgaGVhZCkgaW5zdGVhZCBvZiBnb2luZwo+ID4gdGhyb3VnaCBTQ1BJLgo+ID4gSSBo
YXZlIGV4cGVyaW1lbnRlZCB3aXRoIHRoaXMgaW4gdGhlIHBhc3QgYnV0IG5ldmVyIGdvdCBpdCB0
byB3b3JrLgo+ID4gRG9pbmcgc28gaW4gdGhlIGZ1dHVyZSBjb3VsZCBsZWFkIHRvIGFub3RoZXIg
Y2hhbm5lbCBpbmRleCBjaGFuZ2UsCj4gPiBkZXBlbmRpbmcgb24gaG93IHdlIGRlY2lkZSB0byBn
byBmb3J3YXJkIG5vdy4KPiA+Cj4gPiBUaGVyZSdzIHR3byB0aGF0IEkgY2FuIHRoaW5rIG9mOgo+
ID4gLSB1cGRhdGUgbWVzb24uZHRzaSB0byB1c2UgdGhlIG5ldyBjaGFubmVsIG51bWJlcmluZyAo
SSBkb24ndCBleHBlY3QKPiA+IG1hbnkgMzItYml0IFNvQyB1c2VycyBvdXQgdGhlcmUgdXNpbmcg
bmV3IGtlcm5lbCArIG9sZCAuZHRicywgYnV0IGl0J3MKPiA+IGltcG9zc2libGUgdG8gc2F5IGZv
ciBzdXJlKQo+ID4gLSBvciBrZWVwIHRoZSBkcml2ZXIgYmFja3dhcmRzIGNvbXBhdGlibGUgKHRo
YXQgaW52b2x2ZXMgcmUtYWRkaW5nIHRoZQo+ID4gY2hhbm5lbCB0YWJsZXMpCgpBZ3JlZWQuIFB1
dCB0aGUgdGFibGUgYmFjay4gIEl0IG1pZ2h0IG1ha2UgdGhlIGNvZGUgc2xpZ2h0bHkgbW9yZSBj
b21wbGV4CmJ1dCB3ZSBuZWVkIHRvIGF2b2lkIHNoaWZ0aW5nIGNoYW5uZWwgbnVtYmVycyBhcm91
bmQgd2hlcmUgcG9zc2libGUuCgpKb25hdGhhbgoKCj4gPgo+ID4gV2hhdCBkbyB5b3UgdGhpbms/
ICAKPiBBY3R1YWxseSB3ZSdkIGhhdmUgdG8gbWFrZSAyIHBhdGNoZXMgdG8gbWVzb24uZHRzaSwg
dGhlIGZpcnN0IGNoYW5nZSAKPiA4LT45LCB0aGFuIDkgLT4xNC4KPiBBbmQgaWYgdGhhdCBpbmRl
eCBleHBvc2VkIGV4dGVybmFsbHkgKEFCSSBsaWtlKSBJJ2Qgbm90IGNoYW5nZSBpdCAKPiB3aXRo
b3V0IGdvb2QgcmVhc29uIGF0IGFsbC4KPiBTbyBJIHRoaW5rIHRvIHJldHVybiB0byBkb3VibGUg
ZGVmaW5pdGlvbiBvZiBtZXNvbl9zYXJfYWRjX2lpb19jaGFubmVscyAKPiBhbmQga2VlcCB0aGUg
ZHJpdmVyIGJhY2t3YXJkcyBjb21wYXRpYmxlLgo+IAo+IEkndmUganVzdCByZWFsaXplZCBhbm90
aGVyIG1vbWVudCB3aXRoIGNoYW5uZWxzIGRlZmluZWQgYWZ0ZXIgCj4gTUVTT05fU0FSX0FEQ19U
RU1QX0NIQU4gaW4gY2hhbm5lbCBhcnJheS4KPiBJbiBkdHMgYnkgZGVmYXVsdCBjaGFubmVscyBh
cmUgcmVmZXJlbmNlZCBieSBjaGFubmVsIGFycmF5IGluZGV4IG5vdCAKPiBldmVuIGJ5IGNoYW5u
ZWwgbnVtYmVyLgo+IFNvIGNoYW5uZWwgZS5nIE1VWF8wX1ZTUyB3aWxsIGhhdmUgdGhlIHNhbWUg
bnVtYmVyIChkdWUgdG8gZW51bSBwYXRjaCkgCj4gYnV0IGRpZmZlcmVudCBpbmRleCBvbiBtZXNv
bjggYW5kIGd4YmIuCj4gQXMgYWx0ZXJuYXRpdmUgd2UgY2FuIGltcGxlbWVudCBmd25vZGVfeGxh
dGUgbWV0aG9kIGluIG1lc29uIGFkYyBkcml2ZXIgCj4gYW5kIHVzZSBjaGFubmVsIG51bWJlcnMg
aW4gZHRzCj4gKHByb2JhYmx5IG5vdCBpbiB0aGUgY3VycmVudCBwYXRjaHNldCkuCj4gCj4gQmVz
dCByZWdhcmRzLAo+IEdlb3JnZQo+IAo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IE1hcnRpbgo+
ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMgIAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
