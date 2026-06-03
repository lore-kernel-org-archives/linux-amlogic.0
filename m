Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D4DCD6E55
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jun 2026 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPaeB55TXiCNhYV+A/X32bAPwJ7i5srI6LDCFlH8Ku8=; b=ZWjYd0TXBYMtJs
	WQ8Kf9dCYBz7KeWZcCerulMuwe06/IlmEkat8HRn/SBaA1rjWQtJIbkDAICLplk9WV/ey0EsB84uF
	DjjGhieAcR6u4aFpUfRx40x+5Fko8XRnUo1vYyLV9FxZWF30DfscornYiSbduGDaP8zptFe1HJOEG
	IZo1JpMVNgUgxgIbsye4VsHf+tDbcMshkwwGQ3aF0XNQfLL4UQ9ZIiCHntFGd1PUybHTZAfeTXLm9
	zx2KHoHxYWa9qRZUi/vJsOk3DEqKs7kj04iJAxhGkhIEFJkhq2YUMLGkEHig2LEpVirJi3U2abr6p
	HUxjytE4xF4TyJNiWmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUko2-0000000F5DB-2T1k;
	Wed, 03 Jun 2026 12:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUko1-0000000F5Cx-2Kj6
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jun 2026 12:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A84BC60221;
	Wed,  3 Jun 2026 12:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132711F00893;
	Wed,  3 Jun 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780490084;
	bh=8UD23uJw27FwM4BNCBjpLFtRuqU8u+Zb6KTd0T9i1BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpA5m2t4PWDXQVUY72LtYjclXjJHlexb/tXB+HMO9qdcf5Hu3DzOF7O6klyq6t/37
	 eMsr2KP9sdnsl6wZDXcKzfykCp14dAQgFiX7Q4cl4WfH0KMpjpnWu0n1BAHpkQwfW+
	 goV2571fu4cKhxdXQvE/2s8rUSlWalDW1y93JkgD+6OQsF95WBnLfcCx4PA4ivhWoI
	 abUrfogx18aEPncrjtAfiLLfNCprJ7P2LFric1ALHrRwxcW2rIS396lSZfaw/VYO6E
	 jtA4pRCEwmhDhkwbnNUHbiCIW5mNKDGY3485WeUOn2PmZhH3lnRJYNFE2qb/E8kBfN
	 uihJtkNNsrXig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
