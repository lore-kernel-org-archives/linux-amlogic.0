Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F21C982FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVS74WwRViA/xkuWv/dkvM2aCKJEeAZcbPXSM/ahnAo=; b=VEBZMV71qkUAii
	ql+8DWp/3Ii+8t2zmODvfpN1a9s3RyH2xgzphtnHiHaDuAlFP9dVFbiVRIL73/4bLs74BINTskNeU
	Tx+tAfRIO/5QSWdy7QTFTags9ZN5R/6zaJ8CJE/Cn99LVs3HU5w4+dIzKgXJCiL2OER0pYclJdEyJ
	DmEv/Szr5GSjYjukIcj3SDepurjt9YWews4fiJLchz/jy7lKNqcFI0kqeApRfgHQxNOy6aMiC0KuB
	JI0irL4rs93U4qx0CX3WMy2YAiKfPDqYti9T9v2uDnpDt3XktE6YJPBqUw/NBthq7XpoNotj+ftv9
	6QwG6zQzALmL+6jiFHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ldz-00000008AIu-3ipq;
	Wed, 23 Sep 2026 12:00:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ldz-00000008AIY-2b3l
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 12:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24AAE4165D;
	Wed, 23 Sep 2026 12:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03111F00893;
	Wed, 23 Sep 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164811;
	bh=es1xVTFbO/dadfVzdUTn+ymtBDEdMZ2I52gwe0+B59Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAyAQCRjHkDjuzBFya62ydm6oueTHun/LbU9eValwWOvUT4A6Quge1ChgwxGwioOI
	 4J1c6BtRQffLcSxhIbm3rlWJqM90nqwKEfAPmdcep3X8LsZF8dAeruFA8QiyoAjfwb
	 LdS/tNOI/KPBJu5Xt5fxoVr6bVPeOBNeRvaskLDpMFG1nyXOAEsSDWOcxKbI1tJY92
	 oOjDQ+HhVA2P0hQeOXwKtNJ/0sojgQvj2T8SRllUrPxTY+Wf2p64UJWhDR3D4lipux
	 HbiT7ZuNsJu+j+SdkuDaJO/g/SazhdHX890xshdOJwVsB4QWoU/oe1V6aEcFWvg9ST
	 sFSGQq6gUNckQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/amlogic: switch to clk_bulk API to
 support multiple clocks
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v1-2-7d4c4682f182@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
 <20260923-fix-t7-thermal-clock-v1-2-7d4c4682f182@aliel.fr>
