Return-Path: <SRS0=eh9O=TW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B330C072A4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 08:00:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A26D217F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 08:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnCwEP6y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VShWdf9Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A26D217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6DxkrnWJPVShLkGmbsqi/A6R6fzHFoH+btox6Bhb9o=; b=lnCwEP6yRiX5QV
	lIJ50HtJa9XR6SyJHH5KS1lcgvTOMwyc6jbGQeggtHLu2x3ooTAZwAwtqzUw+f2M1+xuaTkdpMy0h
	P/hsypwMLJnmyuMmm918I+P50AS8RDIIpRRlYxPnL9+kHJJCNL7OegxUX59J2tfffRijxtCD0Ncwm
	Ku42OHhsXolVQTF++pcUICTQvVXA9U/N5NfY42k9c92rnAEebRnCqOs2Fws048QYvWqHXKiSgY1QK
	TXQJz4EIbAOafLAr+VE2OQuf+x+ysV8ZzYQ05c57Kv24g1Lh/OID4nkJQORDJkqDqk897SgFigTc5
	zUII1W6i9I6ZbQa0RjDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTMAP-0003vo-Et; Wed, 22 May 2019 08:00:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTMAD-0003bV-Ty
 for linux-amlogic@lists.infradead.org; Wed, 22 May 2019 07:59:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id q15so1116744wmj.0
 for <linux-amlogic@lists.infradead.org>; Wed, 22 May 2019 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rnCmivct/X7z1PEcQXjQh9eG+GSPf+RXK0R9xnoR9QM=;
 b=VShWdf9Z0ncY7mljbs2OFnnJO99iafT2bd3R4Hfe6XqujdqayhqbSQ44D48eKbU2q7
 e/JmpEPbY3Tc3knfaYPofqdRYRqjaqjrn4Yl87lIu1Z8h8dL76radqC9US/buUt3jfG5
 D9RC0jK+HZ3wqpHBBsLbPUZdAAXzKvdEH5Qqrf6GWL0YYkor7QaZ7ibahKeu5vLBf95i
 IrsTxJ4YmduZBN3XniHslAfqNoydpOra5wIcL+tLV5MYxF6lcBrjsNuyJKBVECf9ww4v
 8kYxsqKLvFt9ntVQ5xXJ/Rhj3xP4de58QNuTgIk4rTlhmRrA4OBg5BlzDWz3nN/E/H/E
 ANMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rnCmivct/X7z1PEcQXjQh9eG+GSPf+RXK0R9xnoR9QM=;
 b=ZHVsbJ2WZzfiP5izpIA7v+eNOMQqJyNvq/vlMpeAM2RvXc69MBqCAjLWy3d6kPv2xg
 SWLEJ+gedAW4HHrry79+pyhUag4u6Np2E5swuHYmWfKphqP+6CuC9T/aGeX9UgLZToeu
 ZcVxKk1HvAilFolG7a4Mc3OEV15c9VVGNzPjWtg5d7T87Iq84SBrI5PEFtjFXp/lhIP1
 1cwsaDitEfmOV8Ci7Re6OLFjRp7kQ3uVXCwodKDNOWxr/QfX0DbY9Vuo0SUL4gcpsVIA
 0w881TLIGPl2HBeLX9itiiuC26UxHfS/hKhGF/ELL/IJroV3Cs0mM844eMPE/rCKyMB6
 h0Cg==
X-Gm-Message-State: APjAAAUsBVeBn+swTIxa6SZQeK9EXVoNVr7Um3lxGSfQJlHtpZ7vXah0
 Fki5Yw2K0/om8DsRXX8ABaV48Q==
X-Google-Smtp-Source: APXvYqwk5SRYCyyOX5+xF7kfeQxYyY4oufGN3ZUYOTeICTlJeAwW6WzNFcpJzStlPU40+ttBcl55eg==
X-Received: by 2002:a1c:cf4f:: with SMTP id f76mr6648267wmg.18.1558511992322; 
 Wed, 22 May 2019 00:59:52 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 h17sm7619311wrq.79.2019.05.22.00.59.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 00:59:51 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] arm64: dts: meson: Add minimal support for
 Odroid-N2
To: Robin Murphy <robin.murphy@arm.com>, khilman@baylibre.com
References: <20190521151952.2779-1-narmstrong@baylibre.com>
 <20190521151952.2779-4-narmstrong@baylibre.com>
 <4eb6aa5c-14e2-944e-9f15-692063ef072b@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <5c95de8f-b611-8286-db5f-bbb3ae97c24f@baylibre.com>
Date: Wed, 22 May 2019 09:59:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4eb6aa5c-14e2-944e-9f15-692063ef072b@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_005953_970648_51632D4B 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjEvMDUvMjAxOSAxODoxMSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIxLzA1LzIwMTkg
MTY6MTksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsuLi5dCj4+ICvCoMKgwqDCoMKgwqDCoCBj
cHUxMDA6IGNwdUAxMDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9
ICJjcHUiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFybSxjb3J0
ZXgtYTczIiwgImFybSxhcm12OCI7Cj4gCj4gTml0OiB3ZSd2ZSByZWNlbnRseSB0cmllZCB0byBl
cmFkaWNhdGUgImFybSxhcm12OCIgYXMgYSBmYWxsYmFjayBjb21wYXRpYmxlIGZvciByZWFsIENQ
VXMgKGFsdGhvdWdoIEkgc2VlIHRoZXJlIGFyZSBzdGlsbCBhIGNvdXBsZSBvZiBpbnN0YW5jZXMg
dGhhdCBoYXZlIHNsaXBwZWQgdGhyb3VnaCkuCgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMsIEkn
bGwgcmVtb3ZlIGl0LgoKTmVpbAoKPiAKPiBSb2Jpbi4KPiAKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4MCAweDEwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJs
ZS1tZXRob2QgPSAicHNjaSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5leHQtbGV2ZWwt
Y2FjaGUgPSA8JmwyPjsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgIGNwdTEwMTogY3B1QDEwMSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90
eXBlID0gImNwdSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYXJt
LGNvcnRleC1hNzMiLCAiYXJtLGFybXY4IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDB4MCAweDEwMT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJsZS1tZXRob2Qg
PSAicHNjaSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5leHQtbGV2ZWwtY2FjaGUgPSA8
JmwyPjsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGNwdTEw
MjogY3B1QDEwMiB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBlID0gImNw
dSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1h
NzMiLCAiYXJtLGFybXY4IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAw
eDEwMj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJsZS1tZXRob2QgPSAicHNjaSI7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsKPj4g
K8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGNwdTEwMzogY3B1QDEw
MyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBlID0gImNwdSI7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNzMiLCAiYXJt
LGFybXY4IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDEwMz47Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJsZS1tZXRob2QgPSAicHNjaSI7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsKPj4gK8KgwqDCoMKg
wqDCoMKgIH07Cj4+ICvCoMKgwqAgfTsKPj4gK307Cj4+ICsKPj4gKyZjbGtjIHsKPj4gK8KgwqDC
oCBjb21wYXRpYmxlID0gImFtbG9naWMsZzEyYi1jbGtjIjsKPj4gK307Cj4+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
