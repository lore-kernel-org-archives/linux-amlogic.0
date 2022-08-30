Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD8ECAAD8
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/i7qfCS9IuduCxp0i8Zw3tY535VlN0VN//ujktOK2Q=; b=E0Ls1m6aEKIrTiykXJfxiw2zYx
	A80Hdb5RcxWEwndUJ8lHLGH3T6LAX02JEAnvi+5u9kawaDvPfVT5Xr5Fz28WshPrinh3zPli0A3Xd
	zr2qsPY4UoqPFjW2ysVakJzljf/kWV91QkXPOnKkRA8PHUskcZS+XhOGm9F9mdTwyYiinM3Wct2Md
	vGhn9Z32Ww/i6Amil/lpGClbwMiAlZ5t4PlpgwBxXtfIoLJMacfl6svdwWxMateUIk2sTm2wWvNkf
	HsuDAz6uNufFP1c3pZzbhQ0qulhP7pAQ43Ucv54Y327RHBtbtWZNzPojVuMo73hawvNQG4opDQGhY
	eZE/MJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvpz-00EpGJ-Ks; Tue, 30 Aug 2022 07:39:07 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvoP-00EoYn-1P; Tue, 30 Aug 2022 07:37:30 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 15:37:26 +0800
Message-ID: <9f9cf980-c0c6-d5c3-ced8-8ab50e392470@amlogic.com>
Date: Tue, 30 Aug 2022 15:37:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
 <4e3cdd6b-5861-8a4f-1df7-af763f77bad5@amlogic.com>
 <1jsflftm1y.fsf@starbuckisacylon.baylibre.com>
 <0c7e6d90-2ce3-25ab-84b6-026ce8a238a8@amlogic.com>
 <1jtu5uz0ry.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jtu5uz0ry.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_003729_306593_7588E85B 
X-CRM114-Status: GOOD (  17.00  )
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

