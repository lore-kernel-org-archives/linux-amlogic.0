Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB7FC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHUGHWNC6Rw+IgxQb3kWDklHWDgPlkyCCeEQ4hLRO3I=; b=wDR/Qy0/DHKwcs
	9Zc/1DLukos63Jw9InWfrcYle+FXwWXpeRIhsjsqM54i65eXLiEepJ/J+73/TgANcCr5T6a1uZfgY
	VkWjRAR1nm+ClIJN2SBq/cLN/uwqnH5Y8IAB9DTLemJzBrt5TohgeaFyudQ8bdJkNjRjMk6PCGr6x
	kwofrsJ24wj67I4GMZO8ZcBZQQryZoAn1K2RiSB8wfUvSd9K8BQUBMhb9FRVEG2UyQ/sITzLkfCd4
	jDlcx+26t5ME8VFInW/njFZb9SaPiYq724u1U9+f49hHrmaZ+wzs9K8IP2ZvVnjIegfHQAnNtnRxk
	W1pBKXjoE30dmVPCtbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZRz-005909-4Q; Mon, 30 Jan 2023 19:04:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZRw-0058zL-Er; Mon, 30 Jan 2023 19:04:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m8so2751123edd.10;
        Mon, 30 Jan 2023 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1SdFn8vbHHOlpifiyP00EMYgDWF+uk4/FOG5AZyHX4=;
        b=Jxt+vF/1MVyYRopjBrEyHy5y5iwMNP0QBIi1CSN81hDB0quugAmHiWz+frKVH6EOtb
         UFhZ1XZ78/UGLVI0h/nMbcGJxzGajwfsatTEx4Q5omu0WNu0B3lZOfoNRn9GE9rL6EJa
         IlYuqBgST73iRxcJuY+OcpZwxMAa9oLVTd5vEdoXJwV5dfx+D16xLanoFJpr+IG28B7l
         bbTrQDPDvVz05kuua1eVYTGS4iqDuxQRxWXNGSEjIXeoFZSecBF1zOpyiQWpRbbQq7w7
         WkZ6yR6x3Nq0VSqWCwOFq5dW9iL6LwZkVMJSOeQXxyj4cMuILQ5G3f7AZ0uz7vxqRTRE
         xNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1SdFn8vbHHOlpifiyP00EMYgDWF+uk4/FOG5AZyHX4=;
        b=uLrrlGhsx/pfT5uIGDTB5ygA6nYNm55cKeiWvP4vBxmeIHDBSCnnzPUnd4zOv3BExy
         GNh5rAjq4rMHOkGUUMAnspTIwUWr5MgI9pjNpDlOd3huoDUvUm5XW/g7Xl/8viAOXv1t
         9b1AE2t29GispZ3uQSWjKBlylqrb2VjHNC29hOohLUep7Auhuvgvd4EL4sfMJxmF6z6b
         lcKKsmvVKt6jmWcw8pg+GUV08kQcz9A2GoKrvcz0fXXf0hI3evLOrI2DG60239QCWAV0
         00OlxENA20mxwXl5RO6oK/gdJkZEQbP6mKfWaHzRZ3Yq6eoxBAWdxekIqt5TP5etLuVg
         2YPg==
X-Gm-Message-State: AO0yUKU5b7JsjESpRgoKGcsG0SXu7Ad+6neqCzaKP/yENn89BdjUSMVn
	MYNcqU4Yi7e+vRRgf/PFbG8=
X-Google-Smtp-Source: AK7set+Db0EDdD7Zkic+Nmr1q4zIaFKr34uDd8R07IIRCK7amBMeiGGWIhiSh3YmSl6je5VpayrRLA==
X-Received: by 2002:a50:950b:0:b0:4a2:43ae:a9ef with SMTP id u11-20020a50950b000000b004a243aea9efmr5851453eda.35.1675105453676;
        Mon, 30 Jan 2023 11:04:13 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id x5-20020aa7cd85000000b00497d8613532sm7313164edv.5.2023.01.30.11.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 11:04:13 -0800 (PST)
