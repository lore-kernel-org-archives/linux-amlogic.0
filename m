Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75455C77B7A
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyAfZ+PHfU5CqgaI7AoSo3eXoSyAGBQKhPM+VVQjEyU=; b=JlkVyRDsHy4Xl+
	FDYu2g1Imup1EpMNNjBRSfFfaLiyVejjXSEUfaLG0R1xSTGfSWGN/UdqqAJSbKqGtq+GFEsPSBQPu
	ev3OQp6xJnKJbitN3Dh2v30mOlL0JO9UN4qdZXTALxxLsdm+6LhAqYhBHs0uqX1gjlElyaKtGczRE
	1usaQ2XTlVypgbmtxqtJizW3m5tDwjXxAzD4mZTBTXVtWy/5SVID3EcnmYt3brglrdUlfYkjVLmMm
	GPt72jiB57TYazoR6oncqdQSDSZ3OV+LDe3V/ziWXmuj1rA3gV1IuUTKwKo/w6hHsV83WI7rlY3Eh
	33DVO1PdF6nCpuSOkulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q02h0-00GgnC-0I;
	Fri, 19 May 2023 16:10:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q02gw-00Gglz-39;
	Fri, 19 May 2023 16:10:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96f0678de80so628021166b.3;
        Fri, 19 May 2023 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684512652; x=1687104652;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shR9tZ5xiaUJ9C4wWURqYuO7Qqx5kQ3Rtd+uNyelifI=;
        b=OfjoobpT9uQF4m5zhukOOavH5dDTVfys7/MeRv7VK28aAKRy30BShQ6lKs58R4kMmc
         MnbpOOTGl0ETnKxnSQaBQl5JDgw8g5zP9JWEQdSMOeAiTsyjCb8sqezzCxjN3OEtDEN2
         QPPU/2dtmEw9lNinyhObJiQHj14y6YdeIhL8PGuVpei3GjrV9t+ZLXo95fP11FXowRdO
         Dt8CpxJ5xUk3LPpXVDd1VtZ/PwCd/NZGKu/PkmHgVZpth2mvfH6dTwYeGUDuYhgv2i4A
         5vNcpC8AZg3ieGBPB5s0dwUlWTl1oF3M1TIIphc7BC0VVVWJgncW17df8uMYjUs1yY7Y
         /iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684512652; x=1687104652;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shR9tZ5xiaUJ9C4wWURqYuO7Qqx5kQ3Rtd+uNyelifI=;
        b=amAhtQZvgIS7sJoHMiTDEXAxPfRLf4FptQNJfXXuqfihOGxNm+OMmgIRuTH93Iy3f6
         zT+RLZyFQH+A3TxphSnAoaTReS4VLiARJ1gDAjA039gQapetOutn+I4aM6W2wVnfipck
         wLeHN+Fj7jKQi0kDebA74SoMqmVTBWj/CS4hc3pNliRseEQ7Nv8K2ws29pSugcmvuMWK
         7D3KhBn3vOLQDS1ZIEHzSeY2E0VzwYChaQGibSPar5Xdbl4wgKpf4xGy7H2kWRh1J1lE
         w96PvGKDQNv0Axz3+CC7CZeZHqaU6sM5NYjlRQxZbCWBFQ+78bmLLlKO7xR0mKcZLExN
         SPrg==
X-Gm-Message-State: AC+VfDztSiDdCrz7o90rKAeGU9zSYrpuLIxrqjTPfoSkLUl3ebOqMal2
	nk1OEWpWFuLkAKmOt7WLuMQ=
