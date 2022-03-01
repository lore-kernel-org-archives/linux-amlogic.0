Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26237C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 02:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OF1KaUbGn2wbgzYlswldDZec6/eHbqV7p5C6+4eJf/I=; b=0qV03KSEBeH5HV
	BCi+6lGPZOm40XBkZ/S8eAZsbLsP9k6VOYDaBv4RHFHXlM8Lcx9iEo9YRLT+GeWof0/t+4qcwABkk
	6RAgsQtjHLV/oCfQ4azVeNUNlXVxVxdq++gXGH/Eifr3yI8vAnPrA34UreqE7Xkyg5C3KnPW9hr1l
	PKcHZ1KRcf23t8NG0MV0UrYp1lIdMXe8b4tMyQLm9/H0P215kTrjXGPsX4gpOzqXbLyEwNwoFrt8U
	wD0EwNChRoQv84GqIrsO/Gy0YvQ6g2H4giPcYS5ME8PlZy6ZkINsYc9MZCRQNpEaYJRfAzNdBV+0p
	Rgnc7jz6Y5jwO1alLbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOsUc-00EimD-0B; Tue, 01 Mar 2022 02:44:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOsUQ-00EikY-NA; Tue, 01 Mar 2022 02:43:51 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 10:43:48 +0800
Message-ID: <aa9c6622-4d3c-5bb8-ba25-d25b8b73a038@amlogic.com>
Date: Tue, 1 Mar 2022 10:43:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter
 <dan.carpenter@oracle.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, kernel test robot
 <lkp@intel.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <20220228142751.GF2812@kadam> <Yh09abhySKsjart4@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <Yh09abhySKsjart4@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_184350_778378_4D3AAD86 
X-CRM114-Status: GOOD (  12.53  )
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

SGkgZ3JlZyBhbmQgZGFuLAoJVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXBseS4gSSB3
aWxsIG1ha2UgYSBzZXBhcmF0ZSBzdWJtaXNzaW9uIAphcyB5b3Ugc3VnZ2VzdGVkIHRvIGZpeCBE
YW4ncyBzdWdnZXN0aW9uLgoKT24gMjAyMi8zLzEgNToyMywgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDA1
OjI3OjUyUE0gKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDI4LCAy
MDIyIGF0IDA5OjU1OjMwUE0gKzA4MDAsIFl1IFR1IHdyb3RlOgo+Pj4gRGVzY3JpYmVzIHRoZSBj
YWxjdWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jawo+Pj4g
ZnJhbWUuIEZvcmdvdCB0byBhZGQgaW4gS2NvbmZpZyBrZXJuZWwgdGVzdCBSb2JvdCBjb21waWxh
dGlvbiBlcnJvcgo+Pj4gZHVlIHRvIENPTU1PTl9DTEsgZGVwZW5kZW5jeS4KPj4+Cj4+PiBGaXhl
czogKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUg
VUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jayBmcmFtZeKAnCkKPj4+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4+IFJlcG9ydGVkLWJ5OiBE
YW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy90dHkvc2Vy
aWFsL0tjb25maWcgICAgICB8ICAxICsKPj4+ICAgZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3Vh
cnQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+Pj4gICAyIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9L
Y29uZmlnCj4+PiBpbmRleCBlOTUyZWM1YzdhN2MuLmEwZjJiODJmYzE4YiAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJp
YWwvS2NvbmZpZwo+Pj4gQEAgLTIwMCw2ICsyMDAsNyBAQCBjb25maWcgU0VSSUFMX0tHREJfTk1J
Cj4+PiAgIGNvbmZpZyBTRVJJQUxfTUVTT04KPj4+ICAgCXRyaXN0YXRlICJNZXNvbiBzZXJpYWwg
cG9ydCBzdXBwb3J0Igo+Pj4gICAJZGVwZW5kcyBvbiBBUkNIX01FU09OIHx8IENPTVBJTEVfVEVT
VAo+Pj4gKwlkZXBlbmRzIG9uIENPTU1PTl9DTEsKPj4+ICAgCXNlbGVjdCBTRVJJQUxfQ09SRQo+
Pj4gICAJaGVscAo+Pj4gICAJICBUaGlzIGVuYWJsZXMgdGhlIGRyaXZlciBmb3IgdGhlIG9uLWNo
aXAgVUFSVHMgb2YgdGhlIEFtbG9naWMKPj4KPj4KPj4gVGhpcyBpcyBhIGxpbmsgaXNzdWUuICBU
aGUgcmVzdCBpcyBhbiB1bnJlbGF0ZWQgZXJyb3IgaGFuZGxpbmcgZml4Lgo+PiBJdCBzaG91bGQg
cmVhbGx5IGJlIHNlbnQgYXMgdHdvIHBhdGNoZXMuCj4gCj4gSSdsbCB0YWtlIHRoZSBmaXJzdCB2
ZXJzaW9uIG9mIHRoaXMgcGF0Y2gsIHdoaWNoIGp1c3QgZGlkIHRoaXMgcG9ydGlvbiwKPiBhbmQg
dGhlIHJlc3QgY2FuIGJlIGFuIGluZGVwZW5kYW50IGNoYW5nZS4KPiAKPiB0aGFua3MsCj4gCj4g
Z3JlZyBrLWgKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
