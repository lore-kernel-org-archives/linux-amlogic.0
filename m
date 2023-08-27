Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BC4C83F10
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVxv3JFrK4sevckAP4nGg84duV8jVxTxOJQQZIhc4jI=; b=mPTq0CtFljcZ+8
	YvyRInlWAIw5XF0Nl6GXcExOYObq3JCshxP09Ik5IFph6DLG3J9dfis+9uCH7YmAJLRUhwoqf3p1F
	i7BghjJhT7NZugDZRTMD18whKFpeqiOYRf5kjxAAx2+1zoFz0q2VPASh1rRkH+5X2MO7C1FwPniZB
	SgEnYnfN1PEpfCF/+0hQz4RGPFhsbM4opnz0E4NvYA9E2ChThKEOi/Sx/GXSk4HLYDPfi6dRJIo+6
	08dkx7SUxbj4JNs4kJu7oxhaWAdUxoSR0RuJ38mbm1Hi3ZswUFs6WnZaBXmq7vhas4//gNtT+HqaA
	mFz3MmfQboCUgXYpldmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD3Z-007wUR-15;
	Sun, 27 Aug 2023 10:31:45 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD3V-007wTf-0i;
	Sun, 27 Aug 2023 10:31:42 +0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bcfdadd149so16636551fa.0;
        Sun, 27 Aug 2023 03:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693132297; x=1693737097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaXyjQEp7FW2di7qvcSh0sewqS6uwk22ADyLcsKMcVQ=;
        b=W9jnRrHKya2DEoWAZopXCWZB2v297Yd8/N/m/xS6rrQrKZWKIv/vgp36a9OmUIpM8g
         XnRu7xSjUc5Pf1L6ppDx2hb/Bh8NOJXt26pIYBs5Wj8RJLdkw3z7wQFUP9WhymjyBaTS
         x64U2iOHcb8/vefSBGonlSlW2l19dt8GMtpuBTXB0Fik0m4IJ2NC0OgNLx6gtU9WU3Hy
         7w33LBfczRnfKoHCq17lxXhtgvQhwCE0AELy8Fp3Qk0o7rbfGuqYruI/c2XLU1O4f86X
         mIWlapJHZPWVbPhpFdNTGiAOrz6F69Kw4M/3kGzuThbiNJAICWXhJWE5FdO1xrLiMrwK
         RZqw==
X-Gm-Message-State: AOJu0Yyoj+zMP6X865jvGqss9+FYwWQ7Y0eT/6lzCMXqQsEe62m0wPEC
	htXav/Yy+MrdfYwbbrQN3lzWdFhqPo2VYw==
X-Google-Smtp-Source: AGHT+IHrJOOCzXE7LYnGGiWSxRYULxLS6F8XSzng5zQCK0L8y1HQksH+9slGqmqNczi+1hh14Bho8w==
X-Received: by 2002:a2e:9699:0:b0:2bc:bb02:fdba with SMTP id q25-20020a2e9699000000b002bcbb02fdbamr13642133lji.40.1693132296676;
        Sun, 27 Aug 2023 03:31:36 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id a20-20020a1709064a5400b00992b50fbbe9sm3285195ejv.90.2023.08.27.03.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 03:31:36 -0700 (PDT)
Message-ID: <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
Date: Sun, 27 Aug 2023 11:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_033141_281806_3148801C 
X-CRM114-Status: GOOD (  21.80  )
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

