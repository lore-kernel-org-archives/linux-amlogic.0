Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B9BC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 15:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE1720873
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 15:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yj3q/h+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE1720873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89v/SeFJ3jgR3cVOp26fz/hd/yiijQGyAMvh9KQnlLs=; b=Yj3q/h+QV/b9mG
	Mu5UVqAYwgWpM3qP9o48PjjmCU/8EIaxDJSMJtwUAt/qVMulDiGsAKUXgs9RCgfu3cEip7lDsMmq7
	LzvH+4+olrr6eB5m2UBm0pP6u7HyiTsb9E8NzN9AKKICasnkmD9Dj1xvWKO1ej26ZeJjRRrP4x+ER
	GAG6/+8Sto23mGKxvDaLfiP+HmzM+277s15nkqMF7xIGSunhCzSXnDNTPiRpky0jt2QtyulADGLGm
	IVKz3sgrKIrRLHBYfEzFMcsSDxPPj32p1hT0Mz2Rtq1Mx/eTJXWaEe7TRoyae/xDqFrcZl2ghgBN9
	mGkXdBF1rnLKlAV54abQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGPUf-0005g3-U3; Fri, 04 Oct 2019 15:27:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGPUc-0005fL-6W
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 15:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345CB1597;
 Fri,  4 Oct 2019 08:27:41 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E854B3F68E;
 Fri,  4 Oct 2019 08:27:39 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: Neil Armstrong <narmstrong@baylibre.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
 <7339b7a1-2d1c-4379-89a0-daf8b28d81c8@baylibre.com>
 <94096e4e-0f60-79d1-69b5-c7c3e59a4d78@amd.com>
 <f44204b4-ce5c-b26e-580d-5bb21314be1f@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8c4ecad8-c2e2-eec1-9132-48e126577baa@arm.com>
