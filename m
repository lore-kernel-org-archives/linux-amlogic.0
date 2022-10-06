Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C571C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Oct 2022 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2LRLPUIkMUZtwYDGMlqBNob6N6gV/0WFD96WqERsaY=; b=b2SfSPu/bQ8R2P
	Ay2Wxiztn3JuyzkC7SNp5ExZ4wZzguHULJ1irQw25Q12+swsFZ3jeLlkeU1Bqig6JsfZP5YDTabFi
	iCVVPtuYaV/1Yh47C2K5zqY54kzK0Bk0cep11iQfoBZiZRwVyxLmbWRW79rnVjsZmkGiVZ7qclZOm
	ejVEZ7YjMbebZjjevYDyjCp1sM28GrOrQ4AnyR99WnOh7FVrXKSKDNVnaGqHDPW/fAHpk17wtNXoS
	GsIHA5HjQzmfKAt76pJLZ9obXwrelWvFb+VikPgAkB13dn+p24n0pdrkNFFr6gbeEDee10HV1JGMr
	6ZV/IjGGuNilyhxKjpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOZv-001hCU-MA; Thu, 06 Oct 2022 10:58:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOZi-001h74-Jl
	for linux-amlogic@lists.infradead.org; Thu, 06 Oct 2022 10:58:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id n12so2089588wrp.10
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Oct 2022 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbv2nHTUDzNiZ9nBgts2ji/CMIP6Gv2pRdL0he3cIgg=;
        b=dQA1MwmY32f6mMOh4FebesRI3KpmxdKASSXF3XNuJ1f5B+AsXOFW7kU2xAamd3DN74
         McmUWagQo3TwI39dvke4dYZr08Rr+nREfOYAyL10Sf3eYIhBxMUgqSEj0BxsvnuYIfPY
         mDfvkk9+xKm8BOSPGU2qmuCf8mzNq32V4RZpsgHkkkWxlCekYHUHyVQ66PqZiC5M/U57
         RhZUfbdX12Z6eHnMdyeGGssGzuY6pcRjXWSdQihGSDaQpSNCleZB0mEFi5mNVn5KjwHl
         dgkkiGgBjNbbpH6gUZh1Y2My2qr8i2S5AsVXEmoGhkT6KLpgNm502H9GcUZd6bdx1VZb
         7wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbv2nHTUDzNiZ9nBgts2ji/CMIP6Gv2pRdL0he3cIgg=;
        b=EMdIL3mD9v/+k4q9OdkTSLWEQ9o+eO66DIiP4EVpAuAB2fn6QwXfEqamWmnrHEl+jm
         tPf7Bcm1uB8+c6z5JNCc5EHblQJwZ4QNlrDKpyKqgfrKHCL98LWPkwLfnu88g2BOT4dm
         UMVqoyIbQj5Y7LEWXItE8H0VR0o9BbNYq5vyIttULEXBQ9rWPlJzwZioSU30JfoMxT1b
         H0leL8q8u4vGvD7RdfGuo6Gr2ayXottlbMmlXwiMm4/A9bDNxJI9rlFPVNZpHiPvNuPR
         tKDG+/nXUf4TMzbXsvqrugRwtT1AamONg0c3e3vugVIRd3vksva3jBTiEH5NIyNodRme
         Xq9A==
X-Gm-Message-State: ACrzQf3lToCxNcsIQq/ZqeAVIZZWOuo048JB2M7IQN5ky5Ey/W+okmsm
	CI2D8pB7w9RZ68vlejfF+s4YgQ==
X-Google-Smtp-Source: AMsMyM6nhQ5i2ukKQyJBrZwm0pxC9L1Un6AVLfuF3eK/z8umqKVDErHz9KN/EfjKDk5f/Rjlorlh+Q==
X-Received: by 2002:a5d:4c8e:0:b0:22e:3979:7dc9 with SMTP id z14-20020a5d4c8e000000b0022e39797dc9mr2632995wrs.41.1665053874257;
        Thu, 06 Oct 2022 03:57:54 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id c66-20020a1c3545000000b003bdb2c7f3d1sm4819568wma.32.2022.10.06.03.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 03:57:53 -0700 (PDT)
Message-ID: <fb2706e3-f758-a0b0-d595-75ef362a853e@baylibre.com>
Date: Thu, 6 Oct 2022 12:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Mark Brown <broonie@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
 <20221004-up-aml-fix-spi-v2-1-3e8ae91a1925@baylibre.com>
 <d2ce98d7-1025-9c6e-e207-00e91942077a@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <d2ce98d7-1025-9c6e-e207-00e91942077a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_035758_858771_D0169145 
