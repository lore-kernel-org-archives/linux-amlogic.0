Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E90C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSFuTdUc+VWc6IlP7+eJurYlPlrzbdDS3/hxk9CoNQE=; b=iynD+DCwCtIcmT
	+dRGHhq7GwiKwarsjZUj4Uhi/wuCFGLPOBnE7U7X3Vy+r9yzc0Ln21sKKUOqKsh1ryfsF2HNiRPgY
	f4mT+j5KK/EylTutdAhJUgfIQSvdtOrW9dZ22v1VxKqjm0W4sr8xmukRkH2fnfyRcHTP4AQIq7y2H
	ccZ8mgKs1be8CxVdo7y5GIe1nukTHzSKOTEFOCBseJtTT5gJsHM7DHTXzbl0xUkoSYZ1fQ4EKg9sI
	cdwHzhpnKmSPtY3KukGlClFIyRzedwFe5prmcrpmV0zUZcsFUgNjZr6KyebGOcMN+7Wxn9aCX5qDA
	/i20JHPxq8YK4sgvordg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrcy-007l0I-94; Fri, 21 Oct 2022 12:59:56 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrcr-007kxc-OJ
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 12:59:51 +0000
Received: by mail-qv1-xf34.google.com with SMTP id f14so1752120qvo.3
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xs86T8FYH3cxwsGgQStZ75SdWF5yjS9RigXMT2iDTuI=;
        b=raelHNIqjAfNIduVyyhSmxlkeTmBDWI5M6eoHxEOrDyKvgNyTbqt/BRWMPAC4nyTU/
         +RIcoIbxCOd1bCVzg0ez40BfCEH8TH5rbH/1bKbuWoMDp9xT+/XTptK0PvMHZJMCBOFo
         tdhKqlH3KQJEvM5sQlNYiMBPzVTM4IIBtCbGm7COkFrpRtKe2PJ0lybfPAALCxS3bMia
         DNJoHxnwgLylRFQfjoTP96dCa7nKWqblDqBC6IG/Fofgnzwn+v1y0EgrqueYHx+2FQX6
         W45YOl3lHnGDZ3YWK12yIQL7vxtLoElGLygLUlaxImLD83SnzCSpERJZLHW0JoEs9BEl
         JuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xs86T8FYH3cxwsGgQStZ75SdWF5yjS9RigXMT2iDTuI=;
        b=jxxJAZJ3MQ4D0OdC7G+5w4cRvUl6tSYhEsTvcn6QWz/2EZrpa/VPOF+E93fKJc3sdg
         /SazH64hCMUNSDGv04ghOomkfUBW57oBg42MDgXPmpUzjz/+t7RZIT0KFuaEy820h3E2
         VEjST8SAjCBO1weMd2ukmBq1SHEr+7AtDkBA0qO8CM4yX2sIkDCA+2DnHWeYjqbizKtb
         ZxahQf3Q2PSeikU3dR4s5Xi19sfECVBBr1ZWqlYRAECCMouoRSnaLRzX7syw2Jl5BXIv
         swRO9OMTx1QtNZP9FIjicNo2QN+lGglta3BD399e8qZZTLMLVMdGWOt72MRwkiSdg/GL
         rK+g==
X-Gm-Message-State: ACrzQf2u8Rox0SQVagA/+6GpbTA77uKKjU5/I7cFvj0AHVZgss15Ppme
	4AbtV4epKBCQpExhIpqwSHE9YA==
X-Google-Smtp-Source: AMsMyM4j88gzow5EGAxNNk2ntX3Dfj86V9wgcexSHaNsAvEEmqSEG+IUzLHqUnaYykHbSpgJR0l5pw==
X-Received: by 2002:a05:6214:1c89:b0:4af:664e:553b with SMTP id ib9-20020a0562141c8900b004af664e553bmr16626198qvb.18.1666357188296;
        Fri, 21 Oct 2022 05:59:48 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bn4-20020a05622a1dc400b0039ccbf75f92sm7884973qtb.11.2022.10.21.05.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 05:59:47 -0700 (PDT)
