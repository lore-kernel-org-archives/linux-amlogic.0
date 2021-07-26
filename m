Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B24CC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 12:32:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC5A60F44
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCC5A60F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV7PwmgwAXjg+6jqfc3gFF8dgynwKbs4sofJm6BWCwQ=; b=bef/4daBufAh9kylg9f/F3N//q
	GSNlYZxUnS7qZocztbtaWdOOt3D0skv3JsiMybusIzwatuA64avgb/yB/DIt6SxFVMfEknbGDbMgj
	vGy+NuW0nqcP2j4puxi7UpGxe2CYyePXIWXM6HAbYkvYqQFETV/uJunJyyMa8agm1J5adaDh/ZjWp
	YPIy+/vwNrDiktUTLdf30tIhR6xGyzuQEJ//AQUmXQ00f2XmBBhuA18eireaJi2NtahC9sEmChbm7
	7zzhxkpYCr2gUv5Om2drpS77RTb+8/auvIK/HUPKQrMm32FvpmKTKbxe9SkxlzSY0pTLV0GRtWekk
	UiC3PPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7zmp-00B9uk-Vq; Mon, 26 Jul 2021 12:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7zm5-00B9X8-7w; Mon, 26 Jul 2021 12:32:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 261A331B;
 Mon, 26 Jul 2021 05:31:57 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B42183F70D;
 Mon, 26 Jul 2021 05:31:55 -0700 (PDT)
Subject: Re: Random reboots on ODROID-N2+
To: Stefan Agner <stefan@agner.ch>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Byron Stanoszek <gandalf@winds.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mike Rapoport <rppt@kernel.org>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
 <alpine.LNX.2.23.451.2107221723060.2673@winds.org>
 <c2a16fbc-653f-5993-f9bb-9ee8c707515e@arm.com>
 <d1fefb1ec2e7ed1b40083426ed7102c6@agner.ch>
 <216a006d-6df0-4229-d2c1-32256853c857@arm.com>
 <0067ee4c-b9d2-1c92-2444-759ac9a56de0@arm.com>
 <50c6925775c207d0751e20fa9d45611a@agner.ch>
 <e0cd09ed-6c24-2bc6-c09a-0c0ccb7ae6c4@baylibre.com>
 <6987e3b18fc5ef7ac7344fec0d7010af@agner.ch>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fcc115ac-1fac-95bf-8ff0-55b50be92da9@arm.com>
Date: Mon, 26 Jul 2021 13:31:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6987e3b18fc5ef7ac7344fec0d7010af@agner.ch>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_053201_422359_2B81ABF0 
X-CRM114-Status: GOOD (  27.99  )
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

