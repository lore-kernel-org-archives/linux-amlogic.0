Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB61C77B7C
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWrnb04Av9xTnKWwgKDA+Cxbbm7WSobX69WLWy02n18=; b=Al9YJyfys7lJ4c
	US2CdaQx9I1fzaZ4e3s9ZJ/59vVyz8Xg706T5qH2BeVXymvA3+ZulkShX6pq50KbV03+HzR7NvKx/
	K77rxRb9POxKBeK43xcwcUq+bxj12JbgdiovlIWDtKmeZklBY1rVFNbxCqPDexKXRaJrXqsSfZ35R
	3SLevEu3jPx4eS7lE86sHQjqQOhIwFrvNIpPoneq0s/5KE0osR+MpvECNYgczSBr2Vq4kG+SlMBZG
	SgLG9JEnaPMqKLBcUGQV16ezfoud+e/gCvzKKUdW+b0/DtYx0cJ+wKYQs7yAeWunqLK3Ap3edLorU
	NNo7sf6J9ZmrwvFBID3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pteyK-00HNyy-2h;
	Tue, 02 May 2023 01:38:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteyH-00HNy7-2o;
	Tue, 02 May 2023 01:38:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f315712406so149086385e9.0;
        Mon, 01 May 2023 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682991503; x=1685583503;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY6sg4QHtW/F7ejnI/trNLnsy73rmOwLgxPDQHz9Y10=;
        b=ebu0v04znpWvN+0ABS4WDZUVCiSIccl1PeLVRtO66tvv4eFVKF/EQaIG9umHJju5gL
         wqBnEWEMOrZh08xkVay5GdVSlpLGBR/eKlXV0Eiqaf/5qYse0xbTSaB/cNCVvFT2J/K+
         nulERRq3afjDLx5dCSqWLiLKaPU16Y06Rkt9cSOzBIn84K7SBJhJSyPUjnMrKtDX5I9d
         DJ9O9O62ZmbtJWIFop0Mbd9YH1CdGat1WDtOb4uMv+RyREexVaxKu9EdGlUqzvwNvbgi
         3foTV5Jqe/rFHU9La1trENL1Nhxg9Wq455240i/Gk/HVxhXG+oY4aNJhoMsGE70NvYaf
         qgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682991503; x=1685583503;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY6sg4QHtW/F7ejnI/trNLnsy73rmOwLgxPDQHz9Y10=;
        b=k1Y6pS+YVqgaMmBEqf4cYOkMrhTAacDvq7ryo1HIZEu1u614vyiqyJN6FDV4poBEY5
         RoCkDYpE2PLmj8HprQYBclmoVKpAMZXhNis/AWJ3ChHqGsYBOlyLz+D3p0TYMIh7LyJG
         zTdFjcmGpY6paxK+OXSENJlE5jZ6W98T1LXNLw2UvdX5d96vNUbpv14vPuTgrY+8PO1i
         /9MGm2XnL5AmOLZ4OyvgFE+Ra0Vp+kqovPQx0Eyvg+mRLl9PhKOwVdlTT36lPtjqafRx
         C1K38wKaj++mFlvyjXwhrzIRnwtj9R5r3t46g0Je44B5W4KmC3lZLRgWWyvNWpOP3OJh
         xEfw==
X-Gm-Message-State: AC+VfDzKjNsCBzi51MvVI4E+pjVhAwFwJMkcJiAwo457jIIsxZz43gZF
	wdAYaw8kM7JeyAN1A9o8Ujg=
X-Google-Smtp-Source: ACHHUZ77cqYAYl1Uh3mvhhV6YECZ8gpnoepS0uwwuok5QbSuP32c5Jkmh3BRvdlqJQtHfMd9dEycIg==
X-Received: by 2002:a5d:4046:0:b0:303:daff:f1a3 with SMTP id w6-20020a5d4046000000b00303dafff1a3mr15320567wrp.1.1682991503076;
        Mon, 01 May 2023 18:38:23 -0700 (PDT)
Received: from smtpclient.apple ([91.135.9.67])
        by smtp.gmail.com with ESMTPSA id r3-20020a05600c35c300b003f1836c98b7sm35214527wmq.48.2023.05.01.18.38.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 May 2023 18:38:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
Date: Tue, 2 May 2023 02:38:20 +0100
Cc: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 jian.hu@amlogic.com,
 kernel@sberdevices.ru,
 rockosov@gmail.com,
 AML <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>
Message-Id: <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_183825_932681_FF4E5D55 
X-CRM114-Status: GOOD (  16.87  )
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

PiBPbiAxIE1heSAyMDIzLCBhdCA3OjUxIHBtLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiAKPiBIaSBEbWl0cnksCj4gCj4g
T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo+IDxkZHJv
a29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+PiAKPj4gQWRkIHRoZSBkb2N1bWVudGF0aW9u
IGZvciBBbWxvZ2ljIEExIFBlcmlwaGVyYWxzIGNsb2NrIGRyaXZlciwKPj4gYW5kIEExIFBlcmlw
aGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MuCj4gTWF5YmUgYSBuYXRpdmUgRW5nbGlz
aCBzcGVha2VyIGNhbiBjb21tZW50IG9uIHdoZXRoZXIgaXQncwo+ICJwZXJpcGhlcmFsIiBvciAi
cGVyaXBoZXJhbHMiLgoKSeKAmW0gbm90IGEgZ3JhbW1hciBzcGVjaWFsaXN0LCBidXQgSSB3b3Vs
ZCB3cml0ZToKCuKAnEFkZCBkb2N1bWVudGF0aW9uIGFuZCBiaW5kaW5ncyBmb3IgdGhlIEFtbG9n
aWMgQTEgU29DIHBlcmlwaGVyYWxzCmNsb2NrIGRyaXZlcuKAnQoKUGVyaXBoZXJhbHMgaXMgdGhl
IGNvcnJlY3QgcGx1cmFsIGJ1dCByZWFkcyBiZXR0ZXIgd2hlbiB5b3UgYWRkCmNvbnRleHQgb24g
dGhlIHR5cGUgb2YgcGVyaXBoZXJhbHMuCgpDaHJpc3RpYW4KCj4gWy4uLl0KPj4gU2lnbmVkLW9m
Zi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPj4gUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAuLi4vYmluZGluZ3MvY2xvY2sv
YW1sb2dpYyxhMS1jbGtjLnlhbWwgICAgICAgfCAgNzMgKysrKysrKysrKysKPj4gLi4uL2JpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsYTEtcGxsLWNsa2MueWFtbCAgIHwgICA1ICstCj4+IGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhMS1jbGtjLmggICB8IDExNCArKysrKysrKysrKysr
KysrKysKPiBJIGhhdmUgc2VlbiB0aGF0IFl1IFR1IG5hbWVkIHRoZSBTNCBwZXJpcGhlcmFsIGNs
b2NrIGNvbnRyb2xsZXIKPiBiaW5kaW5nIGFuZCBkcml2ZXIgInM0LXBlcmlwaGVyYWxzLWNsa2Mi
IFswXS4KPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gYXBwbHkgdGhlIHNhbWUgbmFtaW5nIGhlcmUg
YXMgd2VsbD8KPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyMzA0MTcwNjUwMDUuMjQ5NjctMy15
dS50dUBhbWxvZ2ljLmNvbS8KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
