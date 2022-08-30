Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A768ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvgrwhdLV6Z4xb+pGyyH21FUGTRinin7KGjfi8Kv7Po=; b=nKSano7d/zlQ2yZ4v2JYBfI3DI
	FPR97mebfaO8DEBlAt80X66BrAtUXi1CHP1Gf7lblQauXB9OuuDEsHzoalwwQkDZnYH5kpnuns/+c
	0MskZLcUdZfoDCqwCR7kDkLUifHPG/opbBiYbYskTK2i0nbAXdgCQ0umChspgTYJFMpaMLsiUgG+Q
	FJwNschvSgS92Q4NeBwF3TSPH5VuUnxytR/oJPQL/CHQ/8xhxcvm1cY8S2Ldb0iLwLnmocGLWhPT/
	R7xdBOJ3xGPdR+8NsfDCO9nDEWdVZdqulwSlEbSgvJNGT4/ynTRvcxYUpoB0RsY6XOYSqYTTo4Avo
	nT2mrXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuVW-00EMQf-Lr; Tue, 30 Aug 2022 06:13:54 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuVH-00EMKk-0r; Tue, 30 Aug 2022 06:13:40 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 14:13:35 +0800
Message-ID: <0c7e6d90-2ce3-25ab-84b6-026ce8a238a8@amlogic.com>
Date: Tue, 30 Aug 2022 14:13:35 +0800
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
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jsflftm1y.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_231339_110259_9396D731 
X-CRM114-Status: GOOD (  11.00  )
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

CgpPbiAyMDIyLzgvMjkgMTc6NDgsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gTW9uIDE1IEF1ZyAyMDIyIGF0IDIxOjIwLCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgc3RydWN0IGNsa19y
ZWdtYXAgczRfaGRtaV9wbGxfZGNvID0gewo+Pj4+PiArwqDCoMKgIC5kYXRhID0gJihzdHJ1Y3Qg
bWVzb25fY2xrX3BsbF9kYXRhKXsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5lbiA9IHsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDAs
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAyOCwKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLndpZHRowqDCoCA9IDEsCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLm0gPSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLAo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLndpZHRowqDCoCA9IDgsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgLm4gPSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0g
QU5BQ1RSTF9IRE1JUExMX0NUUkwwLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hp
ZnTCoMKgID0gMTAsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSA1
LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mcmFjID0g
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBM
TF9DVFJMMSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDAsCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSAxNywKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0sCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAubCA9IHsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDAsCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAzMSwKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLndpZHRowqDCoCA9IDEsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgLnJzdCA9IHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDAsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5zaGlmdMKgwqAgPSAyOSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndp
ZHRowqDCoCA9IDEsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiArwqDCoMKgIH0sCj4+
Pj4+ICvCoMKgwqAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC5uYW1lID0gImhkbWlfcGxsX2RjbyIsCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCAub3BzID0gJm1lc29uX2Nsa19wbGxfcm9fb3BzLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLnBh
cmVudF9kYXRhID0gKGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgW10pIHsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeyAuZndfbmFtZSA9ICJ4dGFsIiwgfQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgfSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5udW1fcGFyZW50cyA9IDEsCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIERpc3BsYXkgZGly
ZWN0bHkgaGFuZGxlIGhkbWkgcGxsIHJlZ2lzdGVycyBBVE0sIHdlIG5lZWQKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBOT0NBQ0hFIHRvIGtlZXAgb3VyIHZpZXcgb2YgdGhlIGNsb2NrIGFzIGFj
Y3VyYXRlIGFzCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogcG9zc2libGUKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKi8KPj4+Pgo+Pj4+IElzIGl0IHJlYWxseSA/Cj4+Pj4KPj4+PiBHaXZlbiB0
aGF0IEhETUkgc3VwcG9ydCBmb3IgdGhlIHM0IGlzIHRoZXJlIHlldCwgdGhlCj4+Pj4gYWRkcmVz
c2VzIGhhdmUgY2hhbmdlcyBhbmQgdGhlIHJlZ2lvbiBpcyBubyBsb25nZXIgYSBzeXNjb24sIGl0
IGlzIHRpbWUKPj4+PiBmb3IgdGhlIEhETUkgZHJpdmVyIHRvIGdldCBmaXhlZC4KPj4gVGhlIEhE
TUkgUExMIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIFVib290IHBoYXNlIGFuZCBkb2VzIG5vdCBjaGFu
Z2UgdGhlCj4+IGZyZXF1ZW5jeSBpbiB0aGUga2VybmVsIHBoYXNlLiBTbyB3ZSB1c2UgdGhlIE5P
Q0FDSEUgZmxhZyBhbmQKPj4gInJvX29wcyIuCj4gCj4gVGhhdCdzIG5vIHJlYXNvbiB0byBwdXQg
Tk9DQUNIRSBvciByby1vcHMKPiAKPiBJZiB5b3Ugd2FudCB0aGUgZnJlcXVlbmNpZXMgdG8gYmUg
c3RhdGljYWxseSBhc3NpbmdlZCwgdGhlIGNvcnJlY3Qgd2F5Cj4gd291bGQgYmUgdGhyb3VnaCBh
c3NpZ25lZC1yYXRlIGluIERUIEkgZ3Vlc3MuCgpPa2F5LiBZb3UncmUgcmlnaHQuIEhvd2V2ZXIs
IHdoZW4gcmVnaXN0ZXJpbmcgd2l0aCBPUFMsIEhETUkgUExMIHdpbGwgYmUgCnJlc2V0LiBJdCB0
YWtlcyB0aW1lIGZvciBQTEwgdG8gc3RhYmlsaXplIHRoZSBvdXRwdXQgZnJlcXVlbmN5LCB3aGlj
aCAKd2lsbCBsZWFkIHRvIHRoZSBzdGFydHVwIHNjcmVlbiBmbGFzaGluZy4KCkkgd291bGQgbGlr
ZSB0byBrbm93IGhvdyB0byBzb2x2ZSB0aGlzIHByb2JsZW0gaWYgbm90IHVzaW5nIHJvX29wcy4K
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
