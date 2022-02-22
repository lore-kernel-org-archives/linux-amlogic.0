Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1FEC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 12:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0smzU1Nq0iIE3SwBqmPd0U6sBcisvxalg2UXCe9fqlg=; b=GBxvO/YK9oZc3Y
	CGuOqF5OrU3qMbX9/nxCOjblycqDNcpqpYlZ/5PRTzM3GmnHW6g/ysKxK7R+kxutoAeWeIDMDWyMF
	skM4jFuv7ZlUYfXieKwA5h37y5cFAUSUxd0QT+NkBlSSNB+f+TO7h+oAdAMEKBMyEfcEq0EDSKv33
	bgVxPiU22nH1rXxaqxP44D46ANP29vF0rv7uSrIhuiyt3FrHgorOMtw+ZjNPTtvSegkUdvM5dghZt
	BOfGqX+6AKwUh44zMlU804j0LKXp9O6wnJrKfCPeGfcJbEAc4QzezrU2eu7EeoLbYMwryWy097+Wi
	Vg6nRq29SVaWqfteNzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMU1a-009Vyf-Nh; Tue, 22 Feb 2022 12:12:10 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMU1W-009VxJ-NK; Tue, 22 Feb 2022 12:12:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DCA621121;
 Tue, 22 Feb 2022 12:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645531923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBS4PZuC5+c1ZpU++txl+EIwtRqM8ZeskcgSWVW+4/k=;
 b=WTn7eaAkRSaOG5LGXQqzUZ0ovpX2fidrabSGjkykDgrODy1E7xLzR7fpQA03NZSJxxgnil
 G+eBDe6QBZY7Rk5iVmrpIxYYNkQ3l/rv+ClXHrTxgbvR3sBi46KMc9Be4veoYCx2emHpmi
 33x7EFwoTvN40NeXMXTnT76gbT+NIL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645531923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBS4PZuC5+c1ZpU++txl+EIwtRqM8ZeskcgSWVW+4/k=;
 b=QVdm7W7T3DPjo2X5wYH2dArPdbrExgsn4WmWtY6w+3kAnYUCgkSFVkZJgcCf8FCVUIaRxQ
 Y8/tyYmp7YzZM1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37B3E13BA0;
 Tue, 22 Feb 2022 12:12:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OhssDBPTFGJfNQAAMHmgww
 (envelope-from <afaerber@suse.de>); Tue, 22 Feb 2022 12:12:03 +0000
Message-ID: <a890337b-39e4-f796-2d53-05edd2d69c80@suse.de>
Date: Tue, 22 Feb 2022 13:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
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
 <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
 <09bf3d8a-2902-723b-80d2-0c4d1c24f53d@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <09bf3d8a-2902-723b-80d2-0c4d1c24f53d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_041206_938515_84D79F82 
X-CRM114-Status: GOOD (  31.40  )
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

