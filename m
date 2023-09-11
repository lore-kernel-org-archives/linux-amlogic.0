Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED45EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbQMj56GtdIPPRUIYKrikxnrdstFbAUA8C0lp6XWvZk=; b=h0K5aAyLLlayGa
	T4YwRzubBex+dCN4QriGlKMlWAcpIM+FkmWejRoxzYoWGmd6TrTA6frGZ2FmnW6DoSCHeim0GUy/p
	XlLdNuPJA8NPSuE+NX7asFNa4anBE+rvehsLj+O4xnbfcA6xMV404h0yLsbJgCUI4TFddj6DdUxJ/
	r/uQ7ACbEBV0jbK3AxmsYA49kQu9hNgTGw+E574h7MFbhAbaiNSvDHdmKc6tlfzE7dkf7dbExa8nT
	mQkH6vT7Ve3OH0Bt6UI5Q+ly72E3sbmpzW8jT0MHWY+ORie42hm3wes0q7v0dgmJk49g0XKHbmD6A
	UYLw8Iv3WlzKqC8RTS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcb7-00HYyG-2N;
	Mon, 11 Sep 2023 08:48:45 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcb3-00HYxu-1t
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 08:48:43 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qfcay-0004oo-4O; Mon, 11 Sep 2023 10:48:36 +0200
Message-ID: <fd58e1e9-0a15-4320-9a0a-cceeed45d0b4@leemhuis.info>
Date: Mon, 11 Sep 2023 10:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Shawn Lin
 <shawn.lin@rock-chips.com>, Luca Weiss <luca@z3ntu.xyz>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Ziyang Huang <hzyitc@outlook.com>
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
 <CAPDyKFpS-UwiaRPMqSpX0mNPrS5p=yJzu3g0=pGyCkWHSYyqWg@mail.gmail.com>
 <CAFBinCCnB=po9x6tsxCzRM99ZqgV9=5jBxS9LaoJqLPGZYSH6g@mail.gmail.com>
 <CAPDyKFpAGUudAJKAmzMbcM=LrALU6ELpwaD-ijy18o7yrPgOqA@mail.gmail.com>
 <3a6f8d86-b369-bcf7-406b-4f7d0cd5cfa3@leemhuis.info>
