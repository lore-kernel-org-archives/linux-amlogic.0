Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233BEC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F0D20673
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 16:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIadq1um";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="BjQx+kaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F0D20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hfhjBm+gfrqBCOck4YGg6cvsKZic6L06nb5WQ3Tpd0o=; b=lIadq1umrLHsAPEKW/8AMYFnn
	ADfc7TAaquEKwmdU7pvBPy7bEKgQcFLVxjiPjtbhQ1cvQvHP6p2dCelwJ7d+qebbqqZZoIciPtGLp
	xLrHYeSiXo+gaNeGyGNqq0qJaSrFfaoFuEIKK93x5YVocFVtSOifiZw9dwSn86pSRGD0dfZaqSKKs
	BtK6aEldoC4a8vlNZpecd8QOmKEazBi3oB5IS4PFt6LpvVr3YGGUiYnam5/TqrCIBJlxXJbqdets2
	NH1+4B0Dt/gf5ORSGtQBjNcY5fJhdL9KP2mOswDzChhGRtv33yQjrS1Lira558HMXq0/STX5K9HfF
	QF4pT9YyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8zV-0000v2-8J; Mon, 29 Apr 2019 16:18:53 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8zP-0000me-T4
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 16:18:51 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8wN2pCvz9vDbs;
 Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BjQx+kaE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aXsRFK1QTZr9; Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8wN1Rbrz9vDbr;
 Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556554708; bh=FmG0gTYs5oq5h81q7jEyc4Wov/smm6KptMn1bWZZ6UY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BjQx+kaEHgEJb9T/61rt3diCsJNYkiNHUhfzgr+mvjN4Pnywq5MbgYBcqpdIQz91l
 MOoWYXEzdn4IgWuIaWT6IQgLGYQmiTbu4vZxYLhMqB1ljWxO3BTYx68HtfYfrLa2pJ
 DnY47LpRSIwR+sTZMzdaApWHw4o+sdP3BfWcan1g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 671608B8B4;
 Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J9zNcQs8Cgt1; Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 094208B8B3;
 Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
Subject: Re: serial drivers polishing
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7471c418-4058-db7b-b2ed-af9a67fff201@c-s.fr>
Date: Mon, 29 Apr 2019 16:16:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_091848_547337_0D1807DE 
X-CRM114-Status: GOOD (  11.46  )
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

