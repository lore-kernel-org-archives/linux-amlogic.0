Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0291FC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngwhngGXDGyAUxHjGG34sOa6l5P7pXDhy34KGdckUu4=; b=F1a0x1HTvQRfa9
	QaAKkspbAjgcf4JVMmvJ9Zij+7n7CjvBOJLM+TVrRtxdYQsTmdWJDy7ewok+/sKEMBo9a1pQD5aFD
	++Cz7oWDnb/jsUUrAKVye1OBwArU5cWclS4gg/QZDZnciUcSp+LNxtJNP42yh5Up9EsDXUzowElEH
	hv6M7ChiMQhRXjY2DRKnDpbEr1m5gbsBj0fOFehdMsvxinH5S/67B7FiKszlyfGxKBB/wXmZk/KTx
	Cx6dV6qTn3X+Qu2Apt+IzofCGCamZ2MCutM+FZZouvFdiO8KB0TOhRguHbwVVKtGkYga1TQOEfYqz
	J1cGxpBfKkBSaeNGHpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLSGn-00HHOA-BO; Sat, 19 Feb 2022 16:07:37 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLSGl-00HHNN-2l; Sat, 19 Feb 2022 16:07:36 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 187CB1F383;
 Sat, 19 Feb 2022 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645286851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67vyA+/JoVwRl9ijXv5MoWJd9YvlyqCs+TE+hZgFsOo=;
 b=BbwEUhv2ho6hZ4aoxLOLOJqgRs0f50gpmvevSmGgYBUhKSsQWhriA+Ns+bh81rsyOmdc67
 l86hPS5BC7iV5vjbuv49ttk7RiK24p/QiUpzcTw7uBqdk9i4Gu78SWwA3N8i1hElGrVaks
 fTE7oTDpJwysxivmZj2w6OAGzOMIvFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645286851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67vyA+/JoVwRl9ijXv5MoWJd9YvlyqCs+TE+hZgFsOo=;
 b=nlYvjuP/5QEXyBSEmCpneeLSt6AQY8kFk3SQosrqFk8Uio7gFfnW22m/5mWpevvkRJ45A7
 SDN91lBcq1tVhaBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AADEA1338F;
 Sat, 19 Feb 2022 16:07:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 06TFJ8IVEWKsbAAAMHmgww
 (envelope-from <afaerber@suse.de>); Sat, 19 Feb 2022 16:07:30 +0000
Message-ID: <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
Date: Sat, 19 Feb 2022 17:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
 <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_080735_321580_051238D2 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxOS4wMi4yMiAxNDozNywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDE5LjAy
LjIwMjIgMTQ6MjcsIE1pZ3VlbCBPamVkYSB3cm90ZToKPj4gT24gU2F0LCBGZWIgMTksIDIwMjIg
YXQgMjoxMyBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToK
Pj4+Cj4+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUaXRhbm1lYyBUTTE2Mjgg
NyBzZWdtZW50IGRpc3BsYXkKPj4+IGNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMg
UkZDIHdvcmsgZnJvbSBBbmRyZWFzIEbDpHJiZXIuCj4+PiBUaGUgUkZDIHZlcnNpb24gcGxhY2Vk
IHRoZSBkcml2ZXIgaW4gdGhlIExFRCBzdWJzeXN0ZW0sIGJ1dCB0aGlzIHdhcwo+Pj4gTkFLJ2Vk
IGJ5IHRoZSBMRUQgbWFpbnRhaW5lci4gVGhlcmVmb3JlIEkgbW92ZWQgdGhlIGRyaXZlciB0bwo+
Pj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4K
Pj4KPj4gQ291bGQgeW91IHBsZWFzZSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uIGFuZC9vciBzdW1t
YXJpemUgdGhlIHJhdGlvbmFsZQo+PiBiZWhpbmQgdGhlIE5BSz8KPj4KPiAKPiArUGF2ZWwKPiAK
PiBJIGRpZG4ndCBmaW5kIGFuIGV4cGxpY2l0IHJlYXNvbiwgYnV0IEkgc3VwcG9zZSBQYXZlbCBz
ZWVzIHRoaXMgZHJpdmVyIGFzCj4gb25lIHRoYXQgbWFrZXMgdXNlIG9mIHRoZSBMRUQgc3Vic3lz
dGVtLCBidXQgZG9lc24ndCBiZWxvbmcgdG8gaXQuCj4gSW4gdGhlIGZvbGxvd2luZyBtYWlsIGhl
J3MgZXhwcmVzc2luZyBoaXMgb3BpbmlvbiB0aGF0IHRoZSBkcml2ZXIgc2hvdWxkCj4gYmUgYmVz
dCBwbGFjZWQgdW5kZXIgYXV4ZGlzcGxheS4KPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1hcm0ta2VybmVsLzIwMjAwMjI2MTMwMzAwLkdCMjgwMEBkdW8udWN3LmN6LwoKQW5kIEkg
ZGlzYWdyZWVkLiBJdCBkb2VzIG5vdCBmaXQgd2l0aCB0aGUgb3RoZXIgZHJpdmVycyBpbiBhdXhk
aXNwbGF5CnRoYXQgd2VyZSBvcGVyYXRpbmcgb24gYSBtdWNoIGhpZ2hlciBsZXZlbC4KCkknZCBh
bHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgSSBkaWQgaW1wbGVtZW50IHRoZSBtYXBfdG9fN3Nl
Z21lbnQgQVBJLAphcyB3YXMgc3VnZ2VzdGVkLCBhcyB5b3Ugd2lsbCBmaW5kIGluIG15IHRyZWUg
LSB3aGljaCB5b3UgbWF5IGhhdmUKbWlzc2VkLCByZWZlcmVuY2luZyBvbmx5IHRoZSBSRkMgcGF0
Y2hzZXQgYW5kIHB1dHRpbmcgeW91ciBhdXRob3JzaGlwIG9uCml0IGV4Y2x1c2l2ZWx5PyBBIG1v
dmUgZnJvbSBvbmUgZGlyZWN0b3J5IHRvIGFub3RoZXIgc2hvdWxkIG5vdCB3YXJyYW50Cm15IGF1
dGhvciBhbmQgU29CIGdldHRpbmcgcmVtb3ZlZCBmcm9tIHRoZSBhY3R1YWwgZHJpdmVyLgoKR2l2
ZW4gdGhhdCB3ZSBuZWVkIHRvIG1hbmFnZSBhIGJ1ZmZlciB3aXRoIGJpdHMgcGVyIHNlZ21lbnQg
b3IgTEVECnN5bWJvbCwgb25lIGlkZWEgdGhhdCBJIGhhdmVuJ3QgZm91bmQgdGltZSBmb3IgeWV0
IHdhcyB0byBpbXBsZW1lbnQgaXQKYXMgZnJhbWVidWZmZXIgb3IgZHJtIGRldmljZSBpbnN0ZWFk
LiAoQW5kIG1vc3QgUmVhbHRlayBwbGF0Zm9ybXMgZ290CmJyb2tlbiBieSByZW1vdmluZyB0aGUg
YWRqdXN0YWJsZSB0ZXh0IGJhc2UgZGVmaW5lcy4pCgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQpHRjogSXZvIFRvdGV2CkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
