Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B15E80A92
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 06:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgmj/DTolPFxFzhiZHO3ZGeqD8Mv8G5Siu3zCw6F/C0=; b=LcZK/BaoZXGvO5
	PC6xi8xOcoFiMWZRIbHvSvWesQYuIAcfN/e3jtug6XXe/+PCqrbzBXEcCnx8CbPYnxCQqZWe/Hnpt
	jpS0AJAda7JkLdeep5psZjUgtEb5E3LXO6FMCriq55xX8LEAG/QuFTCkdQJ9D8yx7kcnVTJ+144iH
	pqPDtY9iH1NjanRx4VCn4P6Ec38l3DoyCJHzCnXbHSzgHIqnoUPmv5fAgoymrcgLseOS63XyIz9iv
	VmUdXz2MeLZ4ejuAD4Tg/PzfsgOYOlKjpKPU/JOK+8A/zBuGmBWT+/Qa/sTsVZRsPnRmtdJBDjQXH
	opKIv7I4CeNvPAmpZUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNhr-0004IM-02;
	Wed, 27 Sep 2023 06:07:31 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNho-0004H3-0D;
	Wed, 27 Sep 2023 06:07:29 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5043a01ee20so14389329e87.0;
        Tue, 26 Sep 2023 23:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695794845; x=1696399645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7ZyTS+6OkRT4rkQ1RkeoSytMaHEOzDK9fhK7Tz2pPo=;
        b=XFLEXSpMV+lKbymAO0VAKtGOBZKyMl3BphBXUofFHyhsO1lYEjXXweff+PVT332K/k
         PsJCl8jagE0DM/jx0/8irtLXsCmVKyIIZR4PDIPkW7EgJQo5bR0BdxqqlUopu1Ld1nT2
         88Yhg8yFFss7wnyVF5mi0gZagbEk7jVLGdVzqr96v9JMFElIiJFfT7Bd6/6tdTtVdV79
         j+40ITeA//LgfztQD2ZTGNobGuf7/6dYT60bjosG6V+0qWbs82DznCeGwWje3tSZBcNm
         qG19wmepDKYiQ5rGhh+MFhfhd9eNF/Qtv5vSwiUvoWolJJbKvlQyTYbortFHShoqIIFW
         hX8w==
X-Gm-Message-State: AOJu0Yzy2dr7hrGdfn3kus7t7BICQQrkCgeQ5FXPXPPvhhrwd7LsJuqV
	pFWvUIRhPMe8U3Urkjalrm8=
X-Google-Smtp-Source: AGHT+IGnJUBQAaYrmBopold+rBN/H15acJmyCp3yp3et0TZubBafpuWrwo+aEKuXo3YoVGEbaS/mFQ==
X-Received: by 2002:a05:6512:3412:b0:4ff:a04c:8a5b with SMTP id i18-20020a056512341200b004ffa04c8a5bmr1020765lfr.47.1695794844646;
        Tue, 26 Sep 2023 23:07:24 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040550c20cbcsm12015055wmo.24.2023.09.26.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:07:24 -0700 (PDT)
Message-ID: <1abcf806-de65-45a9-a5f3-bec3322cca4a@linux.com>
Date: Wed, 27 Sep 2023 07:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip: Add support for Amlogic-T7 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Huqiang Qin <huqiang.qin@amlogic.com>,
 tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-3-huqiang.qin@amlogic.com>
 <93bb0a7e-3f58-4755-bf31-a694e60760d0@linaro.org>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <93bb0a7e-3f58-4755-bf31-a694e60760d0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_230728_102681_F7B42C1A 
