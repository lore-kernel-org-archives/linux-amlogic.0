Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43BAC0218A
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8c+J2ZLBS3P4mMEMYxqDDR6W+ytUwkqy2UF8tyKnf4=; b=YuhMAm9/JYae3n
	kDFRpA0rPoP4Po+a4Sv1q2ixTDMIXpvZfausLt0lJWd/ZUgCTRaB/Aj2ZHNOedDVm0JCFMMdu0lDD
	L8i5hI17Pq0kIyPMN1vJc3+zgYMORbPz3N/wUBw9B5mbSFHkzIRTNJyeLgTITKwZBnuWvpiYwuRvx
	hiIxHLmDOjkMXNzYLdXtp9zZhGJGWy0AoIuHdZNZN6nF8w9ZbYRmDc0a7gRDRkuLESnrUFH1ycHM7
	9lUd1oE5jPlcASIZvRC0i18SFnRKhkt1ceAKoPgyIhfMrSyubPI1mzLhsdD2jjI3D5Yl4aWsGMr37
	JufcrYlEZhuV+AtKnLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teAsY-0000000C9uL-3o6z;
	Sat, 01 Feb 2025 10:37:34 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teAsV-0000000C9tz-1Bxz
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Feb 2025 10:37:33 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738406243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PATAQ/9BwIrWJ3JG6zuTUGePxEvjmurrP+nZnbHjNSM=;
	b=pTBB+O0KTKCP9wTrBMgiLMyxMhEgbSIKEe7gFkbkqj+M9bU6lh7kxg5MEHk2wfS0+PVSRu
	hnf78jkW3RAFs6CGJAgLCkgHVwr440+Td5zj12/HeuPGp5EEkaGlTLFH2ghxaTuFXzsFiF
	+5VZjumqIIEwxgpbw9DzYrLP2o7CSAOMAAHbvSjn1aSApAINi8jFMyQt4VnHsTETrG9SPK
	KhbdR1yqNSfu9PPVEAisb3nuR14Ys06aNZZGV4d87nc8P0X8T1b7wv5jz/ydGSMzrBkENQ
	l8vl05ah/dbQuQeF4sRveDRHsPI6Hfjv/PImveicpK0OGSxFSA1tci0mvlkA1Q==
Date: Sat, 01 Feb 2025 10:36:37 +0000
Message-Id: <D7H1KE36MWE6.1G0PMUXEGX4XG@postmarketos.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Christian Hewitt" <christianshewitt@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-2-funderscore@postmarketos.org>
 <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
In-Reply-To: <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_023731_768353_0B468475 
X-CRM114-Status: GOOD (  15.11  )
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

T24gU2F0IEZlYiAxLCAyMDI1IGF0IDU6NDUgQU0gVVRDLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3Rl
Ogo+ID4gT24gMSBGZWIgMjAyNSwgYXQgMTI6MDPigK9hbSwgRmVyYXNzIEVsIEhhZmlkaSA8ZnVu
ZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IEZyb206IEZlcmFzcyBF
bCBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+Cj4gPiAKPiA+IEFkZCBzdXBw
b3J0IGZvciB4aWFvbWktYXF1YW1hbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRmVyYXNzIEVs
IEhhZmlkaSA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4KPiA+IC0tLQo+ID4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCAxICsKPiA+IDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+ID4gaW5kZXggMDY0Nzg1
MWFlLi4wZGI3MDM4YjkgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiA+IEBAIC03MCw2ICs3MCw3IEBAIHByb3Bl
cnRpZXM6Cj4gPiAgICAgICAgICAgLSBlbnVtOgo+ID4gICAgICAgICAgICAgICAtIGFtbG9naWMs
cDI0MQo+ID4gICAgICAgICAgICAgICAtIGxpYnJldGVjaCxhbWwtczgwNXgtYWMKPiA+ICsgICAg
ICAgICAgICAgIC0geGlhb21pLGFxdWFtYW4KPgo+IElmIHRoaXMgaXMgUzgwNVkgbm90IFM4MDVY
LCB5b3Ugc2hvdWxkIGFkZCBhIG5ldyBiaW5kaW5nIHNlY3Rpb24gZm9yCj4gUzgwNVkgZGV2aWNl
cywgYW5kIGFkZCB0aGUgYm9hcmQgdGhlcmUuCgpXaWxsIGRvLiAgVGhhbmtzLgoKPgo+IGUuZy4g
SSBkaWQgdGhpcyBmb3IgUzkwNUwgKEdYTFgpIGRldmljZXM6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvcGF0Y2gvMjAyNDA2MDQwODQxMzQuMzMx
NTg0MS0xLWNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tLwo+Cj4gQ2hyaXN0aWFuCj4KPiA+ICAg
ICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM4MDV4Cj4gPiAgICAgICAgICAgLSBjb25zdDogYW1s
b2dpYyxtZXNvbi1neGwKPiA+IAo+ID4gLS0gCj4gPiAyLjQ3LjEKPiA+IAo+ID4gCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
