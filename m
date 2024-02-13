Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9120DC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voqglRKD1h4+IPlR5tNekFIRT+Y+hehzAytf86SRZRc=; b=isrbzYOzpMWx8q
	QgbtiaQiXgXmpA3x1gwVECfkBZ23A/mCt5h9rr4wajcU3qdtc6q1AA8T2uFEqxY31w2SAbALtfxBr
	LWq7hiMCPAs4VwyjEI+lgBPp1lejJkavtofXUi16wdJQClkfKOxgsEvzPQS4NunS+rcLlrdlKET0d
	a1IsevpxVPGZk72BYnYe/NtmfTGapO9rBcS/rIexpdpovT75E0taXiJEsC55P0CFZpeVVU26H4pR0
	LxD0YAhu9Zj9eEnEbv0m5TtKUZAZa65ighYxaVsGaG7jZ/fRA3Rs07nG8HlMPbkV4Z27qSbrCTqfb
	xqo/QXM1NLl4cXSYlIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoMW-00000008Snr-0ToJ;
	Tue, 13 Feb 2024 08:41:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoMT-00000008Smd-0bPn
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:41:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-411c93e6bfaso765395e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813711; x=1708418511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZmUQqll2tXhPmB8H+W9+kloRRPdFB/2Bnv8H0knDfU=;
        b=sEg6TO2XmDeKbppGpvdqvOIaQTnJyPmdrY3IpEA6nSao83Fwgz328kESl/1+ewbBuZ
         55C6otUucZEwbQMQ+Wzxqkk9TTFbILNnGebE4KJe55fej7M0zYapmGEh7fzMvpAg84xe
         AMpTwuIxo59D9nCJKKP5Z/yvy7JGxfc8EKvNdrK99/4CY1LBz73fJbFSFyhqqCXHaNfE
         SK0NG0rRNWx0CSXz/zvDJQSvRnzH51Xf7+rFRBYfvdNa5WAdzTirT5ju7IxS1pkRlXwv
         ZBTdyPmzJGpKK+CDX1fxx1m2ngN4/r0p1dpilc5fwcljLD5Md/bYYlC2mKdwSHrNhuOC
         o5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813711; x=1708418511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZmUQqll2tXhPmB8H+W9+kloRRPdFB/2Bnv8H0knDfU=;
        b=Ltv/oCG429cfNFgbW0E7wIXG8oHPOO8VDnxOVupgKLW3JOCrGUm69/JcvZyZWN4Q0M
         S3PW20GmXM8Cni2X4CV/EbyxVzvSUFegxZ+6uIDMEMPKvfRMGTayOL7NaZo7vpYpAleb
         gM1yBEUHsJFt3aRUAkuoCtjs9PQPZq6Ued1ebiBGgYiZitP/fIfj+NAOei4eCMC/vmav
         yPh7xdEh8FLtQYBZ7DOEmzf7bAytmF8ogSvf/enLQmL/pCYduqTbcMyDH4gmny5ULThq
         C1m2XmCtDafGgS6fv8+WzP/KbLRZu51EorUZNM/8JuycC9eHvkT60Wj3N083VMS21CKu
         3pLQ==
X-Gm-Message-State: AOJu0YxV0EbDn2UBafT5BZoH3rAXknV6+H2oGfE79FgRqnyEH10+faF7
	8yz+LnXDJT7TjCcDvFwNHWxJkC9mBwrW0qJuWzrH03k98qT7TrF4V73xOrtALeQ=
X-Google-Smtp-Source: AGHT+IHSoODsCH5V4NKtKkQG9E8qUk13GUZHEa0U2QWAmoWSCAixVxqEWXwRrdL5nLBUxc4LBOw7lQ==
X-Received: by 2002:a05:600c:4507:b0:40f:b45c:85a5 with SMTP id t7-20020a05600c450700b0040fb45c85a5mr7939890wmo.22.1707813711411;
        Tue, 13 Feb 2024 00:41:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyF8VHMCmSVZ7rw7QNivdvxGS3Rb+VPxkFpB4fhYiKkKI3AvHpmqGV0OdTPzS00bNwjyTKYjceYuPBbqQnYLO4vaYhB8MNqCwU+UPj5JioCIP7HJwkw9vSs9Ff8wtxc9kwB0mIvZ5YxjcJbD20PmeQ4z0p9IzFWXmWbX+el8+dTQl1CAsVlHtd71zMa6sii4SiP2eHZagBYj2TrRVe9+uvzrc8s3l++ncneMNrhMS03gjQbd0z9pefUbrMXKB4d24tblTxuMcMGgY/jH1n/k+pW/IzPjTCYTfoummjSwmA7SpSoA9tjToiPs4EJB1nJnVGcdnWE+XzV+Iz6fw3Dpv+iO8n8sS5Z+ta3XXzUUlbYeKX48al5+8moQjmoavr
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b00410820995dcsm10446311wmb.23.2024.02.13.00.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:41:51 -0800 (PST)
Message-ID: <6274df9e-bda6-44b8-aa7e-e4bba5c7c96a@linaro.org>
Date: Tue, 13 Feb 2024 09:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US
To: neil.armstrong@linaro.org, Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <64f65168-c7b0-4365-8d0a-e57b47797d95@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <64f65168-c7b0-4365-8d0a-e57b47797d95@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004153_205276_D5C088D2 
X-CRM114-Status: UNSURE (   8.70  )
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

T24gMTMvMDIvMjAyNCAwOTozOCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgTWFyYywKPiAK
PiBPbiAxMi8wMi8yMDI0IDE4OjQ3LCBNYXJjIEdvbnphbGV6IHdyb3RlOgo+PiBBZGQgc3VwcG9y
dCBmb3IgRnJlZWJveCBmYng4YW0gYm9hcmRzCj4+Cj4+IE1hcmMgR29uemFsZXogKDQpOgo+PiAg
wqAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogYWRkIGZyZWVib3gKPj4gIMKgIGR0LWJp
bmRpbmdzOiBhcm06IGFtbG9naWM6IGFkZCBmYng4YW0gYmluZGluZwo+PiAgwqAgYXJtNjQ6IGR0
czogYW1sb2dpYzogYWRkIGZieDhhbSBib2FyZAo+PiAgwqAgYXJtNjQ6IGR0czogYW1sb2dpYzog
YWRkIGZieDhhbSBEVCBvdmVybGF5cwo+Pgo+PiAgwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+ICDC
oERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbMKg
wqDCoMKgIHzCoMKgIDIgKwo+IAo+IFRoaXMgY2hhbmdlIGRvZXNuJ3QgYXBwbHkgb24gdG9wIG9m
IGVpdGhlciB2Ni44LXJjMSBvciBsaW51eC1uZXh0LCBjb3VsZCB5b3UgcmViYXNlIG9uIHY2Ljgt
cmMxID8KClBsZWFzZSBkb24ndCBhcHBseSwgSSBoYXZlIGRvdWJ0cyBiaW5kaW5ncyB3ZXJlIGV2
ZXIgdGVzdGVkLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
