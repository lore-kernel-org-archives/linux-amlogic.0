Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B6DE80A93
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 06:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEuN9XJpdCMKPu0xaOF2ksFQ0pGCoUgkEgtEy8WRjMQ=; b=ShQBEWFTxRYjei
	2UU2jGJQpaO/SBs7gX8bsrrxo/yffBEsHkapvfP6iY8fDofBZN7lXRwyrHL3wDUZvNX3L9NFqBhep
	nE3MCNxxkf4DipIawhLhHGNnTh97XMnYz6TIJkbk6G6PdhX+XMQzY7ZkBmL9L0ygOIYw/S2ypreKs
	w2nEZBadLOpV7whvVFl1OXEhlv6pOsmH4yhqHBiQQt7LEEZSTnwWr5zfpV3zRK9LnQlpcmfeLIoPx
	eGkoqVe5DvWtfpTcC9SVBHUQj8naCoGQuwq4D4lFxz3LXYPJejL5LnI3x8rJPoZ9LyZ+265PfwHW7
	kE7vHHwuipwlk16rMQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNhW-0004Dz-1p;
	Wed, 27 Sep 2023 06:07:10 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNhT-0004D3-0v;
	Wed, 27 Sep 2023 06:07:08 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4054f790190so91605865e9.2;
        Tue, 26 Sep 2023 23:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695794824; x=1696399624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ilGbwZbw+r63tsdGtSB6Sstf8G+rcZU4Qn42BZBqRc=;
        b=OpYGR3/jYBuxLRI7fIKLhyOBO7VDkwyvMj4mV2Yv/ax7wxSeg81nhknoiusoi4tfxK
         q4iwDA1fBhyenDz9w2gXQDZv7MlGnGgE1yG8XwWs33DX8Srm4spAlzYw+PHjHkVsMeIl
         uoGI5V75XERi/ahXT4xNll9IzB487EDuGIPsAkGjzwYPF3KDX7NvrODcWDIEYwv72fXn
         nyB+PG3z6a0bw1vejqyMVycCm9CvIjZxTRdrLTkFQOxDxiSDorHiON/DSK7DlWY4iyN8
         zHE2iiiJpKjMrHDUua+SA9eroAOVKEYFxIdM6m38gUvBbn30/n7XwCTiOusxlgxPqVDI
         hIFw==
X-Gm-Message-State: AOJu0YywDx9OIm8r57t/tdOnnaO7Cvnv8WQ+ume2kLMb6IZo2E16ry5Z
	q19lQ9ICX9rSKJW3BnwvOA0=
X-Google-Smtp-Source: AGHT+IExiuRhyetKklbMtnuZX3MinJL95Qxp7MaKxoC/O93bGilh4rCdS630ztVDycq2j5nYZI2SUg==
X-Received: by 2002:a05:600c:1587:b0:406:44fe:7621 with SMTP id r7-20020a05600c158700b0040644fe7621mr672176wmf.25.1695794823700;
        Tue, 26 Sep 2023 23:07:03 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040550c20cbcsm12015055wmo.24.2023.09.26.23.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:07:03 -0700 (PDT)
Message-ID: <bb37e3ec-d0b9-4b73-ac6e-183b55e8814f@linux.com>
Date: Wed, 27 Sep 2023 07:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: Add gpio_intc node for Amlogic-T7 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Huqiang Qin <huqiang.qin@amlogic.com>,
 tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-4-huqiang.qin@amlogic.com>
 <4c1566e0-a502-4379-b360-9e6ef374af04@linaro.org>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <4c1566e0-a502-4379-b360-9e6ef374af04@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_230707_327436_0FD2380B 
X-CRM114-Status: GOOD (  10.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTQtMDktMjAyMyAwOToyNiwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAxMy8wOS8yMDIzIDEwOjA5LCBIdXFpYW5nIFFpbiB3cm90ZToKPj4gQWRkIEdQSU8gaW50ZXJy
dXB0IGNvbnRyb2xsZXIgZGV2aWNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIdXFpYW5nIFFpbiA8
aHVxaWFuZy5xaW5AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIHwgMTAgKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaSAKPj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+IGluZGV4IGRhZTM0NjViZDM5Yi4uMjFiMjQzNmM0N2Uy
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5k
dHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kK
Pj4gQEAgLTE1NSw2ICsxNTUsMTYgQEAgd2F0Y2hkb2dAMjEwMCB7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb19pbnRjOiBpbnRl
cnJ1cHQtY29udHJvbGxlckA0MDgwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gImFtbG9naWMsdDctZ3Bpby1pbnRjIiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtZXNvbi1ncGlvLWlu
dGMiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0MDgw
IDB4MCAweDIwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQt
Y29udHJvbGxlcjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjaW50ZXJydXB0
LWNlbGxzID0gPDI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtbG9naWMs
Y2hhbm5lbC1pbnRlcnJ1cHRzID0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDwxMCAxMSAxMiAxMyAxNCAxNSAxNiAxNyAxOCAxOSAyMCAyMT47Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWFy
dF9hOiBzZXJpYWxANzgwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyx0Ny11YXJ0IiwgCj4+ICJhbWxvZ2ljLG1lc29uLXM0LXVh
cnQiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg3
ODAwMCAweDAgMHgxOD47Cj4gCj4gUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPgpJIHJlLXRlc3RlZCB0aGlzIHRvZGF5IHdpdGggVmltNCBhbmQg
d29ya3MgZmluZS4KQnkgd29ya3MgSSBtZWFuLCB2aW00IGlzIGFibGUgdG8gYm9vdCB3aXRob3V0
IHBhbmljcyBidXQgZHJvcHMgdG8gCmVtZXJnZW5jeSBzaGVsbCBhcyBleHBlY3RlZC4KClRlc3Rl
ZC1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
