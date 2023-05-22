Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38373C77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 May 2023 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7RcH25OTu3d/vFvUHj1i3PyFqDBdyTQUS9kOX1Oh04=; b=Cxjy6UPtRd9i8/
	EBjpHYUtNl7TpM3BMmeD7BAemVvOaoPOBqtYO3JS1dB+OgIyrufznZVsPczWiGwH3DpKTv063NMd+
	mEs3Qnmn7OrETSUort2xbUQBaCLeQuppzX051+P/K0/y1EvCTI/u/mpkjW3hSsoO4qfT6VLeicjJC
	QVjeNBaUVVF0M4j6Y0dZtwZbFFKMH/HIVNs71DhMH+niuAvcgZDLOO0l4R+dSV7GQESu0w28EN6Lw
	R437yN9Tv9iPFWE0UeoXmLN1sN7HrRW7x7k9B46xLTdb0fJCCAawcV3hXv36+hk/KFbMz5xEkwXtl
	mJoBuX+C2CfL9ij9IfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q15e8-006g9u-0t;
	Mon, 22 May 2023 13:32:20 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q15e4-006g8y-1S;
	Mon, 22 May 2023 13:32:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8BF6B5FD53;
	Mon, 22 May 2023 16:32:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684762333;
	bh=6u9V8vHtTafBR0YnVPjYmlnDi14L5422DGaJYz+Dxq8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=NmIgAjKRuI5WAoj2t1m+b4UA9fcDT9PtSDg76v2enOK5vghDOPI/uzUVntbCerZyv
	 FvJE/fokfX2PP7bRgR6VqqnI8xbxgR4MkJl34imEQYv1sbzqiqPzdPF0wmDFTrpuMJ
	 zo1qxQ8KqDqkbOyceIP3SKiyJbh4f1Z1CM3jlIJOVMv1ufPTqqird9raJPgFOAU8+N
	 x/NUEkzEUdfOszk3c1ZdCZQmadT44YBTdjxJNh3PiXU+EtTn7zD9hbdpbVSpuVI2du
	 rgeVrNvpM/wPxUSt95Cg3Aklp+V9nqbkBtN0SqscGKpbLPVZCNHLNP/Rwm1/crFXlO
	 Gpuyw3RsqrIJg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 22 May 2023 16:32:13 +0300 (MSK)
Date: Mon, 22 May 2023 16:32:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v15 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Message-ID: <20230522133212.fcxgsml4hmvj65bb@CAB-WSD-L081021>
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-7-ddrokosov@sberdevices.ru>
 <CAFBinCBs7-9CvfQLxLoG5=FjmSK+S5eGsLXOAyQN9kNOg2q-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBs7-9CvfQLxLoG5=FjmSK+S5eGsLXOAyQN9kNOg2q-2g@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/22 08:14:00 #21365129
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_063216_854725_73914BD2 
X-CRM114-Status: GOOD (  33.08  )
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

