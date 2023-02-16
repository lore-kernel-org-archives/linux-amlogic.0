Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7059C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SU978kR/1k9JT+l1nOWd1SgWfeNqwZ1ffOm8UEJ9Pns=; b=UpnhnH0Sxii8Wx
	AoG/3SJrJDbpUeRAtRzIGFcR3CDp7hnNVY8ALYwh6QLeQpZmlkZF9mAhu77lW/WTK6iWS/5iWjDwb
	5yfCip635p/rrw2Cf3o1DpdmJt8ddKVb7DRE6NZLV2Hps55fv9DgNiQnk6qpT+NqjY4ESb2aXO1j6
	l4vKTCm9aD3hF9J0h/jA6iTW9vQkuNmwkX7W7QIBzPqzfq42lwzeZmnf66gIqLLbEEX3ylI46ttV/
	oj1hXjmn0+0Hy/WsIG5WqXbGySTvi14+B787Vu2pADS1GujBw+Pc55CwOctmBJG5vLdxwEZ78mC+3
	ZnUu86XUxgJFTEB8VSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSkBn-00BfpX-Hg; Thu, 16 Feb 2023 19:45:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSkBc-00BfmC-3H; Thu, 16 Feb 2023 19:44:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id t16so6986141edd.10;
        Thu, 16 Feb 2023 11:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2TGP6B+IxbGPuvRSkNm+2wsr3WKYYRSuuWyBPcPIYA=;
        b=a+4Kk1je213yxbfmrjyyha9AtYMFDoIL4SK0XgUTfaia+t0Y1Xm5WgR3veSJI6sp0l
         aS5P6XGGFyhkLN+Z82ctnGUJ0apDpTvA4nIMzcpTaKDiAREsxRvFr9Y6Bf4dujioerZt
         VF5qlzAjoJrZo0MRBRzF+U4khIoGCsjGmAtwtICnVRU/wethTuKbYgxx1jfTXQkeRGtb
         H21cv/mSkxk12N+k7jiRO92NCfb9tWv1LbDS7+uhqFj6X6CLVdtTiutE199kFrFg5Q6T
         TEaoG0Rg2HKNNqjQndCjkCtiRM6KjDPqC3A2M9QjHVoKnNRGBIgvQvgq+yrBVPLXDcgs
         ezCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2TGP6B+IxbGPuvRSkNm+2wsr3WKYYRSuuWyBPcPIYA=;
        b=eD4QSexaJK/sQtAcv88xZ80e15VED2PlHridU+1ve+ZgTvKitUE9qTXvuFoiCIPLeC
         KSQTTnIjdwEmdE5IieX5A8QXV0gpO//jO4/gl8ErulaXjHeajeFZLkNFDOuSMSQ9yIoP
         Pl4z7pwACT0h9fhcJaa2N/MgVpSA4lt8C7ZvydTRSFKtvYODRdcw2jF5YxvZ33qlhWIZ
         hudnvtQ6rzwUfGLkTEpPcQkcvSmacCSCcU5fbpYHYeC7DkUsh/2MSCf9sjl9In7jAMLL
         kw8lLlGE7ZujGFe7SW5KuOUvo9lWsv8Dpvv2ax2Ag+E3u4RMYpilQ3t3Ophcww27OV2h
         HB2w==
X-Gm-Message-State: AO0yUKWu1ypba7rjgWrkvocX09e+Pnl25wB/alX7L3b4RHz55MDKpDtV
	g5Ap8zfyk4pAA6oFhxZOaTg=
