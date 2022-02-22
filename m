Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74BC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlV4LcZswZF6DmGVkHO7ghn7V5aqtEnIn2ht2lbJDDw=; b=hBVwVsfFkdi+QY
	m3NyD1/1zSkaCwVvOsAxPP0suYU+6aTRZ1NRKK+/KdSImLh7G9U3xa1fKc7Iv5v6HQ9KU7qdn/EPy
	gI5Y6B0wWldiqvIS8r7CHZAXsVCuUMyxN+GCwz245kMDDiRzd8bIaZ6XIFtx+HmBQzW2LrCTzjSHI
	69vz63cRdgKTX57UXCodb/YYXvk4ouMzQ4uDpQECklCFu0brp3trM57ykc4oYb/seL8h+SHPAEmlI
	IEtxjoKYZ1KghHAaT/ymfxqg3jEDH9XK3g4nu6lO0NBOxGRQl7rOhGlEKAhYs6ys5s+fbVAnKN82r
	pgXtVthzr3Yv9Wu8LHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMU6B-009XEa-Cu; Tue, 22 Feb 2022 12:16:55 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMU67-009XBp-Q0; Tue, 22 Feb 2022 12:16:53 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87AF321102;
 Tue, 22 Feb 2022 12:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645532210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVdf8vg0qvzMS+2GhWg8uKMuS0wEUJUmGhQCjRnv8iA=;
 b=xN0BV/BxKJm7YJCApumTK7Jzkj0N+o/vGum7SA+cr4WsMJq0ceT7pXNDmE9p4lJMxVB5Qu
 EOyAiOGgcaypZhC6h6g5E+87vqgJ/iz6ul8L71V8Zr7t+8wzExLkQDqWHlUcsoRr7m226L
 trTgni3RUp5XzYxjOY4BfokGEGeUD1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645532210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVdf8vg0qvzMS+2GhWg8uKMuS0wEUJUmGhQCjRnv8iA=;
 b=jqx0APy4xTNeoCtOF2oDQRy3QyzZAdZr0+IWQToeeAn6Gb9UOL6HGy5lhJPouVobl3pcCy
 WnQNdcob+qcS88DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3842713BA0;
 Tue, 22 Feb 2022 12:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c8OWDDLUFGIyOAAAMHmgww
 (envelope-from <afaerber@suse.de>); Tue, 22 Feb 2022 12:16:50 +0000
Message-ID: <f0eeb2f4-b47d-f0d8-2169-388899d1cfdf@suse.de>
Date: Tue, 22 Feb 2022 13:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/6] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <3facc242-0ce6-9170-1fee-a5ec0a66660a@gmail.com>
 <CAMuHMdUnDQKtGuN+n-t3P8e4nf9VLB+9q8fGyCh643T4Y1Knag@mail.gmail.com>
 <288225b9-85e0-0c46-5d8b-c91f76c796e5@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <288225b9-85e0-0c46-5d8b-c91f76c796e5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_041652_035564_3AED020D 
X-CRM114-Status: GOOD (  22.67  )
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

