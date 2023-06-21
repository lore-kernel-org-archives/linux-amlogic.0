Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47EBEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g10hNluvcGRDrrULm7z8xUFcQxdYoineDDKzzwcREuw=; b=ruLK5RnTitbSoqB2oQIAuCzBys
	oPxxQsaz/X97hl5i2D7tqr5lYTOFmPrDqrnZQdxPv5ixzP74g1O/GDBUPHyAw1HniS2GDJgMyU4ak
	eAuwyfKbmZ/ZoXKClDTdhvA887jNV9QQ1tVDt/EmuMos46A0DnR1q+I3BI/U+rT6MCpHinN439klP
	r6+ARqnivIRjZVcteeHP3x4bTMtFbqxhI/JeEKIK1kmd5niq0qmgZxzNX4ZNX4a14MK/UiERylWwQ
	lCnMJRLcrq7EnuSF7V5F0ZaNvJ9w8B0aQziMnidDkqGVxtSk2ggy57NGCN6A5zjE+l0pGL2Pd8QhQ
	XxM5U8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBspP-00DdAi-2G;
	Wed, 21 Jun 2023 08:04:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBspM-00Dd9e-21
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 08:04:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-311183ef595so5524385f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jun 2023 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687334670; x=1689926670;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPBuD0hfcllQGTh5WqNHVA5zv/gzXAnk+NTTWVeHYTc=;
        b=zd0rlMjAtccV9iqyp/+iVgmNk8Vgd2/STCy1hZANr4Y60EQxIEiynGuJ4NYDYScQsd
         5J9wwPBTR45dJEFUaxEjaRkhbFq1X9rchqdktXcCehCzdQPZcnEVRwABcqS1SSoxnDCm
         2V4y2zkSt8OWlzixFBdlZeCae05aFQH3hHP0cJuri8AyHinZY0p+qXR0in4eXJoiqhuT
         XQugxK51RR3AcuKsZHziV/aB1stniM59iyiBgZAl8MIabaKHYLT2GORaGgNOXp1QbJfK
         1Ke1B8sENPNrmlR+ZYjf0a6lqbDDRvz1O+7S6rhUBtEcsThppRwJx1pPxkQWzDNlo2YA
         SI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687334670; x=1689926670;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPBuD0hfcllQGTh5WqNHVA5zv/gzXAnk+NTTWVeHYTc=;
        b=Js1TbXzEXo+ym3huZ11xp8alACqWZp1Wm6qJroBCMRzUMh7LDOGC+nT+ApcREa/ZxD
         8spkWc1348l2BrfWX1nzonBLOMvch5cHn19QWHIHOJ/3+2sWcpe/IiUNsKAi/nARpkxf
         Gg99KD4KbsA0t8F1zvFu6aZ9W7X8ApruFaYBlOus5PFRFJnw74UL2jWoXvCtMWrC9eQP
         QyIUdbr20MpOTaWk1DZzTJYEZ70HThW5GtY+6dRVR5ZW5obRG7DLcelgm/P7itIJDvC0
         FRvhBuAp36FW25Oz85MmM0q0e4e6KXQhiZHyWMVOR/MNJXhodcf47pEXqM6gDUSXN/AT
         2+jA==
X-Gm-Message-State: AC+VfDxq2XYFxz5ohQsOeR4oaTg2e3EK2XiRhUU9sc1qGeY+9MIwKpJ6
	LfcvCNDgwO8dvgtH0gFCXzvQqg==
X-Google-Smtp-Source: ACHHUZ5M6VpCzKTbpZqsnQKndJo876Awl5O2+ZBZTlAVumRVz63cwUZ7Br2daEGLUzxtiRofknQp5Q==
X-Received: by 2002:a5d:440c:0:b0:30a:e511:e65c with SMTP id z12-20020a5d440c000000b0030ae511e65cmr10286387wrq.37.1687334670468;
        Wed, 21 Jun 2023 01:04:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b158:3e69:8736:455d? ([2a01:e0a:982:cbb0:b158:3e69:8736:455d])
        by smtp.gmail.com with ESMTPSA id y9-20020adfdf09000000b0031122bd3c82sm3785271wrl.17.2023.06.21.01.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 01:04:30 -0700 (PDT)
Message-ID: <6fe5dfb6-5f18-feca-a2e7-8cfb78627e01@linaro.org>
Date: Wed, 21 Jun 2023 10:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Lucas Tanure <tanure@linux.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yixun Lan <dlan@gentoo.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>,
 Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230620134857.238941-1-tanure@linux.com>
 <20230620134857.238941-3-tanure@linux.com> <ZJIjtphyKdC48JrN@ofant>
 <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
 <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
 <20230621-barber-enjoyably-04806271daea@wendy>
