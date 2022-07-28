Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F7BC04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhnhnORg841kUqq1m40EC2I35AYiA84giOrlAEaBO1s=; b=YBiyHwOz8Fk0gv0IzWK976O4IA
	xV+tbq6YQTayYZ09TWhW9yftj/aPBhkYyJ9qWxLJjHYbMDrVMrcY4POIewnL6rcVnt/bRjXDiAbJ7
	WLZaVVn9QLu+V5qK8BPv5jQxhksBlR/a5n5EPv6ILEaAaJq38bB6UbdCV+lezo/3x+4/TBVqJWO8z
	ylZwxzZMux5HV3BEOtoLWnQWgHT8A9iTuQoHynMThfvJapqDCjcEWmaowpnJV0PBCHQ6zhleaA3Pu
	wUSLdaX3qNEtREDBSRX+0cuaixNIbYQSEi2TuD+nSM3VtBeyLDMCK0TPiIUrPOqJZpTEOJ+nOIhlJ
	twzZEz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0Cn-007m6G-Gt; Thu, 28 Jul 2022 09:53:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0Ca-007kus-Ut; Thu, 28 Jul 2022 09:53:10 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 17:52:57 +0800
Message-ID: <9256c0f2-a656-996f-0ed8-d22ae2907070@amlogic.com>
Date: Thu, 28 Jul 2022 17:52:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
 <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
 <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
 <965f83cf-4695-f89c-5ede-2f6b2524f392@amlogic.com>
 <1jr125fvz0.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jr125fvz0.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_025309_030320_F9F9C9BA 
X-CRM114-Status: GOOD (  16.66  )
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