X-CRM114-Status: GOOD (  16.79  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKT24gMTAvNS8yMiAxMDox
NCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAwNC8xMC8yMDIyIDEzOjEwLCBBbWph
ZCBPdWxlZC1BbWV1ciB3cm90ZToKPj4gU1BJIHBpbnMgb2YgdGhlIFNQSUNDIENvbnRyb2xsZXIg
aW4gTWVzb24tR1ggbmVlZHMgdG8gYmUgY29udHJvbGxlZCBieQo+PiBwaW4gYmlhaXMgd2hlbiBp
ZGxlLiBUaGVyZWZvcmUgZGVmaW5lIHRocmVlIHBpbmN0cmwgbmFtZXM6Cj4+IC0gZGVmYXVsdDog
U1BJIHBpbnMgYXJlIGNvbnRyb2xsZWQgYnkgc3BpIGZ1bmN0aW9uLgo+PiAtIGlkbGUtaGlnaDog
U0NMSyBwaW4gaXMgcHVsbGVkLXVwLCBidXQgTU9TSS9NSVNPIGFyZSBzdGlsbCBjb250cm9sbGVk
Cj4+IGJ5IHNwaSBmdW5jdGlvbi4KPj4gLSBpZGxlLWxvdzogU0NMSyBwaW4gaXMgcHVsbGVkLWRv
d24sIGJ1dCBNT1NJL01JU08gYXJlIHN0aWxsIGNvbnRyb2xsZWQKPj4gYnkgc3BpIGZ1bmN0aW9u
Lgo+Pgo+PiBSZXBvcnRlZC1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KPj4gU2lnbmVk
LW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbWphZCBPdWxlZC1BbWV1ciA8YW91bGVkYW1ldXJAYmF5bGlicmUuY29tPgo+
PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYW1sb2dpYyxtZXNvbi1neC1z
cGljYy55YW1sICAgfCAxNSArKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9hbWxvZ2ljLG1lc29uLWd4LXNwaWNjLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FtbG9naWMsbWVzb24tZ3gtc3BpY2MueWFtbAo+PiBp
bmRleCAwYzEwZjc2NzgxNzguLjUzMDEzZTI3ZjUwNyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbWxvZ2ljLG1lc29uLWd4LXNwaWNjLnlhbWwK
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbWxvZ2ljLG1l
c29uLWd4LXNwaWNjLnlhbWwKPj4gQEAgLTQzLDYgKzQzLDE0IEBAIHByb3BlcnRpZXM6Cj4+ICAg
ICAgIG1pbkl0ZW1zOiAxCj4+ICAgICAgIG1heEl0ZW1zOiAyCj4+ICAgCj4+ICsgIHBpbmN0cmwt
MDoKPj4gKyAgICBtaW5JdGVtczogMQo+IG1heEl0ZW1zPwo+CldpbGwgZmlsbCBpdCBpbiBuZXh0
IHZlcnNpb24uCj4+ICsKPj4gKyAgcGluY3RybC0xOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsK
Pj4gKyAgcGluY3RybC1uYW1lczogdHJ1ZQo+IFdoeSBkbyB5b3UgbmVlZCBhbGwgdGhlc2UgaW4g
dGhlIGJpbmRpbmdzPwoKU1BJIGNsb2NrIGJpYXMgbmVlZHMgdG8gY2hhbmdlIGF0IHJ1bnRpbWUg
ZGVwZW5kaW5nIG9uIFNQSSBtb2RlLCBoZXJlIGlzIGFuIGV4YW1wbGUgb2YKCmhvdyB0aGlzIGlz
IHN1cHBvc2VkIHRvIGJlIHVzZWQgKCJzcGlfaWRsZV9sb3dfcGlucyIgYW5kICJzcGlfaWRsZV9s
b3dfcGlucyIgYXJlIGRlZmluZWQKCmluIHRoZSBzZWNvbmQgcGF0Y2ggb2YgdGhpcyBzZXJpZXMp
OgoKJnNwaWNjIHsKIMKgwqDCoCBwaW5jdHJsLTAgPSA8JnNwaV9waW5zPjsKIMKgwqDCoCBwaW5j
dHJsLTEgPSA8JnNwaV9waW5zPiwgPCZzcGlfaWRsZV9oaWdoX3BpbnM+OwogwqDCoMKgIHBpbmN0
cmwtMiA9IDwmc3BpX3BpbnM+LCA8JnNwaV9pZGxlX2xvd19waW5zPjsKIMKgwqDCoCBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiLCAiaWRsZS1oaWdoIiwgImlkbGUtbG93IjsKCiDCoMKgwqAgWy4u
Ll0KCn07Cgo+PiArCj4+ICAgaWY6Cj4+ICAgICBwcm9wZXJ0aWVzOgo+PiAgICAgICBjb21wYXRp
YmxlOgo+PiBAQCAtNjksNiArNzcsMTMgQEAgZWxzZToKPj4gICAgICAgICBpdGVtczoKPj4gICAg
ICAgICAgIC0gY29uc3Q6IGNvcmUKPj4gICAKPj4gKyAgICBwaW5jdHJsLW5hbWVzOgo+PiArICAg
ICAgbWluSXRlbXM6IDEKPj4gKyAgICAgIGl0ZW1zOgo+PiArICAgICAgICAtIGNvbnN0OiBkZWZh
dWx0Cj4+ICsgICAgICAgIC0gY29uc3Q6IGlkbGUtaGlnaAo+PiArICAgICAgICAtIGNvbnN0OiBp
ZGxlLWxvdwo+IFRoaXMgZG9lcyBub3QgbWF0Y2ggd2hhdCB5b3Ugd3JvdGUgaW4gdGhlIGJpbmRp
bmdzIC0geW91IG1lbnRpb25lZCBvbmx5Cj4gdHdvIHNldCBvZiBwaW4gY29udHJvbHMuCgpSaWdo
dCwgdGhlcmUgYXJlIGFjdHVhbGx5IHRocmVlIHNldCBvZiBwaW4gY29udHJvbHMsIHdpbGwgY29y
cmVjdCB0aGUgYmluZGluZ3MgYWJvdmUuCgoKUmVnYXJkcywKCkFtamFkCgo+Cj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
