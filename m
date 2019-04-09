Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C43C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3093720880
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N0dH+GCo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eOCnJapW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3093720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkdda5daPU97qdRTYP68F7iCFKr5FAoK+xKl2PXrUaY=; b=N0dH+GCo90z8sP
	pqNF1K3zvt0ymF5e0RdPMvaLVOrT8Ksw+gZj9QIg388ShU1JMy2nymM0ASiohXgxuVoajqqVgsvvt
	6OhKtfO1xm2o5p5+rCLr+B3/8xskP7db31WUexUv33yirUy5O9KJ5QZ99HzF/0lfyzF7MhHwwjxof
	gw+Z7GEMNByLx69Uc/h2h1T7XcNUIz7/sqZJqRzU5F5iKF8E/IgwRqeOoiOp41jFZvYUDgCG1p3OQ
	cPVdIl1qDrh4sxLkgblv2hVIJaNb9EFrCjN5Xm3q21hicPwHVdK/BMJOpULHh7GRSZn4TTIG/E6eb
	Mhb16Mw50dznRDvW0eGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDlzq-0004oq-Af; Tue, 09 Apr 2019 08:20:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDlzm-0004ns-VN
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:20:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id n25so2199909wmk.4
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pfR4P9LrDyHZsIRepbvE2l2wqtRd7f4lG6Bo64BoQ5Y=;
 b=eOCnJapW8AyhnYNbT5fOzk+10ZoQ7HfKYH/mXH1CnFteToOmult6bf0d5jwY1k52nH
 CTfEJKwL6HumGiq1bEL1GCMEe0djZdmiPIQ16+yAMYr4I/ZNzfgaDAflRmADAC/XdFIe
 SQaXLsyPTfQ/oqouhQKu0MJMercvNnEQ7QC4JZUrzLP/domuT24sDRrQsqrpbKjxm+5G
 p7PMmQPLTFVXwicv/2NchgvOjyfJ47CkbK4oAJo+Tbrh2YrGA7e0ggnQNcTT+0vmr7XZ
 yVt/X4a0YAikKEiviZTLP2W0xiaLu92aZLwSgSaTsHGFoJ/rQv9HcRvP2Luzo+0OPvMN
 yHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pfR4P9LrDyHZsIRepbvE2l2wqtRd7f4lG6Bo64BoQ5Y=;
 b=dCafibxxV4/OgNMHGhut0/zX+o0d/V7BQ467btQ3W+IcfirYgAZ1Uni2g/zNCV6aTO
 V9AtQIpT3mgUu85plKr1VyNhhL5ObWg5MgPG1BV2oyuU7YURIWaMGN5UV3GYFWriF+jz
 Lsgy3VO1/LapiSxp1QrsWiWBGWY6dvKbLGV0A0L0Fz2GsFnt8f+LqYM3RK/xlK+bO3Ba
 LN5V069Hsq4QOknXFuaP0faw0ZQNkDUxHkmfv8mifyNeRAW00aePBX0Atm5mj2Y3E24e
 WthiogfWm9hkTXbcLv2/3ZcAi1MCEWJYJd4I0UlLRZuzvTvLgz3XnnlUmNea0CJBPB7e
 ETuA==
X-Gm-Message-State: APjAAAW/hTYsiJ1Fvid6kJP9Cfsoq/hkrpAgXvfh9Mb8VVRqGAO3iqYU
 9hr3FLiYWrp9/j/ecWfkcyis+A==
X-Google-Smtp-Source: APXvYqzarK43oSf3PWYfZzP15Z8qkkfRB7FrQmeCYlIQKQ9hlqnnn5+hvRjnnHx/TCUyJNjI/+66Aw==
X-Received: by 2002:a7b:c7d0:: with SMTP id z16mr12547793wmk.136.1554798040554; 
 Tue, 09 Apr 2019 01:20:40 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o4sm24994090wmo.20.2019.04.09.01.20.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 01:20:39 -0700 (PDT)
Subject: Re: [PATCH v4] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
To: Rob Herring <robh@kernel.org>
References: <20190401080949.14550-1-narmstrong@baylibre.com>
 <1640dd7b-3576-d9ce-0641-6b6a64a87275@arm.com>
 <d26f1ce9-c56c-5e51-37f5-0689aa198dc0@baylibre.com>
 <5CA9CE1A.6060109@baylibre.com>
 <CAL_JsqJj4pae6AuK=HGU5GuZogFKyAbU_y7Ls_CyTcV6qXH_rg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <86843e8b-1dda-f7f3-c2ad-02b7b47743dc@baylibre.com>