X-Google-Smtp-Source: AK7set+GOmNvxidy4aSiFfWjv0DKYhrvVBpSkAum+m/SU2QKrWYPb2rsd/xwToJUw+4+K92uaoo/Xw==
X-Received: by 2002:a17:906:84b:b0:8b1:800b:d2e9 with SMTP id f11-20020a170906084b00b008b1800bd2e9mr355562ejd.56.1676576693818;
        Thu, 16 Feb 2023 11:44:53 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:a039:5cde:fa47:7ceb? (dynamic-2a01-0c23-c4f6-7c00-a039-5cde-fa47-7ceb.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:a039:5cde:fa47:7ceb])
        by smtp.googlemail.com with ESMTPSA id n2-20020a170906118200b008b1426fd60dsm1182681eja.176.2023.02.16.11.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:44:53 -0800 (PST)
Message-ID: <3ac1eb14-e39e-066a-8066-a92572d0ba45@gmail.com>
Date: Thu, 16 Feb 2023 20:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] dt-bindings: mmc: meson-gx: fix interrupt binding
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <d5542f6e-920e-93cf-a453-b0601d03f48d@gmail.com>
 <21ae5f5f-2336-db5b-f98a-f83391e1becd@linaro.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <21ae5f5f-2336-db5b-f98a-f83391e1becd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_114456_161541_250F03C9 
X-CRM114-Status: GOOD (  11.24  )
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

T24gMTYuMDIuMjAyMyAxMzo1MiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTYvMDIvMjAy
MyAxMjo0OSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBSZWZsZWN0IGluIHRoZSBiaW5kaW5n
IHRoYXQgdGhlIGNkIGludGVycnVwdCBpcyBvcHRpb25hbCwKPj4gYW5kIGFkZCBhIGRlc2NyaXB0
aW9uIG9mIHRoZSBpbnRlcnJ1cHRzLgo+Pgo+PiBGaXhlczogMDliMzFhNjEwMzI4ICgiZHQtYmlu
ZGluZ3M6IG1tYzogbWVzb24tZ3g6IHN1cHBvcnQgc3BlY2lmeWluZyBjZCBpbnRlcnJ1cHQiKQo+
PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+
PiAtLS0KPj4gwqAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gt
bW1jLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1tbWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1tbWMueWFtbAo+PiBpbmRl
eCBjOGMzMDMwMGQuLmNkM2Y3NTgyMSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLWd4LW1tYy55YW1sCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1tbWMu
eWFtbAo+PiBAQCAtMjgsNyArMjgsMTEgQEAgcHJvcGVydGllczoKPj4gwqDCoMKgwqDCoCBtYXhJ
dGVtczogMQo+PiDCoCDCoMKgwqAgaW50ZXJydXB0czoKPj4gK8KgwqDCoCBtaW5JdGVtczogMQo+
PiDCoMKgwqDCoMKgIG1heEl0ZW1zOiAyCj4+ICvCoMKgwqAgZGVzY3JpcHRpb246Cj4+ICvCoMKg
wqDCoMKgIG1tYyBjb250cm9sbGVyIGluc3RhbmNlIGludGVycnVwdAo+PiArwqDCoMKgwqDCoCBv
cHRpb25hbCBjYXJkIGRldGVjdCBpbnRlcnJ1cHQKPiAKPiBJIHdvdWxkIGluc3RlYWQgd3JpdGU6
Cj4gCj4gaW50ZXJydXB0czoKPiDCoCBtaW5JdGVtczogMQo+IMKgIGl0ZW1zOgo+IMKgwqDCoCAt
IGRlc2NyaXB0aW9uOiBtbWMgY29udHJvbGxlciBpbnN0YW5jZQo+IMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiBjYXJkIGRldGVjdAo+IAo+IGFuZCBkcm9wIG1heEl0ZW1zLgo+IApUaGFua3MgZm9yIHRo
ZSBoaW50ISBCaW5kaW5ncyBpc24ndCByZWFsbHkgbXkgYXJlYSBvZiBleHBlcnRpc2UgKHlldCku
Cgo+IE5laWwKPj4gwqAgwqDCoMKgIGNsb2NrczoKPj4gwqDCoMKgwqDCoCBtYXhJdGVtczogMwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