T24gMjAyMS0wNy0yNiAxMzowNywgU3RlZmFuIEFnbmVyIHdyb3RlOgo+IEZXSVcsIEkgZGlkIHJ1
biB0d28gYm9hcmRzIG92ZXIgdGhlIHdlZWtlbmQgd2l0aCBzdHJlc3Mtbmcgdm0gdGVzdAo+IHJ1
bm5pbmcgdG8gY2F1c2UgbWVtb3J5IHByZXNzdXJlLCBvbmUgYm9hcmQgd2l0aCA4YTVhNzVlNWU5
ZTU1ICgib2YvZmR0Ogo+IE1ha2Ugc3VyZSBuby1tYXAgZG9lcyBub3QgcmVtb3ZlIGFscmVhZHkg
cmVzZXJ2ZWQgcmVnaW9ucyIpIHJldmVydGVkLgo+IFRoZSBvbmUgd2l0aG91dCB0aGUgcmV2ZXJ0
IGNyYXNoZWQgYWZ0ZXIgfjI0aCwgdGhlIG90aGVyIGRpZCBydW4gdGhyb3VnaAo+IHRoZSB3ZWVr
ZW5kLiBCYXNpY2FsbHkgY29uZmlybWluZyB3aGF0IEJ5cm9uIHJlcG9ydGVkLgo+IAo+IE9uIDIw
MjEtMDctMjYgMDk6NTQsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjMv
MDcvMjAyMSAyMTo0OCwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+Pj4gT24gMjAyMS0wNy0yMyAxOTo0
NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4+IE9uIDIwMjEtMDctMjMgMTc6MTQsIFJvYmluIE11
cnBoeSB3cm90ZToKPj4+Pj4gT24gMjAyMS0wNy0yMyAxNjo1NiwgU3RlZmFuIEFnbmVyIHdyb3Rl
Ogo+Pj4gPHNuaXA+Cj4+Pj4+Pj4KPj4+Pj4+PiBCb290aW5nIHdpdGggImVmaT1kZWJ1ZyIgc2hv
dWxkIChhbW9uZyBvdGhlciB0aGluZ3MpIHByaW50IHRoZSBtZW1vcnkKPj4+Pj4+PiBtYXAgYXQg
Ym9vdCBpZiB5b3Ugd2FudCB0byBkb3VibGUtY2hlY2sgdGhhdCB0aGF0IGlzIHRoZSBzb3VyY2Ug
b2YgdGhlCj4+Pj4+Pj4gbWlzbWF0Y2guIE91ciBFRkkgY29kZSBzaG91bGQgYmUgcGVyZmVjdGx5
IGNhcGFibGUgb2Ygc2V0dGluZyB0aGUKPj4+Pj4+PiBtZW1ibG9jayBmbGFnIGlmIHRoZSByZWdp
b24gKmlzKiBkZXNjcmliZWQgYXBwcm9wcmlhdGVseSwgc2VlCj4+Pj4+Pj4gcmVzZXJ2ZV9yZWdp
b25zKCkgaW4gZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLWluaXQuYy4KPj4+Pj4+Cj4+Pj4+PiBC
b290aW5nIDUuMTIuMTAgd2l0aCAiZWZpPWRlYnVnIiBvbiBVLUJvb3QgMjAyMS4wNCBnYXZlIHRo
aXM6Cj4+Pj4+PiBbwqDCoMKgIDAuMDAwMDAwXSBNYWNoaW5lIG1vZGVsOiBIYXJka2VybmVsIE9E
Uk9JRC1OMlBsdXMKPj4+Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIGVmaTogR2V0dGluZyBVRUZJIHBh
cmFtZXRlcnMgZnJvbSAvY2hvc2VuIGluIERUOgo+Pj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gZWZp
OiBVRUZJIG5vdCBmb3VuZC4KPj4+Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIE9GOiBmZHQ6IFJlc2Vy
dmVkIG1lbW9yeTogZmFpbGVkIHRvIHJlc2VydmUgbWVtb3J5IGZvcgo+Pj4+Pj4gbm9kZSAnc2Vj
bW9uQDUwMDAwMDAnOiBiYXNlIDB4MDAwMDAwMDAwNTAwMDAwMCwgc2l6ZSAzIE1pQgo+Pj4+Pj4K
Pj4+Pj4+IFNvIGl0IHNlZW1zIFVFRkkgaXMgbm90IGluIHRoZSBwbGF5IGhlcmU/Cj4+Pj4+Cj4+
Pj4+IEFoLCBPSywgaW4gdGhhdCBjYXNlIEkgZ3Vlc3MgdGhlIHF1ZXN0aW9uIHJlbWFpbnMgd2h5
IGRvZXMgZWFybHlfaW5pdF9kdF9yZXNlcnZlX21lbW9yeV9hcmNoKCkgdGhpbmsgdGhlIHJlZ2lv
biBpcyBhbHJlYWR5IHJlc2VydmVkPyBNeSBpbnN0aW5jdGl2ZSBhc3N1bXB0aW9uIHdhcyBhbiBF
RkkgbWVtb3J5IG1hcCBiZWluZyBwcmVzZW50OyBzZWVpbmcgdGhhdCBVLUJvb3QgZG9lcyBpbmRl
ZWQgcmVmbGVjdCBEVCByZXNlcnZhdGlvbnMgdGhlcmUgKmFuZCogaGFzIGhhZCBhIGxpa2VseS1s
b29raW5nIGJ1ZyByZWNlbnRseSB3YXMgdGhlbiBqdXN0IG92ZXJ3aGVsbWluZ2x5IHN1Z2dlc3Rp
dmUgOikKPj4+Pgo+Pj4+IEFjdHVhbGx5LCBwb2tpbmcgYXQgVS1Cb290IGEgYml0IG1vcmUgSSBm
aW5kCj4+Pj4gbWVzb25fYm9hcmRfYWRkX3Jlc2VydmVkX21lbW9yeSgpIC0gY2FuIHlvdSBjaGVj
ayAvc3lzL2Zpcm13YXJlL2ZkdAo+Pj4+IGFuZCBzZWUgaWYgdGhlIHJlZ2lvbiBlbmRzIHVwIGJl
aW5nIHBhc3NlZCBhcyBhIC9tZW1yZXNlcnZlLyBhcyB3ZWxsCj4+Pj4gYXMgYSBwcm9wZXIgcmVz
ZXJ2ZWQtbWVtb3J5IG5vZGU/Cj4+Pj4KPj4+PiBJSVJDIHRoZSBzZW1hbnRpY3Mgb2YgL21lbXJl
c2VydmUvIGFyZW4ndCByZWFsbHkgd2VsbC1kZWZpbmVkIGVub3VnaAo+Pj4+IHRvIGJlIHN1aXRh
YmxlIGZvciB0aGUga2luZCBvZiB0aGluZ3Mgd2hpY2ggcmVxdWlyZSBuby1tYXAsIGFuZCBteSBu
ZXcKPj4+PiBndWVzcyBpcyB0aGF0IHRoYXQncyB3aGF0IGVuZHMgdXAgY29uZmxpY3RpbmcgaGVy
ZS4KPj4+Cj4+PiBTZWVtcyB0byBiZSBwcmVzZW50IGluIGJvb3RoOgo+Pgo+PiBJbmRlZWQsIGlu
IG9yZGVyIHNvIHN1cHBvcnQgYW55IGNvbWJpbmF0aW9uOgo+PiAtIHVwc3RyZWFtIHUtYm9vdAo+
PiAtIHZlbmRvciB1LWJvb3QKPj4gLSB1cHN0cmVhbSBsaW51eAo+PiAtIG90aGVyIE9TCj4+Cj4+
IFRoZSBzZWNtb24gaXMgaW4gdGhlIHVwc3RyZWFtIExpbnV4IERULCBhbmQgdXBzdHJlYW0gdS1i
b290IHJlYWRzIHRoZQo+PiBzZWN1cmUgbWVtb3J5IHJlZ2lvbnMKPj4gZnJvbSB0aGUgZmlyc3Qg
c3RhZ2UgYm9vdGxvYWRlcnMgYW5kIGFkZHMgdGhlbSBpbnRvIHRoZSBEVCBtZW1yZXNlcnZlLgo+
Pgo+PiBJdCB3b3JrZWQgZmluZSBzaW5jZSBMaW51eCA0LjEwLWlzaCwgdW50aWwgNS4xMC4KPiAK
PiBKdXN0IHZlcmlmaWVkIHdoYXQgaXMgcHJvYmFibHkgb2J2aW91cyBhdCB0aGlzIHBvaW50OiBC
eSByZW1vdmluZwo+IG1lc29uX2JvYXJkX2FkZF9yZXNlcnZlZF9tZW1vcnkoKSB0aGUgL21lbXJl
c2VydmUvIHJlZ2lvbiBpc24ndCBwcmVzZW50Cj4gYW5kICJmYWlsZWQgdG8gcmVzZXJ2ZSBtZW1v
cnkiIG1lc3NhZ2UgZGlzYXBwZWFycyBpbmRlZWQuCj4gCj4gV2h5IGlzIHJlc2VydmluZyBtZW1v
cnkgbm90IGVub3VnaD8gRnJvbSB3aGF0IEkndmUgcmVhZCBuby1tYXAgYWxzbyBtYWtlCj4gc3Vy
ZSB0aGVyZSBpcyBubyBWTSBtYXBwaW5nLCBidXQgaWYgdGhlIHJlZ2lvbiBpcyByZXNlcnZlZCwg
c2hvdWxkbid0Cj4gdGhhdCBiZSBlbm91Z2ggZm9yIExpbnV4IHRvIG5vdCBhY2Nlc3MgdGhlIHJl
Z2lvbj8gSSd2ZSByZWFkIHRoYXQgbm8tbWFwCj4gYWxzbyBwcmV2ZW50c2FjY2VzcyBkdWUgdG8g
c3BlY3VsYXRpb24sIGlzIHRoaXMgd2hhdCBpcyBoYXBwZW5pbmcgaGVyZT8KCkFsbW9zdCBjZXJ0
YWlubHkgLSBiZWluZyByZXNlcnZlZCBlaXRoZXIgd2F5IG1lYW5zIHRoYXQgTGludXggd29uJ3Qg
dHJ5IAp0byBhY2Nlc3MgdGhvc2UgcGFnZXMgZGlyZWN0bHksIGJ1dCBpZiB0aGV5IGFyZSBzdGls
bCBwcmVzZW50IGluIHRoZSAKbGluZWFyIG1hcCBhcyBOb3JtYWwgbWVtb3J5IHdoaWNoIGFsbG93
cyBzcGVjdWxhdGlvbiwgbGVnaXRpbWF0ZSBhY2Nlc3MgCnRvIGFkamFjZW50IHBhZ2VzIG1heSB3
ZWxsIGNhdXNlIHRoZSBDUFUgdG8gZW5kIHVwIHByZWZldGNoaW5nIGludG8gdGhlbS4KCj4gV2hh
dCBpcyB0aGUgcHJvcGVyIHNvbHV0aW9uIGhlcmU/IENvdWxkIG1heWJlCj4gbWVzb25fYm9hcmRf
YWRkX3Jlc2VydmVkX21lbW9yeSgpIGNoZWNrIGlmIHJlc2VydmVkLW1lbW9yeSBpcyBwcmVzZW50
LAo+IGFuZCBpZiBzbyBhdm9pZCBhZGRpbmcgL21lbXJlc2VydmUvPwoKUGVyaGFwcywgYWx0aG91
Z2ggaXQgZG9lc24ndCBoZWxwIHBlb3BsZSB3aG8gY2FuJ3Qgb3IgZG9uJ3Qgd2FudCB0byAKdXBk
YXRlIHRoZWlyIGZpcm13YXJlLiBBcyBJIHNheSwgSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGV4cGVj
dGF0aW9ucyBhcmUgCnN1cHBvc2VkIHRvIGJlIGZvciAvbWVtcmVzZXJ2ZS8sIHBhcnRpY3VsYXJs
eSBpZiBpdCBkdXBsaWNhdGVzIApyZXNlcnZlZC1tZW1vcnkuIEZ1cnRoZXJtb3JlLCBsb29raW5n
IGF0IDhhNWE3NWU1ZTllNTUgSSdtIGFsc28gbm90IApyZWFsbHkgY29udmluY2VkIHRoYXQgbWFr
aW5nIHRoZSBrZXJuZWwgYm9vdCBmb3IgdGhlIHNha2Ugb2YgZGVidWdnaW5nIGEgCmZ1bmRhbWVu
dGFsbHkgYnJva2VuIGJvb3Rsb2FkZXIgaXMgYSBjb21tb24gYW5kIHJlYWxpc3RpYyBlbm91Z2gg
aXNzdWUgCnRvIGp1c3RpZnkgYnJlYWtpbmcgdGhlIGV4aXN0aW5nIG5vdC1uZWNlc3NhcmlseS1p
bnZhbGlkIGJvb3Rsb2FkZXIgCmJlaGF2aW91ciBvZiBvdGhlciB3aWRlbHktZGVwbG95ZWQgc3lz
dGVtcyA6LwoKUm9iaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
