Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE805EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44D1w+5jYcSyZv3ISftAKvbMW0iXylps/FE+DNOYGRY=; b=DE1OsvpMaEgGX5
	uMIRjmd1/4W2Pzpl2ZrJrN83vnZpY6cwqAYdXQ5Cn/F6pX08/3iNZmAMqCSLWo5nA/8ur8wotItA+
	MxmvuX5/aSfRWBOlBqUlE2uxFV5CKf2UxqKBDLf30dO6lgFjeVNtMn7Oqwjh8iIAXN9M0OL2MZyoH
	u2wWgDXW/PX3R/bpVxhFGbaK7Yl42oIv+fmA7GQU01evEwesic+DldgdHt8Yd+bRnUAhk9buHl8ap
	2La3BfESNvNT7POb6ytemGxWbJhzY0DqBc15JYmzruILoA94/EX4skqCttQNHhOxtKScmBEEJeuDv
	Szkb3i4GlORCD2u0/CYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxV0-00F8d6-2R;
	Wed, 05 Jul 2023 08:04:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxUx-00F8bT-0m;
	Wed, 05 Jul 2023 08:04:29 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QwsYb1fRBz67L8m;
	Wed,  5 Jul 2023 16:01:23 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 09:04:17 +0100
Date: Wed, 5 Jul 2023 16:04:13 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: George Stark <gnstark@sberdevices.ru>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: Re: [PATCH v3 5/5] meson saradc: support reading from channel 7 mux
 inputs
Message-ID: <20230705160413.000062e7@Huawei.com>
In-Reply-To: <6ee38b3a-8e2f-15d6-f7bd-06ef567d2b68@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
	<20230627224017.1724097-6-gnstark@sberdevices.ru>
	<20230702172116.00006f33@Huawei.com>
	<CAFBinCCLt-o_QX0izmtzs8MA=ETMAhEib3KDr-6Z66n__GVkyA@mail.gmail.com>
	<6ee38b3a-8e2f-15d6-f7bd-06ef567d2b68@sberdevices.ru>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_010427_423382_359CD3A9 
X-CRM114-Status: GOOD (  20.66  )
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