X-Google-Smtp-Source: ACHHUZ51F8Of6ajEOG4kC19Rjv1qy/hiNer8vMIgrh6QrItztf/4VfKsyoLOjahdva0jY3U7GQ+jug==
X-Received: by 2002:a17:907:3fa8:b0:960:ddba:e5c5 with SMTP id hr40-20020a1709073fa800b00960ddbae5c5mr3186651ejc.11.1684512651750;
        Fri, 19 May 2023 09:10:51 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c53c:ab00:54b1:eb24:1f4e:3a15? (dynamic-2a01-0c23-c53c-ab00-54b1-eb24-1f4e-3a15.c23.pool.telefonica.de. [2a01:c23:c53c:ab00:54b1:eb24:1f4e:3a15])
        by smtp.googlemail.com with ESMTPSA id e20-20020a170906845400b0096f7b7b6f11sm508427ejy.106.2023.05.19.09.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 09:10:51 -0700 (PDT)
Message-ID: <573d96df-7b08-4fa2-668b-58ff674a314e@gmail.com>
Date: Fri, 19 May 2023 18:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru>
 <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
 <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
 <CAFBinCA8e9evk+9hTEgoNOD_+3DBst6vYDcradmr2c996jdUmw@mail.gmail.com>
 <20230517103456.p3sjxzbepvg7cr2r@CAB-WSD-L081021>
 <CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
In-Reply-To: <CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_091055_011438_E9E91D66 
X-CRM114-Status: GOOD (  27.77  )
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