Date: Tue, 9 Apr 2019 10:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJj4pae6AuK=HGU5GuZogFKyAbU_y7Ls_CyTcV6qXH_rg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_012043_014783_002F47CE 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDgvMDQvMjAxOSAyMTowNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gU3VuLCBBcHIgNywg
MjAxOSBhdCA1OjE3IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4g
d3JvdGU6Cj4+Cj4+IEhpIFJvYiwKPj4KPj4gTGUgMDEvMDQvMjAxOSAxMzoyNCwgTmVpbCBBcm1z
dHJvbmcgYSDDqWNyaXQgOgo+Pj4gT24gMDEvMDQvMjAxOSAxMjowMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+Pj4+IE9uIDAxLzA0LzIwMTkgMDk6MDksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+
PiBBZGQgdGhlIGJpbmRpbmdzIGZvciB0aGUgQmlmcm9zdCBmYW1pbHkgb2YgQVJNIE1hbGkgR1BV
cy4KPj4+Pj4KPj4+Pj4gVGhlIEJpZnJvc3QgR1BVIGFyY2hpdGVjdHVyZSBpcyBzaW1pbGFyIHRv
IHRoZSBNaWRnYXJkIGZhbWlseSwKPj4+Pj4gYnV0IHdpdGggYSBkaWZmZXJlbnQgU2hhZGVyIENv
cmUgJiBFeGVjdXRpb24gRW5naW5lIHN0cnVjdHVyZXMuCj4+Pj4+Cj4+Pj4+IEJpbmRpbmdzIGFy
ZSBiYXNlZCBvbiB0aGUgTWlkZ2FyZCBmYW1pbHkgYmluZGluZ3MsIGJ1dCB0aGUgaW5uZXIKPj4+
Pj4gYXJjaGl0ZWN0dXJhbCBjaGFuZ2VzIG1ha2VzIGl0IGEgc2VwYXJhdGUgZmFtaWx5IG5lZWRp
bmcgc2VwYXJhdGUKPj4+Pj4gYmluZGluZ3MuCj4+Pj4+Cj4+Pj4+IFRoZSBCaWZyb3N0IEdQVXMg
YXJlIHByZXNlbnQgaW4gYSBudW1iZXIgb2YgcmVjZW50IFNvQ3MsIGxpa2UgdGhlCj4+Pj4+IEFt
bG9naWMgRzEyQSBGYW1pbHksIGFuZCBtYW55IG90aGVyIHZlbmRvcnMuCj4+Pj4+IFRoZSBBbWxv
Z2ljIHZlbmRvciBzcGVjaWZpYyBjb21wYXRpYmxlIGlzIGFkZGVkIHRvIGhhbmRsZSB0aGUKPj4+
Pj4gc3BlY2lmaWMgSVAgaW50ZWdyYXRpb24gZGlmZmVyZW5jZXMgYW5kIGRlcGVuZGVuY2llcy4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlm
cm9zdC50eHQgICAgICAgICB8IDkyICsrKysrKysrKysrKysrKysrKysKPj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspCj4+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAo+Pj4+
Pgo+Pj4+PiBDaGFuZ2VzIHNpbmNlIHYzOgo+Pj4+PiAtIEFkZGVkIG5vdGUgYWJvdXQgZGlzY292
ZXJhYmxlIG1vZGVsL3JldmlzaW9uCj4+Pj4+IC0gRW5mb3JjZWQgZml4ZWQgZGVmaW5lZCBpcnEg
b3JkZXIKPj4+Pj4gLSBGaXhlZCB0eXBvIGluIGFjY29tbW9kYXRlCj4+Pj4+Cj4+Pj4+IENoYW5n
ZXMgc2luY2UgdjI6Cj4+Pj4+IC0gbW92ZWQgdG8gYSBzaW5nbGUgY29tcGF0aWJsZSBzaW5jZSBI
VyBpcyBmdWxseSBkaXNjb3ZlcmFibGUKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0Cj4+
Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzExYzll
YWQxN2EyCj4+Pj4+IC0tLSAvZGV2L251bGwKPj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAo+Pj4+PiBAQCAtMCwwICsx
LDkyIEBACj4+Pj4+ICtBUk0gTWFsaSBCaWZyb3N0IEdQVQo+Pj4+PiArPT09PT09PT09PT09PT09
PT09PT0KPj4+Pj4gKwo+Pj4+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPj4+Pj4gKwo+Pj4+PiAr
LSBjb21wYXRpYmxlIDoKPj4+Pj4gKyAgKiBTaW5jZSBNYWxpIEJpZnJvc3QgR1BVIG1vZGVsL3Jl
dmlzaW9uIGlmIGZ1bGx5IGRpc2NvdmVyYWJsZSBieSByZWFkaW5nCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl4KPj4+PiBzL2lmL2lzLwo+Pgo+PiBT
aG91bGQgSSBzdGlsbCBzZW5kIGEgdjUgdG8gZml4aW5nIHRoaXMgdHlwbyA/IEkgY2FuIGZpeCBp
dCB3aGlsZSBhcHBseWluZyBpdC4KPiAKPiBObyBuZWVkIHRvIHJlc2VuZC4gSSBwbGFubmVkIHRv
IGFwcGx5IGl0LCBidXQgaWYgeW91IGFyZSBnb2luZyB0bzoKPiAKPiBSZXZpZXdlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAKClRoYW5rcywKCkZpeGVkIGFuZCBhcHBsaWVk
IG9uIGRybS1taXNjLW5leHQKCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
