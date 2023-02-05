Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E83EC636CC
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Feb 2023 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rb6U1v9n2JDHIJFjGOWP3rgyS9b3pyjH2lmcniFxPU=; b=co/6UH5MOL1zVw
	NDlcN/LJJqgmZ6CTWalv5tOaTi8DtaXU/MxoTflw6xFYwBHbT6ZTYUuUeYN6Q8nllNAwyKUeNic/3
	lz/7TT0UYHz6ufrDZs3MPTQV7uW9TDO1Z4makJzwFIMzl7RNLaliDGlejWBRJOpXWvNGHLbaHJSwl
	ZustPzoXSvKqWsCmlKtP4vTloNTlk/8SSBvaE752+BXXh5A06NDOIvzsliaLpKgIJjLZdQlx1mf4w
	twEKIiW0dHPtC7TnTPJNNu7g2DZtYYTAd3Jlp7Ua/ySUvr/ioOBN5BD3D7/Lzlxh1kS/r+FjRxZTw
	V0eyQ0gM1Ijswo7t9I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOZu7-0068Qf-Af; Sun, 05 Feb 2023 07:57:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOZu3-0068Q7-Ic; Sun, 05 Feb 2023 07:57:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bh13-20020a05600c3d0d00b003dff6cd8b7eso1438389wmb.5;
        Sat, 04 Feb 2023 23:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KwxawGhHrGD7Cjciesgq8Dek9FKWiGaG8buzbGZFkk=;
        b=D8O5qLY/PSR31AbVtCwLDd+4KwQ97JcH9YFQMq9tISaak/KKZ9dIPSdjJZttBsf/Ju
         TJcLd+aGOngSHFGU09TL7KBb27HVoV3VYsa8prIDpkW8WQybYFToXCGVLq6vMp7hn5es
         2hyAeQTrhFaevheD6u2wM/j5gqgeNfcvB2VGPLokRfj4LcNaArrL6MzgTWrMTS0fDN5c
         RrBHmOASz2A5rf/3rwWhAsMmYgDNw5USTY/0P/nNOxFUEVlba7FIwAoMcgcYAEW/FZCR
         y0v9KavRXgML5t3s9L6kiSe6uZ4w1llAgCp609PEjJl/LvR5if/pRK3bR3Y4ut71KzI8
         4zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KwxawGhHrGD7Cjciesgq8Dek9FKWiGaG8buzbGZFkk=;
        b=lriiEfdOStlmJCkS/8tZE9rxMdJZ0JcIJfIwkV4dmdpH3lqpzCHuQM4LxEM3RhpG7P
         wF6izyAnnhV3gfIWhrtCrghgXY9q5IAmc3VbOotTkHkpZzIOl4vna976QG8u/lIFMTqU
         Y/KfyoF2ZcvJSC15e99mUcwN39US2oSvgRkMYXHJbOixVFwWoVtxfKViCEJix8QVlzFR
         J1h/PrJlXAudlZdoO2ZQqENuoX1VFVt1wsdQ/7x07sM7YPQigeKTeHVCH9I2/s7gOEZ8
         BQGRPZLHs0uhmO/FlHLKu9Aktu4KClCgzSH0ubcSXmVddDulS0NnECXqcyMIxgywzsVO
         RGIw==
X-Gm-Message-State: AO0yUKXBcGYnpzdVFtgJWNWGKkflIwY2ymCDygjm9Rj0azlG9BhIDeDQ
	3kZ4sH+1xpJQecCJBqlsEb12Ao7uOWo=
X-Google-Smtp-Source: AK7set9uhqLS5dyxfl2QAI2MGrrkJQ28Zlj2FHtRgLUQ7ZNTgFqeHMPW97wBgozLNE46beIUv15wFg==
X-Received: by 2002:a05:600c:3504:b0:3df:30c9:4865 with SMTP id h4-20020a05600c350400b003df30c94865mr14174489wmq.26.1675583852409;
        Sat, 04 Feb 2023 23:57:32 -0800 (PST)
Received: from smtpclient.apple ([2a01:e0a:982:cbb0:3cf9:9123:e7f6:d530])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b003ddf2865aeasm13595438wms.41.2023.02.04.23.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 23:57:32 -0800 (PST)
From: Neil Armstrong <narmstrong.kernel@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding
Date: Sun, 5 Feb 2023 08:57:21 +0100
Message-Id: <9DA78049-10C9-47D6-B36B-9B7E1067385A@gmail.com>
References: <6dcf6333-f75a-f7ec-8ce9-fbbfb81d1a60@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
In-Reply-To: <6dcf6333-f75a-f7ec-8ce9-fbbfb81d1a60@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: iPhone Mail (20C65)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_235735_678164_1B807005 
X-CRM114-Status: GOOD (  13.90  )
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