T24gMTguMDUuMjAyMyAyMjowNCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBEbWl0
cnksCj4gCj4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTI6MzTigK9QTSBEbWl0cnkgUm9rb3Nv
dgo+IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+IFsuLi5dCj4+Pj4gQWRkaXRp
b25hbGx5LCB0aGUgQ0NGIGRldGVybWluZXMgdGhlIGJlc3QgYW5jZXN0b3IgYmFzZWQgb24gaG93
IGNsb3NlCj4+Pj4gaXRzIHJhdGUgaXMgdG8gdGhlIGdpdmVuIG9uZSwgYmFzZWQgb24gYXJpdGht
ZXRpYyBjYWxjdWxhdGlvbnMuIEhvd2V2ZXIsCj4+Pj4gd2UgaGF2ZSBpbmRlcGVuZGVudCBrbm93
bGVkZ2UgdGhhdCBhIGNlcnRhaW4gY2xvY2sgd291bGQgYmUgYmV0dGVyLCB3aXRoCj4+Pj4gbGVz
cyBqaXR0ZXIgYW5kIGZld2VyIGludGVybWVkaWFyaWVzLCB3aGljaCB3aWxsIGxpa2VseSBpbXBy
b3ZlIGVuZXJneQo+Pj4+IGVmZmljaWVuY3kuIFNhZGx5LCB0aGUgQ0NGIGNhbm5vdCB0YWtlIHRo
aXMgaW50byBhY2NvdW50Lgo+Pj4gSSBhZ3JlZSB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBD
Q0YgaXMgZmFpcmx5IHNpbXBsZS4gVGhlcmUncyB3YXlzCj4+PiB0byB0cmljayBpdCB0aG91Z2g6
IElJUkMgaWYgdGhlcmUgYXJlIG11bHRpcGxlIGVxdWFsbHkgc3VpdGFibGUgY2xvY2tzCj4+PiBp
dCBwaWNrcyB0aGUgZmlyc3Qgb25lLiBGb3IgbWUgYWxsIG9mIHRoaXMgaGFzIHdvcmtlZCBzbyBm
YXIgd2hpY2ggaXMKPj4+IHdoYXQgbWFrZXMgbWUgY3VyaW91cyBpbiB0aGlzIGNhc2UgKG5vdCBz
YXlpbmcgdGhhdCBhbnl0aGluZyBpcyB3cm9uZwo+Pj4gd2l0aCB5b3VyIGFwcHJvYWNoKS4KPj4+
Cj4+PiBEbyB5b3UgaGF2ZSBhIChyZWFsIHdvcmxkKSBleGFtcGxlIHdoZXJlIHRoZSBSVEMgY2xv
Y2sgc2hvdWxkIGJlCj4+PiBwcmVmZXJyZWQgb3ZlciBhbm90aGVyIGNsb2NrPwo+Pj4KPj4KPj4g
WWVzLCBhIHJlYWwtbGlmZSBleGFtcGxlIGlzIHRoZSBuZWVkIGZvciBhIDMyS2h6IGNsb2NrIGZv
ciBhbiBleHRlcm5hbAo+PiB3aWZpIGNoaXAuIFRoZXJlIGlzIG9uZSBvcHRpb24gdG8gcHJvdmlk
ZSB0aGlzIGNsb2NrIHdpdGggaGlnaAo+PiBwcmVjaXNpb24sIHdoaWNoIGlzIFJUQyArIEdFTkNM
Sy4KPj4KPj4+IEknbSB0aGlua2luZyBhYm91dCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvLgo+Pj4g
UFdNIHBhcmVudHM6Cj4+PiAtIFhUQUw6IDI0TUh6Cj4+PiAtIHN5czogbm90IHN1cmUgLSBsZXQn
cyBzYXkgMTY2LjY3TUh6Cj4+PiAtIFJUQzogMzJrSHoKPj4+Cj4+PiBUaGVuIGFmdGVyIHRoYXQg
dGhlcmUncyBhIGRpdmlkZXIgYW5kIGEgZ2F0ZS4KPj4+Cj4+PiBMZXQncyBzYXkgdGhlIFBXTSBj
b250cm9sbGVyIG5lZWRzIGEgMU1IeiBjbG9jazogaXQgY2FuIHRha2UgdGhhdCBmcm9tCj4+PiBY
VEFMIG9yIHN5cy4gU2luY2UgWFRBTCBpcyBldmVubHkgZGl2aXNpYmxlIHRvIDFNSHogQ0NGIHdp
bGwgcGljayB0aGF0Cj4+PiBhbmQgdXNlIHRoZSBkaXZpZGVyLgo+Pj4gQnV0IGxldCdzIHNheSB0
aGUgUFdNIGNvbnRyb2xsZXIgbmVlZHMgYSAzMmtIeiBjbG9jazogQ0NGIHdvdWxkCj4+PiBhdXRv
bWF0aWNhbGx5IHBpY2sgdGhlIFJUQyBjbG9jay4KPj4+IFNvIGlzIHlvdXIgaW1wbGVtZW50YXRp
b24gdGhlcmUgdG8gY292ZXIgbGV0J3Mgc2F5IDFrSHogd2hlcmUKPj4+IG1hdGhlbWF0aWNhbGx5
IDI0TUh6IGNhbiBiZSBkaXZpZGVkIGV2ZW5seSB0byAxa0h6IChhbmQgdGh1cyBzaG91bGQKPj4+
IG5vdCByZXN1bHQgaW4gYW55IGppdHRlcikgYnV0IFJUQyBnaXZlcyBiZXR0ZXIgcHJlY2lzaW9u
IGluIHRoZSByZWFsCj4+PiB3b3JsZCAoZXZlbiB0aG91Z2ggaXQncyBvZmYgYnkgMjRIeik/Cj4+
Pgo+Pgo+PiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgaGlnaGVzdCBwcmVjaXNpb24gdGhhdCBSVEMg
Y2FuIHByb3ZpZGUgaXMgZnJvbSBhCj4+IDMyS0h6IHJhdGUgb25seS4gSG93ZXZlciwgSSBiZWxp
ZXZlIHRoYXQgYSAxa0h6IGZyZXF1ZW5jeSBjYW4gYWxzbyBiZQo+PiBhY2hpZXZlZCBieSB1c2lu
ZyB4dGFsIDI0TUh6IHdpdGggYSBkaXZpZGVyLCB3aGljaCBjYW4gcHJvdmlkZSBoaWdoCj4+IHBy
ZWNpc2lvbiBhcyB3ZWxsLgo+IFRoYW5rIHlvdSBhZ2FpbiBmb3IgdGhlIGdyZWF0IGRpc2N1c3Np
b24gb24gSVJDIHRvZGF5Lgo+IEhlcmUncyBteSBzaG9ydCBzdW1tYXJ5IHNvIEkgZG9uJ3QgZm9y
Z2V0IGJlZm9yZSB5b3UnbGwgZm9sbG93IHVwIG9uIHRoaXMuCj4gCj4gSW4gZ2VuZXJhbCB0aGVy
ZSdzIHR3byBrbm93biBjYXNlcyB3aGVyZSB0aGUgUlRDIGNsb2NrIG5lZWRzIHRvIGJlIHVzZWQ6
Cj4gYSkgV2hlbiB1c2luZyB0aGUgR0VOQ0xLIG91dHB1dCBvZiB0aGUgU29DIHRvIG91dHB1dCB0
aGUgMzJrSHogUlRDCj4gY2xvY2sgYW5kIGNvbm5lY3QgdGhhdCB0byBhbiBTRElPIFdpRmkgY2hp
cCBjbG9jayBpbnB1dCAodGhpcyBzZWVtcwo+IHVzZWZ1bCBpbiBteSB1bmRlcnN0YW5kaW5nIGJl
Y2F1c2UgdGhlIFJUQyBjbG9jayBwcm92aWRlcyBoaWdoCj4gcHJlY2lzaW9uKQo+IGIpIFdoZW4g
dXNpbmcgdGhlIFBXTSBjb250cm9sbGVyIHRvIG91dHB1dCBhIDMya0h6IGNsb2NrIHNpZ25hbC4g
SW4KPiB0aGlzIGNhc2UgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHVzaW5nIHRoZSBSVEMgY2xv
Y2sgYXMgaW5wdXQgdG8gdGhlCj4gUFdNIGNvbnRyb2xsZXIgcmVzdWx0cyBpbiB0aGUgYmVzdCBw
b3NzaWJsZSBzaWduYWwKPiAKPiBUaGUgc2Vjb25kIGNhc2Ugd29uJ3QgYmUgc3VwcG9ydGVkIHdp
dGggSGVpbmVyJ3MgcGF0Y2hlcyBbMF0gdGhhdCB1c2UKPiBDQ0YgKGNvbW1vbiBjbG9jayBmcmFt
ZXdvcmspIGluIHRoZSBQV00gY29udHJvbGxlciBkcml2ZXIuCj4gSW4gdGhpcyBzZXJpZXMgdGhl
IHBhcmVudCBjbG9jayBpcyBjYWxjdWxhdGVkIHVzaW5nOgo+ICAgZnJlcSA9IGRpdjY0X3U2NChO
U0VDX1BFUl9TRUMgKiAodTY0KTB4ZmZmZiwgcGVyaW9kKTsKPiAKPiBBIDMya0h6IGNsb2NrIG1l
YW5zIGEgUFdNIHBlcmlvZCBvZiAzMDUxOG5zLiBTbyB3aXRoIHRoZSBhYm92ZQoKVG8gYmUgcHJl
Y2lzZTogMzA1MTcsNTc4MTI1bnMKV2hhdCBtZWFucyB0aGF0IHRoZSBQV00gZnJhbWV3b3JrIGNh
bid0IHNheSAiSSB3YW50IDMyNzY4SHoiLApidXQganVzdCAiSSB3YW50IHNvbWV0aGluZyBiZWlu
ZyB2ZXJ5IGNsb3NlIHRvIDMyNzY4SHoiLgpTbyB3aGF0IHlvdSBuZWVkIGlzIHNvbWUgc2ltcGxl
IGhldXJpc3RpYyB0byBpbnRlcnByZXQgdGhlClBXTSByZXF1ZXN0IC0+ICJQV00gcmVxdWVzdHMg
MzA1MThucywgYnV0IHN1cHBvc2VkbHkgaXQgd2FudHMKMzI3NjhIeiIKCk5TRUNfUEVSX1NFQyAv
IDMwNTE4ID0gMzI3NjcgKHJvdW5kZWQgZG93biBmcm9tIDMyNzY3LDU0NykKY2xrX3JvdW5kX3Jh
dGUoY2hhbm5lbC0+Y2xrLCAzMjc2Nykgd291bGQgcmV0dXJuIDAgKEkgKnRoaW5rKiksCmJlY2F1
c2UgaXQgdHJpZXMgdG8gZmluZCB0aGUgbmV4dCBsb3dlciBjbG9jay4KClRoZSBTb0MgZmFtaWxp
ZXMgSSdtIGZhbWlsaWFyIHdpdGggaGF2ZSBmY2xraW4yIGFzIFBXTSBwYXJlbnQuClRoYXQncyAx
IEdIeiBpbiBteSBjYXNlLCB3aGF0IHJlc3VsdHMgaW4gYSBmcmVxdWVuY3kgb2YgMzIuNzY3LDU0
N0h6CmZvciBwZXJpb2QgPSAzMDUxOG4uCldoYXQgeW91J3JlIHNheWluZyBpcyB0aGF0IG5ld2Vy
IGdlbmVyYXRpb25zIGRvbid0IGhhdmUgUFdNIHBhcmVudHMKPjI0TUh6IGFueSBsb25nZXI/CgoK
PiBjYWxjdWxhdGlvbiB0aGUgUFdNIGRyaXZlciBpcyBhc2tpbmcgZm9yIGEgY2xvY2sgcmF0ZSBv
ZiA+PTJHSHouCj4gV2UgY29uY2x1ZGVkIHRoYXQgbGV0dGluZyB0aGUgY29tbW9uIGNsb2NrIGZy
YW1ld29yayBjaG9vc2UgdGhlIGJlc3QKPiBwb3NzaWJsZSBwYXJlbnQgKG1lYW5pbmc6IHJlbW92
aW5nIENMS19TRVRfUkFURV9OT19SRVBBUkVOVCBoZXJlKSBjYW4KPiBiZSBhIHdheSBmb3J3YXJk
Lgo+IEJ1dCB0aGlzIG1lYW5zIHRoYXQgdGhlIFBXTSBjb250cm9sbGVyIGRyaXZlciBtdXN0IHRy
eSB0byBmaW5kIHRoZQo+IGJlc3QgcG9zc2libGUgcGFyZW50IHNvbWVob3cuIFRoZSBlYXNpZXN0
IHdheSB3ZSBjYW1lIHVwIHdpdGgKPiAocHNldWRvLWNvZGUpOgo+ICAgZnJlcSA9IE5TRUNfUEVS
X1NFQyAvIHBlcmlvZDsKPiAgIGZpbl9mcmVxID0gY2xrX3JvdW5kX3JhdGUoY2hhbm5lbC0+Y2xr
LCBmcmVxKTsKPiAgIGlmIChmaW5fZnJlcSAhPSBmcmVxKSB7Cj4gICAgIGZyZXEgPSBkaXY2NF91
NjQoTlNFQ19QRVJfU0VDICogKHU2NCkweGZmZmYsIHBlcmlvZCk7Cj4gICAgIGZpbl9mcmVxID0g
Y2xrX3JvdW5kX3JhdGUoY2hhbm5lbC0+Y2xrLCBmcmVxKTsKPiAgIH0KPiAKPiBUaGUgaWRlYSBp
czogZm9yIGEgcmVxdWVzdGVkIDMya0h6IHNpZ25hbCB0aGUgUFdNIHBlcmlvZCBpcyAzMDUxOG5z
Lgo+IFRoZSB1cGRhdGVkIGxvZ2ljIHdvdWxkIGZpbmQgdGhhdCB0aGVyZSdzIGEgbWF0Y2hpbmcg
Y2xvY2sgaW5wdXQgYW5kCj4gdXNlIHRoYXQgZGlyZWN0bHkuIElmIG5vdDogdXNlIHRoZSBvcmln
aW5hbCBsb2dpYyBhcyBzdWdnZXN0ZWQgYnkKPiBIZWluZXIuCj4gCj4gCj4gQmVzdCByZWdhcmRz
LAo+IE1hcnRpbgo+IAo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxv
Z2ljLzlmYWNhMmU2LWI3YTEtNDc0OC03ZWIwLTQ4ZjgwNjRlMzIzZUBnbWFpbC5jb20vCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
