Return-Path: <SRS0=JVYJ=LC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F82DC47082
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 12:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D2F61246
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 12:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D2F61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CheeQYtRWENxI+KjYOkuWRISa2PGEvoF0YNt8/wsLZg=; b=MN5J9ZHGgop1j4XfKAguDGvahI
	cGVVRp3XIvLukoc0pUBuLzL3DUjY5Bx3pEl02e6+B4MTILXDkrdLArvEEdbZlVch9s6YjYucneDcD
	o23edmOyl0S6n5Vd1MKTxbmva9d8hn16UDNWBDpPiNWgpa+rEUX9exQ1Qef/qKbqLYxtcVPOxuQfg
	LazmMqcOWNhpuZK9HkPGIb3TU/T24NS28LsWVSivQiYLiOl6afzKlak8efwJ53NtDYdp1vRJPeO5u
	i3ScbpA4iQs+3Vx6bzL1rgVjp0Eo3nNl5ZFCbDMA1ubH66WZFigz/Tvv8FFO9UIbCEVgTfl4M/h1s
	0c3PfO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqb6O-008RiP-Ji; Tue, 08 Jun 2021 12:45:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqayB-008OTG-BY
 for linux-amlogic@lists.infradead.org; Tue, 08 Jun 2021 12:36:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so1826148wmd.5
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jun 2021 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oO/mmtapvda3H1q5K93Xm/jjPVWrjAPkoEeYKXuI4iU=;
 b=Q0k3cI/cgfyXX25Rw7HztsR8I6jPhRw8J5MlYIeND2iygOimMvQxrZ+sYWJyhs0lHy
 ml+FrFcpOFIclFJIb48R3Wibio4zHr/L67LiVI69Op6sSjyDVIfgmP4bGfB4chy0JFBw
 z6IDP3F16VmFwnw1c3h3bRmjq62geNTz+R8H9FCypBTMvx+D0pVF+lZZ5bI1yVw3gOn1
 nyxWLRzwOjHBzaQO8zVEO1zIZvRGBQs76XIFMEri4x6OWM3Y3qAjYAjgaGIemw7BEhjb
 b0+LvORa+q7rntJNaHRRf0lN7x+iJlxwVObUbgeliRozs++qRhzGaBnDqv+lGh5r5/hq
 RKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oO/mmtapvda3H1q5K93Xm/jjPVWrjAPkoEeYKXuI4iU=;
 b=gF2IFFTR5rNElEYwkJnhMW9M77RpYO8Wb+d681YQHfojPmrKXTgwCne61haJrhh9tn
 6eLmz21XVXRAu4BeHYhuLi8rxd6PkljfYXbshnkj9cVqMvAKbEoWRTLSHoK9BocIblsk
 i7sqhJbpHhu4WAa2wSqOQDQkzMk9u3QCmOnr2afBgedFXoOYfBkgXwrBJmT/jVWaMCFH
 oFnvLutgZ1P6IbCy3fbdGM4a5iB8nj2Gwj8ptqktEMRwoZEHv/6zgsAtI1bIppLNP0Wn
 pT6qj08NXuSs55oZuplfuKGLSDKMXvTkbx6MpcpblFHyLYsmJl+uFg4kMg7Tq424ipgN
 8ONA==
X-Gm-Message-State: AOAM533UrgvGVZNAgbxeZo+b4NJ+/kOVHIbwx40TYgEhcGLNeWoa9wI7
 P6u0FJaL+sZs8CuteGZfJKrrgg==