SGVsbG8gTWFydGluLAoKVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSByZXZpZXcsIEkgcmVhbGx5
IGFwcHJlY2lhdGUgaXQhClBsZWFzZSBmaW5kIG15IGNvbW1lbnRzIGJlbG93LgoKT24gRnJpLCBN
YXkgMTksIDIwMjMgYXQgMTE6MDM6NTRQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBIaSBEbWl0cnksCj4gCj4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzozM+KAr1BNIERt
aXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+IFsuLi5dCj4g
PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHN5c19iX3NlbCA9IHsKPiA+ICsgICAgICAgLmRh
dGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX211eF9kYXRhKXsKPiA+ICsgICAgICAgICAgICAgICAu
b2Zmc2V0ID0gU1lTX0NMS19DVFJMMCwKPiA+ICsgICAgICAgICAgICAgICAubWFzayA9IDB4NywK
PiA+ICsgICAgICAgICAgICAgICAuc2hpZnQgPSAyNiwKPiA+ICsgICAgICAgICAgICAgICAudGFi
bGUgPSBtdXhfdGFibGVfc3lzLAo+ID4gKyAgICAgICB9LAo+ID4gKyAgICAgICAuaHcuaW5pdCA9
ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewo+ID4gKyAgICAgICAgICAgICAgIC5uYW1lID0gInN5
c19iX3NlbCIsCj4gPiArICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9yb19v
cHMsCj4gdGhlIHN5c18qX3NlbCBtdXhlcyBhbmQgc3lzXypfZ2F0ZSBhcmUgX3JvLi4uCj4gCj4g
PiArICAgICAgICAgICAgICAgLnBhcmVudF9kYXRhID0gc3lzX3BhcmVudHMsCj4gPiArICAgICAg
ICAgICAgICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShzeXNfcGFyZW50cyksCj4gPiArICAg
ICAgIH0sCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgc3lzX2Jf
ZGl2ID0gewo+ID4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZGl2X2RhdGEp
ewo+ID4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBTWVNfQ0xLX0NUUkwwLAo+ID4gKyAgICAg
ICAgICAgICAgIC5zaGlmdCA9IDE2LAo+ID4gKyAgICAgICAgICAgICAgIC53aWR0aCA9IDEwLAo+
ID4gKyAgICAgICB9LAo+ID4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2Rh
dGEpewo+ID4gKyAgICAgICAgICAgICAgIC5uYW1lID0gInN5c19iX2RpdiIsCj4gPiArICAgICAg
ICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX2RpdmlkZXJfb3BzLAo+IC4uLmJ1dCB0aGUgc3lz
XypfZGl2IGFyZW4ndAo+IElzIHRoaXMgb24gcHVycG9zZT8gSWYgaXQgaXM6IHdoeSBjYW4gdGhl
IGRpdmlkZXIgYmUgY2hhbmdlZCBhdAo+IHJ1bnRpbWUgYnV0IHRoZSBtdXggY2FuJ3Q/Cj4gCgpB
aCwgdGhhdCdzIGEgZ29vZCBjYXRjaC4gU2luY2UgdGhlIHN5c3RlbSBjbG9jayBpcyBzZXQgdXAg
YnkgdGhlIEJvb3RST00KY29kZSwgYWxsIHN5c18qIGRpdmlkZXJzIGFuZCBnYXRlcyBzaG91bGQg
YmUgcmVhZC1vbmx5LiBJJ2xsIG1ha2Ugc3VyZQp0byBjaGFuZ2UgdGhhdCBpbiB0aGUgbmV4dCB2
ZXJzaW9uLgoKPiBbLi4uXQo+ID4gKy8qCj4gPiArICogdGhlIGluZGV4IDIgaXMgc3lzX3BsbF9k
aXYxNiwgaXQgd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgQ1BVIGNsb2NrIGRyaXZlciwKPiBX
ZSBuZWVkIHRvIGFkZCB0aGUgInN5c19wbGxfZGl2MTYiIGlucHV0IHRvIHRoZSBkdC1iaW5kaW5n
cyBzaW5jZSB0aGV5Cj4gc2hvdWxkIGFsd2F5cyBkZXNjcmliZSB0aGUgaGFyZHdhcmUgKHJlZ2Fy
ZGxlc3Mgb2Ygd2hhdCB0aGUgZHJpdmVyCj4gaW1wbGVtZW50cyBjdXJyZW50bHkpLgo+IEknbSBu
b3Qgc3VyZSBob3cgdG8gbWFuYWdlIHRoaXMgd2hpbGUgd2UgZG9uJ3QgaGF2ZSB0aGUgQ1BVIGNs
b2NrCj4gZHJpdmVyIHJlYWR5IHlldCBidXQgSSdtIHN1cmUgUm9iIG9yIEtyenlzenRvZiB3aWxs
IGJlIGFibGUgdG8gaGVscCB1cwo+IGhlcmUuCj4gCgpJJ3ZlIHNoYXJlZCBteSB0aG91Z2h0cyBh
Ym91dCBpdCBpbiB0aGUgYmluZGluZ3MgdGhyZWFkLiBQbGVhc2UgdGFrZSBhCmxvb2suCgo+ID4g
KyAqIHRoZSBpbmRleCA0IGlzIHRoZSBjbG9jayBtZWFzdXJlbWVudCBzb3VyY2UsIGl0J3Mgbm90
IHN1cHBvcnRlZCB5ZXQKPiBJIHN1c3BlY3QgdGhhdCB0aGlzIGNvbWVzIGZyb20gdGhlIGNsb2Nr
IG1lYXN1cmVyIElQIGJsb2NrIGFuZCBpZiBzbwo+IHRoZSBkdC1iaW5kaW5ncyBzaG91bGQgcHJv
YmFibHkgZGVzY3JpYmUgdGhpcyBpbnB1dC4gQnV0IGFnYWluLCB3ZSdkCj4gbmVlZCB0byBrZWVw
IGl0IG9wdGlvbmFsIGZvciBub3cgc2luY2Ugb3VyIGNsb2NrIG1lYXN1cmVyIGRyaXZlcgo+IGRv
ZXNuJ3QgZXZlbiBpbXBsZW1lbnQgYSBjbG9jayBjb250cm9sbGVyLgo+IAoKSW5kZWVkLCB0aGlz
IGlzIGEgc2ltaWxhciBzaXR1YXRpb24gdG8gd2hhdCB3ZSBoYXZlIHdpdGggdGhlIGlucHV0cyBh
bmQKY2xvY2tzIG9mIHRoZSBDUFUgYW5kIEF1ZGlvIGNsb2NrIGNvbnRyb2xsZXJzLiBJdCBzZWVt
cyBsaWtlIHRoZXJlIGlzCm9ubHkgb25lIG9wdGlvbiBoZXJlOiB3ZSBzaG91bGQgbWFyayBpdCB3
aXRoIGEgVE9ETyB0YWcuLi4KCj4gWy4uLl0KPiA+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAg
cHdtX2Ffc2VsID0gewo+ID4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4
X2RhdGEpewo+ID4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBQV01fQ0xLX0FCX0NUUkwsCj4g
PiArICAgICAgICAgICAgICAgLm1hc2sgPSAweDEsCj4gPiArICAgICAgICAgICAgICAgLnNoaWZ0
ID0gOSwKPiA+ICsgICAgICAgfSwKPiA+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtf
aW5pdF9kYXRhKXsKPiA+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJwd21fYV9zZWwiLAo+ID4g
KyAgICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLAo+ID4gKyAgICAgICAg
ICAgICAgIC5wYXJlbnRfZGF0YSA9IHB3bV9hYmNkX3BhcmVudHMsCj4gPiArICAgICAgICAgICAg
ICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShwd21fYWJjZF9wYXJlbnRzKSwKPiA+ICsgICAg
ICAgICAgICAgICAvKiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgcGxlYXNlIHJlZmVyIHRvIHJ0YyBj
bG9jayAqLwo+ID4gKyAgICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9OT19SRVBB
UkVOVCwKPiBBcyBtZW50aW9uZWQgaW4gWzBdIHdlJ2xsIHdvcmsgd2l0aCBIZWluZXIgdG8gc2Vl
IGlmIHdlIGNhbiBpbXByb3ZlCj4gdGhlIGRlY2lzaW9uIG1ha2luZyBwcm9jZXNzIG9mIHRoZSBQ
V00gY29udHJvbGxlciBkcml2ZXIgc28gdGhhdCB3ZQo+IGNhbiBqdXN0IGhhdmUgLmZsYWdzID0g
MCBoZXJlLgo+IFRoaXMgYXBwbGllcyB0byBhbGwgb3RoZXIgb2NjdXJyZW5jZXMgb2YgdGhlIHNh
bWUgY29tbWVudCBhYm91dCB0aGUgcnRjIGNsb2NrLgoKU3VyZSwgSSdsbCBtYWtlIHRoZSBjaGFu
Z2UgaW4gdjE2LiBJbiBteSBvcGluaW9uLCB3ZSBzaG91bGQgcmVtb3ZlIHRoZQpDTEtfU0VUX1JB
VEVfTk9fUkVQQVJFTlQgZmxhZyBmcm9tIGFsbCBSVEMgcmVsYXRlZCBjbG9jayBvYmplY3RzLApp
bmNsdWRpbmcgUFdNLCByZWdhcmRsZXNzIG9mIHRoZSBvdXRjb21lIG9mIHRoZSBIZWluZXIgZGlz
Y3Vzc2lvbi4gQmFzZWQKb24gb3VyIElSQyB0YWxrLCB0aGUgZGVjaXNpb24gaGFzIG1vcmUgcHJv
cyB0aGFuIGNvbnMgLQpodHRwczovL2xpYmVyYS5pcmNsb2cud2hpdGVxdWFyay5vcmcvbGludXgt
YW1sb2dpYy8yMDIzLTA1LTE4CgotLSAKVGhhbmsgeW91LApEbWl0cnkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
