Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06552C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jun 2022 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTlu2ANwuFLEvxUUrngiD4Tj2/o8no9kOO3Jd90Isks=; b=I1lBRVWuaVb4if
	ya7Vry+FxmT4SRjN/77dW3eVFnhqd+cTh1gkmNUEcl1FczJ+VZzlaWoZbMV405mKuUOZxvmrI8zC+
	bPYeRWhE4jyl2bfkEQICVHkDA1r57RKaWCJQfZQCqUYBTT8SWYn4Xzwdi2hnsZulQ6w0BmKWj5Zq8
	Qwj0X7R90qJB/T7umVE6TTXQr8YYIBLKngXRoFljYL1w9wSRRLgaVH2x0kHbAVX9cMqTsRz8J3LrH
	+ggp+4ML5UFAxe7pj41rg2wfGzo8WtCro02LvsQbIlCOpNWRK++U7SNC6fpzQRBByjrJWKPg24roU
	4veISEsPH/Xs1A/Zq7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fHz-002EJg-Pb; Mon, 13 Jun 2022 08:19:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fHf-002EC0-3E
	for linux-amlogic@lists.infradead.org; Mon, 13 Jun 2022 08:18:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id c21so6115186wrb.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jun 2022 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=u32jTKYTi0ZKwr7RGcxhK4oRr2BGZswhL2qBRDbWNxg=;
        b=k/iUqdqk3ciDfQSJ9rAZx+aAxneFL7UDMGtp4X9uMcFPC/ZIYGza9LNyZtfC6LCD/q
         uQboMxDuxtBWzbnsRduAJfXqOLScUbQ0NWFaX/XNm8B0GjRBYmOHPVsPQxUFbl7t2J0D
         /D59nUiAOTFAD8zDEX4WoF3uJLO6Mcdxlvw7jWNV2gakcZgUHB5BIsqzwnFQxvQlHBt4
         i1gAz1bX8XECpCJC7rg54im9NuX3N3aQoXeoG50ZzNpavlG1YEYtzsFY3WkdOsBX/APD
         pPoLL6YohyTREjCCYhIpB/9H6bqg60QwnU2L4PxaLXqFaOIEMNUI1vKo4NvzfBVAcUTI
         2XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=u32jTKYTi0ZKwr7RGcxhK4oRr2BGZswhL2qBRDbWNxg=;
        b=skgwnwepKIqFLcVuEOCVPtO0emSXwCub38RZTFBwvoGh5wlefK277PHPjo3D4H+1A7
         JZFEcHJsWbxvDSwahBI+BORQg+URwr8S0ji7YW1DTHc4UsgPtGB/WBF+ltFQHVH8IcZj
         OLTeRWog8js5H/6XdpMvbpLE1VaRwKrF/M/UAmBnrqSwa2FEjT8qEcI+xeIj4c1OP3+g
         1gPY8MG0GxPKusPHytZ+tBAPAH6UsZHS2x6raoaLPLnf8vb/0N4XWZQg8pm28JCcWl9j
         CeZ494Y0pkFmLVUYNISi72m7BdWbL7aJ3HyQ0RkeOZ8Jd3OlAE0py3gTQ3ino9vkiSuO
         NJXg==
X-Gm-Message-State: AOAM533Sx5hedBbRQDJmaC/OilOWBIAQBjSy9KsNEygLYMw5g/CFiy+x
	MrUkT7IBZTM567jiLszHXUxw2ieJCAaqNw==
X-Google-Smtp-Source: ABdhPJwWqAGv3AaU/yozqNMURndNh+At7Au48fd6/Xkrj7jZLmqd1QgM4/1uL4aUrrMBqzw4f2soFA==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id a3-20020a056000188300b00205c0cb33c6mr57642984wri.39.1655108328704;
        Mon, 13 Jun 2022 01:18:48 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e21a:482:575c:1c8b? ([2001:861:44c0:66c0:e21a:482:575c:1c8b])
        by smtp.gmail.com with ESMTPSA id t63-20020a1c4642000000b003974cb37a94sm12680705wma.22.2022.06.13.01.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 01:18:48 -0700 (PDT)
Message-ID: <56c95eb4-5406-3864-f4ec-0d5c3f71e9cf@baylibre.com>
Date: Mon, 13 Jun 2022 10:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] arm64: dts: meson: add gpio-fan control to GS-King-X
Content-Language: en-US
To: Furkan Kardame <f.kardame@manjaro.org>
Cc: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20220611170852.19487-1-f.kardame@manjaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220611170852.19487-1-f.kardame@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_011851_407157_3AFE69E3 
X-CRM114-Status: GOOD (  17.13  )
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