SGksCgpPbiAwNC8yNy8yMDE5IDEyOjUxIFBNLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29u
c3VsdCB3cm90ZToKPiBIZWxsbyBmb2xrcywKPiAKPiAKPiBoZXJlJ3MgYW5vdGhlciBhdHRlbXB0
IG9mIHBvbGlzaGluZyB0aGUgc2VyaWFsIGRyaXZlcnM6Cj4gCj4gKiBsb3RzIG9mIG1pbm9yIGNs
ZWFudXBzIHRvIG1ha2UgY2hlY2twYXRjaCBoYXBwaWVyCj4gICAgKGVnLiBmb3JtYXR0aW5nLCBp
bmNsdWRlcywgaW50dHlwZXMsIC4uLikKPiAKPiAqIHVzZSBhcHByb3ByaWF0ZSBsb2dnaW5nIGhl
bHBlcnMgaW5zdGVhZCBvZiBwcmludGsoKQo+IAo+ICogY29uc2VxdWVudCB1c2Ugb2YgbWFwc2l6
ZS9tYXBiYXNlIGZpZWxkczoKPiAgICB0aGUgYmFzaWMgaWRlYSBpcywgYWxsIGRyaXZlcnMgc2hv
dWxkIGZpbGwgbWFwYmFzZS9tYXBiYXNlIGZpZWxkcyBhdAo+ICAgIGluaXQgdGltZSBhbmQgbGF0
ZXIgb25seSB1c2UgdGhvc2UgZmllbGRzLCBpbnN0ZWFkIG9mIGhhcmRjb2RlZCB2YWx1ZXMKPiAg
ICAobGF0ZXIgb24sIHdlIGNhbiBhZGQgZ2VuZXJpYyBoZWxwZXJzIGZvciB0aGUgbWFwL3VubWFw
IHN0dWZmLCBldGMpCj4gCj4gKiB1bnR3aXN0aW5nIHNlcmlhbDgyNTBfcG9ydF9zaXplKCkgYXQg
YWxsOgo+ICAgIG1vdmUgdGhlIGlvbWVtIHNpemUgcHJvYmluZyB0byBpbml0aWFsaXphdGlvbiB0
aW1lLCBtb3ZlIG91dCBzb21lCj4gICAgcGxhdGZvcm0gc3BlY2lmaWMgbWFnaWMgdG8gY29ycmVz
cG9uZGluZyBwbGF0Zm9ybSBjb2RlLCBldGMuCj4gCj4gCj4gVW5mb3J0dW5hdGVseSwgSSBkb24n
dCBoYXZlIHRoZSBhY3R1YWwgaGFyZHdhcmUgdG8gcmVhbGx5IHRlc3QgYWxsCj4gdGhlIGNvZGUs
IHNvIHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSdzIHNvbWV0aGluZyBicm9rZW4gaW4gaGVy
ZS4KPiAKPiAKPiBoYXZlIGZ1biwKPiAKPiAtLW10eAo+IAoKCkdvdCB0aGUgZm9sbG93aW5nIGJ1
aWxkICBlcnJvciB3aGlsZSBjb21waWxpbmcgZm9yIG15IHBvd2VycGMgYm9hcmQgd2l0aCAKeW91
ciBmdWxsIHNlcmllcyBhcHBsaWVkLiBObyB0aW1lIHRvIGludmVzdGlnYXRlIHRob3VnaC4KCiAg
IENDICAgICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24ubwpJbiBmaWxlIGluY2x1
ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NlcmlhbF84MjUwLmg6MTQ6MCwKICAgICAgICAgICAg
ICAgICAgZnJvbSBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jOjMzOgouL2luY2x1
ZGUvbGludXgvc2VyaWFsX2NvcmUuaDogSW4gZnVuY3Rpb24g4oCYdWFydF9tZW1yZXNfc2V0X3Jl
c+KAmToKLi9pbmNsdWRlL2xpbnV4L3NlcmlhbF9jb3JlLmg6NDQ2OjE4OiBlcnJvcjog4oCYcmVz
b3VyY2XigJkgdW5kZWNsYXJlZCAKKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAgcG9y
dC0+aW9iYXNlID0gcmVzb3VyY2UtPnN0YXJ0OwogICAgICAgICAgICAgICAgICAgXgouL2luY2x1
ZGUvbGludXgvc2VyaWFsX2NvcmUuaDo0NDY6MTg6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVu
dGlmaWVyIAppcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFy
cyBpbgouL2luY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaDo0NTA6MjogZXJyb3I6IOKAmHVhcnTi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIAppbiB0aGlzIGZ1bmN0aW9uKQogICB1YXJ0LT5tYXBi
YXNlID0gcmVzLT5zdGFydDsKICAgXgouL2luY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaDogSW4g
ZnVuY3Rpb24g4oCYdWFydF9tZW1yZXNfc2V0X3N0YXJ0X2xlbuKAmToKLi9pbmNsdWRlL2xpbnV4
L3NlcmlhbF9jb3JlLmg6NDY0OjY6IGVycm9yOiDigJhzdHJ1Y3QgdWFydF9kcml2ZXLigJkgaGFz
IG5vIAptZW1iZXIgbmFtZWQg4oCYbWFwYmFzZeKAmQogICB1YXJ0LT5tYXBiYXNlID0gc3RhcnQ7
CiAgICAgICBeCi4vaW5jbHVkZS9saW51eC9zZXJpYWxfY29yZS5oOjQ2NTo2OiBlcnJvcjog4oCY
c3RydWN0IHVhcnRfZHJpdmVy4oCZIGhhcyBubyAKbWVtYmVyIG5hbWVkIOKAmG1hcHNpemXigJkK
ICAgdWFydC0+bWFwc2l6ZSA9IGxlbjsKICAgICAgIF4KLi9pbmNsdWRlL2xpbnV4L3NlcmlhbF9j
b3JlLmg6NDY2OjY6IGVycm9yOiDigJhzdHJ1Y3QgdWFydF9kcml2ZXLigJkgaGFzIG5vIAptZW1i
ZXIgbmFtZWQg4oCYaW90eXBl4oCZCiAgIHVhcnQtPmlvdHlwZSAgPSBVUElPX01FTTsKICAgICAg
IF4KbWFrZVszXTogKioqIFthcmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5vXSBFcnJv
ciAxCgoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