T24gMjIuMDIuMjIgMTA6NDQsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPiBPbiAyMi4wMi4yMDIy
IDA5OjE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+IEhpIEhlaW5lciwKPj4KPj4gT24g
TW9uLCBGZWIgMjEsIDIwMjIgYXQgOToyNiBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFA
Z21haWwuY29tPiB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0
YW5tZWMgVE0xNjI4IDcgc2VnbWVudCBkaXNwbGF5Cj4+PiBjb250cm9sbGVyLiBJdCdzIGJhc2Vk
IG9uIHByZXZpb3VzIFJGQyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+Pj4gVGhlIFJGQyB2
ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGluIHRoZSBMRUQgc3Vic3lzdGVtLCBidXQgdGhpcyB3
YXMKPj4+IE5BSydlZCBieSB0aGUgTEVEIG1haW50YWluZXIuIFRoZXJlZm9yZSBJIG1vdmVkIHRo
ZSBkcml2ZXIgdG8KPj4+IC9kcml2ZXJzL2F1eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0IHJlYXNv
bmFibGUgdG8gbWUuCj4+Pgo+Pj4gRnVydGhlciBjaGFuZ2VzIHRvIHRoZSBSRkMgdmVyc2lvbjoK
Pj4+IC0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mgc3VwcG9ydCwgZm9y
IGRpc3BsYXlzIHRoYXQKPj4+ICAgZG9uJ3QgaGF2ZSBhbnkgc3ltYm9scyB0byBiZSBleHBvc2Vk
IGFzIExFRCdzLgo+Pj4gLSBTaW1wbGlmaWVkIHRoZSBjb2RlIGFuZCByZXdyb3RlIGEgbG90IG9m
IGl0Lgo+Pj4gLSBEcml2ZXIgaXMgbm93IGtpbmQgb2YgYSBNVlAsIGJ1dCBmdW5jdGlvbmFsaXR5
IHNob3VsZCBiZSBzdWZmaWNpZW50Cj4+PiAgIGZvciBtb3N0IHVzZSBjYXNlcy4KPj4+IC0gVXNl
IHRoZSBleGlzdGluZyA3IHNlZ21lbnQgc3VwcG9ydCBpbiB1YXBpL2xpbnV4L21hcF90b183c2Vn
bWVudC5oCj4+PiAgIGFzIHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCj4+Pgo+Pj4g
Tm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBmcm9tIG90aGVyIG1hbnVmYWN0dXJlcnMg
dGhhdCBhcmUKPj4+ICAgICAgIGFsbW9zdCBpZGVudGljYWwsIGUuZy4gRkQ2MjgsIFNNMTYyOC4g
T25seSBkaWZmZXJlbmNlIEkgc2F3IHNvCj4+PiAgICAgICBmYXIgaXMgdGhhdCB0aGV5IHBhcnRp
YWxseSBzdXBwb3J0IG90aGVyIGRpc3BsYXkgbW9kZXMuCj4+PiAgICAgICBUTTE2Mjg6IDZ4MTIs
IDd4MTEKPj4+ICAgICAgIFNNMTYyOEM6IDR4MTMsIDV4MTIsIDZ4MTEsIDd4MTAKPj4+ICAgICAg
IEZvciB0eXBpY2FsIGRpc3BsYXlzIG9uIGRldmljZXMgdXNpbmcgdGhlc2UgY2hpcHMgdGhpcwo+
Pj4gICAgICAgZGlmZmVyZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgo+Pj4KPj4+IFN1Y2Nlc3NmdWxs
eSB0ZXN0ZWQgb24gYSBUWDMgTWluaSBUViBib3ggdGhhdCBoYXMgYW4gU00xNjI4QyBhbmQgYQo+
Pj4gZGlzcGxheSB3aXRoIDQgZGlnaXRzIGFuZCA3IHN5bWJvbHMuCj4+Pgo+Pj4gVGVzdGVkLWJ5
OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4+Cj4+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCEKPj4KPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2RyaXZlcnMv
YXV4ZGlzcGxheS90bTE2MjguYwo+Pgo+Pj4gK3N0YXRpYyBpbnQgdG0xNjI4X3Nob3dfdGV4dChz
dHJ1Y3QgdG0xNjI4ICpzKQo+Pj4gK3sKPj4+ICsgICAgICAgc3RhdGljIFNFRzdfQ09OVkVSU0lP
Tl9NQVAobWFwX3NlZzcsIE1BUF9BU0NJSTdTRUdfQUxQSEFOVU0pOwo+Pgo+PiBUaGlzIG1hcHBp
bmcgY2FuIG5vdCBiZSBvdmVycmlkZGVuIGJ5IHRoZSB1c2VyLiAgSXMgdGhlcmUgYW55Cj4+IHNw
ZWNpZmljIHJlYXNvbiB5b3UgZGlkbid0IG1ha2UgdGhlIG1hcHBpbmcgY29uZmlndXJhYmxlIGZy
b20gc3lzZnMsCj4+IGNmci4gbWFwX3NlZzdfe3Nob3csc3RvcmV9KCkgaW4gaW5jbHVkZS91YXBp
L2xpbnV4L21hcF90b183c2VnbWVudC5oPwo+Pgo+IAo+IFRoZSBtb3JlIGZlYXR1cmVzIGFuIGlu
aXRpYWwgZHJpdmVyIHZlcnNpb24gaW5jbHVkZXMsIHRoZSBtb3JlIGRpc2N1c3Npb24KPiB0b3Bp
Y3MgcG9wIHVwIGFuZCBtYWtlIGl0IGxlc3MgbGlrZWx5IHRoYXQgd2UgZW5kIHVwIHdpdGggYXQg
bGVhc3Qgc29tZXRoaW5nLgo+IEkgdGhpbmsgdGhlcmUncyBhIHJlYXNvbiB3aHkgdGhlIGRyaXZl
ciB3YXMgcmVzdGluZyBzaW5jZSB0aGUgaW5pdGlhbAo+IGF0dGVtcHQgMiB5cnMgYWdvLiBUaGVy
ZWZvcmUgSSdkIGxpa2UgdG8ga2VlcCBpdCBhcyBhIE1WUC4gCj4gSWYgc29tZWJvZHkgc2hvdWxk
IGhhdmUgdGhlIG5lZWQgZm9yIGFkZC1vbiBmZWF0dXJlcywgdGhlbiB0aGV5IGNhbiBiZQo+IGFk
ZGVkIGxhdGVyLgoKQXMgSSBwb2ludGVkIG91dCBpbiB5b3VyIHYxLCBJIGRpZCBpbXBsZW1lbnQg
YWxsIHRoYXQgYWxyZWFkeSwgYXMgd2FzCnJlcXVlc3RlZCBieSBHZWVydCBvbiBteSBSRkM6Cgpo
dHRwczovL2dpdGh1Yi5jb20vYWZhZXJiZXIvbGludXgvY29tbWl0L2JiZWNmOTUxMzQ4YzdkZThi
YTkyMmM2YzAwMmEwOTM2OWI3MTdkODIKClJlZ2FyZHMsCkFuZHJlYXMKCi0tIApTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55CkdGOiBJdm8gVG90ZXYKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
