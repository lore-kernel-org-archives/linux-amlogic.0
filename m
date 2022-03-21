Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6174C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Mar 2022 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONmRzMST8bg22Z0OOgKHWuUYh6M2MfBDwsDCfBnmJQs=; b=X8SM5DmcmxxKOU
	HML49JjOvQ37ikJoZfz+bwqnpvqbnk5c/+ETGJ6ctA7c26Hjh+SB5/Dz8HMdZmC6INqrtU+aBF3JN
	9QiFx6MNWZdip8UQ50Qy1pOI4WbrUoDwwhyxVBiZJe8Z1TK0OrmAxB1MqBkt8+tn4yK9djPvgFMSF
	AHMC0ZW7HXDsdaUV1GnyiL3sQhRGCfewPmKQOtDr9m4/C3rFDyyehVpzqdrQpnDgoBteVRFQXhNHp
	cg1Amjp6KpSNjWZJHbRaOroAPKuOlp0ZGUUQuLr+ddXI8s8ZwDOVyWfn2x55rVBIVItTvDEDPpf4V
	BYZQf6arb5WDiYWB/dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWDPa-0071Zp-Vg; Mon, 21 Mar 2022 08:29:11 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWDPH-0071Vo-Q9; Mon, 21 Mar 2022 08:28:52 +0000
Received: by mail-ej1-f53.google.com with SMTP id pv16so28352281ejb.0;
 Mon, 21 Mar 2022 01:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HcEnlmQ/c9nTewqIhQqcZV4bu3Z7rpqXOTeyXi1ZiTE=;
 b=Cvd6kzO7JGHB08u6wsciHEAOvahoX8i3dto7LwAGEHz8do2opk5I2oKEppu7aB6Lnu
 WBs4omoL8tN2Go/XfFaskRSkUNbuNhhw/BLSFN+CTPtllEjPz8e6babxU0yT7X3eS6s2
 mb1YJ6OIntvb7z4g0diqMWDkja4z9wNYKZoM6EbF+pWG5K+reihxZLvzK+VCw6E+oUnz
 3/WsFZm2zj3T3/HE73wXNv5yXRa7mybVmdQbZXDmRiKotSFqn8pzHsR5F5fAOWUH0rMM
 LK+JR/BC+rvkCpWTSn4QsTLXX73+vzeyjcU/O97sIObK/tgyEbKrTltX/zfiosjIiFxZ
 Q+5A==
X-Gm-Message-State: AOAM532ybLWcPbjtWYQUAea6aYC1fM1AodzVnyORpybKxeaA0T46ubkN
 TmQ6o4qTEKHJt35+TG+vXAo=
X-Google-Smtp-Source: ABdhPJz1bc2yRucsjFlFqG+ZLQE2pqxqxKBCGdgZURhOXqOXx8d8uTZ5oEOh0scuZ5Wi50lwshifxg==
X-Received: by 2002:a17:907:7244:b0:6df:fb38:1d02 with SMTP id
 ds4-20020a170907724400b006dffb381d02mr5224559ejc.453.1647851330001; 
 Mon, 21 Mar 2022 01:28:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 c12-20020a05640227cc00b004192114e521sm2852274ede.60.2022.03.21.01.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 01:28:49 -0700 (PDT)
Message-ID: <a4836cd6-1b92-8ee6-78aa-a85415e2c1b9@kernel.org>
Date: Mon, 21 Mar 2022 09:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_012851_875447_1884FED3 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

T24gMjUvMDIvMjAyMiAyMjoxMywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IEFkZCBhIFlBTUwg
c2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYyOCBhdXhkaXNwbGF5Cj4gKDcvMTEtc2VnbWVudCBMRUQp
IGNvbnRyb2xsZXIuCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0aWFsbHkgYmFzZWQgb24gcHJldmlv
dXMgd29yayBmcm9tCj4gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPi4KPiAKCigu
Li4pCgo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvbGVkcy9jb21tb24uaD4KPiArCj4gKyAgICBzcGkgewo+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgICBs
ZWQtY29udHJvbGxlckAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aXRhbm1lYyx0
bTE2MjgiOwo+ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4gKyAgICAgICAgICAgIHNwaS0zLXdp
cmU7Cj4gKyAgICAgICAgICAgIHNwaS1sc2ItZmlyc3Q7Cj4gKyAgICAgICAgICAgIHNwaS1tYXgt
ZnJlcXVlbmN5ID0gPDUwMDAwMD47Cj4gKyAgICAgICAgICAgIHRpdGFubWVjLGdyaWQgPSAvYml0
cy8gOCA8NCAzIDIgMT47Cj4gKyAgICAgICAgICAgIHRpdGFubWVjLHNlZ21lbnQtbWFwcGluZyA9
IC9iaXRzLyA4IDw0IDUgNiAxIDIgMyA3PjsKPiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8Mj47Cj4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgICAg
ICAgYWxhcm1ANSw0IHsKCkEgbml0OiBnZW5lcmljIG5vZGUgbmFtZSwgc28gImxlZCIuCgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
