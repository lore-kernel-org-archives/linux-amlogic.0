Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096DFD5C0F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T/VnmHUPD3sIM3MhSuieUNkI6+7wMGtVRQuR1G86jI=; b=jcKu9XHYHjpCgC
	issdikD+LNsa5tcG/RlucWJxgRM+eMV2YT1rogIlhkYMgAieDji4slD/dszUu4BabI3ixHX8iXH4x
	lSTCWgWRFFa807eV45fGm/LHxhMbrwyAf/XASKlVH3fjSKBcCAo8sXv9xlf74MhuNSl+JtfB29kxv
	MC2fHeqfPFBs+lzpoOvGi6Hd3w/l59pWtoU5skpUS9IvMnnzTJILsXS0tEA5YDF3k60Dk5xbW0KO0
	hcVhiSKqgMgNnq0VrkeXUnbnYc+MzOmZBVZQhUB364iHtiTjll+1VYHhkkEjpr8Qet1HuKNpoItHx
	JTBJo950d+55o/80xIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQgW-00000004wOy-3Vi0;
	Tue, 16 Dec 2025 08:45:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQgS-00000004wOL-0uZk
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 08:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5045943302;
	Tue, 16 Dec 2025 08:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2840C16AAE;
	Tue, 16 Dec 2025 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765874727;
	bh=tvseRd0ZBKVZuxl0/2VvYZVVO718dYCkJYN9IBKiMek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QR7Uiw5VgzfsE7U2kpUwyYuna6qcbU3xhKYDGw7qrT+JaDIQ0b7i73YSGqS77cDNW
	 UTNhYKC+8o/f77bxcvYPR19JheTOlciBMoIBWrALFiOrqXbOl/JHnuTTQBxlTWJ2nP
	 yPWNXIn0wJyGOnrZaBiykTUUDy/dAK+mp9lX69iV7gXRwdyWlABYY4KfpOwT+0Ckkt
	 0evz8jbMl1Gric++TNzBTHxA8gcRJFA/OwUGTGRSG5bcwDk4fK08uKw/n7zoX77mdI
	 Hp/BD5AlYesfSLHaHF4nRPNzs8LLrjC55iXgDVXsofltBzxK+wwhlmn5ibZGMnog+E
	 wKxcUd69ZdlPA==
Message-ID: <83c771e7-f32b-48e4-91ab-d7c3b9746e14@kernel.org>
Date: Tue, 16 Dec 2025 09:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: Add Amlogic general DMA
To: xianwei.zhao@amlogic.com, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
 <20251216-amlogic-dma-v1-1-e289e57e96a7@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251216-amlogic-dma-v1-1-e289e57e96a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_004528_359320_E503CFCD 
X-CRM114-Status: GOOD (  14.06  )
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

T24gMTYvMTIvMjAyNSAwOTowMywgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPiBG
cm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiAKPiBBZGQgZG9j
dW1lbnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIGdlbmVyYWwgRE1BLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+IC0tLQo+
ICAuLi4vYmluZGluZ3MvZG1hL2FtbG9naWMsZ2VuZXJhbC1kbWEueWFtbCAgICAgICAgICB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcwIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS9hbWxvZ2ljLGdlbmVyYWwtZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZG1hL2FtbG9naWMsZ2VuZXJhbC1kbWEueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44YjljZWM5YjhkYTAKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGdlbmVyYWwt
ZG1hLnlhbWwKPiBAQCAtMCwwICsxLDcwIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9hbWxvZ2ljLGdlbmVyYWwtZG1hLnlh
bWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIwo+ICsKPiArdGl0bGU6IEFtbG9naWMgZ2VuZXJhbCBETUEgY29udHJvbGxlcgo+ICsKPiAr
ZGVzY3JpcHRpb246IHwKPiArICBUaGlzIGlzIGEgZ2VuZXJhbC1wdXJwb3NlIHBlcmlwaGVyYWwg
RE1BIGNvbnRyb2xsZXIuIEl0IGN1cnJlbnRseSBzdXBwb3J0cwo+ICsgIG1ham9yIHBlcmlwaGVy
YWxzIGluY2x1ZGluZyBJMkMsIEkzQywgUElPLCBhbmQgQ0FOLUJVUy4gVHJhbnNtaXQgYW5kIHJl
Y2VpdmUKPiArICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdvIHNlcGFyYXRlIGNoYW5u
ZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAo+ICsgIHJlZ2lzdGVyIHNldHMuIEkyQyBhbmQg
STNDIHRyYW5zZmVyIGRhdGEgaW4gMS1ieXRlIHVuaXRzLCB3aGlsZSBQSU8gYW5kCj4gKyAgQ0FO
LUJVUyB0cmFuc2ZlciBkYXRhIGluIDQtYnl0ZSB1bml0cy4gRnJvbSB0aGUgY29udHJvbGxlcuKA
mXMgcGVyc3BlY3RpdmUsCj4gKyAgdGhlcmUgaXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4K
PiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1s
b2dpYy5jb20+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25z
dDogYW1sb2dpYyxnZW5lcmFsLWRtYQoKSSBkb24ndCBrbm93IHdoYXQgeW91IG1lYW4gYnkgImdl
bmVyYWwiIGJ1dCBpdCBmZWVscyBsaWtlIHdpbGRjYXJkLCBub3QKU29DLCBzbyB0aGF0IHdvdWxk
IGJlIGEgbm8tZ28uIFJlYWQgd3JpdGluZyBiaW5kaW5ncyBvciBzZXZlcmFsIHRhbGtzCmFib3V0
IHRoaXMuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