X-Google-Smtp-Source: ABdhPJzGmhxU7Sx26fpReO9mfAqjeCqUAGoC1hph7WblUxi8a785peFYuR1HgXfuUu+mg6HiVlOvfw==
X-Received: by 2002:a1c:9ac5:: with SMTP id c188mr3910463wme.17.1623155792040; 
 Tue, 08 Jun 2021 05:36:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b?
 ([2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b])
 by smtp.gmail.com with ESMTPSA id m22sm2614313wmq.21.2021.06.08.05.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:36:31 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] arm64: Import latest memcpy()/memmove()
 implementation
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 linux-amlogic@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <cover.1622128527.git.robin.murphy@arm.com>
 <3c953af43506581b2422f61952261e76949ba711.1622128527.git.robin.murphy@arm.com>
 <CGME20210608111534eucas1p2964e360336878b9e7a791c0fbeb12940@eucas1p2.samsung.com>
 <acb244ad-0759-5a96-c659-5c23003d3dcd@samsung.com>
 <00519b97-7e09-49ed-817e-de234b0c1cd4@arm.com>
 <7624e09f-cd52-9430-ab18-1d816c8d2898@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <66d01d91-f52c-1318-aa12-175afff86bad@baylibre.com>
Date: Tue, 8 Jun 2021 14:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7624e09f-cd52-9430-ab18-1d816c8d2898@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_053638_690710_8F28591C 
X-CRM114-Status: GOOD (  18.11  )
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

