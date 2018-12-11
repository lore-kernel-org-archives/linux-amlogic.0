Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B3DC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 01:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AD820851
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 01:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oUN5SSda"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AD820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dODE44RqIJBWwreSfWU5j1pHxgto8/FrEjwp2RH2jbk=; b=oUN5SSdamc/kjH0efmzA7sWrF
	WrfkNn8B3vwpjXAx8AM8nDDnqbyoQ7ab00BjCWCOw+VX1oDRyWS4H6DoUHq3uEyYrDhhG1yYTmb4Q
	2CXYN74KrEyZcmJEx2x6Z/VdkCUOiJ72rpz8CL9totQEv0qXfVBJZfFc4Otf7JfTZSEbmdyBU0x3a
	nnpknpgwf5iHPZpZkEbb5X/YLjYWQzS6qInTChQ9DwPs6blLdNZt0Z1D/CESK7EYhFeVjKRs6IclA
	AfLGAyyymb3mXROmunB1Mq4OS1NK6gcyQJiU/aI8sU2u7M7MEJTFv1nbokvyhOzOCMWnqWtHKKFvi
	tsMIY7g2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWXHh-0003TB-0x; Tue, 11 Dec 2018 01:56:29 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWXHW-0003MP-9F; Tue, 11 Dec 2018 01:56:20 +0000
Received: from [10.28.18.115] (10.28.18.115) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 11 Dec
 2018 09:56:25 +0800
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13>
 <823825a3-86fb-9a20-ae29-85cc52d44093@amlogic.com>
 <20181210123809.5ade45c4@bbrezillon>
 <79a797c2-f37f-7f7c-e907-2d3c2283ec2d@amlogic.com>
 <20181210155057.38788656@xps13>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <d60bac6f-732d-0ddc-2644-17f650dfa885@amlogic.com>
Date: Tue, 11 Dec 2018 09:56:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.3.2
MIME-Version: 1.0
In-Reply-To: <20181210155057.38788656@xps13>
Content-Language: en-US
X-Originating-IP: [10.28.18.115]
X-ClientProxiedBy: mail-sz2.amlogic.com (10.28.11.6) To mail-sz2.amlogic.com
 (10.28.11.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_175618_324141_EA49EECA 
X-CRM114-Status: GOOD (  14.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMjAxOC8xMi8xMCAyMjo1MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBMaWFuZywKPiAKPiBMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPiB3cm90ZSBv
biBNb24sIDEwIERlYyAyMDE4IDIwOjEyOjM5Cj4gKzA4MDA6Cj4gCj4+IE9uIDIwMTgvMTIvMTAg
MTk6MzgsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPj4+IE9uIE1vbiwgMTAgRGVjIDIwMTggMTk6
MjM6NDYgKzA4MDAKPj4+IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dpYy5jb20+IHdyb3Rl
Ogo+Pj4gICAgCj4+Pj4+PiArCQkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkKys7Cj4+Pj4+PiArCQkJ
Y29udGludWU7Cj4+Pj4+PiArCQl9Cj4+Pj4+PiArCQltdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQg
Kz0gRUNDX0VSUl9DTlQoKmluZm8pOwo+Pj4+Pj4gKwkJYml0ZmxpcHMgPSBtYXhfdCh1MzIsIGJp
dGZsaXBzLCBFQ0NfRVJSX0NOVCgqaW5mbykpOwo+Pj4+Pj4gKwl9Cj4+Pj4+Cj4+Pj4+IEFyZSB5
b3Ugc3VyZSB5b3UgaGFuZGxlIGNvcnJlY3RseSBlbXB0eSBwYWdlcyB3aXRoIGJmPwo+Pj4+PiAg
ICAgPj4gaWYgc2NyYW1ibGUgaXMgZW5hYmxlLCBpIHdvdWxkIHNheSB5ZXMgaGVyZS4KPj4+PiB3
aGVuIHNjcmFtYmxlIGlzIGRpc2FibGVkLCBpIGFtIGNvbnNpZGVyaW5nIGhvdyB0byB1c2UgdGhl
IGhlbHBlcgo+Pj4+IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuaywgYnV0IGl0IHNlZW1zIHRo
YXQgaSBjYW4ndCBnZXQgdGhlIGVjYwo+Pj4+IGJ5dGVzIHdoaWNoIGlzIGNhY3VsYXRlZCBieSBl
Y2MgZW5naW5lLmJ5IHRoZSB3YXksIG5mYyBkbWEgZG9lc24ndCBzZW5kCj4+Pj4gb3V0IHRoZSBl
Y2MgcGFyaXR5IGJ5dGVzLgo+Pj4KPj4+IEV2ZW4gaWYgdGhlIEVDQyBlbmdpbmUgaXMgZGlzYWJs
ZWQ/Cj4+PiAgICAKPj4gTm8uCj4+IFdoZW4gRUNDIGVuZ2luZSBpcyBkaXNhYmxlZCwgaXQgY2Fu
IHJlYWQgdGhlIGVjYyBwYXJpdHkgYnl0ZXMgOyBidXQgdGhlcmUgaXMgYW5vdGhlciBwcm9ibGVt
IHRoYXQgaSBuZWVkIHRvIGNvbnNpZGVyIGhvdyBjb2RlIHN0cnVjdCBsb29rcyBiZXR0ZXIgd2hl
biByZWFkaW5nIGVycm9yIHdpdGggZWNjIG9wZW5lZCBhbmQgdGhlbiB0cnkgdG8gcmF3IHJlYWQu
Cj4+IElzIHRoZXJlIGEgZ29vZCBpZGVhPwo+IAo+IFdoZW4gcmVhZGluZyB3aXRoIEVDQyBlbmFi
bGVkLCBpbiBjYXNlIG9mIHVuY29ycmVjdGFibGUgZXJyb3IgeW91Cj4gbXVzdCByZS1yZWFkIHdp
dGhvdXQgRUNDLCB0aGVuIGNoZWNrIGlmIHRoZSBwYWdlIGlzIGVtcHR5IG9yIG5vdCB3aXRoCj4g
dGhlIGNvcmUgaGVscGVycyAobmFuZF9jaGVja19lcmFzZWRfKigpKS4KPiAKPiBJcyB0aGlzIHdo
YXQgeW91IG1lYW50Pwo+IAp5ZXMuIHdoZW4gdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IsIGkgbmVl
ZCBmaXJzdGx5IHJlYWQgb3V0IHRoZSBFQ0MgYnl0ZXMgCndpdGhvdXQgRUNDIGVuZ2luZSBhbmQg
dGhlbiB1c2UgdGhlIGhlbHBlciBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsgCnRvIGNoZWNr
IGlmIGJsYW5rIHBhZ2UuCk9mIGNvdXJzZSwgdGhlIHByZWNvbmRpdGlvbiBpcyB3aXRob3V0IHNj
cmFtYmxlciwgb3IgdGhlIGJsYW5kIHBhZ2UgY2FuIApiZSBkZXRlY3RlZCBieSBtZXNvbiBORkMu
Cgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
