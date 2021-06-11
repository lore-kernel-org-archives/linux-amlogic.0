Return-Path: <SRS0=Tm47=LF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF784C4743D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B34A0613B3
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B34A0613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c9p97x9rntzIuJp9p7ok0MM6ezLAlVqpNRVVnqAmM/Q=; b=ISMEZn/On8YyaVumZ6V/+Wd1SC
	X5ILzMTu74VEpz1uWOyM5+L/YLuvgAiePj8/trEfznlyrpeD9P2lGoyTIONekFawLqWCAtBeyMddf
	h5RQoXlec1SUbf9hPKLVX1u8p1HZi/8K2PvzRBUNcpO9UrxonCrtA8Zf7I8v5OHlSFdFDjUXbmhCA
	+FdsMjgzT4HPTq2kTnO4/qnD3Li/tHtpvoi2iJzlDGwtKUciXUl4m/b5AKIY9TN/bHVPfyEpmgQzH
	yd1URZKCVysZH3ybT48gntTYTI7ph367fUbWw8iIAlemkiTNPcQzOPMbWj7IYjqR7TJ9fEoGqWTJi
	NjcISH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrbra-004CGI-9t; Fri, 11 Jun 2021 07:45:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrbrX-004CF1-CB
 for linux-amlogic@lists.infradead.org; Fri, 11 Jun 2021 07:45:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id l2so4972566wrw.6
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jun 2021 00:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jyVLRP1QkA2IL6a5f5yksm2l9IPiad2Lfrho8JCrB80=;
 b=tnUXwEtIxNsUkR3juOymwq8NsDACLFO4UY9stNt8nf4fnyEfeLnMLJRCJ4WQrBSTVo
 YXthzzdbMkbartaX3GNqDiGY4Gz7qS9h7XO2LM1KW0jgywjEjW8YmTfPj6o9v5fL/yxE
 b9mjgp5A6ZiodETFvTQAp9m5YaYuipu2JP+jI5qYapY0Qf+qqvtB3sunq5gEnCh9WtkM
 R//r15ndCwJfRN6O4LT1G4c1oQ9pBNogvUVYa7pZeYik7xN9OVlPoL5dpPlCSGuCReOI
 RjsU/AFnUKF2BOQnHb+fLoueJveCWv+LFh4UewSsRxnBpkIIyGQq7bq1QNw6Bg7hqn9i
 gDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyVLRP1QkA2IL6a5f5yksm2l9IPiad2Lfrho8JCrB80=;
 b=oA7UBlCsRllHAD9xyhUXjMdWkcnuS1mSX8VV4xjmsB9aJbHccpU48WM95oZuN+mPti
 awl/ZAqj9NSuJZxU1WA3WZFlX2/6qUpnkLP9ooIRpguy4YXXLBlRBAJrNX1ErVejRFNW
 P2WLSK72hXX/aRqFaTVEof6TAyjb5LxDKuxyQ+G3kcuze70OsroWZuTExNlcQohEugt7
 0ztpFQeIfUPYgmbhGnjJJl06Ux+tmmm8b+zoI9gfMAbwOCdJbhAMtIjj4rC2qE0oeoGF
 8mhmudOXi+pJtKYUQSUeGYxLzO1hCa3ox1BWYM4X7Kr9J4d+uIyaoQoT2gpSVv3oxAXS
 jgjA==
X-Gm-Message-State: AOAM530CcxpGEWQJtInzmWIUcfwZXiKpRYeDl3XOtseoItQw1/lkVbDJ
 lQ8+VsXh+PkLW7htig6qXRxddg==
X-Google-Smtp-Source: ABdhPJzdpXeCEBaZqW+gbgn/Y7fTCnLbcAraMgni6bIzcHxjI8moZxc8QRHIancTbR/BoSfZr7KBAw==
X-Received: by 2002:adf:f1ca:: with SMTP id z10mr2557658wro.396.1623397553262; 
 Fri, 11 Jun 2021 00:45:53 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e537:d458:d3c4:18e1?
 ([2a01:e34:ed2f:f020:e537:d458:d3c4:18e1])
 by smtp.googlemail.com with ESMTPSA id v15sm5701683wrw.24.2021.06.11.00.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 00:45:52 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