X-CRM114-Status: GOOD (  12.94  )
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
biAxMy8wOS8yMDIzIDEwOjA5LCBIdXFpYW5nIFFpbiB3cm90ZToKPj4gVGhlIEFtbG9naWMtVDcg
U29DcyBzdXBwb3J0IDEyIEdQSU8gSVJRIGxpbmVzIGNvbXBhcmVkIHdpdGggcHJldmlvdXMKPj4g
c2VyaWFsIGNoaXBzIGFuZCBoYXZlIHNvbWV0aGluZyBkaWZmZXJlbnQsIGRldGFpbHMgYXJlIGFz
IGJlbG93Lgo+Pgo+PiBJUlEgTnVtYmVyOgo+PiAtIDE1NsKgwqDCoMKgwqAgMSBwaW7CoCBvbiBi
YW5rIFRFU1ROCj4+IC0gMTU1OjE0OMKgIDggcGlucyBvbiBiYW5rIEgKPj4gLSAxNDc6MTI5IDE5
IHBpbnMgb24gYmFuayBZCj4+IC0gMTI4OjExNSAxNCBwaW5zIG9uIGJhbmsgTQo+PiAtIDExNDo5
McKgIDI0IHBpbnMgb24gYmFuayBUCj4+IC0gOTA6NzfCoMKgIDE0IHBpbnMgb24gYmFuayBaCj4+
IC0gNzY6NzDCoMKgwqAgNyBwaW5zIG9uIGJhbmsgRQo+PiAtIDY5OjU3wqDCoCAxMyBwaW5zIG9u
IGJhbmsgRAo+PiAtIDU2OjQwwqDCoCAxNyBwaW5zIG9uIGJhbmsgVwo+PiAtIDM5OjIwwqDCoCAy
MCBwaW5zIG9uIGJhbmsgWAo+PiAtIDE5OjEzwqDCoMKgIDcgcGlucyBvbiBiYW5rIEMKPj4gLSAx
MjowwqDCoMKgIDEzIHBpbnMgb24gYmFuayBCCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1cWlhbmcg
UWluIDxodXFpYW5nLnFpbkBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaXJxY2hp
cC9pcnEtbWVzb24tZ3Bpby5jIHwgNSArKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdw
aW8uYyAKPj4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYwo+PiBpbmRleCBmODhk
ZjM5ZjQxMjkuLjlhMTc5MTkwODU5OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1tZXNvbi1ncGlvLmMKPj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMK
Pj4gQEAgLTE1NCw2ICsxNTQsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9ncGlvX2ly
cV9wYXJhbXMgCj4+IGMzX3BhcmFtcyA9IHsKPj4gwqDCoMKgwqDCoCBJTklUX01FU09OX1M0X0NP
TU1PTl9EQVRBKDU1KQo+PiDCoCB9Owo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9ncGlv
X2lycV9wYXJhbXMgdDdfcGFyYW1zID0gewo+PiArwqDCoMKgIElOSVRfTUVTT05fUzRfQ09NTU9O
X0RBVEEoMTU3KQo+PiArfTsKPj4gKwo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtZXNvbl9pcnFfZ3Bpb19tYXRjaGVzW10gCj4+IF9fbWF5YmVfdW51c2VkID0gewo+PiDC
oMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjgtZ3Bpby1pbnRjIiwgLmRh
dGEgPSAKPj4gJm1lc29uOF9wYXJhbXMgfSwKPj4gwqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb244Yi1ncGlvLWludGMiLCAuZGF0YSA9IAo+PiAmbWVzb244Yl9wYXJhbXMg
fSwKPj4gQEAgLTE2NSw2ICsxNjksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCAKPj4gbWVzb25faXJxX2dwaW9fbWF0Y2hlc1tdIF9fbWF5YmVfdW51c2VkID0gewo+PiDCoMKg
wqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1hMS1ncGlvLWludGMiLCAuZGF0
YSA9ICZhMV9wYXJhbXMgfSwKPj4gwqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0gImFtbG9naWMs
bWVzb24tczQtZ3Bpby1pbnRjIiwgLmRhdGEgPSAmczRfcGFyYW1zIH0sCj4+IMKgwqDCoMKgwqAg
eyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGMzLWdwaW8taW50YyIsIC5kYXRhID0gJmMzX3BhcmFt
cyB9LAo+PiArwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyx0Ny1ncGlvLWludGMiLCAu
ZGF0YSA9ICZ0N19wYXJhbXMgfSwKPj4gwqDCoMKgwqDCoCB7IH0KPj4gwqAgfTsKPiAKPiBSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmdUZXN0ZWQt
Ynk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