T24gMTkuMDIuMjIgMTg6MTYsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPiBPbiAxOS4wMi4yMDIy
IDE3OjA3LCBBbmRyZWFzIEbDpHJiZXIgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxOS4wMi4yMiAx
NDozNywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4gT24gMTkuMDIuMjAyMiAxNDoyNywgTWln
dWVsIE9qZWRhIHdyb3RlOgo+Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDI6MTMgUE0gSGVp
bmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IFRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQg
ZGlzcGxheQo+Pj4+PiBjb250cm9sbGVyLiBJdCdzIGJhc2VkIG9uIHByZXZpb3VzIFJGQyB3b3Jr
IGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+Pj4+PiBUaGUgUkZDIHZlcnNpb24gcGxhY2VkIHRoZSBk
cml2ZXIgaW4gdGhlIExFRCBzdWJzeXN0ZW0sIGJ1dCB0aGlzIHdhcwo+Pj4+PiBOQUsnZWQgYnkg
dGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRvCj4+Pj4+
IC9kcml2ZXJzL2F1eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0IHJlYXNvbmFibGUgdG8gbWUuCj4+
Pj4KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGxpbmsgdG8gdGhlIGRpc2N1c3Npb24gYW5kL29yIHN1
bW1hcml6ZSB0aGUgcmF0aW9uYWxlCj4+Pj4gYmVoaW5kIHRoZSBOQUs/Cj4+Pj4KPj4+Cj4+PiAr
UGF2ZWwKPj4+Cj4+PiBJIGRpZG4ndCBmaW5kIGFuIGV4cGxpY2l0IHJlYXNvbiwgYnV0IEkgc3Vw
cG9zZSBQYXZlbCBzZWVzIHRoaXMgZHJpdmVyIGFzCj4+PiBvbmUgdGhhdCBtYWtlcyB1c2Ugb2Yg
dGhlIExFRCBzdWJzeXN0ZW0sIGJ1dCBkb2Vzbid0IGJlbG9uZyB0byBpdC4KPj4+IEluIHRoZSBm
b2xsb3dpbmcgbWFpbCBoZSdzIGV4cHJlc3NpbmcgaGlzIG9waW5pb24gdGhhdCB0aGUgZHJpdmVy
IHNob3VsZAo+Pj4gYmUgYmVzdCBwbGFjZWQgdW5kZXIgYXV4ZGlzcGxheS4KPj4+Cj4+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjAwMjI2MTMwMzAwLkdCMjgw
MEBkdW8udWN3LmN6Lwo+Pgo+PiBBbmQgSSBkaXNhZ3JlZWQuIEl0IGRvZXMgbm90IGZpdCB3aXRo
IHRoZSBvdGhlciBkcml2ZXJzIGluIGF1eGRpc3BsYXkKPj4gdGhhdCB3ZXJlIG9wZXJhdGluZyBv
biBhIG11Y2ggaGlnaGVyIGxldmVsLgo+Pgo+IAo+IFdlIG5lZWQgdG8gZmluZCBhIHBsYWNlLiBB
bmQgaWYgUGF2ZWwgaGFzIGdvb2QgcmVhc29ucyB0aGF0IGl0IGRvZXNuJ3QKPiBmaXQgaW50byB0
aGUgTEVEIHN1YnN5c3RlbSwgYW5kIE1pZ3VlbCBzaG91bGQgYmUgZmluZSB3aXRoIGhhdmluZwo+
IGl0IGluIGF1eGRpc3BsYXksIHRoZW4gSSdkIHNlZSBubyByZWFzb24gdG8gbm90IGdvIHRoaXMg
d2F5Lgo+IAo+PiBJJ2QgYWxzbyBsaWtlIHRvIHBvaW50IG91dCB0aGF0IEkgZGlkIGltcGxlbWVu
dCB0aGUgbWFwX3RvXzdzZWdtZW50IEFQSSwKPiAKPiBMb29raW5nIGF0IHRoZSBoaXN0b3J5IG9m
IGluY2x1ZGUvdWFwaS9saW51eC9tYXBfdG9fN3NlZ21lbnQuaCBJIHNlZSBubwo+IGNvbW1pdCBm
cm9tIHlvdS4gU2VlbXMgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUuCgpZb3UncmUgcmVwbHlp
bmcgaW5saW5lIHRvbyBlYXJseToKCj4+IGFzIHdhcyBzdWdnZXN0ZWQsIGFzIHlvdSB3aWxsIGZp
bmQgaW4gbXkgdHJlZQoKQXMgSSBzYWlkLCBJIGltcGxlbWVudGVkIGl0IGluIG15IGRyaXZlcjoK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9hZmFlcmJlci9saW51eC9jb21taXQvYmJlY2Y5NTEzNDhjN2Rl
OGJhOTIyYzZjMDAyYTA5MzY5YjcxN2Q4MgoKVGh1cyBtZSBzYXlpbmcgeW91IGFyZSB1bm5lY2Vz
c2FyaWx5IGR1cGxpY2F0aW5nIHdvcmsgdGhhdCBJIGFscmVhZHkKZGlkLCB3aXRob3V0IHBpbmcn
aW5nIHRoZSB0aHJlYWQgb3IgbWUgYW5kIGNsYWltaW5nIHRoZSBjcmVkaXQgZm9yIGFuCmltcGxl
bWVudGF0aW9uIGNoYW5nZSB3aGljaCBJIGFscmVhZHkgZGlkIG15c2VsZi4KCj4+IC0gd2hpY2gg
eW91IG1heSBoYXZlCj4+IG1pc3NlZCwgcmVmZXJlbmNpbmcgb25seSB0aGUgUkZDIHBhdGNoc2V0
IGFuZCBwdXR0aW5nIHlvdXIgYXV0aG9yc2hpcCBvbgo+PiBpdCBleGNsdXNpdmVseT8gQSBtb3Zl
IGZyb20gb25lIGRpcmVjdG9yeSB0byBhbm90aGVyIHNob3VsZCBub3Qgd2FycmFudAo+PiBteSBh
dXRob3IgYW5kIFNvQiBnZXR0aW5nIHJlbW92ZWQgZnJvbSB0aGUgYWN0dWFsIGRyaXZlci4KPj4K
PiBUaGUgZHJpdmVyIGluY2x1ZGVzIG1ham9yIGNoYW5nZXMgYW5kIEkgbWVudGlvbmVkIHlvdXIg
d29yayBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZS4gQWxzbyB5b3VyIHN0aWxsIGxpc3RlZCBhcyBN
T0RVTEVfQVVUSE9SLiBNeSBpbnRlbnRpb24gaXMgdG8KPiBnZXQgYSBkcml2ZXIgdXBzdHJlYW0s
IG5vdCB0byBlYXJuIGNyZWRpdHMgZm9yIHNvbWV0aGluZy4KPiBTbyBzdXJlLCB5b3VyIFNvQiBj
YW4gYmUgKHJlLSlhZGRlZC4KCmh0dHBzOi8vZ2l0aHViLmNvbS9hZmFlcmJlci9saW51eC9jb21t
aXRzL3J0ZDEyOTUtbmV4dAoKQWxzbyBub3RlIHRoaXMgNS1pbi00IG9wdGltaXphdGlvbjoKCmh0
dHBzOi8vZ2l0aHViLmNvbS9hZmFlcmJlci9saW51eC9jb21taXQvZmY4Mjg0YjZlZDlkYzFlMzU0
YzM1ODQwYWZkYWY1MGIxY2Q5N2ZlYQoKQW5kIHNldmVyYWwgbW9yZSBjaGlwc2V0cyBiZWluZyBj
b3ZlcmVkLgoKPj4gR2l2ZW4gdGhhdCB3ZSBuZWVkIHRvIG1hbmFnZSBhIGJ1ZmZlciB3aXRoIGJp
dHMgcGVyIHNlZ21lbnQgb3IgTEVECj4+IHN5bWJvbCwgb25lIGlkZWEgdGhhdCBJIGhhdmVuJ3Qg
Zm91bmQgdGltZSBmb3IgeWV0IHdhcyB0byBpbXBsZW1lbnQgaXQKPj4gYXMgZnJhbWVidWZmZXIg
b3IgZHJtIGRldmljZSBpbnN0ZWFkLiAoQW5kIG1vc3QgUmVhbHRlayBwbGF0Zm9ybXMgZ290Cj4+
IGJyb2tlbiBieSByZW1vdmluZyB0aGUgYWRqdXN0YWJsZSB0ZXh0IGJhc2UgZGVmaW5lcy4pCj4+
Cj4gSSdtIG5vdCBhd2FyZSBvZiB0aGUgUmVhbHRlayBwbGF0Zm9ybSBpc3N1ZSwgZG8geW91IGhh
dmUgYSBsaW5rIHRvIGEKPiByZWxhdGVkIGRpc2N1c3Npb24/CgpSZWFsdGVrIGhhcyBhIGJvb3Qg
Uk9NIGF0IHRoZSBiZWdpbm5pbmcgb2YgbWVtb3J5IHNwYWNlLCB3aGljaCBoYXMgYmVlbgphIHBy
b2JsZW0gZnJvbSB0aGUgZmlyc3QgUkZDIGFuZCBmb3IgbW9zdCBib290bG9hZGVycyByZXF1aXJl
ZCB0byB0d2Vhawp0aGUga2VybmVsJ3MgdGV4dCBvZmZzZXQgZm9yIHN1Y2Nlc3NmdWwgYm9vdC4g
KFNvbWUgbm90IE9wZW4gU291cmNlIChMSykKYW5kL29yIG5vdCBvcGVubHkgZmxhc2hhYmxlLikK
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1hcm0ta2VybmVsLzIw
MTctRmVicnVhcnkvNDg3NzE4Lmh0bWwKCkluIDIwMjAgdGhhdCBhcm02NCBmZWF0dXJlIGdvdCBy
ZW1vdmVkIHdpdGhvdXQgYW55IGZ1cnRoZXIgZGlzY3Vzc2lvbjoKCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIwMDgyNTEzNTQ0MC4xMTI4OC0xLWFyZGJAa2VybmVsLm9yZy8KCkkndmUg
dHJpZWQgdG8gcmV2ZXJ0IGl0LCBidXQgdGhhdCdzIGJlZW4gYSBwYWluOgoKaHR0cHM6Ly9naXRo
dWIuY29tL2FmYWVyYmVyL2xpbnV4L2NvbW1pdC8wZDJjNjQ3NzgxYmM4OWVlOTViZmE3YjgwZDcx
MjM3YzdlYmVhMjMwCgo+IEFuZCB3b3VsZG4ndCB5b3UgdGhpbmsgaXQncyBvdmVyZW5naW5lZXJp
bmcgdG8KPiB3cml0ZSBhIERSTSBkcml2ZXIgZm9yIGEgNyBzZWdtZW50IGRpc3BsYXkgd2l0aCA0
IGRpZ2l0cz8KPiBGcmFtZWJ1ZmZlciBzZWVtcyB0byBiZSBkZXByZWNhdGVkIGJhc2VkIG9uIG15
IGV4cGVyaWVuY2Ugd2l0aAo+IHB5Z2FtZSAvIFNETDIuCgpJcyB0aGVyZSBhbnkgb3RoZXIgQVBJ
IHRoYXQgd291bGQgYWxsb3cgdXNlcnNwYWNlIHRvIHdyaXRlIHRvIHRoZSBidWZmZXIKYW5kIGJp
dGJsdCBwYXJ0cyB0byB0aGUgU1BJIGRldmljZT8KClRoaW5raW5nIG9mIHNvbWUgb3B0aW1pemF0
aW9ucyBJIGltcGxlbWVudGVkIGluIG15IGRyaXZlciB0byBhdm9pZAp1bm5lY2Vzc2FyeSBTUEkg
dHJhbnNmZXJzOgoKaHR0cHM6Ly9naXRodWIuY29tL2FmYWVyYmVyL2xpbnV4L2NvbW1pdC80NmM0
MDIwOWRiMTYzYTgxNDc0YzY4OTRlYmJkOTBiNWUyMzhjZTYwCgpSZWdhcmRzLApBbmRyZWFzCgot
LSAKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQpHRjogSXZvIFRvdGV2CkhSQiAzNjgwOSAoQUcgTsO8cm5i
ZXJnKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