References: <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
Date: Wed, 03 Jun 2026 12:34:43 +0000
Message-Id: <20260603123444.132711F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIEtjb25maWcgc3lt
Ym9sIGBDT01NT05fQ0xLX0E5X0FPYCBpbmFwcHJvcHJpYXRlbHkgdXNlcyBgZGVmYXVsdCBBUkNI
X01FU09OIHx8IENPTVBJTEVfVEVTVGAuIFRoaXMgZm9yY2VzIHRoZSBkcml2ZXIgdG8gYmUgZW5h
YmxlZCBieSBkZWZhdWx0IG9uIGFsbCBjb21waWxlLXRlc3QgYnVpbGRzLCBwb2xsdXRpbmcgdGhl
IGRlZmF1bHQgY29uZmlndXJhdGlvbiBhbmQgYnJlYWtpbmcgY3Jvc3MtY29uZmlnIGNvbnNpc3Rl
bmN5LgotIFtMb3ddIFRoZSBjbG9jayBjb250cm9sbGVyIGRyaXZlciBkZWZpbmVzIGFuIGludGVy
bmFsIGNsb2NrIGFzIGBpMmMzYCBidXQgbWFwcyBpdCB0byBgQ0xLSURfQU9fU1lTX0kzQ2AsIGlu
ZGljYXRpbmcgYSB0eXBvIHdoZXJlICdpM2MnIHdhcyBtaXN0YWtlbmx5IHdyaXR0ZW4gYXMgJ2ky
YzMnLgotLQoKY29tbWl0IGEzNjkxNzA3N2NmNTRjNzFjYTRiOTE3ZTdiMjEyMmJkODRlMmI5NTYK
QXV0aG9yOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgoKY2xrOiBhbWxvZ2ljOiBBZGQg
QTkgQU8gY2xvY2sgY29udHJvbGxlciBkcml2ZXIKClRoaXMgY29tbWl0IGFkZHMgdGhlIEFsd2F5
cy1vbiBjbG9jayBjb250cm9sbGVyIGRyaXZlciBmb3IgdGhlIEFtbG9naWMgQTkKU29DIGZhbWls
eS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL0tjb25maWcgYi9kcml2ZXJzL2Ns
ay9tZXNvbi9LY29uZmlnCj4gaW5kZXggY2Y4Y2YzZjllNGVlOC4uNjI1ZTY3ODhiOTQwNiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9jbGsv
bWVzb24vS2NvbmZpZwo+IEBAIC0xMzIsNiArMTMyLDE5IEBAIGNvbmZpZyBDT01NT05fQ0xLX0Ex
X1BFUklQSEVSQUxTCj4gIAkgIGRldmljZSwgQTEgU29DIEZhbWlseS4gU2F5IFkgaWYgeW91IHdh
bnQgQTEgUGVyaXBoZXJhbHMgY2xvY2sKPiAgCSAgY29udHJvbGxlciB0byB3b3JrLgo+ICAKPiAr
Y29uZmlnIENPTU1PTl9DTEtfQTlfQU8KPiArCXRyaXN0YXRlICJBbWxvZ2ljIEE5IFNvQyBBTyBj
bG9jayBjb250cm9sbGVyIHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEFSTTY0Cj4gKwlkZWZhdWx0
IEFSQ0hfTUVTT04gfHwgQ09NUElMRV9URVNUCgpbU2V2ZXJpdHk6IExvd10KU2hvdWxkIENPTVBJ
TEVfVEVTVCBiZSB1c2VkIGluIGEgZGVmYXVsdCBkaXJlY3RpdmUgaGVyZT8gCgpCeSBpbmNsdWRp
bmcgaXQgaW4gdGhlIGRlZmF1bHQgZXhwcmVzc2lvbiwgdGhlIGRyaXZlciB3aWxsIGF1dG9tYXRp
Y2FsbHkgYmUKZW5hYmxlZCBvbiBhbGwgY29tcGlsZS10ZXN0IGJ1aWxkcywgcG9sbHV0aW5nIHRo
ZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24uIApVc3VhbGx5LCBDT01QSUxFX1RFU1QgaXMgcGxhY2Vk
IGluIHRoZSAnZGVwZW5kcyBvbicgY2xhdXNlIGluc3RlYWQgdG8gCmFsbG93IGJ1aWxkIGNvdmVy
YWdlIHdpdGhvdXQgZm9yY2luZyBpdCBvbiBieSBkZWZhdWx0LgoKPiArCXNlbGVjdCBDT01NT05f
Q0xLX01FU09OX1JFR01BUAo+ICsJc2VsZWN0IENPTU1PTl9DTEtfTUVTT05fQ0xLQ19VVElMUwoK
WyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vYTktYW9jbGsuYyBiL2Ry
aXZlcnMvY2xrL21lc29uL2E5LWFvY2xrLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMDAuLmI3YjNjYTIzMWE0MmIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJp
dmVycy9jbGsvbWVzb24vYTktYW9jbGsuYwoKWyAuLi4gXQoKPiArLyoKPiArICogQTkgaW50ZWdy
YXRlcyBhIGxvdy1wb3dlciBtaWNyb3Byb2Nlc3NvciAoQWx3YXlzLW9uIENQVTogQU9DUFUpLiBT
b21lIEFPIHN5cwo+ICsgKiBjbG9ja3MgY29udHJvbCB0aGUgQU9DUFUgbW9kdWxlcy4gTWFyayB0
aGUgQU9DUFUtcmVsYXRlZCBjbG9ja3Mgd2l0aAo+ICsgKiBDTEtfSVNfQ1JJVElDQUwgdG8gYXZv
aWQgdGhlbSBiZWluZyBkaXNhYmxlZCBhbmQgaW1wYWN0aW5nIEFPQ1BVIGZ1bmN0aW9uYWxpdHku
Cj4gKyAqIEFPQ1BVLXJlbGF0ZWQgY2xvY2tzIGxpc3Q6Cj4gKyAqIC0gY2xrdHJlZQo+ICsgKiAt
IHJzdF9jdHJsCj4gKyAqIC0gcGFkCj4gKyAqIC0gaXJxCj4gKyAqIC0gcHdyY3RybAo+ICsgKiAt
IGFvY3B1Cj4gKyAqIC0gc3JhbQo+ICsgKi8KPiArc3RhdGljIEE5X0FPX1BDTEsoaTJjMywJCTAs
CTApOwoKW1NldmVyaXR5OiBMb3ddCklzIHRoaXMgaW50ZW5kZWQgdG8gYmUgYW4gSTNDIGNsb2Nr
IHJhdGhlciB0aGFuIEkyQz8gCgpTaW5jZSB0aGUgZHJpdmVyIGRlZmluZXMgdGhlIG90aGVyIEky
QyBjb250cm9sbGVycyBhbHBoYWJldGljYWxseSAoaTJjX2EsIAppMmNfYiwgZXRjLiksIGFuZCB0
aGlzIGdldHMgbWFwcGVkIHRvIENMS0lEX0FPX1NZU19JM0MgYmVsb3csIGl0IGxvb2tzIGxpa2Ug
CidpMmMzJyBtaWdodCBiZSBhIHR5cG8gZm9yICdpM2MnLiAKCkJlY2F1c2Ugb2YgdGhlIG1hY3Jv
IHN0cmluZ2lmaWNhdGlvbiwgdGhpcyB0eXBvIHdpbGwgY2F1c2UgdGhlIENvbW1vbiBDbG9jayAK
RnJhbWV3b3JrIHRvIHJlZ2lzdGVyIHRoZSBjbG9jayB3aXRoIHRoZSB3cm9uZyBuYW1lLgoKPiAr
c3RhdGljIEE5X0FPX1BDTEsocnRjX3JlZywJMSwJMCk7Cj4gK3N0YXRpYyBBOV9BT19QQ0xLKGNs
a3RyZWUsCTIsCUNMS19JU19DUklUSUNBTCk7CgpbIC4uLiBdCgo+ICtzdGF0aWMgc3RydWN0IGNs
a19odyAqYTlfYW9faHdfY2xrc1tdID0gewo+ICsJW0NMS0lEX0FPX1hUQUxfSU5dCQk9ICZhOV9h
b194dGFsX2luLmh3LAo+ICsJW0NMS0lEX0FPX1hUQUxdCQkJPSAmYTlfYW9feHRhbC5odywKPiAr
CVtDTEtJRF9BT19TWVNdCQkJPSAmYTlfYW9fc3lzLmh3LAo+ICsJW0NMS0lEX0FPX1NZU19JM0Nd
CQk9ICZhOV9hb19zeXNfaTJjMy5odywKClsgLi4uIF0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MDMtYTlfYW9jbGstdjItMC1m
NDdlYTYxNmVlNzhAYW1sb2dpYy5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
