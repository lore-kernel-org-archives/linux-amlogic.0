Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC6DCD98F7
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2026 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpTgW9ijSJSQ96GEEEbCLkSuP3H7RtRfiLqNfvVYxVc=; b=Rix441DyI7D82g
	kZTI0EbEHm5/F5tuJ9gImbSY3hmntg3Rtj72MeiAPHpUSQyq5DrtETwWomIOUa5nwmZGy+nN+u5SK
	qYJet2zHyMr9oEnG6OXCH5l3+QW+uScyfSunTQ/86ycfjkD0Ha93ullK1VI7V/T7Tf3O2PLVMwr2F
	lZXqiiPjhRFMe/TQatyaubpCcOdKDlg8Q4j54RT9jITELTo0Ol5QNG0qN6cwHbCxJCdQrtoo7MOsu
	H9QABA0PGl+IEr2CVlVjAdw5y5Acb5yUHvsWTaABewx+wNG78bNQHENbwGtzjO7NaPp908DA/vjOH
	9wyEfxkjMXMpiWjxY07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9b5-000000012e5-20fW;
	Thu, 18 Jun 2026 10:03:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9b4-000000012ds-0S1U
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jun 2026 10:03:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C595043BAD;
	Thu, 18 Jun 2026 10:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A42F1F00A3A;
	Thu, 18 Jun 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781777021;
	bh=MNSKkFiiQ1fxo80SVhqE0FtboJXN22LiRMtR4XFzVsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ci//CeAWMz9DYxYCbdDDHbPoRFxR9E8gYywjFIHWNHfnJyL8byGFVHOQRX45djJEY
	 45+2ASmeBXkeeGEG4gTLGzO0p5XYpeo8zm+wVTWCH413exLUpF4NPPNEJepdt2hi2V
	 Kw9U71QmumJ4QM8WICdng67rf2go4d6+sYxgkav5261pvpwYYHhbh7NyjPYdLLcPAO
	 rCjZH138XkDKBuaB0dAsnhtO1LShivK1ZfNaLwqanBgCqQ014VwIfW/D5h+trHz1rC
	 WFcV11qdLAUfX0OHs0KxFNf6bvr8Cvu0dDM0rPHd36wUfAr6TkHaRM6VVfUUAx+kMT
	 369xtllArR74w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Date: Thu, 18 Jun 2026 10:03:40 +0000