CgpPbiAyMDIyLzcvMjggMTc6MDMsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gVGh1IDI4IEp1bCAyMDIyIGF0IDE2OjU1LCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBIaSBKZXJvbWUsCj4+IAlUaGFua3MgZm9yIHlvdXIg
cmVwbHkgYW5kIGV4cGxhbmF0aW9uLgo+Pgo+PiBPbiAyMDIyLzcvMjggMTY6MjcsIEplcm9tZSBC
cnVuZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBUaHUgMjggSnVs
IDIwMjIgYXQgMTY6MDYsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+
IEhpIEpC77yMCj4+Pj4KPj4+PiBPbiAyMDIyLzcvMjggMTU6MDgsIEplcm9tZSBCcnVuZXQgd3Jv
dGU6Cj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pgo+Pj4+PiBPbiBUaHUgMjggSnVsIDIw
MjIgYXQgMTM6NDEsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+
PiAxLiBBZGQgY2xvY2sgY29udHJvbGxlciBkcml2ZXIgZm9yIFM0IFNPQy4KPj4+Pj4+Cj4+Pj4+
PiBZdSBUdSAoMyk6Cj4+Pj4+PiAgICAgIGR0LWJpbmRpbmdzOiBjbGs6IG1lc29uOiBhZGQgUzQg
U29DIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MKPj4+Pj4+ICAgICAgYXJtNjQ6IGR0czogbWVz
b246IGFkZCBTNCBTb2MgY2xvY2sgY29udHJvbGxlciBpbiBEVAo+Pj4+Pj4gICAgICBjbGs6IG1l
c29uOiBzNDogYWRkIHM0IFNvQyBjbG9jayBjb250cm9sbGVyIGRyaXZlcgo+Pj4+Pj4KPj4+Pj4+
IFYxIC0+IFYyOiBDaGFuZ2UgZm9ybWF0IGFzIGRpc2N1c3NlZCBpbiB0aGUgZW1haWwuCj4+Pj4+
Pgo+Pj4+Pj4gTGluazpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjIw
NzA4MDYyNzU3LjM2NjItMS15dS50dUBhbWxvZ2ljLmNvbS8KPj4+Pj4+Cj4+Pj4+PiAgICAgLi4u
L2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsZ3hiYi1jbGtjLnR4dCAgICAgIHwgICAgMSArCj4+Pj4+
PiAgICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
MSArCj4+Pj4+PiAgICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kg
ICAgIHwgICAxMSArCj4+Pj4+PiAgICAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgIHwgICAxNSArCj4+Pj4+PiAgICAgZHJpdmVycy9jbGsvbWVzb24vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4+Pj4+PiAgICAgZHJpdmVycy9jbGsvbWVz
b24vczQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNDczMiArKysrKysrKysrKysrKysrKwo+
Pj4+Pj4gICAgIGRyaXZlcnMvY2xrL21lc29uL3M0LmggICAgICAgICAgICAgICAgICAgICAgICB8
ICAyOTYgKysKPj4+Pj4+ICAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3M0LWNsa2MuaCAg
ICAgICAgICAgfCAgMTQ2ICsKPj4+Pj4+ICAgICA4IGZpbGVzIGNoYW5nZWQsIDUyMDMgaW5zZXJ0
aW9ucygrKQo+Pj4+Pj4gICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9z
NC5jCj4+Pj4+PiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lc29uL3M0LmgK
Pj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9z
NC1jbGtjLmgKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gYmFzZS1jb21taXQ6IGIyOTNiYzkyODZlZTIx
ODI0ZTkzZjBmY2ZlZDNiNzhmZGZlZTAxZTYKPj4+Pj4gUGxlYXNlIGRvbid0IHBvc3QgdW50aWwg
eW91IGhhdmUgYWRkcmVzc2VkICpBTEwqIHRoZSBjb21tZW50cyBmcm9tIHRoZQo+Pj4+PiBwcmV2
aW91cyB2ZXJzaW9uLgo+Pj4+IFRoZSBsYXN0IGVtYWlsIGFza2VkIHlvdSB0byBhZG9wdCBBMSBt
ZXRob2QsIGJ1dCB5b3UgZGlkIG5vdCByZXBseT8KPj4+Pgo+Pj4+PiBBdCBmaXJzdCBnbGFuY2Us
IEkgY2FuIHNlZSB0aGF0IHRoaXMgaXMgc3RpbGwgYSBzaW5nbGUgZHJpdmVyIGZvcgo+Pj4+PiB3
aGF0IGlzIG9idmlvdXNseSAyIGNvbnRyb2xsZXJzIHdpdGggMiByZWdpc3RlciBzcGFjZXMuIFNp
bXBsZSBjb21tZW50cwo+Pj4+PiBsaWtlIHRoZSAiPDwgMiIgaW4gdGhlIHJlZ2lzdGVyIGRlY2xh
cmF0aW9uIGhhdmUgbm90IGJlZW4gYWRkcmVzc2VkIGVpdGhlci4KPj4+PiBJIHVuZGVyc3RhbmQg
dGhhdCB0aGlzIHNob3VsZCBiZSBhIGNvbnRyb2xsZXIsIGp1c3QgdHdvIGFkZHJlc3MKPj4+PiBk
ZXNjcmlwdGlvbnMuIE9uZSBpcyB0aGUgdmFyaW91cyBQTEwgcmVnaXN0ZXJzIGFuZCBvbmUgaXMg
dGhlIGNsb2NrIGZvcgo+Pj4+IHRoZSBwZXJpcGhlcmFscy4gQW5kIFBMTCBpcyB0byBwcm92aWRl
IGEgY2xvY2sgc291cmNlIGZvciB2YXJpb3VzCj4+Pj4gcGVyaXBoZXJhbCBjbG9ja3MuIFNvIGEg
Y2xvY2sgY29udHJvbGxlciBpcyByZWFzb25hYmxlLiBJIHRoaW5rIHlvdSBnb3QKPj4+PiBpdCB3
cm9uZy4KPj4+IEkgZG9uJ3QgdGhpbmsgSSBkby4gVGhpcyBsb29rcyBleGFjdGx5IGxpa2UgdGhl
IEExLgo+Pj4gVGhlIHBvc3Qgb2YgdGhhdCBjb250cm9sbGVyIGFyZSBzdGlsbCBpbiB0aGUgIGFy
Y2hpdmUgYW5kIEkgYW0gc3VyZSB5b3VyCj4+PiBjb2xsZWFndWVzIGNhbiBnaXZlIHlvdSB0aGUg
aGlzdG9yeS4KPj4+IFlvdSBjbGVhcmx5IGhhdmUgcmVnaXN0ZXIgcmVnaW9ucyBwcm92aWRpbmcg
Y2xvY2ssIHNlcGFyYXRlZCBieQo+Pj4gMHg4MDAwLiBDbGFpbWluZyB0aGF0IGFzIG9uZSBiaWcg
cmVnaW9uIGlzIGJhZCBkZXNpZ24uCj4+PiBUaGVyZSBoYXMgYmVlbiBzZXZlcmFsIHJlbWFya3Mg
YWJvdXQgdXNpbmcgYSBiaWcgc3lzY29uIG9uIFYxLAo+Pj4gdW5hZGRyZXNzZWQgdG9vLgo+Pj4g
Q0NGIGhhcyBldmVyeXRoaW5nIG5lY2Vzc2FyeSBpbiBwbGFjZSB0byBoYW5kbGUgZWFjaCByZWdp
c3RlciByZWdpb24KPj4+IHNlcGFyYXRlbHksIHByb3Blcmx5IGFuZCBwYXNzIGNsb2NrIGFyb3Vu
ZC4KPj4+IFlvdSBjYW4gaGFuZGxlIGl0IGFzIGEgc2luZ2xlIGNvbnRyb2xsZXIsIGNsYWltaW5n
IHRoZSB0d28gcmVnaW9ucwo+Pj4gaW5kaXZpZHVhbGx5IGJ1dDoKPj4+ICMgMSAtIGhhbmRsaW5n
IDIgZGlmZmVyZW50IHJlZ21hcHMgaW4gdGhlIGNvbnRyb2xsZXIgaXMgZ29pbmcgdG8gYmUKPj4+
ICAgICAgICAgYmlnZ2VyIG1lc3MgdGhhbiB5b3UgdGhpbmsKPj4+ICMgMiAtIEkgYW0gZmFyIGZy
b20gY29udmluY2VkIHRoZXJlIGlzIGFueSByZWFzb24gdG8gZG8gc28KPj4+Cj4+IEl0IG1ha2Vz
IHNlbnNlLCBhcyB5b3Ugc2F5LCB0byBzZXBhcmF0ZSB0aGUgdHdvIGNvbnRyb2xsZXJzLiBCdXQg
SSB0aGluawo+PiB0aGUgb25seSB0aGluZyB0aGF0IHdhcyBmb3JjZWQgYXBhcnQgd2FzIHRoYXQg
dGhlIGRpZ2l0YWwgZGVzaWduZXJzCj4+IGRpZG4ndCBwdXQgdGhlc2UgcmVnaXN0ZXJzIHRvZ2V0
aGVyIHdoZW4gdGhleSB3ZXJlIGRlc2lnbmluZyB0aGUgY2hpcHMuCj4+Cj4gCj4gT25lIGNvbnRy
b2xsZXIgaXMgcHJvdmlkaW5nIGFsbCB0aGUgYmFzZSBQTExzCj4gVGhlIG90aGVyIGlzIHByb3Zp
ZGluZyBtb3N0IChpZiBub3QgYWxsKSB0aGUgZGV2aWNlcyBjbG9ja3MuCj4gVGhpcyBkb2VzIG5v
dCBsb29rIGxpa2UgY29pbmNpZGVuY2Ugb3IgbWlzdGFrZSB0byBtZS4KVGhhbmtzIGZvciB5b3Vy
IHJlcGx5LiBMb29rcyBsaWtlIEkgZ290IGl0IHdyb25nLiBIb3dldmVyLCBJIHdpbGwgdGFsayAK
dG8gdGhlIGNoaXAgZGVzaWduZXIgYWJvdXQgd2hldGhlciBpdCBpcyBwb3NzaWJsZSB0byBwdXQg
dGhlc2UgcmVnaXN0ZXJzIAppbiB0aGUgbGF0ZXIgY2hpcCBzbyB0aGF0IGl0IG1heSBiZSBlYXNp
ZXIgZm9yIG91ciBzb2Z0d2FyZSB0byBwcm9jZXNzLgoKPiAKPj4gSSdtIGdvaW5nIHRvIHNlcGFy
YXRlIHRoZSB0d28gY29udHJvbGxlcnMgbGlrZSB5b3Ugc2FpZC4KPj4KPj4+Cj4+Pj4KPj4+PiBP
aywgaWYgeW91IGluc2lzdCBvbiB1c2luZyB0d28gY2xvY2sgY29udHJvbGxlcnMsLCBwbGVhc2Ug
cHJvdmlkZSB5b3VyIHRoZQo+Pj4+IHJlYXNvbiBhbmQgZXhhbXBsZSBjb2RlPwo+Pj4+Cj4+Pj4+
IFNlZWluZyB0aGF0LCBJIGhhdmUgbm90IHJldmlld2VkIHRoaXMgdmVyc2lvbiBmdXJ0aGVyLgo+
Pj4+PiBJIHdvbid0IHVudGlsIGFsbCB0aGUgY29tbWVudHMgZnJvbSB2MSBhcmUgZWl0aGVyIGFk
ZHJlc3NlZCBvciBhbnN3ZXIKPj4+Pj4gUmVnYXJkcwo+Pj4+PiBKZXJvbWUKPj4+Pj4gLgo+Pj4g
Lgo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
