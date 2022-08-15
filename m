Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD5CC00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 06:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5AUV+faeVvrCrzG9os11gmRtyByG26T8nQsuOggD7w=; b=tSixjoudgkaG2SXwW+/5sbbI/+
	fm7oeCTdXQDfr9H6brDwJwa22bO4uZXriCQSwqf11MYV5wOwYphdBrvLo6iVwbdJ6azVIl5hdOhSp
	ZDff1b8rtCnFfJa1yuXFltyniwQ9wbwsWW9U/AQWHHj8CfZKEO+iVhJ34nJ2cB3HSiqLPsd8nBkYo
	Xhn+2yEbP7EyVBBr3CG4jbpGa8KXJHax1+4+OTefvVHqlDz5AjQoQcRNJIFjn+Hrwmh5KtiPlv914
	877tHnbQwF1iipVUbkLJ5aJrQ0QlWlpucxihOMpjzb2pXCoZAS/+2sm6rQrLIjrAkPtMPCQ9bdVYc
	6P+OW1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNTQ3-00BpOh-Jo; Mon, 15 Aug 2022 06:17:47 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNTPf-00Bp45-3W; Mon, 15 Aug 2022 06:17:29 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 15 Aug
 2022 14:17:11 +0800
Message-ID: <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
Date: Mon, 15 Aug 2022 14:17:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock controller
 in DT
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
 <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_231723_721856_9D864E79 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

SGkgSmVyb21l77yMCgpPbiAyMDIyLzgvMTAgMjE6MzIsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4g
WyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gCj4gT24gRnJpIDA1IEF1ZyAyMDIyIGF0IDE3OjM5LCBZ
dSBUdSA8eXUudHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBIaSBLcnp5c3p0b2YsCj4+ICAg
ICAgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+Pgo+PiBPbiAyMDIyLzgvNSAxNzoxNiwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4gT24gMDUv
MDgvMjAyMiAxMDo1NywgWXUgVHUgd3JvdGU6Cj4+Pj4gQWRkZWQgaW5mb3JtYXRpb24gYWJvdXQg
dGhlIFM0IFNPQyBQTEwgQ2xvY2sgY29udHJvbGxlciBpbiBEVC4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDggKysrKysrKysKPj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+Pj4+IGluZGV4IGZmMjEzNjE4YTU5OC4uYTgxNmIx
Zjc2OTRiIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1zNC5kdHNpCj4+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0
LmR0c2kKPj4+PiBAQCAtOTIsNiArOTIsMTQgQEAgYXBiNDogYXBiNEBmZTAwMDAwMCB7Cj4+Pj4g
ICAgCQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4+Pj4gICAgCQkJcmFuZ2VzID0gPDB4MCAweDAgMHgw
IDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPj4+PiAgICArCQkJY2xrY19wbGw6IHBsbC1jbG9j
ay1jb250cm9sbGVyQDgwMDAgewo+Pj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYyAtIGNs
b2NrLWNvbnRyb2xsZXIuCj4+PiBodHRwczovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFk
dGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2aWNldHJlZS1iYXNpY3MuaHRtbCNnZW5l
cmljLW5hbWVzLXJlY29tbWVuZGF0aW9uCj4+Pgo+PiBJIHdpbGwgY2hhbmdlIHRvIGNsa2NfcGxs
OiBjbG9jay1jb250cm9sbGVyQDgwMDAsIGluIG5leHQgdmVyc2lvbi4KPiAKPiBTYW1lIGNvbW1l
bnQgYXBwbGllcyB0byB0aGUgYmluZGluZyBkb2MuCk9LYXkuCj4gCj4gQWxzbyBpdCB3b3VsZCBi
ZSBuaWNlIHRvIHNwbGl0IHRoaXMgaW4gdHdvIHNlcmllcy4KPiBCaW5kaW5ncyBhbmQgZHJpdmVy
cyBpbiBvbmUsIGFybTY0IGR0IGluIHRoZSBvdGhlci4gVGhlc2UgY2hhbmdlcyBnb2VzCj4gaW4g
dGhyb3VnaCBkaWZmZXJlbnQgdHJlZXMuCkF0IHByZXNlbnQsIEJpbmRpbmdzLCBEVFMgYW5kIGRy
aXZlcnMgYXJlIHRocmVlIHNlcmllcy4gRG8geW91IG1lYW4gdG8gCnB1dCBCaW5kaW5ncyBhbmQg
ZHJpdmVycyB0b2dldGhlcj8gSWYgc28sIGNoZWNrcGF0Y2gucGwgd2lsbCByZXBvcnQgYSAKd2Fy
bmluZy4KCj4gCj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiBLcnp5c3p0b2YKPj4+IC4KPiAKPiAuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