Date: Fri, 4 Oct 2019 16:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f44204b4-ce5c-b26e-580d-5bb21314be1f@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_082742_330647_96F21624 
X-CRM114-Status: GOOD (  21.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDQvMTAvMjAxOSAxNjowMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMDQvMTAvMjAx
OSAxNjo1MywgR3JvZHpvdnNreSwgQW5kcmV5IHdyb3RlOgo+Pgo+PiBPbiAxMC8zLzE5IDQ6MzQg
QU0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGkgQW5kcmV5LAo+Pj4KPj4+IExlIDAyLzEw
LzIwMTkgw6AgMTY6NDAsIEdyb2R6b3Zza3ksIEFuZHJleSBhIMOpY3JpdCA6Cj4+Pj4gT24gOS8z
MC8xOSAxMDo1MiBBTSwgSGlsbGYgRGFudG9uIHdyb3RlOgo+Pj4+PiBPbiBNb24sIDMwIFNlcCAy
MDE5IDExOjE3OjQ1ICswMjAwIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+Pj4gRGlkIGEgbmV3
IHJ1biBmcm9tIDUuMzoKPj4+Pj4+Cj4+Pj4+PiBbICAgMzUuOTcxOTcyXSBDYWxsIHRyYWNlOgo+
Pj4+Pj4gWyAgIDM1Ljk3NDM5MV0gIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjAK
Pj4+Pj4+IAkJCWZmZmYwMDAwMTA2NjdmMzgJRkZGRjAwMDAxMDY2N0Y5NAo+Pj4+Pj4gCQkJZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6MzM1Cj4+Pj4+Pgo+Pj4+Pj4gVGhl
IGNyYXNoaW5nIGxpbmUgaXMgOgo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+
Pj4+Pj4KPj4+Pj4+IERvZXNuJ3Qgc2VlbSByZWxhdGVkIHRvIGd1aWx0eSBqb2IuCj4+Pj4+IEJh
aWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8gbG9uZ2VyIGZyZXNoLgo+Pj4+Pgo+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+PiBAQCAtMzMzLDYgKzMzMywxMCBA
QCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1Y3QgZHJtCj4+Pj4+ICAgIAo+Pj4+
PiAgICAJCQlzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4gICAgCQkJbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKGVudGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+Pj4+ICsJCQkJ
aWYgKCFzbXBfbG9hZF9hY3F1aXJlKCZiYWQtPnNfZmVuY2UpKSB7Cj4+Pj4+ICsJCQkJCXNwaW5f
dW5sb2NrKCZycS0+bG9jayk7Cj4+Pj4+ICsJCQkJCXJldHVybjsKPj4+Pj4gKwkJCQl9Cj4+Pj4+
ICAgIAkJCQlpZiAoYmFkLT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4+PiAgICAJ
CQkJICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+Pj4+PiAgICAJCQkJCWlmIChhdG9taWNf
cmVhZCgmYmFkLT5rYXJtYSkgPgo+Pj4+PiBAQCAtNTQzLDcgKzU0Nyw3IEBAIEVYUE9SVF9TWU1C
T0woZHJtX3NjaGVkX2pvYl9pbml0KTsKPj4+Pj4gICAgdm9pZCBkcm1fc2NoZWRfam9iX2NsZWFu
dXAoc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYikKPj4+Pj4gICAgewo+Pj4+PiAgICAJZG1hX2Zl
bmNlX3B1dCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4+Pj4+IC0Jam9iLT5zX2ZlbmNlID0g
TlVMTDsKPj4+Pj4gKwlzbXBfc3RvcmVfcmVsZWFzZSgmam9iLT5zX2ZlbmNlLCAwKTsKPj4+Pj4g
ICAgfQo+Pj4+PiAgICBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9qb2JfY2xlYW51cCk7Cj4+PiBU
aGlzIGZpeGVkIHRoZSBwcm9ibGVtIG9uIHRoZSAxMCBDSSBydW5zLgo+Pj4KPj4+IE5laWwKPj4K
Pj4KPj4gVGhlc2UgYXJlIGdvb2QgbmV3cyBidXQgSSBzdGlsbCBmYWlsIHRvIHNlZSBob3cgdGhp
cyBmaXhlcyB0aGUgcHJvYmxlbSAtIAo+PiBIaWxsZiwgZG8geW91IG1pbmQgZXhwbGFpbmluZyBo
b3cgeW91IGNhbWUgdXAgd2l0aCB0aGlzIHBhcnRpY3VsYXIgZml4IC0gCj4+IHdoYXQgd2FzIHRo
ZSBidWcgeW91IHNhdyA/Cj4gCj4gQXMgU3RldmVuIGV4cGxhaW5lZCwgc2VlbXMgdGhlIHNhbWUg
am9iIHdhcyBzdWJtaXR0ZWQgb24gYm90aCBIVyBzbG90cywKPiBhbmQgdGhlbiB3aGVuIHRpbWVv
dXQgb2NjdXJzIGVhY2ggdGhyZWFkIGNhbGxzIHBhbmZyb3N0X2pvYl90aW1lZG91dAo+IHdoaWNo
IGxlYWRzIHRvIGRybV9zY2hlZF9zdG9wKCkgb24gdGhlIGZpcnN0IGNhbGwgYW5kIG9uIHRoZQo+
IHNlY29uZCBjYWxsIHRoZSBqb2Igd2FzIGFscmVhZHkgZnJlZWQuCj4gCj4gU3RldmVuIHByb3Bv
c2VkIGEgd29ya2luZyBmaXgsIGFuZCB0aGlzIG9uZSBkb2VzIHRoZSBzYW1lIGJ1dCBvbgo+IHRo
ZSBkcm1fc2NoZWQgc2lkZS4gVGhpcyBvbmUgbG9va3MgY2xlYW5lciwgYnV0IHBhbmZyb3N0IHNo
b3VsZAo+IG5vdCBjYWxsIGRybV9zY2hlZF9zdG9wKCkgdHdpY2UgZm9yIHRoZSBzYW1lIGpvYi4K
CkknbSBub3Qgc3VyZSB0aGF0IEhpbGxmJ3MgZml4IGlzIHN1ZmZpY2llbnQuIEluIHBhcnRpY3Vs
YXIgaW4KZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKCkgSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0
aGUgc21wX2xvYWRfYWNxdWlyZSgpCmNhbGwgcHJldmVudHMgYmFkLT5zX2ZlbmNlIGJlY29taW5n
IE5VTEwgaW1tZWRpYXRlbHkgYWZ0ZXJ3YXJkcyAoYnV0CmFkbWl0dGVkbHkgdGhlIHdpbmRvdyBp
cyBtdWNoIHNtYWxsZXIpLiBCdXQgcmVhbGx5IHRoaXMgaXMganVzdCBhClBhbmZyb3N0IGJ1ZyAo
Y2FsbGluZyBkcm1fc2NoZWRfc3RvcCgpIHR3aWNlIG9uIHRoZSBzYW1lIGpvYikuCgpUaGUgcGFy
dCBvZiBteSBjaGFuZ2UgdGhhdCBJJ2Qgd2VsY29tZSBmZWVkYmFjayBvbiBpcyBjaGFuZ2luZwpj
YW5jZWxfZGVsYXllZF93b3JrKCkgdG8gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCkgaW4gZHJt
X3NjaGVkX3N0b3AoKQp3aGVuIGNhbGxlZCBvbiBkaWZmZXJlbnQgc2NoZWR1bGVyIHRvIHRoZSBi
YWQgam9iLiBJdCdzIG5vdCBjbGVhciB0byBtZQpleGFjdGx5IHdoYXQgdGhlIHNlbWFudGljcyBv
ZiB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlLCBhbmQgSSBoYXZlbid0CnRlc3RlZCB0aGUgZWZmZWN0
IG9mIHRoZSBjaGFuZ2Ugb24gZHJpdmVycyBvdGhlciB0aGFuIFBhbmZyb3N0LgoKU3RldmUKCj4g
TmVpbAo+IAo+Pgo+PiBBbmRyZXkKPj4KPj4+Cj4+Pj4gRG9lcyB0aGlzIGNoYW5nZSBoZWxwIHRo
ZSBwcm9ibGVtID8gTm90ZSB0aGF0IGRybV9zY2hlZF9qb2JfY2xlYW51cCBpcwo+Pj4+IGNhbGxl
ZCBmcm9tIHNjaGVkdWxlciB0aHJlYWQgd2hpY2ggaXMgc3RvcHBlZCBhdCBhbGwgdGltZXMgd2hl
biB3b3JrX3Rkcgo+Pj4+IHRocmVhZCBpcyBydW5uaW5nIGFuZCBhbnl3YXkgdGhlICdiYWQnIGpv
YiBpcyBzdGlsbCBpbiB0aGUKPj4+PiByaW5nX21pcnJvcl9saXN0IHdoaWxlIGl0J3MgYmVpbmcg
YWNjZXNzZWQgZnJvbQo+Pj4+IGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSBzbyBJIGRvbid0IHRo
aW5rIGRybV9zY2hlZF9qb2JfY2xlYW51cCBjYW4gYmUKPj4+PiBjYWxsZWQgZm9yIGl0IEJFRk9S
RSBvciB3aGlsZSBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEgaXMgZXhlY3V0ZWQuCj4+Pj4KPj4+
PiBBbmRyZXkKPj4+Pgo+Pj4+Cj4+Pj4+ICAgIAo+Pj4+PiAtLQo+Pj4+Pgo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