Date: Wed, 23 Sep 2026 12:00:10 +0000
Message-Id: <20260923120010.A03111F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHRoZXJtYWwvYW1sb2dp
Yzoga2VybmVsIHBhbmljIG9uIHVuY2xvY2tlZCByZWdpc3RlciBhY2Nlc3MgaWYgRFQgbGFja3Mg
Y2xvY2tzCi0tCgpjb21taXQgZWE1NDM5YTVmNjg3NjllMTBkNThjOTNhOTQ5YTI4M2JmNjk4NGE1
ZgpBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKdGhl
cm1hbC9kcml2ZXJzL2FtbG9naWM6IHN3aXRjaCB0byBjbGtfYnVsayBBUEkgdG8gc3VwcG9ydCBt
dWx0aXBsZSBjbG9ja3MKClRoZSB0Ny10aGVybWFsIHZhcmlhbnQgbm93IGV4cG9zZXMgdHdvIGNs
b2NrcyAoYnVzIGFuZCBjb3JlKSBpbiBpdHMKZGV2aWNldHJlZSBiaW5kaW5nLCBidXQgdGhlIGRy
aXZlciBvbmx5IGtub3dzIGhvdyB0byBnZXQgYW5kIG1hbmFnZQphIHNpbmdsZSBzdHJ1Y3QgY2xr
LiBVc2luZyBkZXZtX2Nsa19nZXQoKSB3b3VsZCBzaWxlbnRseSBpZ25vcmUgdGhlCnNlY29uZCBj
bG9jaywgc28gc3dpdGNoIHRvIGRldm1fY2xrX2J1bGtfZ2V0X2FsbCgpIGFuZCB0aGUgbWF0Y2hp
bmcKY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoKS9jbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZSgp
IGNhbGxzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5j
IGIvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gaW5kZXggYTBiNTMwNjI0YjYw
Yy4uMmU4ZDA0MjA2NzA3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190
aGVybWFsLmMKPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKWyAuLi4g
XQo+IEBAIC0zMjMsOSArMzI0LDEwIEBAIHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAoSVNfRVJSKHBkYXRhLT5yZWdt
YXApKQo+ICAJCXJldHVybiBQVFJfRVJSKHBkYXRhLT5yZWdtYXApOwo+ICAKPiAtCXBkYXRhLT5j
bGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiAtCWlmIChJU19FUlIocGRhdGEtPmNsaykp
Cj4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHBkYXRhLT5jbGspLCAiZmFp
bGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gKwlyZXQgPSBkZXZtX2Nsa19idWxrX2dldF9hbGwoZGV2
LCAmcGRhdGEtPmNsa3MpOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZ2V0IGNsb2Nrc1xuIik7Cj4gKwlwZGF0YS0+bnVtX2Ns
a3MgPSByZXQ7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBhbGxvdyB0aGUgcHJvYmUgdG8g
c3VjY2VlZCB3aXRob3V0IGFueSBjbG9ja3MsIGxlYWRpbmcgdG8gYSBjcmFzaApkdXJpbmcgcmVn
aXN0ZXIgYWNjZXNzIGlmIHRoZSBkZXZpY2UgdHJlZSBsYWNrcyBjbG9ja3M/CgpXaGlsZSBkZXZp
Y2UgdHJlZXMgYXJlIHR5cGljYWxseSB0cnVzdGVkLCBtaXNzaW5nIHJlcXVpcmVkIHByb3BlcnRp
ZXMgbXVzdApyZXN1bHQgaW4gYSBncmFjZWZ1bCBwcm9iZSBmYWlsdXJlLCBub3QgYSBzeXN0ZW0g
Y3Jhc2guIFRoZSBvcmlnaW5hbApkZXZtX2Nsa19nZXQoKSBjbGVhbmx5IGZhaWxlZCB3aXRoIC1F
Tk9FTlQgaWYgdGhlIGNsb2NrIHdhcyBtaXNzaW5nLgoKQnkgY2hhbmdpbmcgdGhpcyB0byBkZXZt
X2Nsa19idWxrX2dldF9hbGwoKSwgYSBtaXNzaW5nIGNsb2NrcyBwcm9wZXJ0eSBub3cKcmV0dXJu
cyAwLiBUaGUgZHJpdmVyIHNldHMgcGRhdGEtPm51bV9jbGtzID0gMCBhbmQgcHJvY2VlZHMgd2l0
aG91dCBlcnJvci4KCkxhdGVyIGluIHByb2JlLCBhbWxvZ2ljX3RoZXJtYWxfZW5hYmxlKCkgY2Fs
bHMgY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoKQood2hpY2ggYmVjb21lcyBhIG5vLW9wIGZvciAw
IGNsb2NrcykgYW5kIHRoZW4gd3JpdGVzIHRvIFRTRU5TT1JfQ0ZHX1JFRzEuCgpBY2Nlc3Npbmcg
aGFyZHdhcmUgcmVnaXN0ZXJzIHdpdGhvdXQgZmlyc3QgZW5hYmxpbmcgdGhlIG5lY2Vzc2FyeSBi
dXMgb3IgY29yZQpjbG9ja3MgdXN1YWxseSByZXN1bHRzIGluIGEgYnVzIGZhdWx0IChzeW5jaHJv
bm91cyBleHRlcm5hbCBhYm9ydCksIGNhdXNpbmcgYQprZXJuZWwgcGFuaWMuIFNob3VsZCB0aGVy
ZSBiZSBhbiBleHBsaWNpdCBjaGVjayBmb3IgcmV0ID09IDAgdG8gcmV0dXJuIGFuCmVycm9yPwoK
PiAgCj4gIAlpZiAocGRhdGEtPmRhdGEtPnVzZV9zbSkKPiAgCQlyZXQgPSBhbWxvZ2ljX3RoZXJt
YWxfcHJvYmVfc20ocGRldiwgcGRhdGEpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyMy1maXgtdDctdGhlcm1hbC1jbG9jay12
MS0wLTdkNGM0NjgyZjE4MkBhbGllbC5mcj9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