T24gMTEvMDYvMjAyMiAxOTowOCwgRnVya2FuIEthcmRhbWUgd3JvdGU6Cj4gR1MtS2luZy1YIGhh
cyBhIHNpbmdsZSBzcGVlZCBHUElPIGZhbiB3aGljaCBpcyBhbHdheXMtb24gYnkgZGVmYXVsdC4K
PiBJZiB3ZSBhZGQgY29udHJvbHMgZm9yIHRoZSBmYW4gYW5kIGEgdHJpcCBwb2ludCwKPiB0aGUg
ZmFuIHN0YXlzIG9mZiBtb3N0IG9mIHRoZSB0aW1lLCByZWR1Y2luZyBiYWNrZ3JvdW5kCj4gbm9p
c2UgZnJvbSB0aGUgdW5pdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGdXJrYW4gS2FyZGFtZSA8Zi5r
YXJkYW1lQG1hbmphcm8ub3JnPgo+IC0tLQo+IENoYW5nZWxvZzoKPiBWMToKPiAqIFVzaW5nIHRh
YnMgaW5zdGVhZCBvZiBzcGFjZS4KPiAKPiBWMjoKPiAqIFJlbW92ZSB1bnVzZWQgbWFwLgo+IAo+
IFYzOgo+ICogRml4ZWQgc3BlZWQtbWFwIGluZGVudGF0aW9uCj4gKiBBbGlnbmVkIGJyYWNrZXRz
Cj4gKiBDaGFuZ2VkIGNvb2xpbmctZGV2aWNlCj4gKiBJbmNyZWFzZWQgdGVtcGVyYXR1cmUgdG8g
NzDCsEMKPiAKPiBWNDoKPiAqIEZpeGVkIHN5bnRheCBlcnJvci4KPiAgIC4uLi9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMmItZ3NraW5nLXguZHRzICB8IDI1ICsrKysrKysrKysrKysrKysrKysK
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwo+IGluZGV4IDZj
N2JmYWNiYS4uMjM1OTJhZTIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwo+IEBAIC0yMCw2ICsyMCwxNCBAQCBhbGlh
c2VzIHsKPiAgIAkJcnRjMSA9ICZ2cnRjOwo+ICAgCX07Cj4gICAKPiArCWdwaW9fZmFuOiBncGlv
LWZhbiB7Cj4gKwkJY29tcGF0aWJsZSA9ICJncGlvLWZhbiI7Cj4gKwkJZ3Bpb3MgPSA8JmdwaW8g
R1BJT0hfNSBHUElPX0FDVElWRV9ISUdIPjsKPiArCQkvKiBVc2luZyBEdW1teSBTcGVlZCAqLwo+
ICsJCWdwaW8tZmFuLHNwZWVkLW1hcCA9IDwwIDA+LCA8MSAxPjsKPiArCQkjY29vbGluZy1jZWxs
cyA9IDwyPjsKPiArCX07Cj4gKwo+ICAgCWdwaW8ta2V5cy1wb2xsZWQgewo+ICAgCQljb21wYXRp
YmxlID0gImdwaW8ta2V5cy1wb2xsZWQiOwo+ICAgCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiBA
QCAtOTYsNiArMTA0LDIzIEBAICZjbGtjX2F1ZGlvIHsKPiAgIAlzdGF0dXMgPSAib2theSI7Cj4g
ICB9Owo+ICAgCj4gKyZjcHVfdGhlcm1hbCB7Cj4gKwl0cmlwcyB7Cj4gKwkJY3B1X2FjdGl2ZTog
Y3B1LWFjdGl2ZSB7Cj4gKwkJCXRlbXBlcmF0dXJlID0gPDcwMDAwPjsgLyogbWlsbGljZWxzaXVz
ICovCj4gKwkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ICsJCQl0
eXBlID0gImFjdGl2ZSI7Cj4gKwkJfTsKPiArCX07Cj4gKwo+ICsJY29vbGluZy1tYXBzIHsKPiAr
CQltYXAgewo+ICsJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsKPiArCQkJY29vbGluZy1kZXZpY2Ug
PSA8JmdwaW9fZmFuIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4gKwkJfTsK
PiArCX07Cj4gK307Cj4gKwo+ICAgJmZyZGRyX2Egewo+ICAgCXN0YXR1cyA9ICJva2F5IjsKPiAg
IH07CgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
