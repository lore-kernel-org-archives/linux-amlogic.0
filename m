Return-Path: <SRS0=1mM9=QG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDEFC282D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 09:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D9E220882
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 09:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1BctsW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D9E220882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmPyoxxmp+LKPK02hzAcmIoYao3isIZUWhnv9WVP7qY=; b=t1BctsW2T34fm/
	lP8OPZvDM4XNaK1/mVarzTFOu6tTAnoZBzogoQtfEdpOHTwpoAvzIOXA8qTaK8mqOhAKrp5Uk3HWv
	TuyiE0lqr9PPpQ8jtp6k0JUqsJTD1o1AQHX913dnk4hWsuvlh1rbenymWq7ZxZfol3kyuY8QcAGH5
	Dml3TX/s52wMT2WOz826dw6SkcntNUQOCKBIZ2j+ZxVESPm7g4bR4UyZ505zRlwCrRX3KUtxC/aoE
	3pAcLAEWAOAf2nhMUNUerTEuXcUPJfb0B+rASJBWRxw6cTN1Xmn04Cq0kJI75tSsu79cHAwUj4VFR
	/VzkXVxTX5DzXMmXET2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gomF2-0007jv-JA; Wed, 30 Jan 2019 09:33:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gomEp-0007W1-LA; Wed, 30 Jan 2019 09:33:06 +0000
X-Originating-IP: 90.88.147.226
Received: from xps13 (aaubervilliers-681-1-27-226.w90-88.abo.wanadoo.fr
 [90.88.147.226]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A026C40007;
 Wed, 30 Jan 2019 09:32:51 +0000 (UTC)
Date: Wed, 30 Jan 2019 10:32:50 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of
 ret on a call to meson_chip_buffer_init
Message-ID: <20190130103250.4080a3b3@xps13>
In-Reply-To: <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
References: <20190129105757.19138-1-colin.king@canonical.com>
 <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_013256_615100_7FF22012 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Colin King <colin.king@canonical.com>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTGlhbmcsIENvbGluLAoKTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4gd3Jv
dGUgb24gV2VkLCAzMCBKYW4gMjAxOSAxNzoyNjo0OQorMDgwMDoKCj4gSGkgQ29saW4sCj4gCj4g
T24gMjAxOS8xLzI5IDE4OjU3LCBDb2xpbiBLaW5nIHdyb3RlOgo+ID4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IAo+ID4gVGhlIGNhbGwgdG8gbWVz
b25fY2hpcF9idWZmZXJfaW5pdCBpcyBub3QgYXNzaWduaW5nIHJldCwgaG93ZXZlciwgcmV0Cj4g
PiBpcyBiZWluZyBjaGVja2VkIGZvciBmYWlsdXJlLiBGaXggdGhpcyBieSBhZGRpbmcgaW4gdGhl
IG1pc3NpbmcgYXNzaWdubWVudC4KPiA+IAo+ID4gRml4ZXM6IDJkNTcwYjM0YjQxYSAoIm10ZDog
cmF3bmFuZDogbWVzb246IGFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIE5BTkQgZmxhc2ggY29udHJv
bGxlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5v
bmljYWwuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyB8IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+IGluZGV4IGU4NThkNThk
OTdiMC4uYjljNTQzZDEwNTRjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMK
PiA+IEBAIC0xMjA2LDcgKzEyMDYsNyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2No
aXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPiA+ICAgCQlkZXZfZXJyKG5mYy0+ZGV2LCAiMTZi
aXRzIGJ1cyB3aWR0aCBub3Qgc3VwcG9ydGVkIik7Cj4gPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4g
PiAgIAl9Cj4gPiAtCW1lc29uX2NoaXBfYnVmZmVyX2luaXQobmFuZCk7Cj4gPiArCXJldCA9IG1l
c29uX2NoaXBfYnVmZmVyX2luaXQobmFuZCk7ICAKPiAKPiBMb29rcyBnb29kIHRvIG1lOgo+IAo+
IEFja2VkLWJ5OiBMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPgoKVGhpcyBpcyBu
YW5kL25leHQgbWF0ZXJpYWwsIHNvIGlmIHlvdSBkb24ndCBtaW5kIEkgd291bGQgbGlrZSB0byBz
cXVhc2gKdGhlIHR3byBmaXhlcyB5b3Ugc2VudCBpbnRvIHRoZSBvcmlnaW5hbCBjb21taXQgaW5z
ZXJ0aW5nIHRoZSBkcml2ZXIuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