T24gVHVlLCA0IEp1bCAyMDIzIDA0OjU5OjUxICswMzAwCkdlb3JnZSBTdGFyayA8Z25zdGFya0Bz
YmVyZGV2aWNlcy5ydT4gd3JvdGU6Cgo+IEhlbGxvIE1hcnRpbiwgSm9uYXRoYW4KPiAKPiBPbiA3
LzMvMjMgMjI6MzksIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiBIaSBKb25hdGhhbiwK
PiA+Cj4gPiBPbiBTdW4sIEp1bCAyLCAyMDIzIGF0IDExOjIx4oCvQU0gSm9uYXRoYW4gQ2FtZXJv
bgo+ID4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gIHdyb3RlOgo+ID4gWy4uLl0gIAo+
ID4+PiBAQCAtMjM1LDYgKzI0OSwyNyBAQCBlbnVtIG1lc29uX3Nhcl9hZGNfY2hhbm5lbF9pbmRl
eCB7Cj4gPj4+ICAgICAgICBOVU1fQ0hBTl83LAo+ID4+PiAgICAgICAgTlVNX0NIQU5fVEVNUCwK
PiA+Pj4gICAgICAgIE5VTV9DSEFOX1NPRlRfVElNRVNUQU1QLCAgCj4gPj4gU2lsbHkgcXVlc3Rp
b24uLi4gV2h5IGRvZXMgdGhpcyBkZXZpY2UgaGF2ZSB0aW1lc3RhbXAgY2hhbm5lbHM/Cj4gPj4g
SXQgaGFzIG5vIGJ1ZmZlciBzdXBwb3J0IHNvIHRoZXkgZG9uJ3QgJ2RvIGFueXRoaW5nJy4KPiA+
PiBJZiBpdCBoYWQgdGhlbiBwdXR0aW5nIG90aGVyIGNoYW5uZWxzIGFmdGVyIHRoYXQgbWlnaHQg
aGF2ZSBicm9rZW4KPiA+PiB0aGluZ3MgaWYgbm90IGRvbmUgdmVyeSBjYXJlZnVsbHkgKGhlbmNl
IEkgd2VudCBsb29raW5nKSAgCj4gPiBUaGlzIHF1ZXN0aW9uIGlzIHByb2JhYmx5IGZvciBtZSAo
bm90IEdlb3JnZSkuCj4gPiBUaGUgYW5zd2VyIGlzIHNpbXBsZTogd2hlbiBJIHdyb3RlIHRoZSBN
ZXNvbiBTQVIgQURDIGRyaXZlciBJIGxvb2tlZAo+ID4gYXQgdmFyaW91cyBvdGhlciBkcml2ZXJz
IChidXQgY2FuJ3QgcmVjYWxsIHdoaWNoIG9uZXMgZXhhY3RseSkuIE9uZSBvZgo+ID4gdGhlbSBw
cm9iYWJseSB1c2VkIGEgc29mdCB0aW1lc3RhbXAgY2hhbm5lbCBzbyBJIGFsc28gYWRkZWQgdGhh
dCB0bwo+ID4gbWVzb25fc2FyYWRjLiBTaW5jZSAiaXQgZGlkbid0IGJyZWFrIGFueXRoaW5nIiBJ
IHRob3VnaHQgaXQgd291bGQgYmUKPiA+IGZpbmUuCj4gPgo+ID4gTmV3ZXIgU0FSIEFEQyBJUCBi
bG9ja3MgaGF2ZSBidWZmZXIgc3VwcG9ydCwgYnV0IHRoYXQncyBub3QKPiA+IGltcGxlbWVudGVk
IGluIHRoZSBkcml2ZXIgKHlldCkuCj4gPiBTbyBpZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3Rs
eSB3ZSBjYW4gZHJvcCB0aGUgc29mdCB0aW1lc3RhbXAKPiA+IGNoYW5uZWwgKHdpdGggYSBkZWRp
Y2F0ZWQgcGF0Y2ggaW4gdGhpcyBzZXJpZXMpPyAgCnllcy4gSSB0aGluayBkcm9wcGluZyBpdCB3
b3VsZCBiZSBzZW5zaWJsZS4KPiAKPiBPbmUgc2hvcnQgY29tbWVudDogbmV3bHktYWRkZWQgY2hh
bm5lbHMgcHJvYmFibHkgd29uJ3Qgc3VwcG9ydCBidWZmZXJpbmcgCj4gYmVjYXVzZSBwaHlzaWNh
bGx5IHRoZXkgYWxsIGFyZSByZWFkIHRocnUgY2hhbm5lbDcuIFdlJ2xsIGJlIGFibGUgdG8gYWRk
IAo+IGJ1ZmZlcmluZyBvbmx5IHRvIGJhc2Ugb2xkIGNoYW5uZWxzIGFuZCB0aGV5IGFyZSBzdGls
bCBkZWZpbmVkIGJlZm9yZQo+IENIQU5fU09GVF9USU1FU1RBTVAgKGlmIHRoaXMgaXMgeW91J3Jl
IHdhcnkgYWJvdXQpLgo+IAoKVGhhdCBpcyBhIGNvbW1vbiBzaXR1YXRpb24uICBJZiBhZGRpbmcg
YnVmZmVyaW5nIHN1cHBvcnQgYW55IGNoYW5uZWxzIHRoYXQKYXJlIG5vdCBzdWl0YWJsZSBmb3Ig
YnVmZmVyZWQgYWNjZXNzIGFyZSBnaXZlbiBzY2FuX2luZGV4ID0gLTEgYXQgd2hpY2gKcG9pbnQg
dGhleSBhcmUgc3lzZnMgLyBwb2xsZWQgaW4ga2VybmVsIGFjY2VzcyBvbmx5LgoKSm9uYXRoYW4K
Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBNYXJ0aW4gIAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
