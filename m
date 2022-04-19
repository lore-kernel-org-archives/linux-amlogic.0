Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BCDC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72xe9eylVsdlFnVp6h1cbInbLiyvXZKWBwpkS77ewjE=; b=MvQkVz54jRyNEb
	fTDhL56F0qhuvdyGFIdYeAVEeMZv/KHfx4a/ZAMB0bDMRB8xxXGe5Q3XVMXlyI+CMYI0DB/5ty+b0
	YtvRA9JPAC4UVd1nNFwuEDbHxMxBpna8mockiWJGpnQ1YQqHwffXry81wd1iSHbd3ZznlEqjL8XQR
	Y8Wbk48L4doFqL4B3i7ha2ZCJv3fma84l/gjC8v78PuggDSYg1na2jsg1VPuxH/Ea95Ri5S4cdNsP
	u/JyT1J87TO5RDItR6istzVYQPROGk9DLGYqSaahk3QLA5qQDuzqOI2IPELo3Wi9MioNQLC2q8mzd
	d5nvIuwSuxfazmLM6oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngjST-002NRb-IM; Tue, 19 Apr 2022 08:43:37 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngjSF-002NM3-UA; Tue, 19 Apr 2022 08:43:25 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Apr
 2022 16:43:13 +0800
Message-ID: <654f9cb8-5a88-3b96-8a2a-80ef7bb5eef9@amlogic.com>
Date: Tue, 19 Apr 2022 16:43:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
CC: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
 <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
 <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_014323_991254_FB86F4F3 
X-CRM114-Status: GOOD (  11.12  )
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

SGkgSmlyaSwKCVRoYW5rcyBmb3IgdGhlIHRpcC4KCk9uIDIwMjIvNC8xOSAxNTozOCwgSmlyaSBT
bGFieSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAKPiBPbiAxOS4gMDQu
IDIyLCA5OjI5LCBZdSBUdSB3cm90ZToKPj4gSGkgQW5keSwKPj4gwqDCoMKgwqDCoFRoYW5rIHlv
dSBmb3IgeW91ciBhZHZpY2UuCj4+Cj4+IE9uIDIwMjIvNC8xOCAyMDowOSwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gT24gTW9uLCBBcHIgMTgs
IDIwMjIgYXQgODo1MCBBTSBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Cj4+
Pj4gQSAvMiBkaXZpZGVyIG92ZXIgWFRBTCB3YXMgaW50cm9kdWNlZCBzaW5jZSBHMTJBLCBhbmQg
aXMgcHJlZmVycmVkCj4+Pj4gdG8gYmUgdXNlZCBvdmVyIHRoZSBzdGlsbCBwcmVzZW50IC8zIGRp
dmlkZXIgc2luY2UgaXQgcHJvdmlkZXMgbXVjaAo+Pj4+IGNsb3NlciBmcmVxdWVuY2llcyB2cyB0
aGUgcmVxdWVzdCBiYXVkcmF0ZS5Fc3BlY2lhbGx5IHRoZSBCVCBtb2R1bGUKPj4+Cj4+PiAnZS4g
RScgKG1pbmQgdGhlIHNwYWNlKQo+PiBNeSBzdGF0ZW1lbnQgaXMgYSB3aG9sZS4gVGhlcmUgc2hv
dWxkIGJlIG5vIHNwYWNlcy4KPiAKPiBQZXJpb2Qgc2hvdWxkIGJlIGZvbGxvd2VkIGJ5IGEgc3Bh
Y2UsIG9mIGNvdXJzZS4KSSBnb3QgaXQgLlRoaXMgd2lsbCBiZSBjb3JyZWN0ZWQgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KCj4gCj4+Pj4gdXNlcyAzTWh6IGJhdWQgcmF0ZS4gOE1oeiBjYWxjdWxhdGlv
bnMgY2FuIGxlYWQgdG8gYmF1ZCByYXRlIGJpYXMsCj4+Pj4gY2F1c2luZyBzb21lIHByb2JsZW1z
Lgo+Pj4KPj4+IC4uLgo+Pj4KPj4+PiArc3RydWN0IG1lc29uX3VhcnRfZGF0YSB7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoCBib29sIGhhc194dGFsX2RpdjI7Cj4+Pgo+Pj4gSSB3b3VsZCBwcmVmZXIgdG8g
c2VlIHRoaXMgYXMgYW4gdW5zaWduZWQgaW50IGFuZCB3aXRoIGEgbGVzcwo+Pj4gcGFydGljdWxh
ciBuYW1lLCBlLmcuIHh0YWxfZGl2IHdvdWxkIHN1ZmZpY2UuCj4+IEkgZG9uJ3QgaGF2ZSBhIHBy
b2JsZW0gd2l0aCB5b3VyIHN1Z2dlc3Rpb24uTGV0J3Mgc2VlIFdoYXQgTmVpbCBoYXMgdG8gCj4+
IHNheS4KPiAKPiBBY3R1YWxseSB3aHkgdWludCBwcm92aWRlZCBpdCdzIGEgYm9vbGVhbiB2YWx1
ZT8gT3IgZG8geW91IG1lYW4gdG8gc3RvcmUgCj4gdGhlIGRpdmlzb3IgZGlyZWN0bHkgaW4gdGhp
cyBtZW1iZXIsIEFuZHk/Cj4gCj4gdGhhbmtzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
