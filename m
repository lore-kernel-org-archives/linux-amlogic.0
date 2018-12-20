Return-Path: <SRS0=VwQT=O5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093AEC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 05:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA99B20869
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 05:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fdh5Ia7c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA99B20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiXse+CyN/4aVC6zuM/naT9UrHkaNziqpTPW6lKqUOA=; b=Fdh5Ia7caEF8Tp86jlAtedd/W
	OE3mH+34YZ+/vfIJVNkKBQL3J1dRCS3Xboc1uHWQ4fPDTGTCPOJ79CquQIkR8baPkWINFQ8bacEPZ
	xNCEGbgXlbBuM2uRq5p3nZfhIumyaTbiws1E/v0unszC8wpYsFN25gzkZdR+F4F8XfTl9Pgr6nwIl
	OcfnFmhSnpqmTIH3NDy4Wnn1Faj44mz6l3M1bmyLYxCP5AaBqs9t4fmbQiOaZ2aQq14V8bJgkvN8L
	cGDFYDePZnviGr8krBAIpwGgBG8c0oysLtB/LVUp8XmZZMUGd2Id5k9hRGgPKwqwI0/8SNQmq+7O8
	tl/45tY7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZr2n-0007By-4q; Thu, 20 Dec 2018 05:38:49 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZr2k-0007BL-La; Thu, 20 Dec 2018 05:38:48 +0000
Received: from [192.168.2.7] (unknown [78.218.214.33])
 by smtp4-g21.free.fr (Postfix) with ESMTP id B948B19F58A;
 Thu, 20 Dec 2018 06:38:28 +0100 (CET)
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
References: <20181219002620.12138-1-khilman@baylibre.com>
From: Chris Moore <moore@free.fr>
Message-ID: <7584b0db-573e-fef8-b5c7-2e02cc5bd780@free.fr>
Date: Thu, 20 Dec 2018 06:38:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20181219002620.12138-1-khilman@baylibre.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_213846_848388_9A5D77AD 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpMZSAxOS8xMi8yMDE4IMOgIDAxOjI2LCBLZXZpbiBIaWxtYW4gYSDDqWNyaXTCoDoKPiBB
ZGQgbmV3IHZlbmRvciBmb3IgYW1lZGlhdGVjaCwgYW5kIGluaXRpYWwgYm9hcmQ6IHg5Ni1tYXgK
Pgo+IFNpZ25lZC1vZmYtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cj4g
LS0tCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0
ICAgICB8IDEgKwo+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy50eHQgfCAxICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxv
Z2ljLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50
eHQKPiBpbmRleCA4ZGJjMjU5MDgxZTQuLmM1MGIwODRiNmM1OSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnR4dAo+IEBAIC05OSw2
ICs5OSw3IEBAIEJvYXJkIGNvbXBhdGlibGUgdmFsdWVzIChhbHBoYWJldGljYWxseSwgZ3JvdXBl
ZCBieSBTb0MpOgo+ICAgICAtICJhbWxvZ2ljLHAyODEiIChNZXNvbiBneGwgczkwNXcpCj4gICAg
IC0gIm9yYW50aCx0eDMtbWluaSIgKE1lc29uIGd4bCBzOTA1dykKPiAgIAo+ICsgIC0gImFtZWRp
YXRlY2gseDk2LW1heCIgKE1lc29uIGd4bSBzOTEyKQo+CgpTaG91bGRuJ3QgdGhhdCBiZSBNZXNv
biBnMTJhIHM5MDV4MiA/CgpDaGVlcnMsCkNocmlzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