CgpPbiAyMDIyLzgvMzAgMTQ6NDQsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gVHVlIDMwIEF1ZyAyMDIyIGF0IDE0OjEzLCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBPbiAyMDIyLzgvMjkgMTc6NDgsIEplcm9tZSBCcnVu
ZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+IE9uIE1vbiAxNSBBdWcgMjAyMiBh
dCAyMToyMCwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Cj4+Pj4+Pj4gKwo+
Pj4+Pj4+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgczRfaGRtaV9wbGxfZGNvID0gewo+Pj4+
Pj4+ICvCoMKgwqAgLmRhdGEgPSAmKHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEpewo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAuZW4gPSB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDAsCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDI4LAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC53aWR0aMKgwqAgPSAxLAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAubSA9IHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29m
ZiA9IEFOQUNUUkxfSERNSVBMTF9DVFJMMCwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAuc2hpZnTCoMKgID0gMCwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud2lkdGjC
oMKgID0gOCwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgLm4gPSB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJlZ19vZmYgPSBBTkFD
VFJMX0hETUlQTExfQ1RSTDAsCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNoaWZ0
wqDCoCA9IDEwLAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSA1
LAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZnJh
YyA9IHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFOQUNUUkxf
SERNSVBMTF9DVFJMMSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKg
ID0gMCwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud2lkdGjCoMKgID0gMTcsCj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5sID0gewo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExM
X0NUUkwwLAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAzMSwK
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud2lkdGjCoMKgID0gMSwKPj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLnJzdCA9IHsKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBMTF9DVFJM
MCwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMjksCj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndpZHRowqDCoCA9IDEsCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0sCj4+Pj4+Pj4gK8KgwqDCoCB9LAo+Pj4+Pj4+ICvCoMKgwqAgLmh3LmluaXQg
PSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUg
PSAiaGRtaV9wbGxfZGNvIiwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLm9wcyA9ICZtZXNvbl9j
bGtfcGxsX3JvX29wcywKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLnBhcmVudF9kYXRhID0gKGNv
bnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgW10pIHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB7IC5md19uYW1lID0gInh0YWwiLCB9Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0s
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5udW1fcGFyZW50cyA9IDEsCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIC8qCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBEaXNwbGF5IGRpcmVjdGx5
IGhhbmRsZSBoZG1pIHBsbCByZWdpc3RlcnMgQVRNLCB3ZSBuZWVkCj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBOT0NBQ0hFIHRvIGtlZXAgb3VyIHZpZXcgb2YgdGhlIGNsb2NrIGFzIGFjY3Vy
YXRlIGFzCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBwb3NzaWJsZQo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICovCj4+Pj4+Pgo+Pj4+Pj4gSXMgaXQgcmVhbGx5ID8KPj4+Pj4+Cj4+Pj4+
PiBHaXZlbiB0aGF0IEhETUkgc3VwcG9ydCBmb3IgdGhlIHM0IGlzIHRoZXJlIHlldCwgdGhlCj4+
Pj4+PiBhZGRyZXNzZXMgaGF2ZSBjaGFuZ2VzIGFuZCB0aGUgcmVnaW9uIGlzIG5vIGxvbmdlciBh
IHN5c2NvbiwgaXQgaXMgdGltZQo+Pj4+Pj4gZm9yIHRoZSBIRE1JIGRyaXZlciB0byBnZXQgZml4
ZWQuCj4+Pj4gVGhlIEhETUkgUExMIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIFVib290IHBoYXNlIGFu
ZCBkb2VzIG5vdCBjaGFuZ2UgdGhlCj4+Pj4gZnJlcXVlbmN5IGluIHRoZSBrZXJuZWwgcGhhc2Uu
IFNvIHdlIHVzZSB0aGUgTk9DQUNIRSBmbGFnIGFuZAo+Pj4+ICJyb19vcHMiLgo+Pj4gVGhhdCdz
IG5vIHJlYXNvbiB0byBwdXQgTk9DQUNIRSBvciByby1vcHMKPj4+IElmIHlvdSB3YW50IHRoZSBm
cmVxdWVuY2llcyB0byBiZSBzdGF0aWNhbGx5IGFzc2luZ2VkLCB0aGUgY29ycmVjdCB3YXkKPj4+
IHdvdWxkIGJlIHRocm91Z2ggYXNzaWduZWQtcmF0ZSBpbiBEVCBJIGd1ZXNzLgo+Pgo+PiBPa2F5
LiBZb3UncmUgcmlnaHQuIEhvd2V2ZXIsIHdoZW4gcmVnaXN0ZXJpbmcgd2l0aCBPUFMsIEhETUkg
UExMIHdpbGwgYmUKPj4gcmVzZXQuIEl0IHRha2VzIHRpbWUgZm9yIFBMTCB0byBzdGFiaWxpemUg
dGhlIG91dHB1dCBmcmVxdWVuY3ksIHdoaWNoIHdpbGwKPj4gbGVhZCB0byB0aGUgc3RhcnR1cCBz
Y3JlZW4gZmxhc2hpbmcuCj4+Cj4+IEkgd291bGQgbGlrZSB0byBrbm93IGhvdyB0byBzb2x2ZSB0
aGlzIHByb2JsZW0gaWYgbm90IHVzaW5nIHJvX29wcy4KPj4KPj4+Cj4gCj4gWW91IGNhbiBhZGQg
bmV3IG9wcyBvciB0d2VhayB0aGUgY3VycmVudCBpbml0IGZ1bmN0aW9uLgoKSERNSSBQTEwgaXMg
bm90IGRpZmZlcmVudCBmcm9tIG90aGVyIFBMTFMsIHNvIEkgdGhpbmsgYWRkaW5nIE9QUyBpcyB3
ZWlyZC4KCj4gCj4gU2FmZXN0IHdvdWxkIGJlIHRvIGRvIHRoZSBmb2xsb3dpbmcgOgo+ICAgKiBD
aGVjayBpZiB0aGUgUExMcyBpcyBhbHJlYWR5IG9uLgo+ICAgKiBDaGVjayBpZiB0aGUgJ3BsbC0+
aW5pdF9yZWdzJyBtYXRjaGVzIHdoYXQgaXMgYWxyZWFkeSBzZXQKPiAgICAgLSBpZiBzbywgeW91
IGNhbiBza2lwIHRoZSByZXNldAo+ICAgICAtIGlmIG5vdCwgeW91IG5lZWQgdG8gcmVzZXQgYXMg
dXN1YWwKCnN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9pbml0KHN0cnVjdCBjbGtfaHcgKmh3KSAK
CnsgCgogICAgICAgICBzdHJ1Y3QgY2xrX3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7
IAoKICAgICAgICAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsID0gbWVzb25fY2xrX3Bs
bF9kYXRhKGNsayk7IAoKIAoKICAgICAgICAgaWYgKHBsbC0+aW5pdF9jb3VudCkgeyAKCiAgICAg
ICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAxKTsgCgog
ICAgICAgICAgICAgICAgIHJlZ21hcF9tdWx0aV9yZWdfd3JpdGUoY2xrLT5tYXAsIHBsbC0+aW5p
dF9yZWdzLCAKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICBwbGwtPmlu
aXRfY291bnQpOyAKCiAgICAgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwg
JnBsbC0+cnN0LCAwKTsgCgogICAgICAgICB9IAoKIAoKICAgICAgICAgcmV0dXJuIDA7IAoKfQoK
QmVjYXVzZSB0aGUgaW5pdCBmdW5jdGlvbiBsb29rcyBsaWtlIHRoaXMuIFRoZXJlZm9yZSwgSERN
SSBQTEwgCmluaXRfY291bnQgaXMgbm90IGdpdmVuLiBDYW4gSSBjaGFuZ2UgaXQgbGlrZSB0aGlz
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
