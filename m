Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B229C88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAAm80iCo+msXAwAEuqYtKGXKE9Pyw6V9Hbm1D1yPzc=; b=RLQfrGoa6oevA/
	5EtVs2UhTU0zWO+Gq3rLnBqrxu48P4s00joRBozELZVsJfniXePuqPJlOENbHr1B1mCk9fHPOM96V
	tdc+F0SiISXceESIHTWQ6qvgzhBUnmSfO/eekMlVjCqA/+dgUbwtUk+mYzZEJSo/kEV3yqatbArj9
	p7eTz/7iU/y7SllpTk4ZFdC3srgoF/APRHjX3Or14Hro16yjDBPrC81h5UIGw+pCOPzRHVf78wpKq
	L2IlRAPlFPRvaGIdBT1uiCsrsyYK6Sw8CnjoF/6HSuzXUlVPySVM1z3nSMna4DYF82h5En76kkzhL
	l+XCz3I2FlWVHb4H5qVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59l3-00000000GjS-0h5f;
	Fri, 11 Sep 2026 22:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59l2-00000000Gj9-0FKZ
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 22:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 875B840197;
	Fri, 11 Sep 2026 22:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF661F000FF;
	Fri, 11 Sep 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789165805;
	bh=KD8JinR+dOn+manyn3rI12mXQtCa15+ChZzIrnki8sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2aoK9R+r10ahlJZz6n+JDm+NfMsYS0meLD4N1FQcPfTR3bt5QgwZmgFDyNRYJ91d
	 ksEXvl2Yhhf5OD/p4MyzvnxIiPpm9/hyssJu/SF+2aaV6SgP7Z7UzDDAT6ykhrPpy1
	 sGy4vcNf2poNLmoz0g04aa8F194+X1lwhvNgtEnFxFMebaLYJ+6wvlYwVkMF7Bcr8w
	 kvmhjf2Nf2G7xUJkDJinAqW+LV+AxwiKKpfhAliJsWWSJ7YjEIc+Z2JBjplc4rLjoa
	 qvHCUZfjhs4q085ye/y9I3uDwKI61yUKeVr2uOPikEJlRF3i7LiusQNJ1i7JZoFRFj
	 vbry23+XA7rlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] ASoC: meson: add audin FIFO driver
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260912-audin-v1-3-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-3-7fbefe928711@baylibre.com>
Date: Fri, 11 Sep 2026 22:30:04 +0000
Message-Id: <20260911223005.0FF661F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENhbGxpbmcgYSBzbGVl
cGluZyBmdW5jdGlvbiBmcm9tIGF0b21pYyBhbmQgaGFyZGlycSBjb250ZXh0cy4KLS0KCmNvbW1p
dCA0NDQ5OWU4MDg1N2JiMGE0MGUwOTBhZjI2M2FlODNlYzAwN2U2MDA4CkF1dGhvcjogVmFsZXJp
byBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KCkFTb0M6IG1lc29uOiBhZGQgYXVkaW4gRklG
TyBkcml2ZXIKCkFkZCBzdXBwb3J0IGZvciB0aGUgZnJvbnRlbmQgREFJIG9mIHRoZSBjYXB0dXJl
IGludGVyZmFjZSB3aGljaCBpcyBpbgpjaGFyZ2Ugb2YgcmVjZWl2aW5nIGRlY29kZWQgZGF0YSBm
cm9tICJhdWRpbi1mb3JtYXR0ZXItaTJzIiBhbmQgbW92ZSB0aGVtCnRvIGFuIGludGVybmFsIEZJ
Rk8gYmVmb3JlIHRoZXkgYXJlIGJsb2NrLXRyYW5zZmVycmVkIHRvIFJBTS4KCj4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9tZXNvbi9hdWRpbi1maWZvLmMgYi9zb3VuZC9zb2MvbWVzb24vYXVkaW4t
Zmlmby5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi43MDI5
YmQ2YTQ2NGFiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9hdWRpbi1m
aWZvLmMKClsgLi4uIF0KCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYXVkaW5fZmlmb19wb3Moc3Ry
dWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCj4gKwkJCQkgICBzdHJ1Y3Qgc25kX3Bj
bV9ydW50aW1lICpydW50aW1lKQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgcHRyID0gc25kX3NvY19j
b21wb25lbnRfcmVhZChjb21wb25lbnQsIEFVRElOX0ZJRk9fUFRSKTsKCltTZXZlcml0eTogSGln
aF0KQ2FuIHRoaXMgY2FsbCBpbnRvIGEgc2xlZXBpbmcgZnVuY3Rpb24gZnJvbSBhdG9taWMgYW5k
IGhhcmRpcnEgY29udGV4dHM/CgpUaGUgYXVkaW5fZmlmb19wb3MoKSBmdW5jdGlvbiBjYWxscyBz
bmRfc29jX2NvbXBvbmVudF9yZWFkKCksIHdoaWNoCmV4cGxpY2l0bHkgYWNxdWlyZXMgYSBzbGVl
cGluZyBtdXRleC4gSG93ZXZlciwgdGhpcyBpcyBjYWxsZWQgYnkKYXVkaW5fZmlmb190aW1lcl9j
YigpIChhbiBocnRpbWVyIGNhbGxiYWNrIGV4ZWN1dGluZyBpbiBoYXJkaXJxIGNvbnRleHQpCmFu
ZCBieSBhdWRpbl9maWZvX2NvbXBvbmVudF9wb2ludGVyKCkgKGFuIEFMU0EgUENNIHBvaW50ZXIg
Y2FsbGJhY2sgdGhhdApleGVjdXRlcyB3aGlsZSBob2xkaW5nIGEgc3BpbmxvY2spLgoKQWNxdWly
aW5nIGEgc2xlZXBpbmcgbG9jayBmcm9tIGVpdGhlciBvZiB0aGVzZSBjb250ZXh0cyBjYW4gdHJp
Z2dlciBhCmtlcm5lbCBwYW5pYyBkdXJpbmcgYXVkaW8gY2FwdHVyZS4KCj4gKwo+ICsJcmV0dXJu
IHB0ciAtIGxvd2VyXzMyX2JpdHMocnVudGltZS0+ZG1hX2FkZHIpOwo+ICt9CgpbIC4uLiBdCgo+
ICtzdGF0aWMgZW51bSBocnRpbWVyX3Jlc3RhcnQgYXVkaW5fZmlmb190aW1lcl9jYihzdHJ1Y3Qg
aHJ0aW1lciAqdGltZXIpCj4gK3sKPiArCXN0cnVjdCBhdWRpbl9maWZvX2RhaV9kYXRhICpkYXRh
ID0KPiArCQljb250YWluZXJfb2YodGltZXIsIHN0cnVjdCBhdWRpbl9maWZvX2RhaV9kYXRhLCBw
b2xsaW5nX3RpbWVyKTsKPiArCXN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgKnJ1bnRpbWUgPSBkYXRh
LT5zdWJzdHJlYW0tPnJ1bnRpbWU7Cj4gKwl1bnNpZ25lZCBpbnQgY3Vycl9wb3MsIGRlbHRhLCBz
bGVlcF90aW1lOwo+ICsKPiArCWlmICghUkVBRF9PTkNFKGRhdGEtPnJ1bm5pbmcpKQo+ICsJCXJl
dHVybiBIUlRJTUVSX05PUkVTVEFSVDsKPiArCj4gKwljdXJyX3BvcyA9IGF1ZGluX2ZpZm9fcG9z
KGRhdGEtPmNvbXBvbmVudCwgcnVudGltZSk7CgpbIC4uLiBdCgo+ICtzdGF0aWMgc25kX3BjbV91
ZnJhbWVzX3QKPiArYXVkaW5fZmlmb19jb21wb25lbnRfcG9pbnRlcihzdHJ1Y3Qgc25kX3NvY19j
b21wb25lbnQgKmNvbXBvbmVudCwKPiArCQkJICAgICBzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSkKPiArewo+ICsJc3RydWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZSA9IHN1
YnN0cmVhbS0+cnVudGltZTsKPiArCj4gKwlyZXR1cm4gYnl0ZXNfdG9fZnJhbWVzKHJ1bnRpbWUs
IGF1ZGluX2ZpZm9fcG9zKGNvbXBvbmVudCwgcnVudGltZSkpOwo+ICt9CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTEyLWF1ZGlu
LXYxLTAtN2ZiZWZlOTI4NzExQGJheWxpYnJlLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
