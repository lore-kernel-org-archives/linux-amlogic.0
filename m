Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C1C3DA6D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 May 2025 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0iII+asAqkHB836CBnhN3yK2bnTABT7dUa8fzOgUX8=; b=qQpTIlfTr/psyC
	c5KzypfsAYUJmvH4w1YiszAf4dQYAar2MQj37lTnLENtj9dsg1Ke+AX6jv85v4ghms5R7zlGQbuu+
	hkIK7x6cocnnohqjRkd6AgOMwwonbudY0VejQvDdzPZzLjfC6Jv0SAcmOkyzpiS7kyjNDUfh7Gd1h
	FXofHFQLqhGKAdqjy+lMjMZytFZPgvKHghRBrK4wgczjEEBO3Ag1kiLvK6o+ngoVyGPlfRkoZyBS7
	OB1NXs73n1IzDswa8LGgYALrzJa3WONJzDcKf9QlFTDCYWNaxzQgqFnR58xdJPx3n5GdFbcHyxvHw
	7EKPFSA1iKA3/3XbsIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHT1B-0000000E00l-3isH;
	Tue, 20 May 2025 19:52:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSuj-0000000DyTr-3Mhc
	for linux-amlogic@lists.infradead.org;
	Tue, 20 May 2025 19:46:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23274dbcbc2so14330645ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 May 2025 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1747770372; x=1748375172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiqgvhPL3huWrAAY6k1RZtnEkStLp95GFptcfgV3FCI=;
        b=H4nx5hHaDtiLOq3EQbD+StqnBkYDbvAWAP5GWotUHs5Ym/ky7Uda6C3clzZDEmS5+q
         f67g2QzHvqkuTL/YQjj8BjAMlZEw7XrykCTndqCHjMNczhSs68a+MIuiqLix+4UditcV
         m97sDK3DdCm9YHlsN2ya7hnAPOG7Adc9ptA96giZyKB2BM9608PSOc0on0xvZIub7VAJ
         BAWWJYGOQUaoZ3wrIH1HuehPzLC5GMxpnRGCv2wkmbRF0NifhHxc7FPEPKYT2OZoIO4w
         q5Z9fiPTcB9ICEDX2uNF4J8V6PK4nouZVzBYp1MPBC2mREM/HX/noKnOjNKJXqV0P5vN
         mxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770372; x=1748375172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiqgvhPL3huWrAAY6k1RZtnEkStLp95GFptcfgV3FCI=;
        b=l1MM+qDvPljqS/wV2er/zxAhZhmEoT9G1wYBjWvsbwRTB05sbQcO2kVYm0vOD0luYv
         ttGrjrcvDuWJRRjy8GuGYmo6mOaq2N/OCco93pyEus9LRGhyxVFsN3MxE9gB4kHpY3nS
         jP7LP3HY2V94CqxoSFT6/VjjrN2IvJWqXDk8FcW7LRq2F4Fw33lsEcstdxVtGlJ0KkZz
         emn+T5pLg7ZCmW/lnZp6aDyNdtVX2IL7s+DlrxqQU1XGyu2ygEEukT4bawW/stjT3FV6
         x2IWVoY4XGSQPmUXaNOir9t3dWH9VtCz1CNSpgCc5RAPA8UBslbc7RPkBeoKido0l5Rc
         D4tw==
X-Forwarded-Encrypted: i=1; AJvYcCVKCIMKUILeO/sdBA99rEhkO66hZXG09LRdqfpWrf3aZHNt8ix5Pi8viHguXc5dV8pfCaKxRD1QS4afGWEg@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtQIkBgBuzpuUAIlSI93I/TMlNg0j652dNVXIryz8grei860D
	hfON4lS5OFzqX71mvdq9HiwdiOlj2JRdxjiH9J0F71fMW08Uij1kPck47WE2SEbz5oziskJ4P49
	WBShvxxYC3eLDTHnzfG+Vgt5yEwlkpn0=
X-Gm-Gg: ASbGnctnO4upSdqSLavnybv8t+mzV5xlFJbmE5yYEJQEQAagvnpYjfn3Ef/6MG+0r+K
	+4TTDPDWvA9quKTFL0K6WfpLVnPA2JE2yW7eI/cQxneBReX/vfBEO9J/qchOZUCBKz6PEeHJXvm
	rPTsdwV6QbZRcC3BNSxSQp3KSzRs3aYKO2vb4izAWazGONYOe4VwtI6tCWpwzj4L7v8w==
X-Google-Smtp-Source: AGHT+IGpOU8AuTpmfyiPWHS9f9AyIuq2oP/9T8gLrzp4+R9pQw/aaINR4j9OtNfdZ5TQfBliNbuTK4NWqSXI1yA/+0M=
X-Received: by 2002:a17:903:22ca:b0:22f:c530:102 with SMTP id
 d9443c01a7336-231de376f89mr246040095ad.31.1747770372610; Tue, 20 May 2025
 12:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747739323.git.zhoubinbin@loongson.cn> <abf952393b2089dea103c1976a7af878b1c9852a.1747739323.git.zhoubinbin@loongson.cn>
In-Reply-To: <abf952393b2089dea103c1976a7af878b1c9852a.1747739323.git.zhoubinbin@loongson.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 May 2025 21:46:01 +0200
X-Gm-Features: AX0GCFuCAFO7TJI-d6sab6lfsbBBjAJjzWttXJVDpbUIJxRQPTdIJJC4cQ5RkPw
Message-ID: <CAFBinCAZMqSzhudhZdnES=4E8yKUUZz6cEO7fgguvE9F02XHtg@mail.gmail.com>
Subject: Re: [PATCH 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_124613_842157_31C7F817 
X-CRM114-Status: UNSURE (   8.78  )
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

SGVsbG8sCgpPbiBUdWUsIE1heSAyMCwgMjAyNSBhdCAxOjQ34oCvUE0gQmluYmluIFpob3UgPHpo
b3ViaW5iaW5AbG9vbmdzb24uY24+IHdyb3RlOgpbLi4uXQo+IC0gICAgICAgbW1jID0gbW1jX2Fs
bG9jX2hvc3Qoc2l6ZW9mKCpob3N0KSwgJnNsb3RfcGRldi0+ZGV2KTsKPiArICAgICAgIG1tYyA9
IGRldm1fbW1jX2FsbG9jX2hvc3QoJnNsb3RfcGRldi0+ZGV2LCBzaXplb2YoKmhvc3QpKTsKTGFz
dCB0aW1lIEkgdHJpZWQgdGhpcyBJIGhhZCBzb21lIHByb2JsZW1zLiBJIGRvbid0IGZ1bGx5IHJl
Y2FsbCB0aGUKaXNzdWVzIChJIGNhbiB0ZXN0IGluIHRoZSBuZXh0IGZldyBkYXlzKS4KSW4gdGhl
IG1lYW50aW1lOiBjb3VsZCB5b3UgcGxlYXNlIGRvdWJsZS1jaGVjayB0aGUgZHJpdmVyIGNvZGUg
dG8gc2VlCmlmIHlvdSBzcG90IGFueSBpc3N1ZXMgKHRoZSBzcGVjaWFsIGJpdCBoZXJlIGlzIHRo
YXQgdGhlIHN0cnVjdCBkZXZpY2UKaXMgY3JlYXRlZCBieSBvZl9wbGF0Zm9ybV9kZXZpY2VfY3Jl
YXRlKCkpPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
