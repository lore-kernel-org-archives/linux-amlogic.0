Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BDCC6FA8F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Aug 2023 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hepq8XVScw5aU7BHm+DLX7Lnp5c9lCdnrgUgrMuHrL4=; b=Ab+15+MttFK4w4
	2QSwtVKJB3J7XYeVY1yZIoWjS77gAJLHkA0EofdH2RkqOKSZW5c5GiksRAomHVE0Kp82NwphmTePa
	LFS7sNCWY/PMKVLvtk6UbX5hVa1yssPQOmreHU0DYFBS9xD1IUYIy7273NG0O03bTh6kAc7RZDq/c
	PXmnbPVSfFvKFKYfbmcghE3zVbxFblv/Mh03kTPyoBHX1Jxs5wo0Wig13x5UYeED4TJjPAd42uCjK
	BaLnmow3pIS62ixVEv+EH1tLmY002PN2muJWsbH7Nl9LXH59uMWGABkJ5Paiv7N0oC6butS92Wnoj
	/F6W8bMpEend2wrCmYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavVQ-00BBg2-2M;
	Tue, 29 Aug 2023 09:59:28 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qavVN-00BBfa-1V
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Aug 2023 09:59:27 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qavVG-0006fc-3h; Tue, 29 Aug 2023 11:59:18 +0200
Message-ID: <3a6f8d86-b369-bcf7-406b-4f7d0cd5cfa3@leemhuis.info>
Date: Tue, 29 Aug 2023 11:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
Content-Language: en-US, de-DE
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
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAPDyKFpAGUudAJKAmzMbcM=LrALU6ELpwaD-ijy18o7yrPgOqA@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693303165;56375ecb;
X-HE-SMSGID: 1qavVG-0006fc-3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_025925_666851_B3BA4ABE 
X-CRM114-Status: GOOD (  20.13  )
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