Cj4gTGUgNSBmw6l2ci4gMjAyMyDDoCAwMTowNSwgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQx
QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+IAo+IO+7v09uIDA0LjAyLjIwMjMgMjM6NTYsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+IEhpIEhlaW5lciwKPj4gCj4+IE9uIFdlZCwgRmViIDEs
IDIwMjMgYXQgMTE6MTMgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+IFsuLi5dCj4+Pj4+ICsgICAgICAtIGl0ZW1zOgo+Pj4+PiArICAgICAgICAgIC0g
Y29uc3Q6IGFtbG9naWMsbWVzb244bTItYW9idXMtcGluY3RybAo+Pj4+PiArICAgICAgICAgIC0g
Y29uc3Q6IGFtbG9naWMsbWVzb244LWFvYnVzLXBpbmN0cmwKPj4+Pj4gKyAgICAgIC0gaXRlbXM6
Cj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjhtMi1jYnVzLXBpbmN0cmwK
Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uOC1jYnVzLXBpbmN0cmwKPj4+
PiAKPj4+PiBBZ2FpbiwgY2FuJ3QgaGF2ZSBib3RoIHdpdGggYW5kIHdpdGhvdXQgdGhlIGZhbGxi
YWNrIGFsbG93ZWQuCj4+Pj4gCj4+PiBIaSBNYXJ0aW4sCj4+PiAKPj4+IG1lc29uOG0yIGlzIHRo
ZSBvbmx5IGNoaXAgdmVyc2lvbiBoYXZpbmcgYSBmYWxsYmFjayBmb3IgdGhlCj4+PiBwaW5jdHJs
IGNvbXBhdGlibGUuIElzIHRoaXMgZmFsbGJhY2sgcmVhbGx5IG5lZWRlZD8KPj4+IExvb2tpbmcg
YXQgdGhlIGRyaXZlciBpdCBzZWVtcyB0aGF0IGJvdGggY29tcGF0aWJsZXMKPj4+IGFyZSBoYW5k
bGVkIGlkZW50aWNhbGx5Lgo+PiBCYWNrIGluIHRoZSBkYXkgd2UgZGVjaWRlZCB0byBkdXBsaWNh
dGUgdGhlIE1lc29uOCBkcml2ZXIgY29kZSBqdXN0IHRvCj4+IGFkZCBmb3VyIG5ldyBwaW4gZnVu
Y3Rpb25zIHRoYXQgYXJlIGFkZGVkIGJ5IHRoZSBNZXNvbjhtMiBTb0MKPj4gZ2VuZXJhdGlvbjoK
Pj4gImV0aF9yeGQyIiwgImV0aF9yeGQzIiwgImV0aF90eGQyIiwgImV0aF90eGQzIgo+PiAKPj4g
VGhlIGNvbXBhdGlibGUgc3RyaW5nIHdhcyBkZWZpbmVkIHdpdGggYSBzaW1pbGFyIGFwcHJvYWNo
OiBzaW5jZQo+PiBNZXNvbjhtMiBqdXN0IGFkZHMgYSBmZXcgYml0cyB0byB0aGUgTWVzb244IHBp
biBjb250cm9sbGVyIGl0J3MKPj4gYmFja3dhcmRzIGNvbXBhdGlibGUuCj4+IAo+PiBJZiB0aGUg
ZmFsbGJhY2sgaGFzIHRvIGJlIHJlbW92ZWQgdGhlbiBJJ20gb2theSB3aXRoIHRoYXQgYnV0IEkg
d291bGQKPj4gbGlrZSB0byB1bmRlcnN0YW5kIGl0IGZpcnN0Lgo+PiBTbyBmYXIgSSB0aG91Z2h0
IHRoYXQgUm9iIGJhc2ljYWxseSBhc2tlZCB0byByZW1vdmUgdGhlIGZvbGxvd2luZyB0d28KPj4g
Y29tcGF0aWJsZSBzdHJpbmdzIGZyb20gdGhlIGVudW0gKGFzIHRoZXkncmUgbGlzdGVkIHNlcGFy
YXRlbHkgd2l0aAo+PiB0aGVpciBmYWxsYmFja3MpOgo+PiAtIGFtbG9naWMsbWVzb244bTItY2J1
cy1waW5jdHJsCj4+IC0gYW1sb2dpYyxtZXNvbjhtMi1hb2J1cy1waW5jdHJsCj4+IAo+IFJpZ2h0
LCB0aGlzIHNob3VsZCBiZSBzdWZmaWNpZW50LiBUaGVyZSdzIG5vIHBsYWNlIHdoZXJlIHRoZSA4
bTIgcGluY3RybAo+IGNvbXBhdGlibGVzIGFyZSB1c2VkIHcvbyBmYWxsYmFjay4KPiAKPiBUaGVu
IHRoZSBob3BlZnVsbHkgZmluYWwgdmVyc2lvbiBvZiB0aGUgYmluZGluZyBpcyBhbG1vc3QgcmVh
ZHkuCj4gSSdtIGp1c3Qgc3RpbGwgY2hlY2tpbmcgd2hldGhlciB0aGVyZSdzIGFueSB3YXkgaW4g
eWFtbCB0byBzcGVjaWZ5Cj4gYSByZWctbmFtZXMgbGlzdCB3aXRoIG1hbmRhdG9yeSBhbmQgb3B0
aW9uYWwgbmFtZXMuIERvZXNuJ3Qgc2VlbSBzby4KCkl04oCZcyBwb3NzaWJsZSB3aXRoIG1pbkl0
ZW1zL21heEl0ZW1zIGFuZCBhbGxPZjppZi9lbHNlIHRvIHNwZWNpZnkgZGlmZmVyZW50IG1pbi9t
YXggZm9yIGVhY2ggY29tcGF0aWJsZQoKTmVpbAoKPiAKPj4gCj4+IEJlc3QgcmVnYXJkcywKPj4g
TWFydGluCj4gCj4gSGVpbmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