Organization: Linaro Developer Services
In-Reply-To: <20230621-barber-enjoyably-04806271daea@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_010432_712997_393002C3 
X-CRM114-Status: GOOD (  21.47  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjEvMDYvMjAyMyAxMDowMSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDIx
LCAyMDIzIGF0IDA4OjM3OjAyQU0gKzAxMDAsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPj4gT24gV2Vk
LCBKdW4gMjEsIDIwMjMgYXQgNzowMuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPj4gPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gT24gMjEvMDYvMjAyMyAw
MDowOSwgWWl4dW4gTGFuIHdyb3RlOgo+Pj4+PiArICAgICAgICAgICAgYXBiNDogYnVzQGZlMDAw
MDAwIHsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVz
IjsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweGZlMDAwMDAwIDB4MCAw
eDQ4MDAwMD47Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+
Owo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgcmFuZ2VzID0gPDB4MCAweDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4
NDgwMDAwPjsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAgICAgICAgICAgICB1YXJ0X0E6IHNlcmlh
bEA3ODAwMCB7Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLG1lc29uLXQ3LXVhcnQiLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn4KPj4+PiBpZiB5b3UgaW50cm9k
dWNlIG5ldyBjb21wYXRpYmxlIHN0cmluZywgdGhlbiBhdCBsZWFzdCB5b3UgbmVlZCB0byBkb2N1
bWVudCBpdAo+Pj4+IHNvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
YW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgbmVlZCB0byBiZSB1cGRhdGVkCj4+Pj4KPj4+PiBidXQg
bXkgcWV1c3Rpb24gaGVyZSwgd2h5IGJvdGhlciBpbnRyb2R1Y2luZyBuZXcgY29tcGF0aWJsZSBz
dHJpbmcgaWYgbm90aGluZwo+Pj4+IGNoYW5nZWQgd2l0aCB0aGUgY29tcGF0aWJsZSBkYXRhPyBn
aXZlbiB0aGUgdWFydCBpcyBzYW1lIElQIHdpdGggZzEyYSwgY2FuJ3Qgd2UganVzdAo+Pj4+IHVz
ZSAiYW1sb2dpYyxtZXNvbi1nMTItdWFydCIgZm9yIHRoaXM/IG5vIG9ubHkgaXQgd2lsbCByZWR1
Y2UgdGhlIHN0cnVjdHVyZSBsZW5ndGggb2YKPj4+PiBtZXNvbl91YXJ0X2R0X21hdGNoW10sIGJ1
dCBhbHNvIHJlbGlldmUgbWFpbnRhaW5lcidzIHJldmlldyBidXJkZW4/Cj4+Pgo+Pj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMS1yYzEvc291cmNlL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy93cml0aW5nLWJpbmRpbmdzLnJzdCNMNDIKPj4+Cj4+PiBCZXN0
IHJlZ2FyZHMsCj4+PiBLcnp5c3p0b2YKPj4+Cj4+IEhpLCBJIGRpZCBub3QgdW5kZXJzdGFuZCB0
aGUgcmVjb21tZW5kYXRpb24gaGVyZS4KPj4gQ2FuIEkgYWRkICJhbWxvZ2ljLG1lc29uLXQ3LXVh
cnQiIHdpdGhvdXQgRG9jdW1lbnRhdGlvbiBjaGFuZ2VzPwo+IAo+IE5vLCB5b3UgY2FuJ3QuCj4g
Cj4+IEkgdGhpbmsgWWVzLCBhcyBJIGNhbiBzZWUgYSBmZXcgY29tcGF0aWJsZSBzdHJpbmdzIGlu
IGR0cyB0aGF0IGRvbid0Cj4+IGV4aXN0IGFueXdoZXJlIGVsc2UuCj4gCj4gQXllLCBidXQgd2Ug
ZG8gbm90IHdhbnQgdG8gcHJvcGFnYXRlIHRoYXQuIE5ldyBzdHVmZiBzaG91bGQgbm90IGJlCj4g
YWRkaW5nIHVuZG9jdW1lbnRlZCBjb21wYXRpYmxlcywgYW5kIHRob3NlIHRoYXQgYXJlIHVuZG9j
dW1lbnRlZCBzaG91bGQKPiBiZSBkb2N1bWVudGVkLgoKRG9jdW1lbnRhdGlvbiBpcyBvbmdvaW5n
LCBpdCB0YWtlcyB0aW1lICEKCk5laWwKCj4gCj4+IE15IGlkZWEgaGVyZSBpcyB0byBhZGQgImFt
bG9naWMsbWVzb24tdDctdWFydCIgZm9yIGZ1dHVyZSB1c2UgaWYgZXZlcgo+PiBjcmVhdGVkLCBs
aWtlIGlmIHdlIGZpbmQgYSBidWcgaW4gdGhlIGZ1dHVyZSB0aGF0IGlzIG9ubHkgcmVsZXZhbnQg
dG8KPj4gVDcgc29jLgo+PiBCdXQgZm9yIG5vdywgZmFsbGJhY2sgdG8gczQgdWFydCwgYXMgaXQg
c2VlbXMgdG8gYmUgdGhlIHNhbWUgY29udHJvbGxlci4KPj4KPj4gPkZyb20gS3J6eXN6dG9mIHNh
aWQgaW4gdGhlIHdyaXRpbmctYmluZGluZ3MucnN0LCBJIGFtIGZvbGxvd2luZyB0aGUgcnVsZXMu
Cj4+Cj4+IFNvLCB3aGF0J3MgdGhlIHBhdGggZm9yd2FyZCBoZXJlPwo+IAo+IFlvdSBhcmUgZm9s
bG93aW5nIHRoZSBydWxlcyBmcm9tIHRoZSBkdHMgcG9pbnQgb2YgdmlldywgeW91IGp1c3QgbmVl
ZCBhCj4gM3JkIHBhdGNoIGluIHdoaWNoIHlvdSBkb2N1bWVudCB0aGUgcGF0dGVybiB5b3UgaGF2
ZSBhZGRlZCBoZXJlIGluCj4gYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwuIEl0IGlzIHByb2JhYmx5
IHNvbWV0aGluZyBsaWtlOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDog
YW1sb2dpYyxtZXNvbi10Ny11YXJ0Cj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29u
LXM0LXVhcnQKPiBCdXQgSSBoYXZlIG5vdCB0ZXN0ZWQgdGhhdCwgSSBqdXN0IHdyb3RlIHRoYXQg
aW4gbXkgbWFpbCBjbGllbnQuCj4gCj4gQ2hlZXJzLAo+IENvbm9yLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
