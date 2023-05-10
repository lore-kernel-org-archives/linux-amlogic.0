Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B4C77B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LklxFdwtfvmYgbCZ7d0CQBElR3GlJLySJ0ge6OAVKM8=; b=rrhRTr/28+/OSKKPaNQGXNtAzJ
	SL3uCkphcddsB4FV2ugCKLVYy2I03CJvVEKOFwMDLf018HT+R2VjXADrkkaKya+Ur5W6MaXrpgdCF
	BMHlcbWJqwW3PrulhkVN2vBBRd7kZ1JjKpuqQXjuR2lTSe6unXTEHErcCGeqnBI2h3L1BpveTzL9n
	FFPJ2eoJJJMdU4eRp3WSyNJO8RnHB1hy0xw8bFKIIkd2f4WguzpV72yyGnRfQIkE4KQENeZ1Hgm7e
	fGx68JGOXRbb1zSo8umuPhfdbklG/HgRVG0X+qqLGHe2S+bTfJ+4yyhjM+NVIQmFn5Og6rQ9ZBvFs
	SnwK5WmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlHE-006PwU-1G;
	Wed, 10 May 2023 14:58:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlHC-006PvZ-1y
	for linux-amlogic@lists.infradead.org;
	Wed, 10 May 2023 14:58:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so16085865e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 May 2023 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683730723; x=1686322723;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tEkLDnYi6amM57tdf5gQnUUcHk3hMqAJVN6n+xRcEeo=;
        b=dEpKg1WOUB5ETVmIYDA/QCSUmtZoIWNfO6R6U4Hskff340eWzjX3xFzw190yKhoag9
         f7bGh4mkONO9w8bLWdTj3889mqoYAppqK9ghpsDdLuUmldPAs8gtSrfOFeieieTgBbDv
         8IepZC2UHKdqO26mTTW61BzNrs2dFFBoEbwfAU/7EP/Y07SlPoQgYsiPtPbOqQ+qTPmL
         Lo7gcY3ayCK0bfZIbeamcaGO0cSy+E7dLRZc/14osbSBfc8NWepXU1b/8NavlTMlTZQ4
         uZeVdlkIqHuEs3Fb8LlSKl56ZCLQr39o9u/BwVAJfhiziLPNkZDlQUv73P8ejSWKRJ9C
         uM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730723; x=1686322723;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEkLDnYi6amM57tdf5gQnUUcHk3hMqAJVN6n+xRcEeo=;
        b=lAK1iFUyL1/19NSfbmIvm68JEfhnhJtj9l0C6lx34mEP68H+zqGJFheZN9poI2V+vx
         oX9+zcZ1t37IkF9JjYmE5VLQ3QbM0pjJ370EnQV3p4hnTXsjdpNym5/hzcc6BMESe0se
         Sfng4XV6SSGVLVlQzU2Mag2ZnWA4Hs4X44alwvTadL1I52URyqwL48nH8Fsoiw+93JqY
         PstdqoL28ksdnG/pXetFbIulTCenWjXlbkkRWtw2Y3diFokwkZpEPTYkzRBJ/enyLhXi
         IoINlORM15EQS1LM/wSAZEBVjV0YxH+ZXEy9qYDI/Q/20VmyfSK5HU3iAFZbVhOo+nj2
         CecQ==
X-Gm-Message-State: AC+VfDzxsx4ools2krXjuOnUgixhNTm6exb85hmAOXc051H8pR0PtYKw
	xqiqKPONhWTA2pXbXwG0/lDc3w==
X-Google-Smtp-Source: ACHHUZ73tOLq3Z/LRshLlvD/QEdXldSGIbtBPgjM4oYjibmsuEAudP6W9JhTrUhldd8HFaYMRce5Mg==
X-Received: by 2002:a7b:c404:0:b0:3f1:6942:e024 with SMTP id k4-20020a7bc404000000b003f16942e024mr13596026wmi.27.1683730722969;
        Wed, 10 May 2023 07:58:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2ee9:7e58:bce6:9219? ([2a01:e0a:982:cbb0:2ee9:7e58:bce6:9219])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c229100b003f423a04016sm10687507wmf.18.2023.05.10.07.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:58:42 -0700 (PDT)
Message-ID: <cfebdda6-6e51-25f5-1c99-1e0b203e749b@linaro.org>
Date: Wed, 10 May 2023 16:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-axg: add missing GPIOA_18 gpio group
Content-Language: en-US
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
 linux-amlogic@lists.infradead.org
Cc: stable@vger.kernel.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Yixun Lan <yixun.lan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <20230510141934.112994-1-martin@geanix.com>
Organization: Linaro Developer Services
In-Reply-To: <20230510141934.112994-1-martin@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_075846_658702_03050AE4 
X-CRM114-Status: GOOD (  12.40  )
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

SGksCgpPbiAxMC8wNS8yMDIzIDE2OjE5LCBNYXJ0aW4gSHVuZGViw7hsbCB3cm90ZToKPiBXaXRo
b3V0IHRoaXMsIHRoZSBncGlvIGNhbm5vdCBiZSBleHBsaWNpdGx5IG11eCdlZCB0byBpdHMgZ3Bp
byBmdW5jdGlvbi4KPiAKPiBGaXhlczogODNjNTY2ODA2YTY4YSAoInBpbmN0cmw6IG1lc29uLWF4
ZzogQWRkIG5ldyBwaW5jdHJsIGRyaXZlciBmb3IgTWVzb24gQVhHIFNvQyIpCj4gU2lnbmVkLW9m
Zi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgo+IC0tLQo+ICAgZHJp
dmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMgfCAxICsKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
bWVzb24vcGluY3RybC1tZXNvbi1heGcuYyBiL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJs
LW1lc29uLWF4Zy5jCj4gaW5kZXggN2JmZWNkZmJhMTc3Li5kMjQ5YTAzNWMyYjkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMKPiArKysgYi9k
cml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYwo+IEBAIC00MDAsNiArNDAw
LDcgQEAgc3RhdGljIHN0cnVjdCBtZXNvbl9wbXhfZ3JvdXAgbWVzb25fYXhnX3BlcmlwaHNfZ3Jv
dXBzW10gPSB7Cj4gICAJR1BJT19HUk9VUChHUElPQV8xNSksCj4gICAJR1BJT19HUk9VUChHUElP
QV8xNiksCj4gICAJR1BJT19HUk9VUChHUElPQV8xNyksCj4gKwlHUElPX0dST1VQKEdQSU9BXzE4
KSwKPiAgIAlHUElPX0dST1VQKEdQSU9BXzE5KSwKPiAgIAlHUElPX0dST1VQKEdQSU9BXzIwKSwK
PiAgIAoKWW91J3JlIG1pc3Npbmcgc29tZSBtYWlsaW5nLWxpc3RzIGFuZCBtYWludGFpbmVycyBp
biBDQywgcGxlYXNlIHNlZSBvdXRwdXQgb2YgZ2V0X21haW50YWluZXJzLgoKTmVpbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