T24gMjctMDgtMjAyMyAxMToyMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgTHVjYXMsCj4g
Cj4gTGUgMjcvMDgvMjAyMyDDoCAxMjowNCwgTHVjYXMgVGFudXJlIGEgw6ljcml0wqA6Cj4+IE9u
IDI3LTA4LTIwMjMgMTA6NDgsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGkgTHVjYXMsCj4+
Pgo+Pj4gTGUgMjcvMDgvMjAyMyDDoCAxMDoyOSwgTHVjYXMgVGFudXJlIGEgw6ljcml0wqA6Cj4+
Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2YTQxOTdmOTc2MzMyNTA0M2FiZjc2OTBhMjExMjRhOWZh
Y2JmNTJlLgo+Pj4+IE5ldyBTb0Mgd2lsbCB1c2UgdHR5UzAgaW5zdGVhZCBvZiB0dHlBTUwsIHNv
IFQ3IFNvQyBkb2Vzbid0IG5lZWQgYSAKPj4+PiBPRl9FQVJMWUNPTl9ERUNMQVJFLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+Pj4+IC0t
LQo+Pj4+IFNpbmNlIFYxOgo+Pj4+IC0gYWRkIFNpZ25lZC1vZmYtYnk6Cj4+Pj4KPj4+PiDCoCBk
cml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMiAtLQo+Pj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3Nl
cmlhbC9tZXNvbl91YXJ0LmMgCj4+Pj4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5j
Cj4+Pj4gaW5kZXggYzRmNjFkODJmYjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2NDQKPj4+PiAtLS0g
YS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+Pj4gKysrIGIvZHJpdmVycy90dHkv
c2VyaWFsL21lc29uX3VhcnQuYwo+Pj4+IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25fc2VyaWFs
X2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0IAo+Pj4+IGVhcmx5Y29uX2RldmljZSAqZGV2aWNl
LCBjb25zdCBjaGFyICpvcHQKPj4+PiDCoCBPRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1s
b2dpYyxtZXNvbi1hby11YXJ0IiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNv
bl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4+Pj4gLU9GX0VBUkxZQ09OX0RFQ0xBUkUo
bWVzb24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1l
c29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPj4+PiDCoCAjZGVmaW5lIE1FU09OX1NF
UklBTF9DT05TT0xFX1BUUihfZGV2bmFtZSkgCj4+Pj4gKCZtZXNvbl9zZXJpYWxfY29uc29sZV8j
I19kZXZuYW1lKQo+Pj4+IMKgICNlbHNlCj4+Pgo+Pj4gSG93IGRvIHlvdSB1c2UgZWFybHljb24g
d2l0aCB0aGlzIHJlbW92ZWQgPwo+Pj4KPj4+IE5laWwKPj4gVGhpcyBpcyBteSBrZXJuZWwgY21k
bGluZToKPj4gY29uc29sZT10dHlTMCw5MjE2MDAgbm9fY29uc29sZV9zdXNwZW5kIGVhcmx5Y29u
PXR0eVMwLDB4ZmUwNzgwMDAKPj4KPj4gQW5kIEkgY2FuIHNlZSBteSBsb2c6Cj4+IGJvb3QgNjRi
aXQga2VybmVsCj4+IFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwg
Q1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPj4gW8KgwqDCoCAwLjAwMDAwMF0gTGludXgg
dmVyc2lvbiA2LjUuMC1yYzctbmV4dC0yMDIzMDgyNSsgKHRhbnVyZWFsQHJ5emVuKSAKPj4gKGFh
cmNoNjQtbm9uZS1saW51eC1nbnUtZ2NjIChHTlUgVG9vbGNoYWluIGZvciB0aGUgQS1wcm9maWxl
IAo+PiBBcmNoaXRlY3R1cmUgMTAuMy0yMDIxLjA3IChhcm0tMTAuMjkpKSAxMC4zLjEgMjAyMTA2
MjEsIEdOVSBsZCAoR05VIAo+PiBUb29sY2hhaW4gZm8zCj4+IFvCoMKgwqAgMC4wMDAwMDBdIEtB
U0xSIGRpc2FibGVkIGR1ZSB0byBsYWNrIG9mIHNlZWQKPj4gW8KgwqDCoCAwLjAwMDAwMF0gTWFj
aGluZSBtb2RlbDogS2hhZGFzIHZpbTQKPj4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6IHJlc2VydmVk
IG1lbTogCj4+IDB4MDAwMDAwMDAwNTAwMDAwMC4uMHgwMDAwMDAwMDA1MmZmZmZmICgzMDcyIEtp
Qikgbm9tYXAgbm9uLXJldXNhYmxlIAo+PiBzZWNtb25ANTAwMDAwMAo+PiBbwqDCoMKgIDAuMDAw
MDAwXSBPRjogcmVzZXJ2ZWQgbWVtOiAKPj4gMHgwMDAwMDAwMDA1MzAwMDAwLi4weDAwMDAwMDAw
MDcyZmZmZmYgKDMyNzY4IEtpQikgbm9tYXAgbm9uLXJldXNhYmxlIAo+PiBzZWNtb25ANTMwMDAw
MAo+PiAuLi4KPj4gW8KgwqDCoCAwLjA3OTM2OF0gaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJl
Z2lzdGVyZWQKPj4gW8KgwqDCoCAwLjA3OTM3NF0gaW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVy
ZWQKPj4gW8KgwqDCoCAwLjA3OTU0OV0gaW8gc2NoZWR1bGVyIGJmcSByZWdpc3RlcmVkCj4+IFvC
oMKgwqAgMC4wODMzNzNdIGZlMDc4MDAwLnNlcmlhbDogdHR5UzAgYXQgTU1JTyAweGZlMDc4MDAw
IChpcnEgPSAxNCwgCj4+IGJhc2VfYmF1ZCA9IDE1MDAwMDApIGlzIGEgbWVzb25fdWFydAo+PiBb
wqDCoMKgIDAuMDgzNDAzXSBwcmludGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkCj4+Cj4+IEFz
IHRoZSBsb2cgaXMgT0ssIGFuZCBUNyBmb3Igbm93IGlzIGJpbmRpbmcgYWdhaW5zdCBTNCBjb2Rl
IHdlIHNob3VsZCAKPj4gZHJvcCB0aGlzIHBhdGNoIGFuZCBhZGQgYSBTNCBvbmUgaWYgbmVlZGVk
Lgo+Pgo+PiBCdXQganVzdCBoYXZpbmcgdGhpcyBsb2cgaXMgbm90IGVub3VnaCBmb3IgdGVzdGlu
ZyBlYXJseWNvbj8KPj4gSSBhbSBhc3N1bWluZyB0aGF0IGJ5IGp1c3QgaGF2aW5nIHRoZSBsb2cg
c2luY2UgMC4wMDAwIGlzIGEgZ29vZCBzaWduIAo+PiB0aGF0IGVhcmx5Y29uIGlzIHdvcmtpbmcu
Cj4+IENvdWxkIHlvdSBnaXZlIGZ1cnRoZXIgZ3VpZGFuY2U/Cj4gCj4gRmlyc3QgdGhlIGtlcm5l
bCBhcmd1bWVudCBpcyBzaW1wbHkgImVhcmx5Y29uIiB3aXRoIG5vIG90aGVyIG9wdGlvbnMsCj4g
dGhlIGVhcmx5Y29uIGNvZGUgd2lsbCBmZXRjaCB0aGUgZmlyc3QgdWFydCB1c2luZyB0aGUgRFQg
Cj4gL2Nob3Nlbi9zdGRvdXQtcGF0aCBwcm9wZXJ0eS4KPiAKPiBUaGVuIHlvdSBzaG91bGQgc2Vl
IHNvbWV0aGluZyBsaWtlIHJpZ2h0IGFmdGVyICJNYWNoaW5lIG1vZGVsIjoKPiBbwqDCoMKgIDAu
MDAwMDAwXSBlYXJseWNvbjogbWVzb24wIGF0IE1NSU8gMHgwMDAwMDAwMGZmODAzMDAwIChvcHRp
b25zIAo+ICcxMTUyMDBuOCcpCj4gCj4gVGhlIGJvb3QgbG9nIHlvdSBzaGFyZSBkb2Vzbid0IHVz
ZSBlYXJseWNvbiwgaXQgd2FpdHMgdW50aWwgYWxsIAo+IGRlcGVkZW5jeSBvZiB0aGUgVUFSVAo+
IGhhcyBiZWVuIHByb2JlZCBiZWZvcmUgcHJvYmluZyB0aGUgVUFSVCBkcml2ZXIgYW5kIHByaW50
cyB0aGUgd2hvbGUgYm9vdCAKPiBsb2cuCj4gCj4gRWFybHljb24gaXMgYSBtZWNoYW5pc20gdG8g
dXNlIHRoZSBVQVJUIEhXIGFzIGNvbmZpZ3VyZWQgYnkgdGhlIAo+IGJvb3Rsb2FkZXIgaW4KPiBh
IG1pbmltYWwgd2F5IHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgaW4gb3JkZXIgdG8gZGV0ZWN0IHZl
cnkgZWFybHkgbG9ja3Vwcy4KPiAKPiBLZWVwaW5nIE9GX0VBUkxZQ09OX0RFQ0xBUkUgZm9yIHQ3
IHdvdWxkIGVuYWJsZSB0aGlzLgo+IAo+IE5laWwKPiAKPj4KPj4gTHVjYXMgVGFudXJlCj4+Cj4g
CkJ1dCB0aGVuIHdlIHdvdWxkIG5lZWQgdG8gYWRkIEVhcmx5Y29uIGZvciBTNCB0b28uCkhvdyBj
YW4gd2UgYWRkIG9uZSBFYXJseWNvbiBmb3IgYWxsIGZ1dHVyZSBTb0NzLCBsaWtlIFM0IGFuZCBU
Nz8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
