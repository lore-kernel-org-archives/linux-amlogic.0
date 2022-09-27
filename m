Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64822C6FA83
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Sep 2022 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/G0QDvVL/c8ctG+zcHhUndivKowaqrvp5mhMnoQLNs=; b=hsB9lxMVMkK/Rm
	6KmRgyyjAJE2ZD7NgwvW5WCvEilrb+4/EJ23myQJyQ5KyCP+OGFnzi5PzcKau+0tR623KdKeh9ypU
	kH/KroSNFK4PHojVuU5yuicfmX+rGbneRHY6/vStz4dg8Fi8e8zrT6lXqcayiiReRrRoNXjQ3q0xa
	qzPOm3tJh16Ouw3O4GBdRbgQEqgkZ8kMqyIPqty0MkED9FwYJFXQID/+y7+Iwm9dD2F6a0nb8g4W3
	BhV8qCHZrKnvLRURQD58dg0h1xVr20VgV9C+fQ6Q7B/rQZvKKL/RMelnhcqGl+Bbdzs3FWmOtQ7ai
	l1/ydhFwxxtfpeWCNlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od72E-009bmZ-BI; Tue, 27 Sep 2022 09:37:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od71I-009bIL-6a
	for linux-amlogic@lists.infradead.org; Tue, 27 Sep 2022 09:36:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id s14so14162038wro.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Sep 2022 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=o2YL47wkdNCtbQ/cDyQshFBYktZxHSBc3e+Im99MsKQ=;
        b=VOp1y0rIEFjW9MzzuluhjxgZIEMdat46QCY8sGRhrgJzo1NMRmb4BMl8L0wXZors0S
         f3lzBllNMQZ309rJbWYY7Q2sK+PCUb+zRbQIQPfjWbn5iaLGTrlAlnspt5fQYqeck1Fx
         AMgqE3gykkMsA1ME1JLAEXAPO0zchz3q2OOSBSMciSEGgTC6D5YkVb/L8pimqSzohK8P
         ZNlyOQTO4iy3bLeidV3Rck5y8OgieLRlnEt5P6NUlH2hpdR8noLM4XsIWA+l3S7++ik8
         +g/n0YQGwqGiCuopypTiKRT0Sdl2CS5XPCLZ6aL60IQVr4qhGlTupyp77QZR5V5TqAOO
         CLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o2YL47wkdNCtbQ/cDyQshFBYktZxHSBc3e+Im99MsKQ=;
        b=Ob6c+8wDhPZQVejgHXSeLJiygGwSFlEbuIJKxvkcoF551uMs1aW5vWYEAeYQAHa2S3
         fql+zWtiSXZ5RcIYmuFur/KCb6leX6IP4GhCWWtoT2OzqpRNBNwCfzC4W6x9CliilZIn
         wuErHkInDYn9zYaiJAnVEgLkb4Fc/lx3nKLOSoGokSlpO6PjH93FXV3i2qyEks86ezgm
         S8z0tgUqo8uOLKt5Lnc38F2+sAGXh11kwjKapAP/dTzaYywgy+Rjau5RhepUmudUVPyx
         Lixu1cObR+80CdSuje+ui9Bf35ZjaZGzDYwyqviM2NMiE0BgRyFh/frXsjF02LnotRup
         6UlQ==
X-Gm-Message-State: ACrzQf1MRclAUljZkFHTAva9xRgVy7rYTQSCqmeGbMvmwuPFbtvTNO3H
	OMjHkYqVEaZ1zoYaGuRX+rFDIw==
X-Google-Smtp-Source: AMsMyM7Z6EJ4pOi9kImED9VR+cCZ/gatMSptyvxq7YIinwEiZ7IsL4xOVqZV9NhmTQrkuyrlZwqg0Q==
X-Received: by 2002:adf:e309:0:b0:22c:c332:9af7 with SMTP id b9-20020adfe309000000b0022cc3329af7mr157623wrj.217.1664271410890;
        Tue, 27 Sep 2022 02:36:50 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id g2-20020adff402000000b0022860e8ae7csm1314875wro.77.2022.09.27.02.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:36:50 -0700 (PDT)
Message-ID: <d1039404-b8db-c32c-d508-32a77a348744@baylibre.com>
Date: Tue, 27 Sep 2022 11:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/2] spi: amlogic: meson-spicc: Use pinctrl to drive CLK
 line when idle
