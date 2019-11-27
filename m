Return-Path: <SRS0=w3Gc=ZT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03289C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2019 21:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC9AD215A5
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2019 21:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVIseVbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC9AD215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTHaxUEiN45MDTyArvk5G6Dx0FWQRo2zDo4rVvN0RLI=; b=pVIseVbinejdPq
	NTe92CJZtQtGR1X/u/VFMw2iHijUjHx6BGSAgzXVFxRx7sHvos4ldwzX2D3oWK7wql7NLD/0qYBuA
	U3sU4nGJienag9tUMutPXv8jm5F74q2AMS/habAUIBT19Y/dHPcmABuTpwcyPSBB7fHbeEMtEjb6K
	EaDHFkHbapyqt7kalcIcWiBKpaUoxUYJXYm+8xEHRUkqP9V2zBnC5xyLn7y/xdt6Y9c3WGYjpNjlI
	vi1bH7G5STfO5oAb+U5ywkCrgFU3sSJszodcOFARNc15UcwYsSLMk0CwboO/9IrEOqfNMMc/UkxQo
	mm6bBANUDc5CqWOfP3sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia4Rx-00083H-KP; Wed, 27 Nov 2019 21:02:13 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia4Ru-00082O-SZ; Wed, 27 Nov 2019 21:02:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B612AC1A;
 Wed, 27 Nov 2019 21:02:09 +0000 (UTC)
Subject: Re: [PATCH 1/5] pinctrl: actions: Use the correct style for SPDX
 License Identifier
To: Nishad Kamdar <nishadkamdar@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
Date: Wed, 27 Nov 2019 22:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_130211_066496_3E8D419D 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW0gMjcuMTEuMTkgdW0gMTc6NDAgc2NocmllYiBOaXNoYWQgS2FtZGFyOgo+IFRoaXMgcGF0Y2gg
Y29ycmVjdHMgdGhlIFNQRFggTGljZW5zZSBJZGVudGlmaWVyIHN0eWxlIGluCj4gaGVhZGVyIGZp
bGUgcmVsYXRlZCBBY3Rpb25zIFNlbWkgT1dMIHBpbmN0cmwgZHJpdmVyLgoKT3dsCgo+IEZvciBD
IGhlYWRlciBmaWxlcyBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbGljZW5zZS1ydWxlcy5yc3QKPiBt
YW5kYXRlcyBDLWxpa2UgY29tbWVudHMgKG9wcG9zZWQgdG8gQyBzb3VyY2UgZmlsZXMgd2hlcmUK
PiBDKysgc3R5bGUgc2hvdWxkIGJlIHVzZWQpLgo+IAo+IENoYW5nZXMgbWFkZSBieSB1c2luZyBh
IHNjcmlwdCBwcm92aWRlZCBieSBKb2UgUGVyY2hlcyBoZXJlOgo+IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE5LzIvNy80Ni4KPiAKPiBTdWdnZXN0ZWQtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVy
Y2hlcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmlzaGFkIEthbWRhciA8bmlzaGFka2FtZGFyQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaCB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmggYi9k
cml2ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5oCj4gaW5kZXggZGFlMmU4MzYzZmQ1
Li5mZWVlN2FkN2UyN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGlu
Y3RybC1vd2wuaAo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmgK
PiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKyAqLwoKVGhpcyBpcyBub3Qg
YSB1YXBpIG9yIGFzbSBoZWFkZXIsIHdoaWNoIHRoYXQgLyogKi8gcnVsZSB3YXMgbGF0ZXIgYWRk
ZWQKZm9yLCBJIHRob3VnaHQ/Cgo+ICAvKgo+ICAgKiBPV0wgU29DJ3MgUGluY3RybCBkZWZpbml0
aW9ucwo+ICAgKgoKTm90IG9iamVjdGluZywganVzdCBtYWtpbmcgc3VyZSB3ZSdyZSBub3QgYmxp
bmRseSByZWZhY3RvcmluZyBjb2RlLgoKSWYgZG9pbmcgdGhpcywgSSBzdWdnZXN0IHVwZGF0aW5n
IHRvIEdQTC0yLjAtb3ItbGF0ZXIuCgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