SGksIFRob3JzdGVuIGhlcmUsIHRoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXIu
IFRvcC1wb3N0aW5nCmZvciBvbmNlLCB0byBtYWtlIHRoaXMgZWFzaWx5IGFjY2Vzc2libGUgdG8g
ZXZlcnlvbmUuCgpJIHN0aWxsIGhhdmUgdGhpcyByZWdyZXNzaW9uIChjYXVzZWQgYnkgYSBjb21t
aXQgZnJvbSBCcmlhbiwgYXBwbGllZCBieQpVbGYpIG9uIG15IGxpc3Qgb2YgdHJhY2tlZCBpc3N1
ZXMuIFdhcyB0aGVyZSBhbnkgcHJvZ3Jlc3MgdG8gZmluYWxseSBnZXQKdGhpcyBmaXhlZFsxXT8g
RG9lc24ndCBsb29rIGxpa2UgaXQgZnJvbSBoZXJlLCBidXQgSSBtaWdodCBoYXZlIGVhc2lseQpt
aXNzZWQgc29tZXRoaW5nLCB0aGF0J3Mgd2h5IEknbSBhc2tpbmcuCgpbMV0gdGhpcyBwYXRjaCBm
cm9tIFppeWFuZyBIdWFuZyBhZmFpY3Mgd2FzIHN1cHBvc2VkIHRvIGhlbHAsIGJ1dCBpdAp3ZW50
IG5vd2hlcmUgYWZhaWNzCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvVFla
UFIwMU1CNTU1NkI1NkQ4MzRFMDJGNDFDNDREODFEQzk1RkFAVFlaUFIwMU1CNTU1Ni5hcGNwcmQw
MS5wcm9kLmV4Y2hhbmdlbGFicy5jb20vCgpPciBkb2VzIGFueWJvZHkgc3RvcCBjYXJpbmc/CgpD
aWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9u
IHRyYWNrZXInIGhhdCkKLS0KRXZlcnl0aGluZyB5b3Ugd2FubmEga25vdyBhYm91dCBMaW51eCBr
ZXJuZWwgcmVncmVzc2lvbiB0cmFja2luZzoKaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVt
aHVpcy5pbmZvL2Fib3V0LyN0bGRyCklmIEkgZGlkIHNvbWV0aGluZyBzdHVwaWQsIHBsZWFzZSB0
ZWxsIG1lLCBhcyBleHBsYWluZWQgb24gdGhhdCBwYWdlLgoKI3JlZ3pib3QgcG9rZQoKT24gMjAu
MDYuMjMgMTE6NTMsIFVsZiBIYW5zc29uIHdyb3RlOgo+IE9uIE1vbiwgMTkgSnVuIDIwMjMgYXQg
MjE6NTQsIE1hcnRpbiBCbHVtZW5zdGluZ2wKPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgSnVuIDE0LCAyMDIzIGF0IDU6NDnigK9QTSBV
bGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4+IFsuLi5dCj4+Pj4g
RnVsbCByZWdpc3RlciBkdW1wOgo+Pj4+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9j
MTEwOGUwMC5tbWMvcmVnaXN0ZXJzCj4+Pj4gMDA6IDAwMDAwOTAwCj4+Pj4gMDQ6IDAwMDAwMDRk
Cj4+Pj4gMDg6IGU3ZmZlMDAyCj4+Pj4gMGM6IDAyZjAwMDNmCj4+Pj4gMTA6IDAwMDNmMDA5Cj4+
Pj4gMTQ6IDAzYjgxYzAwCj4+Pj4gMTg6IDJjNDNiY2YwCj4+Pj4gMWM6IGUwMDAwMTUwCj4+Pj4g
MjA6IDAwMDAwMDAwCj4+Pj4gMjQ6IDAwMDAzMDY3Cj4+Pj4gMjg6IDAwMDAwMDAwCj4+Pj4gMmM6
IDAwMDAwMDAwCj4+Pj4gMzA6IDAwMDAwMDAwCj4+Pj4gMzQ6IDAwZmUwY2ZmCj4+Pj4gMzg6IDAw
MDAxMDBiCj4+Pj4KPj4+PiBJbiBjYXNlIHlvdSBhcmUgY3VyaW91cywgdGhlIGRyaXZlciBpczog
ZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1teC1zZGhjLW1tYy5jCj4+Pgo+Pj4gVGhhbmtzIGZvciBz
aGFyaW5nIHRoaXMgZGF0YSEKPj4+Cj4+PiBJIGFzc3VtZSB0aGUgYWJvdmUgcmVnaXN0ZXJzIGlu
ZGljYXRlIHRoYXQgd2UgaGF2ZSBzZW50IHRoZSBjb21tYW5kCj4+PiBhbmQgYXJlIG5vdyB3YWl0
aW5nIGZvciBhbiBJUlEgZm9yIGEgcmVzcG9uc2UvZXJyb3IsIGJ1dCB3ZSBuZXZlcgo+Pj4gcmVj
ZWl2ZSBvbmUuCj4+Pgo+Pj4gVG8gcmVhbGx5IGZpZ3VyZSBvdXQgd2hhdCBpcyBnb2luZyBvbiwg
SSB0aGluayB3ZSBuZWVkIHRvIGRvIHNvbWUKPj4+IGFkZGl0aW9uYWwgbG93IGxldmVsIGRlYnVn
Z2luZy90ZXN0aW5nLgo+Pj4KPj4+IEkgd2FzIGxvb2tpbmcgYXQgdGhlIGNvbW1pdCBtZXNzYWdl
IGZyb20gZTRiZjFiMDk3MGVmICgibW1jOiBob3N0Ogo+Pj4gbWVzb24tbXgtc2RoYzogbmV3IGRy
aXZlciBmb3IgdGhlIEFtbG9naWMgTWVzb24gU0RIQyBob3N0IiksIHdoaWNoCj4+PiBpbmRpY2F0
ZXMgdGhhdCB0aGUgY2xvY2sgbWFuYWdlbWVudCBpcyBxdWl0ZSBsaW1pdGVkIGZvciB0aGlzIEhX
LiBGb3IKPj4+IGV4YW1wbGUsIHRoZSA1MTAwMDAwMEh6IGlzbid0IG9uZSBvZiB0aGUgc3VwcG9y
dGVkIGZyZXF1ZW5jaWVzLiBDb3VsZAo+Pj4gdGhhdCBiZSB0aGUgcmVhc29uIGZvciB0aGUgcHJv
YmxlbT8gUGVyaGFwcyBpZiB3ZSBwbGF5IHdpdGggY2hhbmdpbmcKPj4+IHRoZSBmcmVxdWVuY3kg
dG8gc29tZXRoaW5nIHRoYXQgaXMgY29uc2lkZXJlZCBzdXBwb3J0ZWQgLSB0aGVuIGNhbiB3ZQo+
Pj4gbWFrZSB0aGlzIHdvcms/Cj4+IFlvdSBzZWVtIHRvIGJlIG1vcmUgZmFtaWxpYXIgd2l0aCB0
aGlzIEFtbG9naWMgTU1DIGNvbnRyb2xsZXIgdGhhbiBJIGFtIDstKQo+IAo+IFNvbWV0aW1lcyBh
IHdlbGwgd3JpdHRlbiBjb21taXQgbWVzc2FnZSBhY3R1YWxseSBoZWxwcy4gOi0pCj4gCj4+IFRv
ZGF5IEkgZmluYWxseSBoYWQgc29tZSB0aW1lIGZvciB0ZXN0aW5nIGFuZCB3aGVuIEkgc3RhcnRl
ZCBaaXlhbmcKPj4gSHVhbmcgcHJvdmlkZWQgYSBwYXRjaCBbMF0gKGFkbWl0dGVkbHk6IEkgdGhp
bmsgaXQgbmVlZHMgdG8gYmUKPj4gaW1wcm92ZWQsIGJ1dCBmaW5hbGx5IHdlIGtub3cgdGhhdCBp
dCdzIGEgTU1DIGNvbnRyb2xsZXIgZHJpdmVyCj4+IGxpbWl0YXRpb24gYW5kIG5vdCBhbiBNTUMg
Y29yZSBidWcpCj4KPiBHcmVhdCBuZXdzIQo+IAo+IEkgd2lsbCBjb250aW51ZSB0byBtb25pdG9y
IHRoZSB0aHJlYWQgYW5kIGRlZmVyIHRvIGFwcGx5IGFueXRoaW5nCj4gdW50aWwgeW91IGhhdmUg
Z2l2ZW4gaXQgeW91ciBibGVzc2luZywgb2YgY291cnNlLgo+IAo+IEtpbmQgcmVnYXJkcwo+IFVm
ZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