Content-Language: en-US
To: neil.armstrong@linaro.org, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 narmstrong@baylibre.com
References: <20220809172017.215412-1-aouledameur@baylibre.com>
 <09081275-be9c-9d0c-856b-ed2df8fc0b13@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <09081275-be9c-9d0c-856b-ed2df8fc0b13@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_023652_285503_A10AEDD0 
X-CRM114-Status: GOOD (  17.09  )
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

SGkgTmVpbCwKCk9uIDkvMjcvMjIgMTA6MzAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IEhpIEFt
amFkLAo+Cj4gT24gMDkvMDgvMjAyMiAxOToyMCwgQW1qYWQgT3VsZWQtQW1ldXIgd3JvdGU6Cj4+
IEJldHdlZW4gU1BJIHRyYW5zYWN0aW9ucywgYWxsIFNQSSBwaW5zIGFyZSBpbiBIaVogc3RhdGUu
IFdoZW4gdXNpbmcgCj4+IHRoZSBTUwo+PiBzaWduYWwgZnJvbSB0aGUgU1BJQ0MgY29udHJvbGxl
ciBpdCdzIG5vdCBhbiBpc3N1ZSBiZWNhdXNlIHdoZW4gdGhlCj4+IHRyYW5zYWN0aW9uIHJlc3Vt
ZXMgYWxsIHBpbnMgY29tZSBiYWNrIHRvIHRoZSByaWdodCBzdGF0ZSBhdCB0aGUgc2FtZSAKPj4g
dGltZQo+PiBhcyBTUy4KPj4KPj4gVGhlIHByb2JsZW0gaXMgd2hlbiB3ZSB1c2UgQ1MgYXMgYSBH
UElPLiBJbiBmYWN0LCBiZXR3ZWVuIHRoZSBHUElPIENTCj4+IHN0YXRlIGNoYW5nZSBhbmQgU1BJ
IHBpbnMgc3RhdGUgY2hhbmdlIGZyb20gaWRsZSwgeW91IGNhbiBoYXZlIGEgCj4+IG1pc3Npbmcg
b3IKPj4gc3B1cmlvdXMgY2xvY2sgdHJhbnNpdGlvbi4KPj4KPj4gU2V0IGEgYmlhcyBvbiB0aGUg
Y2xvY2sgZGVwZW5kaW5nIG9uIHRoZSBjbG9jayBwb2xhcml0eSByZXF1ZXN0ZWQgCj4+IGJlZm9y
ZSBDUwo+PiBnb2VzIGFjdGl2ZSwgYnkgcGFzc2luZyBhIHNwZWNpYWwgImlkbGUtbG93IiBhbmQg
ImlkbGUtaGlnaCIgcGluY3RybCAKPj4gc3RhdGUKPj4gYW5kIHNldHRpbmcgdGhlIHJpZ2h0IHN0
YXRlIGF0IGEgc3RhcnQgb2YgYSBtZXNzYWdlLgo+Pgo+PiBBbWphZCBPdWxlZC1BbWV1ciAoMik6
Cj4+IMKgwqAgc3BpOiBkdC1iaW5kaW5nczogYW1sb2dpYywgbWVzb24tZ3gtc3BpY2M6IEFkZCBw
aW5jdHJsIG5hbWVzIGZvciBTUEkKPj4gwqDCoMKgwqAgc2lnbmFsIHN0YXRlcwo+PiDCoMKgIHNw
aTogbWVzb24tc3BpY2M6IFVzZSBwaW5jdHJsIHRvIGRyaXZlIENMSyBsaW5lIHdoZW4gaWRsZQo+
Pgo+PiDCoCAuLi4vYmluZGluZ3Mvc3BpL2FtbG9naWMsbWVzb24tZ3gtc3BpY2MueWFtbMKgIHwg
MTUgKysrKysrKwo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLmR0
c2nCoMKgwqAgfCAxNCArKysrKysrCj4+IMKgIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOSArKysrKysrKysrKysrKysrKyst
Cj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pgo+Cj4gV2lsbCB5b3Ugc2VuZCBhIHYyIHdpdGggY29tbWVudHMgYWRyZXNzZXMgPwoKUGxhbm5p
bmcgdG8gc2VuZCBpdCBzb29uLCB0aGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpSZWdhcmRzLAoK
QW1qYWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
