Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE12C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY/jlSWfTydex8afGgowgJ98382/A4Ws3uTnOMufqS0=; b=FGGSHUOvL/VUDLKa+1MDtJBmqM
	ky9XyOiV2zem6MGpzYSKMyTfeaKY/f4+1p5KCO21rwoHF1K6obrvgdo3EOP2pZ/o0bL8E0kLfEagt
	0pIsvjdXkv/j3EnHrI/QukWRQf4RUK8ly4dIWNjObP+/HlNOZc4d8k0WS8dApCGzetQQygoYlLDU+
	b5ci1WfMlK4L0BQcGDrgjn7Dgl48SGqGP64PIXOtv+PHJuyH/gAadIpjetuGePuXinvVqN3d/McZC
	OQ/Deu74P2VIbCkcCigKyXgDRYQvkiQOl6sxTPcmZxt9kCtL+OlHUKUER6XmSAaecqygZ1WYaoER4
	QV+YDjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyXc-005dNs-Ot; Thu, 28 Jul 2022 08:06:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyXQ-005dII-My; Thu, 28 Jul 2022 08:06:34 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 16:06:25 +0800
Message-ID: <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
Date: Thu, 28 Jul 2022 16:06:25 +0800
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
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_010632_773084_C2AB8C32 
X-CRM114-Status: GOOD (  12.12  )
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

SGkgSkLvvIwKCk9uIDIwMjIvNy8yOCAxNTowOCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiAKPiBPbiBUaHUgMjggSnVsIDIwMjIgYXQgMTM6NDEsIFl1IFR1
IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gCj4+IDEuIEFkZCBjbG9jayBjb250cm9sbGVy
IGRyaXZlciBmb3IgUzQgU09DLgo+Pgo+PiBZdSBUdSAoMyk6Cj4+ICAgIGR0LWJpbmRpbmdzOiBj
bGs6IG1lc29uOiBhZGQgUzQgU29DIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MKPj4gICAgYXJt
NjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgY2xvY2sgY29udHJvbGxlciBpbiBEVAo+PiAgICBj
bGs6IG1lc29uOiBzNDogYWRkIHM0IFNvQyBjbG9jayBjb250cm9sbGVyIGRyaXZlcgo+Pgo+PiBW
MSAtPiBWMjogQ2hhbmdlIGZvcm1hdCBhcyBkaXNjdXNzZWQgaW4gdGhlIGVtYWlsLgo+Pgo+PiBM
aW5rOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyMjA3MDgwNjI3NTcu
MzY2Mi0xLXl1LnR1QGFtbG9naWMuY29tLwo+Pgo+PiAgIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxv
Z2ljLGd4YmItY2xrYy50eHQgICAgICB8ICAgIDEgKwo+PiAgIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+PiAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpICAgICB8ICAgMTEgKwo+PiAgIGRyaXZlcnMvY2xrL21l
c29uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgMTUgKwo+PiAgIGRyaXZlcnMvY2xr
L21lc29uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+PiAgIGRyaXZlcnMv
Y2xrL21lc29uL3M0LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQ3MzIgKysrKysrKysrKysr
KysrKysKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9zNC5oICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMjk2ICsrCj4+ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zNC1jbGtjLmggICAgICAg
ICAgIHwgIDE0NiArCj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCA1MjAzIGluc2VydGlvbnMoKykKPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQuYwo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC5oCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svczQtY2xrYy5oCj4+Cj4+Cj4+IGJhc2UtY29tbWl0
OiBiMjkzYmM5Mjg2ZWUyMTgyNGU5M2YwZmNmZWQzYjc4ZmRmZWUwMWU2Cj4gCj4gUGxlYXNlIGRv
bid0IHBvc3QgdW50aWwgeW91IGhhdmUgYWRkcmVzc2VkICpBTEwqIHRoZSBjb21tZW50cyBmcm9t
IHRoZQo+IHByZXZpb3VzIHZlcnNpb24uClRoZSBsYXN0IGVtYWlsIGFza2VkIHlvdSB0byBhZG9w
dCBBMSBtZXRob2QsIGJ1dCB5b3UgZGlkIG5vdCByZXBseT8KCj4gCj4gQXQgZmlyc3QgZ2xhbmNl
LCBJIGNhbiBzZWUgdGhhdCB0aGlzIGlzIHN0aWxsIGEgc2luZ2xlIGRyaXZlciBmb3IKPiB3aGF0
IGlzIG9idmlvdXNseSAyIGNvbnRyb2xsZXJzIHdpdGggMiByZWdpc3RlciBzcGFjZXMuIFNpbXBs
ZSBjb21tZW50cwo+IGxpa2UgdGhlICI8PCAyIiBpbiB0aGUgcmVnaXN0ZXIgZGVjbGFyYXRpb24g
aGF2ZSBub3QgYmVlbiBhZGRyZXNzZWQgZWl0aGVyLgpJIHVuZGVyc3RhbmQgdGhhdCB0aGlzIHNo
b3VsZCBiZSBhIGNvbnRyb2xsZXIsIGp1c3QgdHdvIGFkZHJlc3MgCmRlc2NyaXB0aW9ucy4gT25l
IGlzIHRoZSB2YXJpb3VzIFBMTCByZWdpc3RlcnMgYW5kIG9uZSBpcyB0aGUgY2xvY2sgZm9yIAp0
aGUgcGVyaXBoZXJhbHMuIEFuZCBQTEwgaXMgdG8gcHJvdmlkZSBhIGNsb2NrIHNvdXJjZSBmb3Ig
dmFyaW91cyAKcGVyaXBoZXJhbCBjbG9ja3MuIFNvIGEgY2xvY2sgY29udHJvbGxlciBpcyByZWFz
b25hYmxlLiBJIHRoaW5rIHlvdSBnb3QgCml0IHdyb25nLgoKT2ssIGlmIHlvdSBpbnNpc3Qgb24g
dXNpbmcgdHdvIGNsb2NrIGNvbnRyb2xsZXJzLCwgcGxlYXNlIHByb3ZpZGUgeW91ciAKdGhlIHJl
YXNvbiBhbmQgZXhhbXBsZSBjb2RlPwoKPiAKPiBTZWVpbmcgdGhhdCwgSSBoYXZlIG5vdCByZXZp
ZXdlZCB0aGlzIHZlcnNpb24gZnVydGhlci4KPiBJIHdvbid0IHVudGlsIGFsbCB0aGUgY29tbWVu
dHMgZnJvbSB2MSBhcmUgZWl0aGVyIGFkZHJlc3NlZCBvciBhbnN3ZXIKPiAKPiBSZWdhcmRzCj4g
SmVyb21lCj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
