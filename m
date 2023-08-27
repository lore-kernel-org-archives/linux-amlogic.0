Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E5EC83F10
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICsFlJkZCcjO6T5A0bdNwxwO1nHrkm6pxO6pRGLT1cA=; b=Q/djciPrVOOs9+
	Adm8/CcJ1n0kjB54cHVKMVcGhWaM8HxSxTBkGLFSyoS/irqGuC68/AxJTPhBluFjRqoA6M8gT3vxt
	Dn3w1SRYljVEIxCzBVE/mWpvfSmvRLQy6iFLDIsmmnT1fQtbnQooWfCvHvyrEq5Y2Hk2XCTli6PT3
	KuM6QkyMRwEehqT750dwLW27WIHA7Pr5jYAQtt/KNYQzG6PhQMM1Q8i31df7PFTeeYqasbEEatAS8
	4ucW7+WDIVebM+5NQozk8wE6zj8YR+2Ldn93Xo+zNvExg3MDgz/xD2Mhv7kPtm43Or2iWXFmLi8KE
	CbXjtbbVWUXZ2qNNMukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCvN-007vwl-0O;
	Sun, 27 Aug 2023 10:23:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCvK-007vtS-0C
	for linux-amlogic@lists.infradead.org;
	Sun, 27 Aug 2023 10:23:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so21560785e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Aug 2023 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693131791; x=1693736591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcUzkPYm/VWGO+NWviGSfkAFyEHWVQGPLTp4MRmRHs0=;
        b=hKnqbWv+K2AJAuvlB8UYqTPxh1grMKhfmcbJuHAZe/o3RThDlUhW8LpxC00UlmpbSX
         tBGsbZB0vsa1JQFcyqP94PGJNew7PS/AfBc6lKqbIcoBPCvWzDgaKiRpL/g3VsHfrsWS
         KA0BzD0kG+zlFqaNmSflviMz75ysBixMtSkOVFQcQkAUtVKraeGIyyT48cMTyInb4S2P
         3t3l+W0x73CiS+IHq7NK+J85mptnazm1TRKlvIZ3M0zEe7LyE1WCqr8Cd1wXTfCCpTye
         oz0FqVmnnykespvoviNSdY6PaV4YU2EJtQRDzH+UZrLENQb3O4XNtGyMPuDSHjC1SmLi
         5jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693131791; x=1693736591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcUzkPYm/VWGO+NWviGSfkAFyEHWVQGPLTp4MRmRHs0=;
        b=WbBaf/vkHyfx0EwHNM1I8GAJJaI2ZfUs1xXBuNQUvVGfkVLSJiCM398Yymw5mS/IM8
         CHsQpiSYmmCVRij7MhFgFqDMwVjY8Jk4AlsvWncMgG4GucHta5T3vs9Xngmn7VpR1JlM
         BAaNjP8piJTUsSxDsrrMrof4UGdmIGDnJ3IyU3Z3B3nSnT7fcVAEMQbiU5Gdjj3n3tjH
         lo6x1w746oyaJMw9No817ty/JzkCYv4NxAdo+IqRpjVvbp190A2um5E22hj1nqACFuhx
         mbkbG1fgIgbFYlu//OjJrm9nCqaMwE0fmKDHrJo4oMFo7eTOlDLPGw0FnuIVT/FIsuy9
         9MLA==
X-Gm-Message-State: AOJu0YzQsbdXLQByuBfc3zh2ruK904yvtk2o6Bug0y75c1GLNwWfwHln
	Fsg5AVHGFBbl+GLY24vGZTfhoQ==
X-Google-Smtp-Source: AGHT+IEeJEGkposikHw7kGDcSR/dP88RFy1eSUxV5jo41SYcKYAePCZYl1GXQuA3kCfhxCHWVlALBA==
X-Received: by 2002:a7b:cc8c:0:b0:401:c52c:5ed9 with SMTP id p12-20020a7bcc8c000000b00401c52c5ed9mr1704637wma.32.1693131791371;
        Sun, 27 Aug 2023 03:23:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8865:2133:756f:b886? ([2a01:e0a:982:cbb0:8865:2133:756f:b886])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600004ce00b00317f3fd21b7sm7144933wri.80.2023.08.27.03.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 03:23:10 -0700 (PDT)
Message-ID: <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
Date: Sun, 27 Aug 2023 12:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-GB
To: Lucas Tanure <tanure@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_032314_099156_4850A1EB 
X-CRM114-Status: GOOD (  18.90  )
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

