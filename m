Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBCAC83F15
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Aug 2023 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3zoK7t5xLM8HOteOBYe0qtlYsZbZ1jX8EAltkrBr58=; b=jfkFaC66hyWRUG
	QE5AT4WMFCt4jqCd+faFex08jYVLo1vzGFfKaHJemJqGepep34T8nQEeVDZrgDTWuiRjHq7Phe0id
	4GTAbKvGj+703+upzZ0szeNplnqs+Kb8j5fziCs61zKrGmdeeVtkWXhYPOXaJq/N7ZvB+LHLjPfL3
	iOroJrIINwXro4XiayitNRmKzdU8k0upssMhgmWcrGdX09YFd2thTBx3K8iPg5nPR5gW6cpk5XF8T
	FYOb0R4QeaT+QAsaLUwCtwlX+bPzbRNMEvvKIcm8zFeGRoNpIDn5Di8IKdhm24FJF0mn24hsp/qUw
	6HxoL/I9tWDHsykrGLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxZU-0076g5-0N;
	Sat, 26 Aug 2023 17:59:40 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxZR-0076fb-0q;
	Sat, 26 Aug 2023 17:59:38 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99d937b83efso247348366b.3;
        Sat, 26 Aug 2023 10:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693072775; x=1693677575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hg3oMggEQHd+gc6q9L9POT/lEfSR5eoXULrpzdbLklk=;
        b=dxkuY3sOUxE9Ggw0pCY7C5TIV/xvb+DFw0Aq+ieI+9CMGqIa7aqQQ+LuLKsRwI3G+E
         AKtVSnSD/XT1WltkQ7ULXMxybQe6GRK3HZ/IMH2eTmXFCzgZUWpcVoV/yxsqNBzMFx0+
         QEaaQAWj49Bu8XNNCJu86UNgKr0Dr8lgvKK9hTgiRyTeQCEqyDeEF/RGGPFQaH5H+Q3x
         k9rLIrLgRFPwUkfhWNQq8+ON1v9vj0nXrZF14muHpLgNLXsm7gH7YBVUoqi9ZpmMUvS9
         WHOy6DGC+0Fsq09e6jEKhPVO7+b7QbcU/Lpqw8kryo2HLw6fMbgWCqoGA5svKk9u4Xzo
         10PA==
X-Gm-Message-State: AOJu0Yyc5P/qWRre5HQAKqXcpXq+3NSPxuw1NhJnkXpoGwGyrAs2Wxfm
	9KHhur/BpyY1hO8kZm+czlg=
X-Google-Smtp-Source: AGHT+IGNOsWCDsUL5pZ0AiktNOZC7/JBxYAG4tbCmHfyMbugl7QB2wYm9fg1FEO7P/fQ6KOucMjekw==
X-Received: by 2002:a17:907:7757:b0:9a1:aede:edfb with SMTP id kx23-20020a170907775700b009a1aedeedfbmr10817032ejc.12.1693072774840;
        Sat, 26 Aug 2023 10:59:34 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b0099d45ed589csm2434635ejf.125.2023.08.26.10.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 10:59:34 -0700 (PDT)
Message-ID: <099b2b17-b236-4fd5-89a7-8ecbfbc9c323@linux.com>
Date: Sat, 26 Aug 2023 18:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/6] arm64: dts: add support for T7 power domain
 controller
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-7-xianwei.zhao@amlogic.com>
 <27e55b16-065b-4a16-ab05-dded04f2c705@linaro.org>
 <56c0b78a-b9dd-de6d-7d7e-654fc5dd8e1b@amlogic.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <56c0b78a-b9dd-de6d-7d7e-654fc5dd8e1b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_105937_299506_9196B783 
X-CRM114-Status: GOOD (  11.50  )
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

T24gMjQtMDgtMjAyMyAwOTo1MSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gwqDC
oMKgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KPgo+IE9uIDIwMjMvOC8yNCAxNjozMiwgTmVpbCBB
cm1zdHJvbmcgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiAyNC8wOC8yMDIz
IDA3OjU5LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+PiBGcm9tOiAieGlhbndlaS56aGFvIiA8eGlh
bndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4KPj4+IEVuYWJsZSBwb3dlciBkb21haW4gY29udHJv
bGxlciBmb3IgQW1sb2dpYyBUNyBTb0MKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiB4aWFud2VpLnpo
YW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gVjEgLT4gVjI6IE5vbmUK
Pj4+IC0tLQo+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRz
aSB8IDYgKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0
c2kgCj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+
IGluZGV4IDE0MjNkNGE3OTE1Ni4uMjNjZGFkMWI0MjViIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4gQEAgLTQsNiArNCw3IEBACj4+
PiDCoMKgICovCj4+Pgo+Pj4gwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2FybS1naWMuaD4KPj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvYW1sb2dp
Yyx0Ny1wd3JjLmg+Cj4+Pgo+Pj4gwqAgLyB7Cj4+PiDCoMKgwqDCoMKgIGludGVycnVwdC1wYXJl
bnQgPSA8JmdpYz47Cj4+PiBAQCAtMTE4LDYgKzExOSwxMSBAQCBwc2NpIHsKPj4+Cj4+PiDCoMKg
wqDCoMKgIHNtOiBzZWN1cmUtbW9uaXRvciB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3hiYi1zbSI7Cj4+PiArCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB3cmM6IHBvd2VyLWNvbnRyb2xsZXIgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3
LXB3cmMiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3Bv
d2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsK
Pj4+IMKgwqDCoMKgwqAgfTsKPj4+Cj4+PiDCoMKgwqDCoMKgIHNvYyB7Cj4+Cj4+IFBsZWFzZSBj
aGFuZ2UgdGhlIHN1YmplY3QgdG86Cj4+IGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBhZGQgcG93
ZXIgZG9tYWluIGNvbnRyb2xsZXIgbm9kZQo+Pgo+IFdpbGwgZG8uCj4+IFdpdGggdGhhdDoKPj4g
UmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoK
VGVzdGVkIHdpdGggVmltNCBhbmQgYWxsIHdvcmtzIGZpbmUuCgpUZXN0ZWQtYnk6IEx1Y2FzIFRh
bnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