To: Nick Xie <xieqinick@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: robh+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nick <nick@khadas.com>, artem@khadas.com
References: <20210609012849.797576-1-xieqinick@gmail.com>
 <11da3ae4-91d4-1e51-c652-e4ad518f13bd@baylibre.com>
 <CAP4nuTVMZV7pz8NrM2MHcZzBdueRXjS+KYsU4=cQ1CB67gr_Hg@mail.gmail.com>
 <ee3341d9-350e-a84d-6836-3401be679b2a@baylibre.com>
 <CAP4nuTUt1vQjVP=3_NYaeu+m47f78ru6-MgGBiAqLeU9fJAsNg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <09c65310-9441-9b97-d9ae-4695f0dd16af@linaro.org>
Date: Fri, 11 Jun 2021 09:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP4nuTUt1vQjVP=3_NYaeu+m47f78ru6-MgGBiAqLeU9fJAsNg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_004555_443408_5BEB6CFC 
X-CRM114-Status: GOOD (  14.83  )
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

T24gMTEvMDYvMjAyMSAwOTozMCwgTmljayBYaWUgd3JvdGU6Cj4gSGVsbG8gTmVpbCwKPiAKPiAK
PiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOS6jjIwMjHlubQ25pyI
MTHml6XlkajkupQg5LiL5Y2IMzoxNeWGmemBk++8mgo+Pgo+PiBIaSwKPj4KPj4gT24gMTEvMDYv
MjAyMSAwODo1NCwgTmljayBYaWUgd3JvdGU6Cj4+PiBIZWxsbyBOZWlsLAo+Pj4KPj4+IFRoZSBN
Q1UgRkFOIHdvbid0IHdvcmsgdW50aWwgdGhlIHRlbXBlcmF0dXJlIHJlYWNoIHRvIDgwIGRlZ3Jl
ZSBjZW50aWdyYWRlLAo+Pj4gRG8geW91IHRoaW5rIHRoZSB0ZW1wZXJhdHVyZSBpcyB0b28gaGln
aD8KPj4KPj4gSSB0aGluayA4MCBpcyB0b29sIGhpZ2gsIGJ1dCBJIGZlYXIgNTAgaXMgd2F5IHRv
byBsb3csIGJ1dCBpZiB5b3UgdGhpbmsgNTAgaXMgT0sgYWZ0ZXIgeW91IHJhbiBzb21lIHRlc3Rz
LCBqdXN0IGFkZCBpdCB0byB0aGUgY29tbWl0IGxvZyBhbmQgaXQncyBvayBmb3IgbWUuCj4gCj4g
SSB0aGluayBpdCBpcyBPSywgd2UgdXNlIGl0IGZvciBhIGxvbmcgdGltZS4KCjUwwrBDIHNvdW5k
cyBsaWtlIG5vcm1hbCB0ZW1wZXJhdHVyZSB3aXRoIHJlZ3VsYXIgbG9hZC4gVGhhdCBtZWFucyB0
aGUKZmFuIHdpbGwgYmUgc3dpdGNoZWQgb24gbW9zdCBvZiB0aGUgdGltZSB3aGVuIHRoZSBib2Fy
ZCBpcyB1c2VkLgoKQW5kIHRoaXMgY2hhbmdlIG1heSBiZSBwdXQgaW4gcmVnYXJkIHdpdGggdGhl
IG90aGVyIHRyaXAgcG9pbnRzIGluIHRoZQpjb21tb24gRFQuIEZvciBpbnN0YW5jZSwgZW5hYmxl
IHRoZSBmYW4gd2hlbiByZWFjaGluZyA4MMKwQyBidXQgc2V0IHRoZQpwYXNzaXZlIHRyaXAgcG9p
bnQgdG8gNzXCsEMgaW5zdGVhZCBvZiA4NcKwQy4KCkFsbCB0aGF0IGRlcGVuZHMgb24gdGhlIGhh
cmR3YXJlIGNoYXJhY3RlcmlzdGljcyBhbmQgVERQIHdoaWNoIGFyZSBpbgp0aGUgVFJNIG5vcm1h
bGx5LgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cu
ZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29t
LyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJs
b2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