Message-Id: <20260618100341.0A42F1F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIEFPIFBXTSBj
bG9ja3MgYXJlIHJlZ2lzdGVyZWQgd2l0aG91dCBhbiBgYW9fYCBvciBgYTlfYW9fYCBwcmVmaXgs
IHdoaWNoIHdpbGwgY2F1c2UgZ2xvYmFsIG5hbWVzcGFjZSBjb2xsaXNpb25zIHdpdGggdGhlIG1h
aW4gY2xvY2sgY29udHJvbGxlci4KLSBbTG93XSBUeXBvZ3JhcGhpY2FsIGVycm9yIGluIHRoZSBj
bG9jayBuYW1lIHN0cmluZyBsaXRlcmFsIGZvciB0aGUgUlRDIGR1YWxkaXYgaW5wdXQgZ2F0ZTog
YGFvX3J0Y19kdWFuZGl2X2luYCBpbnN0ZWFkIG9mIGBhb19ydGNfZHVhbGRpdl9pbmAuCi0gW0xv
d10gTWlzc2luZyBgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPmAgZm9yIGBNT0RVTEVfKmAgbWFj
cm9zLgotLQoKY29tbWl0IGVmNTk5OGZmMDg3YjZmYWVkMDlkOWVlZDRmNTkwNzhkMmIyZjBhNjAK
QXV0aG9yOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgoKY2xrOiBhbWxvZ2ljOiBBZGQg
QTkgQU8gY2xvY2sgY29udHJvbGxlciBkcml2ZXIKICAgIApBZGQgdGhlIEFsd2F5cy1vbiBjbG9j
ayBjb250cm9sbGVyIGRyaXZlciBmb3IgdGhlIEFtbG9naWMgQTkgU29DIGZhbWlseS4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2E5LWFvY2xrLmMgYi9kcml2ZXJzL2Nsay9tZXNv
bi9hOS1hb2Nsay5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAw
Li44OGFhOGNmM2Y1ZDAwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29u
L2E5LWFvY2xrLmMKPiBAQCAtMCwwICsxLDQ4OCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBNSVQpCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAy
NiBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPiArICovCj4gKwo+ICsjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhOS1hb2Nsa2MuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2Nsay1wcm92aWRlci5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
CgpbU2V2ZXJpdHk6IExvd10KU2hvdWxkIHRoaXMgZmlsZSBleHBsaWNpdGx5IGluY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPj8KClRoZSBmaWxlIHJlbGllcyBvbiBzZXZlcmFsIG1vZHVsZSBtYWNyb3Mg
YXQgdGhlIGVuZCAoc3VjaCBhcyBNT0RVTEVfREVTQ1JJUFRJT04sCk1PRFVMRV9BVVRIT1IsIGFu
ZCBNT0RVTEVfTElDRU5TRSkuIEFsdGhvdWdoIGl0IGN1cnJlbnRseSBjb21waWxlcyBzdWNjZXNz
ZnVsbHkKZHVlIHRvIHRyYW5zaXRpdmUgaW5jbHVkZXMgZnJvbSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+LCBzdGFuZGFyZCBrZXJuZWwKcHJhY3RpY2UgaXMgdG8gaW5jbHVkZSB0aGUgaGVhZGVy
IGV4cGxpY2l0bHkuCgpbIC4uLiBdCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRf
ZGF0YSBhOV9hb19wd21fcGFyZW50c1tdID0gewo+ICsJeyAuaHcgPSAmYTlfYW9feHRhbC5odyB9
LAo+ICsJeyAuZndfbmFtZSA9ICJmZGl2NSIsIH0sCj4gKwl7IC5md19uYW1lID0gImZkaXY0Iiwg
fSwKPiArCXsgLmZ3X25hbWUgPSAiZmRpdjMiLCB9Cj4gK307Cj4gKwo+ICtzdGF0aWMgQTlfQ09N
UF9TRUwocHdtX2EsIEFPX1BXTV9DTEtfQV9DVFJMLCA5LCAweDcsIGE5X2FvX3B3bV9wYXJlbnRz
KTsKCltTZXZlcml0eTogTWVkaXVtXQpXaWxsIHRoaXMgY2F1c2UgYSBjbG9jayBuYW1lIGNvbGxp
c2lvbiB3aXRoIHRoZSBtYWluIGNsb2NrIGNvbnRyb2xsZXI/CgpCZWNhdXNlIHRoZSBBOV9DT01Q
X1NFTCBtYWNybyB1c2VzIHRoZSAjX25hbWUgc3RyaW5naWZpY2F0aW9uIG9wZXJhdG9yIGluc2lk
ZQpNRVNPTl9DT01QX1NFTCwgdGhpcyB3aWxsIGdlbmVyYXRlIHRoZSBjbG9jayBuYW1lIGFzIGV4
YWN0bHkgInB3bV9hX3NlbCIKKGFuZCBzaW1pbGFybHkgInB3bV9hX2RpdiIgYW5kICJwd21fYSIg
Zm9yIHRoZSBvdGhlcnMpLCB3aXRob3V0IGFueSAiYW9fIiBvcgoiYTlfYW9fIiBwcmVmaXguCgpJ
ZiB0aGUgbWFpbiBjbG9jayBjb250cm9sbGVyIGNvbnZlbnRpb25hbGx5IHJlZ2lzdGVycyBhICJw
d21fYSIgY2xvY2ssIGZhaWxpbmcKdG8gcHJlZml4IHRoZSBBbHdheXMtT24gY2xvY2tzIHdpbGwg
bGVhZCB0byBnbG9iYWwgbmFtZXNwYWNlIGNvbGxpc2lvbnMgaW4gdGhlCkNvbW1vbiBDbG9jayBG
cmFtZXdvcmsgYW5kIGRlYnVnZnMuCgo+ICtzdGF0aWMgQTlfQ09NUF9ESVYocHdtX2EsIEFPX1BX
TV9DTEtfQV9DVFJMLCAwLCA4KTsKPiArc3RhdGljIEE5X0NPTVBfR0FURShwd21fYSwgQU9fUFdN
X0NMS19BX0NUUkwsIDgpOwo+ICsKPiArc3RhdGljIEE5X0NPTVBfU0VMKHB3bV9iLCBBT19QV01f
Q0xLX0JfQ1RSTCwgOSwgMHg3LCBhOV9hb19wd21fcGFyZW50cyk7CgpbIC4uLiBdCgo+ICtzdGF0
aWMgc3RydWN0IGNsa19yZWdtYXAgYTlfYW9fcnRjX2R1YWxkaXZfaW4gPSB7Cj4gKwkuZGF0YSA9
ICYoc3RydWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPiArCQkub2Zmc2V0ID0gQU9fUlRDX0JZ
X09TQ0lOX0NUUkwwLAo+ICsJCS5iaXRfaWR4ID0gMzEsCj4gKwl9LAo+ICsJLmh3LmluaXQgPSAm
KHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gKwkJLm5hbWUgPSAiYW9fcnRjX2R1YW5kaXZfaW4i
LAoKW1NldmVyaXR5OiBMb3ddClRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGVyZSdzIGEgdHlwbyBp
biB0aGUgY2xvY2sgbmFtZSBsaXRlcmFsLiBTaG91bGQKImFvX3J0Y19kdWFuZGl2X2luIiBiZSAi
YW9fcnRjX2R1YWxkaXZfaW4iPwoKPiArCQkub3BzID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsCj4g
KwkJLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsKPiArCQkJJmE5X2Fv
X3h0YWwuaHcKPiArCQl9LAoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDYxOC1hOV9hb2Nsay12NC0wLTU2OWQwNDI1ZTUwY0BhbWxv
Z2ljLmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