SGkgTHVjYXMsCgpMZSAyNy8wOC8yMDIzIMOgIDEyOjA0LCBMdWNhcyBUYW51cmUgYSDDqWNyaXTC
oDoKPiBPbiAyNy0wOC0yMDIzIDEwOjQ4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGkgTHVj
YXMsCj4+Cj4+IExlIDI3LzA4LzIwMjMgw6AgMTA6MjksIEx1Y2FzIFRhbnVyZSBhIMOpY3JpdMKg
Ogo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2YTQxOTdmOTc2MzMyNTA0M2FiZjc2OTBhMjExMjRh
OWZhY2JmNTJlLgo+Pj4gTmV3IFNvQyB3aWxsIHVzZSB0dHlTMCBpbnN0ZWFkIG9mIHR0eUFNTCwg
c28gVDcgU29DIGRvZXNuJ3QgbmVlZCBhIE9GX0VBUkxZQ09OX0RFQ0xBUkUuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+Pj4gLS0tCj4+PiBT
aW5jZSBWMToKPj4+IC0gYWRkIFNpZ25lZC1vZmYtYnk6Cj4+Pgo+Pj4gwqAgZHJpdmVycy90dHkv
c2VyaWFsL21lc29uX3VhcnQuYyB8IDIgLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFy
dC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+Pj4gaW5kZXggYzRmNjFkODJm
YjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9t
ZXNvbl91YXJ0LmMKPj4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4+
IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3Ry
dWN0IGVhcmx5Y29uX2RldmljZSAqZGV2aWNlLCBjb25zdCBjaGFyICpvcHQKPj4+IMKgIE9GX0VB
UkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLAo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+
Pj4gLU9GX0VBUkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+
Pj4gwqAgI2RlZmluZSBNRVNPTl9TRVJJQUxfQ09OU09MRV9QVFIoX2Rldm5hbWUpICgmbWVzb25f
c2VyaWFsX2NvbnNvbGVfIyNfZGV2bmFtZSkKPj4+IMKgICNlbHNlCj4+Cj4+IEhvdyBkbyB5b3Ug
dXNlIGVhcmx5Y29uIHdpdGggdGhpcyByZW1vdmVkID8KPj4KPj4gTmVpbAo+IFRoaXMgaXMgbXkg
a2VybmVsIGNtZGxpbmU6Cj4gY29uc29sZT10dHlTMCw5MjE2MDAgbm9fY29uc29sZV9zdXNwZW5k
IGVhcmx5Y29uPXR0eVMwLDB4ZmUwNzgwMDAKPiAKPiBBbmQgSSBjYW4gc2VlIG15IGxvZzoKPiBi
b290IDY0Yml0IGtlcm5lbAo+IFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5
c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPiBbwqDCoMKgIDAuMDAwMDAwXSBM
aW51eCB2ZXJzaW9uIDYuNS4wLXJjNy1uZXh0LTIwMjMwODI1KyAodGFudXJlYWxAcnl6ZW4pIChh
YXJjaDY0LW5vbmUtbGludXgtZ251LWdjYyAoR05VIFRvb2xjaGFpbiBmb3IgdGhlIEEtcHJvZmls
ZSBBcmNoaXRlY3R1cmUgMTAuMy0yMDIxLjA3IChhcm0tMTAuMjkpKSAxMC4zLjEgMjAyMTA2MjEs
IEdOVSBsZCAoR05VIFRvb2xjaGFpbiBmbzMKPiBbwqDCoMKgIDAuMDAwMDAwXSBLQVNMUiBkaXNh
YmxlZCBkdWUgdG8gbGFjayBvZiBzZWVkCj4gW8KgwqDCoCAwLjAwMDAwMF0gTWFjaGluZSBtb2Rl
bDogS2hhZGFzIHZpbTQKPiBbwqDCoMKgIDAuMDAwMDAwXSBPRjogcmVzZXJ2ZWQgbWVtOiAweDAw
MDAwMDAwMDUwMDAwMDAuLjB4MDAwMDAwMDAwNTJmZmZmZiAoMzA3MiBLaUIpIG5vbWFwIG5vbi1y
ZXVzYWJsZSBzZWNtb25ANTAwMDAwMAo+IFvCoMKgwqAgMC4wMDAwMDBdIE9GOiByZXNlcnZlZCBt
ZW06IDB4MDAwMDAwMDAwNTMwMDAwMC4uMHgwMDAwMDAwMDA3MmZmZmZmICgzMjc2OCBLaUIpIG5v
bWFwIG5vbi1yZXVzYWJsZSBzZWNtb25ANTMwMDAwMAo+IC4uLgo+IFvCoMKgwqAgMC4wNzkzNjhd
IGlvIHNjaGVkdWxlciBtcS1kZWFkbGluZSByZWdpc3RlcmVkCj4gW8KgwqDCoCAwLjA3OTM3NF0g
aW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQKPiBbwqDCoMKgIDAuMDc5NTQ5XSBpbyBzY2hl
ZHVsZXIgYmZxIHJlZ2lzdGVyZWQKPiBbwqDCoMKgIDAuMDgzMzczXSBmZTA3ODAwMC5zZXJpYWw6
IHR0eVMwIGF0IE1NSU8gMHhmZTA3ODAwMCAoaXJxID0gMTQsIGJhc2VfYmF1ZCA9IDE1MDAwMDAp
IGlzIGEgbWVzb25fdWFydAo+IFvCoMKgwqAgMC4wODM0MDNdIHByaW50azogY29uc29sZSBbdHR5
UzBdIGVuYWJsZWQKPiAKPiBBcyB0aGUgbG9nIGlzIE9LLCBhbmQgVDcgZm9yIG5vdyBpcyBiaW5k
aW5nIGFnYWluc3QgUzQgY29kZSB3ZSBzaG91bGQgZHJvcCB0aGlzIHBhdGNoIGFuZCBhZGQgYSBT
NCBvbmUgaWYgbmVlZGVkLgo+IAo+IEJ1dCBqdXN0IGhhdmluZyB0aGlzIGxvZyBpcyBub3QgZW5v
dWdoIGZvciB0ZXN0aW5nIGVhcmx5Y29uPwo+IEkgYW0gYXNzdW1pbmcgdGhhdCBieSBqdXN0IGhh
dmluZyB0aGUgbG9nIHNpbmNlIDAuMDAwMCBpcyBhIGdvb2Qgc2lnbiB0aGF0IGVhcmx5Y29uIGlz
IHdvcmtpbmcuCj4gQ291bGQgeW91IGdpdmUgZnVydGhlciBndWlkYW5jZT8KCkZpcnN0IHRoZSBr
ZXJuZWwgYXJndW1lbnQgaXMgc2ltcGx5ICJlYXJseWNvbiIgd2l0aCBubyBvdGhlciBvcHRpb25z
LAp0aGUgZWFybHljb24gY29kZSB3aWxsIGZldGNoIHRoZSBmaXJzdCB1YXJ0IHVzaW5nIHRoZSBE
VCAvY2hvc2VuL3N0ZG91dC1wYXRoIHByb3BlcnR5LgoKVGhlbiB5b3Ugc2hvdWxkIHNlZSBzb21l
dGhpbmcgbGlrZSByaWdodCBhZnRlciAiTWFjaGluZSBtb2RlbCI6ClsgICAgMC4wMDAwMDBdIGVh
cmx5Y29uOiBtZXNvbjAgYXQgTU1JTyAweDAwMDAwMDAwZmY4MDMwMDAgKG9wdGlvbnMgJzExNTIw
MG44JykKClRoZSBib290IGxvZyB5b3Ugc2hhcmUgZG9lc24ndCB1c2UgZWFybHljb24sIGl0IHdh
aXRzIHVudGlsIGFsbCBkZXBlZGVuY3kgb2YgdGhlIFVBUlQKaGFzIGJlZW4gcHJvYmVkIGJlZm9y
ZSBwcm9iaW5nIHRoZSBVQVJUIGRyaXZlciBhbmQgcHJpbnRzIHRoZSB3aG9sZSBib290IGxvZy4K
CkVhcmx5Y29uIGlzIGEgbWVjaGFuaXNtIHRvIHVzZSB0aGUgVUFSVCBIVyBhcyBjb25maWd1cmVk
IGJ5IHRoZSBib290bG9hZGVyIGluCmEgbWluaW1hbCB3YXkgdmVyeSBlYXJseSBpbiB0aGUgYm9v
dCBpbiBvcmRlciB0byBkZXRlY3QgdmVyeSBlYXJseSBsb2NrdXBzLgoKS2VlcGluZyBPRl9FQVJM
WUNPTl9ERUNMQVJFIGZvciB0NyB3b3VsZCBlbmFibGUgdGhpcy4KCk5laWwKCj4gCj4gTHVjYXMg
VGFudXJlCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
