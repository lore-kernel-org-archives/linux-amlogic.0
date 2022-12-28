Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE7C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ix80QNasVD0Z3kRibTS7YIqblP4zaPn4NhREzqn2AY=; b=UdzXhL1Pu6k+im
	6JSZFGfU/3L2HwKUijJ8Zduzzy2uwW35H18ZQwml2djWg3/z8tT4xgC8e+xHBtKMDGoD8igvtvGh5
	dNQpXter0Yb4HqHJYlUcRHcnnTYv04mYGoSaHw1V+2ZLoMFKq8FZfZWn2JK0Z2arvr9B+e3jFHkCD
	3RW/xfgcs9niy/kk7pgR71ldtXFdb0K3Zxl/E+iuF4IGDB+TU11QyDLJpy5qzABo+fXz9EsnFTxCz
	cZLh21L6aiTzh5UPCO0sf50uwRbtM72RlgxHuq3J7EvfA74ELOwooEb8ngqZgVZVHnCX+SRBWTq7f
	4L7/Zc2JvXXH0r9K8XpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATMQ-003xVU-2g; Wed, 28 Dec 2022 10:08:34 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATMJ-003xKl-Oj
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672222100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DR7EU7XZmfJBsV2/fzc+7dKvSMdtHaD/bwPhesW4sa4eMih2Y1Ph9CuNLETSurqR8o2Ai6hOwQbyTn+dVXGTxCAmEjcFzH446+Kx80SWfo+VJgw2Hc2Dg39mjyAyzs6lLXkFGOca1Pk+IwAw4sCFetUMl2RL9gpfk1jH9P91ZuI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672222100; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6RIh+iAefWxFs9a9psv5C07vlRmV2frNtjn4+K4G0VM=; 
	b=BKs3u9KWDNUajiU+Op2bpOgXKzEeCIjYwETWhAV87+4/RT9u1qFGzgjWW9JQ/Wo2a/bJfd/XaZo0xtNWpHxuUUFfZM9GIb7US8g1ORsYQlC+l8FIAmFvaNvJN/AxPMCT/JinzJ1Wagm/qN15itYSSgINEo9C1Io8cDRrWRq2Lzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672222100;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=6RIh+iAefWxFs9a9psv5C07vlRmV2frNtjn4+K4G0VM=;
	b=F8u11A+Qt19bpek999EarlNKxkoaqLgAYN38B8vxF24KC138yn43JyPyf+oG0LGf
	IkDuB71tnIwS34asv4r4AZoW4TJA+AYc3Ns8A45xmR+6YNL20rDeLZFyw55jq9kjkoL
	/B09D9UzudyRmbuS+XujDxBHHuSD+EknYGBfNkcU=
Received: from edelgard.fodlan.icenowy.me (120.85.99.39 [120.85.99.39]) by mx.zohomail.com
	with SMTPS id 1672222099827577.0094574854984; Wed, 28 Dec 2022 02:08:19 -0800 (PST)
Message-ID: <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Anand Moon <linux.amoon@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
	Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Dec 2022 18:08:15 +0800
In-Reply-To: <20221228100321.15949-2-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
	 <20221228100321.15949-2-linux.amoon@gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020827_988649_EA6DEBC7 
X-CRM114-Status: GOOD (  10.47  )
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

5ZyoIDIwMjItMTItMjjmmJ/mnJ/kuInnmoQgMTA6MDMgKzAwMDDvvIxBbmFuZCBNb29u5YaZ6YGT
77yaCj4gQWRkIHVzYiBodWIgZGV2aWNlIGlkIGZvciBHZW5lc3lzIExvZ2ljLCBJbmMuIEdMODUy
Ry1PSEcgSHViIFVTQiAyLjAKPiByb290IGh1YiBhbmQgR2VuZXN5cyBMb2dpYywgSW5jLiBHTDM1
MjMtUUZONzYgVVNCIDMuMSByb290IGh1Yi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29u
IDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Cj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwgfCAyICsrCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdAo+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1sCj4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiBpbmRleCBh
OWY4MzE0NDhjY2EuLmRiMDA5ZjNlZjQzOCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiBAQCAt
MTYsNiArMTYsOCBAQCBwcm9wZXJ0aWVzOgo+IMKgwqAgY29tcGF0aWJsZToKPiDCoMKgwqDCoCBl
bnVtOgo+IMKgwqDCoMKgwqDCoCAtIHVzYjVlMyw2MDgKPiArwqDCoMKgwqDCoCAtIGdlbmVzeXMs
dXNiNWUzLDYxMAo+ICvCoMKgwqDCoMKgIC0gZ2VuZXN5cyx1c2I1ZTMsNjIwCgpJIGRvbid0IHRo
aW5rIGdlbmVzeXMsIGlzIG5lZWRlZCBoZXJlIGJlY2F1c2UgdXNiNWUzIG1lYW5zIFVTQiBWSUQK
MHgwNWUzLCB3aGljaCBpcyBhbHJlYWR5IGxpbmtlZCB0byBHZW5lc3lzIExvZ2ljLgoKSW4gYWRk
aXRpb24sIHRoZSBjb250cm9sIGxvZ2ljIG9mIHRoZXNlIHR3byBodWJzIGFyZSBuZWVkZWQgdG8g
YmUKdmVyaWZpZWQuCgpBbmQgd2hhdCdzIHRoZSBzdGF0dXMgb2YgdGhlIGNvbXBhbmlvbiBodWIg
b2YgdGhlIFVTQjMgaHViPyBJcyBpdApyZWFsbHkgYSBVU0IzLW9ubHkgaHViLCBvciBpcyBpdHMg
VVNCMiBwYXJ0IGp1c3QgZXF1YWwgdG8gYW5vdGhlciBVU0IzCmh1Yj8KCj4gwqAKPiDCoMKgIHJl
ZzogdHJ1ZQo+IMKgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