Message-ID: <34cd9312-67da-b069-4e61-5763a7460c38@gmail.com>
Date: Mon, 30 Jan 2023 20:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] mmc: meson-gx: support platform interrupt as card
 detect interrupt
To: neil.armstrong@linaro.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
 <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
 <7789e36f-f13a-9837-5432-c16754922fa3@linaro.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <7789e36f-f13a-9837-5432-c16754922fa3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_110416_534967_047BED65 
X-CRM114-Status: GOOD (  15.54  )
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

T24gMzAuMDEuMjAyMyAxMjowNiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMzAvMDEvMjAy
MyAwMDoxMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBVc2UgYSBuZXcgbW1jIGNvcmUgZmVh
dHVyZSBhbmQgc3VwcG9ydCBzcGVjaWZ5aW5nIHRoZSBjYXJkIGRldGVjdAo+PiBncGlvIGludGVy
cnVwdCBpbiBkZXZpY2UgdHJlZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0
IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbW1jL2hvc3QvbWVz
b24tZ3gtbW1jLmMgfCAzICsrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIGIvZHJp
dmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiBpbmRleCBiZTFhOTcyYzIuLmM4N2JjMzFk
MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiArKysg
Yi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4+IEBAIC0xMjM2LDYgKzEyMzYsOSBA
QCBzdGF0aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX2hvc3Q7Cj4+IMKgwqDCoMKgwqAgfQo+
PiDCoCArwqDCoMKgIC8qIGdwaW8gY2FyZCBkZXRlY3QgaW50ZXJydXB0ICovCj4+ICvCoMKgwqAg
bW1jLT5jZF9pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDEpOwo+IAo+IE9r
IGl0J3MgZmluZSBidXQgYmV3YXJlIEdYQkIvR1hML0FYRyBkb2Vzbid0IHN1cHBvcnQgUmlzaW5n
ICsgRmFsbGluZyBHUElPIElSUSwKPiBzbyB0aGlzIHNob3VsZCBvbmx5IGJlIHVzZWQgb24gRzEy
QS9CL1NNMSBhbmQgbGF0ZXIuCj4gClRoYW5rcyBmb3IgdGhlIGhpbnQuIEknbSBhd2FyZSBvZiB0
aGUgY29uc3RyYWludCBmb3Igb2xkZXIgdmVyc2lvbnMuClRoZXJlIHRoZSBtbWMgY29yZSB3b3Vs
ZCBzaWxlbnRseSBmYWxsIGJhY2sgdG8gcG9sbGluZy4KQXQgdGhlIHRpbWUgd2hlbiB0aGUgZ3Bp
byBpcnFjaGlwIGNvZGUgd2FzIGRldmVsb3BlZCBKZXJvbWUgYW5kIG1lIGhhZAppbnRlbnNlIGRp
c2N1c3Npb25zIG9uIHdoZXRoZXIgdGhlcmUncyBhbiBhY2NlcHRhYmxlIHdvcmthcm91bmQgdG8K
c3VwcG9ydCBlZGdlLWJvdGggb24gdGhlc2UgY2hpcCB2ZXJzaW9ucy4KCkkgdGVzdGVkIG9uIFND
MiwgdGhlcmUgdGhlIHByb3Bvc2VkIHdheSB0byBzdXBwb3J0IHRoZSBncGlvIGNkIGlycQp3b3Jr
cyBmaW5lLgoKPiBOZWlsCj4gCj4+ICsKPj4gwqDCoMKgwqDCoCBob3N0LT5waW5jdHJsID0gZGV2
bV9waW5jdHJsX2dldCgmcGRldi0+ZGV2KTsKPj4gwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGhvc3Qt
PnBpbmN0cmwpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSKGhvc3QtPnBp
bmN0cmwpOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