In-Reply-To: <3a6f8d86-b369-bcf7-406b-4f7d0cd5cfa3@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694422121;ba5efe33;
X-HE-SMSGID: 1qfcay-0004oo-4O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_014841_894678_A20DC88E 
X-CRM114-Status: GOOD (  21.67  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjkuMDguMjMgMTE6NTksIExpbnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExl
ZW1odWlzKSB3cm90ZToKPiBIaSwgVGhvcnN0ZW4gaGVyZSwgdGhlIExpbnV4IGtlcm5lbCdzIHJl
Z3Jlc3Npb24gdHJhY2tlci4gVG9wLXBvc3RpbmcKPiBmb3Igb25jZSwgdG8gbWFrZSB0aGlzIGVh
c2lseSBhY2Nlc3NpYmxlIHRvIGV2ZXJ5b25lLgo+IAo+IEkgc3RpbGwgaGF2ZSB0aGlzIHJlZ3Jl
c3Npb24gKGNhdXNlZCBieSBhIGNvbW1pdCBmcm9tIEJyaWFuLCBhcHBsaWVkIGJ5Cj4gVWxmKSBv
biBteSBsaXN0IG9mIHRyYWNrZWQgaXNzdWVzLiBXYXMgdGhlcmUgYW55IHByb2dyZXNzIHRvIGZp
bmFsbHkgZ2V0Cj4gdGhpcyBmaXhlZFsxXT8gRG9lc24ndCBsb29rIGxpa2UgaXQgZnJvbSBoZXJl
LCBidXQgSSBtaWdodCBoYXZlIGVhc2lseQo+IG1pc3NlZCBzb21ldGhpbmcsIHRoYXQncyB3aHkg
SSdtIGFza2luZy4KPiAKPiBbMV0gdGhpcyBwYXRjaCBmcm9tIFppeWFuZyBIdWFuZyBhZmFpY3Mg
d2FzIHN1cHBvc2VkIHRvIGhlbHAsIGJ1dCBpdAo+IHdlbnQgbm93aGVyZSBhZmFpY3MKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljL1RZWlBSMDFNQjU1NTZCNTZEODM0RTAy
RjQxQzQ0RDgxREM5NUZBQFRZWlBSMDFNQjU1NTYuYXBjcHJkMDEucHJvZC5leGNoYW5nZWxhYnMu
Y29tLwo+IAo+IE9yIGRvZXMgYW55Ym9keSBzdG9wIGNhcmluZz8KCk5vIHJlcGx5LCB0aGVuIEkg
YXNzdW1lIHRoYXQncyB0aGUgY2FzZS4gSW4gdGhhdCBjYXNlIEkgd29uJ3Qgd2FzdGUgYW55CmN5
Y2xlcyB0cmFja2luZyB0aGlzOgoKI3JlZ3pib3QgaW5jb25jbHVzaXZlOiBzZWVtIG5vYm9keSBj
YXJlcyBhbnltb3JlCgpNYXJ0aW4sIGlmIHRoaXMgaXMgd3JvbmcgYW5kIHlvdSB3YW50IHRvIHNl
ZSB0aGlzIGZpeGVkLCBwbGVhc2Ugc3BlYWsgdXAuCgpDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBo
aXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkKLS0KRXZlcnl0
aGluZyB5b3Ugd2FubmEga25vdyBhYm91dCBMaW51eCBrZXJuZWwgcmVncmVzc2lvbiB0cmFja2lu
ZzoKaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRyCklm
IEkgZGlkIHNvbWV0aGluZyBzdHVwaWQsIHBsZWFzZSB0ZWxsIG1lLCBhcyBleHBsYWluZWQgb24g
dGhhdCBwYWdlLgoKPiBPbiAyMC4wNi4yMyAxMTo1MywgVWxmIEhhbnNzb24gd3JvdGU6Cj4+IE9u
IE1vbiwgMTkgSnVuIDIwMjMgYXQgMjE6NTQsIE1hcnRpbiBCbHVtZW5zdGluZ2wKPj4gPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIFdlZCwgSnVu
IDE0LCAyMDIzIGF0IDU6NDnigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9y
Zz4gd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+PiBGdWxsIHJlZ2lzdGVyIGR1bXA6Cj4+Pj4+ICMgY2F0
IC9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9jMTEwOGUwMC5tbWMvcmVnaXN0ZXJzCj4+Pj4+IDAw
OiAwMDAwMDkwMAo+Pj4+PiAwNDogMDAwMDAwNGQKPj4+Pj4gMDg6IGU3ZmZlMDAyCj4+Pj4+IDBj
OiAwMmYwMDAzZgo+Pj4+PiAxMDogMDAwM2YwMDkKPj4+Pj4gMTQ6IDAzYjgxYzAwCj4+Pj4+IDE4
OiAyYzQzYmNmMAo+Pj4+PiAxYzogZTAwMDAxNTAKPj4+Pj4gMjA6IDAwMDAwMDAwCj4+Pj4+IDI0
OiAwMDAwMzA2Nwo+Pj4+PiAyODogMDAwMDAwMDAKPj4+Pj4gMmM6IDAwMDAwMDAwCj4+Pj4+IDMw
OiAwMDAwMDAwMAo+Pj4+PiAzNDogMDBmZTBjZmYKPj4+Pj4gMzg6IDAwMDAxMDBiCj4+Pj4+Cj4+
Pj4+IEluIGNhc2UgeW91IGFyZSBjdXJpb3VzLCB0aGUgZHJpdmVyIGlzOiBkcml2ZXJzL21tYy9o
b3N0L21lc29uLW14LXNkaGMtbW1jLmMKPj4+Pgo+Pj4+IFRoYW5rcyBmb3Igc2hhcmluZyB0aGlz
IGRhdGEhCj4+Pj4KPj4+PiBJIGFzc3VtZSB0aGUgYWJvdmUgcmVnaXN0ZXJzIGluZGljYXRlIHRo
YXQgd2UgaGF2ZSBzZW50IHRoZSBjb21tYW5kCj4+Pj4gYW5kIGFyZSBub3cgd2FpdGluZyBmb3Ig
YW4gSVJRIGZvciBhIHJlc3BvbnNlL2Vycm9yLCBidXQgd2UgbmV2ZXIKPj4+PiByZWNlaXZlIG9u
ZS4KPj4+Pgo+Pj4+IFRvIHJlYWxseSBmaWd1cmUgb3V0IHdoYXQgaXMgZ29pbmcgb24sIEkgdGhp
bmsgd2UgbmVlZCB0byBkbyBzb21lCj4+Pj4gYWRkaXRpb25hbCBsb3cgbGV2ZWwgZGVidWdnaW5n
L3Rlc3RpbmcuCj4+Pj4KPj4+PiBJIHdhcyBsb29raW5nIGF0IHRoZSBjb21taXQgbWVzc2FnZSBm
cm9tIGU0YmYxYjA5NzBlZiAoIm1tYzogaG9zdDoKPj4+PiBtZXNvbi1teC1zZGhjOiBuZXcgZHJp
dmVyIGZvciB0aGUgQW1sb2dpYyBNZXNvbiBTREhDIGhvc3QiKSwgd2hpY2gKPj4+PiBpbmRpY2F0
ZXMgdGhhdCB0aGUgY2xvY2sgbWFuYWdlbWVudCBpcyBxdWl0ZSBsaW1pdGVkIGZvciB0aGlzIEhX
LiBGb3IKPj4+PiBleGFtcGxlLCB0aGUgNTEwMDAwMDBIeiBpc24ndCBvbmUgb2YgdGhlIHN1cHBv
cnRlZCBmcmVxdWVuY2llcy4gQ291bGQKPj4+PiB0aGF0IGJlIHRoZSByZWFzb24gZm9yIHRoZSBw
cm9ibGVtPyBQZXJoYXBzIGlmIHdlIHBsYXkgd2l0aCBjaGFuZ2luZwo+Pj4+IHRoZSBmcmVxdWVu
Y3kgdG8gc29tZXRoaW5nIHRoYXQgaXMgY29uc2lkZXJlZCBzdXBwb3J0ZWQgLSB0aGVuIGNhbiB3
ZQo+Pj4+IG1ha2UgdGhpcyB3b3JrPwo+Pj4gWW91IHNlZW0gdG8gYmUgbW9yZSBmYW1pbGlhciB3
aXRoIHRoaXMgQW1sb2dpYyBNTUMgY29udHJvbGxlciB0aGFuIEkgYW0gOy0pCj4+Cj4+IFNvbWV0
aW1lcyBhIHdlbGwgd3JpdHRlbiBjb21taXQgbWVzc2FnZSBhY3R1YWxseSBoZWxwcy4gOi0pCj4+
Cj4+PiBUb2RheSBJIGZpbmFsbHkgaGFkIHNvbWUgdGltZSBmb3IgdGVzdGluZyBhbmQgd2hlbiBJ
IHN0YXJ0ZWQgWml5YW5nCj4+PiBIdWFuZyBwcm92aWRlZCBhIHBhdGNoIFswXSAoYWRtaXR0ZWRs
eTogSSB0aGluayBpdCBuZWVkcyB0byBiZQo+Pj4gaW1wcm92ZWQsIGJ1dCBmaW5hbGx5IHdlIGtu
b3cgdGhhdCBpdCdzIGEgTU1DIGNvbnRyb2xsZXIgZHJpdmVyCj4+PiBsaW1pdGF0aW9uIGFuZCBu
b3QgYW4gTU1DIGNvcmUgYnVnKQo+Pgo+PiBHcmVhdCBuZXdzIQo+Pgo+PiBJIHdpbGwgY29udGlu
dWUgdG8gbW9uaXRvciB0aGUgdGhyZWFkIGFuZCBkZWZlciB0byBhcHBseSBhbnl0aGluZwo+PiB1
bnRpbCB5b3UgaGF2ZSBnaXZlbiBpdCB5b3VyIGJsZXNzaW5nLCBvZiBjb3Vyc2UuCj4+Cj4+IEtp
bmQgcmVnYXJkcwo+PiBVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