Message-ID: <4a0b2e54-e13c-d6e8-261a-a282f35c1a30@linaro.org>
Date: Fri, 21 Oct 2022 08:59:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, neil.armstrong@linaro.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
 <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
 <dc918114-8b89-441b-5ba1-aaf3ae084860@linaro.org>
 <20c115e0-0acf-dac2-2a30-0f394fa513ab@linaro.org>
 <df1895c8-aec6-cada-e208-ccda8042860d@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df1895c8-aec6-cada-e208-ccda8042860d@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_055949_823806_A52A22A2 
X-CRM114-Status: GOOD (  10.25  )
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

T24gMjEvMTAvMjAyMiAwODo1NCwgQW1qYWQgT3VsZWQtQW1ldXIgd3JvdGU6Cj4gSGkKPiAKPiBP
biAxMC8yMC8yMiAxNDo0OSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+Pj4gKyAgICAg
IHByb3BlcnRpZXM6Cj4+Pj4+ICsgICAgICAgIHBpbmN0cmwtbmFtZXM6Cj4+Pj4+ICsgICAgICAg
ICAgbWluSXRlbXM6IDEKPj4+Pj4gKyAgICAgICAgICBpdGVtczoKPj4+Pj4gKyAgICAgICAgICAg
IC0gY29uc3Q6IGRlZmF1bHQKPj4+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGlkbGUtaGlnaAo+
Pj4+PiArICAgICAgICAgICAgLSBjb25zdDogaWRsZS1sb3cKPj4+PiBZb3Ugc2hvdWxkIGFsc28g
ZGVmaW5lIGluIHN1Y2ggY2FzZSBwaW5jdHJsLTAgYW5kIG90aGVycy4KPj4+IE9rIEkgdGhvdWdo
dCBpdCB3b3VsZCBiZSBjb3ZlcmVkIGJ5IHRoZSBwaW5jdHJsLWNvbnN1bWVyLnlhbWwKPj4+IGJ1
dCB5ZWFoIHdlIHNob3VsZCBhbGxvdyBwaW5jdHJsLTEgYW5kIHBpbmN0cmwtMiBoZXJlIGFzd2Vs
bCBieSBhZGRpbmc6Cj4+Pgo+Pj4gICAgICAgICAgICAgICBwaW5jdHJsLTE6IHRydWUKPj4+ICAg
ICAgICAgICAgICAgcGluY3RybC0yOiB0cnVlCj4+Pgo+Pj4KPiBJbiBzdWNoIGNhc2UsIHNob3Vs
ZCBJIGRlZmluZSBwaW5jdHJsLSBhcyBwYXJ0IG9mIHRoZSBpZiBzdGF0ZW1lbnQsIGFzIHNob3du
IGJlbG93LAo+IAo+IG9yIGJlZm9yZSBhbGxPZiA/CgpUaGUgc2FtZSBhcyBwaW5jdHJsLW5hbWVz
LCBzbyBwYXJ0IG9mIGFsbE9mLgoKPiAKPiBbLi4uXQo+IAo+ICDCoCAtIGlmOgo+ICDCoMKgwqDC
oMKgIHByb3BlcnRpZXM6Cj4gIMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gIMKgwqDCoMKg
wqDCoMKgwqDCoCBjb250YWluczoKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tZ3gtc3BpY2MKPiAKPiAg
wqDCoMKgIHRoZW46Cj4gIMKgwqDCoMKgwqAgcHJvcGVydGllczoKPiAgwqDCoMKgwqDCoMKgwqAg
cGluY3RybC0wOiB0cnVlCj4gIMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtMTogdHJ1ZQo+ICDCoMKg
wqDCoMKgwqDCoCBwaW5jdHJsLTI6IHRydWUKPiAKPiAgwqDCoMKgwqDCoMKgwqAgcGluY3RybC1u
YW1lczoKPiAgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbkl0ZW1zOiAxCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBpdGVtczoKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBkZWZhdWx0Cj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogaWRsZS1oaWdoCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBjb25zdDogaWRsZS1sb3cKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