SGksCgpPbiAwOC8wNi8yMDIxIDE0OjIxLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+ICsgS2V2
aW4KPiAKPiBPbiAwOC4wNi4yMDIxIDEzOjM3LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IEhpIE1h
cmVrLAo+Pgo+PiBPbiAyMDIxLTA2LTA4IDEyOjE1LCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+
Pj4gSGkgUm9iaW4sCj4+Pgo+Pj4gT24gMjcuMDUuMjAyMSAxNzozNCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+Pj4+IEltcG9ydCB0aGUgbGF0ZXN0IGltcGxlbWVudGF0aW9uIG9mIG1lbWNweSgpLCBi
YXNlZCBvbiB0aGUKPj4+PiB1cHN0cmVhbSBjb2RlIG9mIHN0cmluZy9hYXJjaDY0L21lbWNweS5T
IGF0IGNvbW1pdCBhZmQ2MjQ0IGZyb20KPj4+PiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29t
L3YxL3VybD9rPTBlMjVkNjMwLTUxYmVlZjI4LTBlMjQ1ZDdmLTBjYzQ3YTMxNGU5YS1iNDFmZGIy
ZDRkMDZmZjc1JnE9MSZlPWZjZmFmNzFkLWYwMWEtNGJjNC04ZTE2LThhZTg2ZTBjMDExNiZ1PWh0
dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRkFSTS1zb2Z0d2FyZSUyRm9wdGltaXplZC1yb3V0aW5l
cywgCj4+Pj4gYW5kIHN1YnN1bWluZwo+Pj4+IG1lbW1vdmUoKSBpbiB0aGUgcHJvY2Vzcy4KPj4+
Pgo+Pj4+IE5vdGUgdGhhdCBmb3Igc2ltcGxpY2l0eSBBcm0gaGF2ZSBjaG9zZW4gdG8gY29udHJp
YnV0ZSB0aGlzIGNvZGUKPj4+PiB0byBMaW51eCB1bmRlciBHUEx2MiByYXRoZXIgdGhhbiB0aGUg
b3JpZ2luYWwgTUlUIGxpY2Vuc2UuCj4+Pj4KPj4+PiBOb3RlIGFsc28gdGhhdCB0aGUgbmVlZHMg
b2YgdGhlIHVzZXJjb3B5IHJvdXRpbmVzIHZzLiByZWd1bGFyIG1lbWNweSgpCj4+Pj4gaGF2ZSBu
b3cgZGl2ZXJnZWQgc28gZmFyIHRoYXQgd2UgYWJhbmRvbiB0aGUgc2hhcmVkIHRlbXBsYXRlIGlk
ZWEKPj4+PiBhbmQgdGhlIGRhbWFnZSB3aGljaCB0aGF0IGluY3VycmVkIHRvIHRoZSB0dW5pbmcg
b2YgTERQL1NUUCBsb29wcy4KPj4+PiBXZSdsbCBiZSBiYWNrIHRvIHRhY2tsZSB0aG9zZSByb3V0
aW5lcyBzZXBhcmF0ZWx5IGluIGZ1dHVyZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvYmlu
IE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4+Pgo+Pj4gVGhpcyBwYXRjaCBsYW5kZWQg
cmVjZW50bHkgaW4gbGludXgtbmV4dCBhcyBjb21taXQgMjg1MTMzMDQwZTZjICgiYXJtNjQ6Cj4+
PiBJbXBvcnQgbGF0ZXN0IG1lbWNweSgpL21lbW1vdmUoKSBpbXBsZW1lbnRhdGlvbiIpLiBTYWRs
eSBpdCBjYXVzZXMKPj4+IHNlcmlvdXMgaXNzdWVzIG9uIEtoYWRhcyBWSU0zIGJvYXJkLiBSZXZl
cnRpbmcgaXQgb24gdG9wIG9mIGxpbnV4Cj4+PiBuZXh0LTIwMjEwNjA3ICh0b2dldGhlciB3aXRo
IDZiOGY2NDg5NTllNSBhbmQgcmVzb2x2aW5nIHRoZSBjb25mbGljdCBpbgo+Pj4gdGhlIE1ha2Vm
aWxlKSBmaXhlcyB0aGUgaXNzdWUuIEhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4+Pgo+Pj4gVW5h
YmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIAo+
Pj4gZmZmZjgwMDAxMzZiZDIwNAo+Pj4gTWVtIGFib3J0IGluZm86Cj4+PiDCoCDCoCBFU1IgPSAw
eDk2MDAwMDYxCj4+PiDCoCDCoCBFQyA9IDB4MjU6IERBQlQgKGN1cnJlbnQgRUwpLCBJTCA9IDMy
IGJpdHMKPj4+IMKgIMKgIFNFVCA9IDAsIEZuViA9IDAKPj4+IMKgIMKgIEVBID0gMCwgUzFQVFcg
PSAwCj4+PiBEYXRhIGFib3J0IGluZm86Cj4+PiDCoCDCoCBJU1YgPSAwLCBJU1MgPSAweDAwMDAw
MDYxCj4+Cj4+IFRoYXQncyBhbiBhbGlnbm1lbnQgZmF1bHQsIHdoaWNoIGltcGxpZXMgd2UncmUg
YWNjZXNzaW5nIHNvbWV0aGluZyAKPj4gd2hpY2ggaXNuJ3Qgbm9ybWFsIG1lbW9yeS4KPj4KPj4+
IMKgIMKgIENNID0gMCwgV25SID0gMQo+Pj4gc3dhcHBlciBwZ3RhYmxlOiA0ayBwYWdlcywgNDgt
Yml0IFZBcywgcGdkcD0wMDAwMDAwMDA5ZGE2MDAwCj4+PiBbZmZmZjgwMDAxMzZiZDIwNF0gcGdk
PTEwMDAwMDAwZjQ4MDYwMDMsIHA0ZD0xMDAwMDAwMGY0ODA2MDAzLAo+Pj4gcHVkPTEwMDAwMDAw
ZjQ4MDUwMDMsIHBtZD0xMDAwMDAwMDAwMzY1MDAzLCBwdGU9MDA2ODAwMDBmZmUwMzcxMwo+Pj4g
SW50ZXJuYWwgZXJyb3I6IE9vcHM6IDk2MDAwMDYxIFsjMV0gUFJFRU1QVCBTTVAKPj4+IE1vZHVs
ZXMgbGlua2VkIGluOiBicmNtZm1hYyBicmNtdXRpbCBjZmc4MDIxMSBkd19oZG1pX2kyc19hdWRp
bwo+Pj4gbWVzb25fZ3hsIGhjaV91YXJ0IGJ0cWNhIGJ0YmNtIGJsdWV0b290aCBwYW5mcm9zdCBl
Y2RoX2dlbmVyaWMgZWNjCj4+PiBzbmRfc29jX21lc29uX2F4Z19zb3VuZF9jYXJkIGNyY3QxMGRp
Zl9jZSBzbmRfc29jX21lc29uX2NhcmRfdXRpbHMKPj4+IHJma2lsbCBydGNfaHltODU2MyBncHVf
c2NoZWQgZHdtYWNfZ2VuZXJpYyByY19raGFkYXMgbWVzb25fZ3hiYl93ZHQKPj4+IG1lc29uX2ly
IHB3bV9tZXNvbiBzbmRfc29jX21lc29uX2F4Z190ZG1pbiBzbmRfc29jX21lc29uX2cxMmFfdG9o
ZG1pdHgKPj4+IHJ0Y19tZXNvbl92cnRjIHNuZF9zb2NfbWVzb25fYXhnX3RkbW91dCBzbmRfc29j
X21lc29uX2F4Z19mcmRkcgo+Pj4gcmVzZXRfbWVzb25fYXVkaW9fYXJiIHNuZF9zb2NfbWVzb25f
Y29kZWNfZ2x1ZSBheGdfYXVkaW8gbWVzb25fcm5nCj4+PiBzY2xrX2RpdiBkd21hY19tZXNvbjhi
IHNuZF9zb2NfbWVzb25fYXhnX3RvZGRyIG1kaW9fbXV4X21lc29uX2cxMmEKPj4+IGNsa19waGFz
ZSBzdG1tYWNfcGxhdGZvcm0gcm5nX2NvcmUgc25kX3NvY19tZXNvbl9heGdfZmlmbyBtZXNvbl9k
d19oZG1pCj4+PiBzdG1tYWMgbWVzb25fZHJtIG1lc29uX2NhbnZhcyBkd19oZG1pIHBjc194cGNz
IGRpc3BsYXlfY29ubmVjdG9yCj4+PiBzbmRfc29jX21lc29uX2F4Z190ZG1faW50ZXJmYWNlIG52
bWVtX21lc29uX2VmdXNlIGFkY19rZXlzCj4+PiBzbmRfc29jX21lc29uX2F4Z190ZG1fZm9ybWF0
dGVyCj4+PiBDUFU6IDQgUElEOiAxMzUgQ29tbToga3dvcmtlci80OjMgTm90IHRhaW50ZWQgNS4x
My4wLXJjNS1uZXh0LTIwMjEwNjA3Cj4+PiAjMTA0NDEKPj4+IEhhcmR3YXJlIG5hbWU6IEtoYWRh
cyBWSU0zIChEVCkKPj4+IFdvcmtxdWV1ZTogZXZlbnRzIHJlcXVlc3RfZmlybXdhcmVfd29ya19m
dW5jCj4+PiBwc3RhdGU6IDIwMDAwMDA1IChuekN2IGRhaWYgLVBBTiAtVUFPIC1UQ08gQlRZUEU9
LS0pCj4+PiBwYyA6IF9fbWVtY3B5KzB4MmMvMHgyNjAKPj4+IGxyIDogc2dfY29weV9idWZmZXIr
MHg5MC8weDExOAo+Pj4gLi4uCj4+PiBDYWxsIHRyYWNlOgo+Pj4gwqAgwqBfX21lbWNweSsweDJj
LzB4MjYwCj4+PiDCoCDCoHNnX2NvcHlfdG9fYnVmZmVyKzB4MTQvMHgyMAo+Pj4gwqAgwqBtZXNv
bl9tbWNfc3RhcnRfY21kKzB4ZjQvMHgyYzgKPj4+IMKgIMKgbWVzb25fbW1jX3JlcXVlc3QrMHg0
Yy8weGI4Cj4+PiDCoCDCoF9fbW1jX3N0YXJ0X3JlcXVlc3QrMHhhNC8weDJhOAo+Pj4gwqAgwqBt
bWNfc3RhcnRfcmVxdWVzdCsweDgwLzB4YTgKPj4+IMKgIMKgbW1jX3dhaXRfZm9yX3JlcSsweDY4
LzB4ZDgKPj4+IMKgIMKgbW1jX2lvX3J3X2V4dGVuZGVkKzB4MWQ0LzB4MmUwCj4+PiDCoCDCoHNk
aW9faW9fcndfZXh0X2hlbHBlcisweGIwLzB4MWU4Cj4+PiDCoCDCoHNkaW9fbWVtY3B5X3RvaW8r
MHgyMC8weDI4Cj4+PiDCoCDCoGJyY21mX3NkaW9kX3NrYnVmZl93cml0ZS5pc3JhLjE4KzB4MmMv
MHg2OCBbYnJjbWZtYWNdCj4+PiDCoCDCoGJyY21mX3NkaW9kX3JhbXJ3KzB4ZTAvMHgyMzAgW2Jy
Y21mbWFjXQo+Pj4gwqAgwqBicmNtZl9zZGlvX2Zpcm13YXJlX2NhbGxiYWNrKzB4YTgvMHg3Yzgg
W2JyY21mbWFjXQo+Pj4gwqAgwqBicmNtZl9md19yZXF1ZXN0X2RvbmUrMHg3Yy8weDEwMCBbYnJj
bWZtYWNdCj4+PiDCoCDCoHJlcXVlc3RfZmlybXdhcmVfd29ya19mdW5jKzB4NGMvMHhkOAo+Pj4g
wqAgwqBwcm9jZXNzX29uZV93b3JrKzB4MmE4LzB4NzE4Cj4+PiDCoCDCoHdvcmtlcl90aHJlYWQr
MHg0OC8weDQ2MAo+Pj4gwqAgwqBrdGhyZWFkKzB4MTJjLzB4MTYwCj4+PiDCoCDCoHJldF9mcm9t
X2ZvcmsrMHgxMC8weDE4Cj4+PiBDb2RlOiA1NDAwMDBjMyBhOTQwMWMyNiBhOTdmMzQ4YyBhOTAw
MWMwNiAoYTkzZjM0YWMpCj4+PiAtLS1bIGVuZCB0cmFjZSBiZTgzZmEyODNkYzgyNDE1IF0tLS0K
Pj4+Cj4+PiBJIGhvcGUgdGhhdCB0aGUgYWJvdmUgbG9nIGhlbHBzIGZpeGluZyB0aGUgaXNzdWUu
IElJUkMgdGhlIFNESENJIGRyaXZlcgo+Pj4gb24gVklNMyBib2FyZCB1c2VzIGludGVybmFsIFNS
QU0gZm9yIHRyYW5zZmVycmluZyBkYXRhIChpbnN0ZWFkIG9mIERNQSksCj4+PiBzbyB0aGUgaXNz
dWUgaXMgc29tZWhvdyByZWxhdGVkIHRvIHRoYXQuCj4+Cj4+IERyaXZlcnMgc2hvdWxkbid0IGJl
IHVzaW5nIG1lbWNweSgpIG9uIGlvbWVtIG1hcHBpbmdzLiBFdmVuIGlmIHRoZXkgCj4+IGhhcHBl
biB0byBoYXZlIGdvdCBhd2F5IHdpdGggaXQgc29tZXRpbWVzIDspCj4+Cj4+IFRha2luZyBhIHF1
aWNrIGxvb2sgYXQgdGhhdCBkcml2ZXIsCj4+Cj4+IMKgwqDCoMKgaG9zdC0+Ym91bmNlX2J1ZiA9
IGhvc3QtPnJlZ3MgKyBTRF9FTU1DX1NSQU1fREFUQV9CVUZfT0ZGOwo+Pgo+PiBpcyBjb21wbGV0
ZWx5IGJvZ3VzLCBhcyBTcGFyc2Ugd2lsbCByZWFkaWx5IHBvaW50IG91dC4KCk15IGJhZCwgd2hh
dCdzIHRoZSBjb3JyZWN0IHdheSB0byBjb3B5IGRhdGEgdG8gYW4gaW9tZW0gbWFwcGluZyA/CgpO
ZWlsCgo+Pgo+PiBSb2Jpbi4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
