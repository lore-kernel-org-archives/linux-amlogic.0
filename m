Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC8CC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A74E2064A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pO4T+iVh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="t/XWwwgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A74E2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxA5Jgra2hOkjQX0C9HaZzk9nsxVOQj9JMGUtTPChXw=; b=pO4T+iVhbLaz7hL5rAy5Tfb+D
	B3BDJBqCSB4/DaX2F0fWCYNdEqxgoDYm2DY/wTvE/wZnVK2NjWIUyut+yc29ot5D7Pozc6f0tDpDI
	/t0J95+vNY7P3lWFZNXPj+nRrMyP8RZy/drfgOOkf7BfD6/sO6C3sCdFRWqwOVr1fXet3yM6zGQaX
	dZqDfbhMC+QLakDwMBDa9qB0bGHmOa9og0pXXfhuweKGGBZdpQlZ3QYrqmzXGLMolnWaATdoedeoT
	HhE4dPCZJTDTfG58xQxSDII55gpp5VVJ0x6yFoU+NKr1Sp7RzDJqxdgz2Pan/YOr1hOp/WQEZ+6zt
	ejzqcKJYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8kI-0004N4-Kk; Mon, 29 Apr 2019 16:03:10 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8kG-0004MH-37
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 16:03:09 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8ZP4p0Zz9vD3X;
 Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t/XWwwgi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rDCK6vg8yFrw; Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8ZP3Xg2z9vD3V;
 Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556553773; bh=rcIaV+qc0a8fdgHPWG+m+q/P408Q7NZbpDrRgA8ibzQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t/XWwwgiGGqb4fakwrx+64OJYiFmBqOtxxKKg57IrO65WVTL2+3oxzYQlAOb07xCN
 hpbOzwzvRRN8iDlKe0D/LoYalhYWGTFpN2A7XfiJ+NZRewX5LsG70Dxwza+yb4Dq3p
 808JBPA7xndmvAbkD9TLLUUvyTOqQmYhUgZj+G4E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3468B8B4;
 Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7KbpjHDpfWiZ; Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 636AD8B8B3;
 Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
Subject: Re: [PATCH 21/41] drivers: tty: serial: cpm_uart: fix includes
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-22-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <da473f1b-d6a5-f82a-5af3-d4dfaaabf947@c-s.fr>
Date: Mon, 29 Apr 2019 18:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-22-git-send-email-info@metux.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_090308_429177_6A53BAB8 
X-CRM114-Status: GOOD (  10.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAyNy8wNC8yMDE5IMOgIDE0OjUyLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3Vs
dCBhIMOpY3JpdMKgOgo+IEZpeGluZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gCj4gICAgICBXQVJO
SU5HOiBVc2UgI2luY2x1ZGUgPGxpbnV4L2lvLmg+IGluc3RlYWQgb2YgPGFzbS9pby5oPgo+ICAg
ICAgIzI1OiBGSUxFOiBkcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5j
OjI1Ogo+ICAgICAgKyNpbmNsdWRlIDxhc20vaW8uaD4KPiAKPiAgICAgIFdBUk5JTkc6IFVzZSAj
aW5jbHVkZSA8bGludXgvaW8uaD4gaW5zdGVhZCBvZiA8YXNtL2lvLmg+Cj4gICAgICArI2luY2x1
ZGUgPGFzbS9pby5oPgo+IAo+ICAgICAgV0FSTklORzogVXNlICNpbmNsdWRlIDxsaW51eC9kZWxh
eS5oPiBpbnN0ZWFkIG9mIDxhc20vZGVsYXkuaD4KPiAgICAgICsjaW5jbHVkZSA8YXNtL2RlbGF5
Lmg+Cj4gCj4gU2lnbmVkLW9mZi1ieTogRW5yaWNvIFdlaWdlbHQgPGluZm9AbWV0dXgubmV0PgoK
UmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgoK
PiAtLS0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jb3JlLmMgfCA0
ICsrLS0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0yLmMgfCAy
ICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2Nv
cmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jb3JlLmMKPiBpbmRl
eCAzNzRiOGJiLi5jODMxZDMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1f
dWFydC9jcG1fdWFydF9jb3JlLmMKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQv
Y3BtX3VhcnRfY29yZS5jCj4gQEAgLTMzLDEwICszMywxMCBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4
L2dwaW8uaD4KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4gICAjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICsjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4KPiAgIAo+IC0jaW5jbHVkZSA8YXNtL2lvLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2lycS5o
Pgo+IC0jaW5jbHVkZSA8YXNtL2RlbGF5Lmg+Cj4gICAjaW5jbHVkZSA8YXNtL2ZzX3BkLmg+Cj4g
ICAjaW5jbHVkZSA8YXNtL3VkYmcuaD4KPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91
YXJ0L2NwbV91YXJ0X2NwbTIuYwo+IGluZGV4IGVmMWFlMDguLjQwY2ZjZjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYwo+ICsrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0yLmMKPiBAQCAtMjEsOCArMjEs
OCBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21l
bWJsb2NrLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L2lvLmg+Cj4gICAKPiAtI2luY2x1ZGUgPGFzbS9pby5oPgo+ICAgI2luY2x1ZGUgPGFz
bS9pcnEuaD4KPiAgICNpbmNsdWRlIDxhc20vZnNfcGQuaD4KPiAgICNpbmNsdWRlIDxhc20vcHJv
bS5oPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
