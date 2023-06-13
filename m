Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D65DC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwVrGDZIQFJ6tHOHtI2+OjDwnBs8X665LBOzY4zgaSc=; b=gN8QHp1OlUlJZY
	XHoLBDLPntEWe2R6Vn4KNX7wmgypJqrA23gzaw+jysRK588+8XPYTOFm/Gb+VbUFcjFAIZww8HaFn
	b10CEfqcuVlV4zew5XwifmLGW0hwG7/v7mHqxmlxTPSjp+fqEpIgHjVgiQev1tU8UWbnfdCiKJwfE
	L/+GSgB2xLiOMDZC0gceE0eLO7Xd0l5CJ9UKsYtIMejvIype/4THzTimmPKnJrlAV4MtZ+kH5BsGB
	M4RylG/v+ZKgF3W89R4QMRKcz7nb1pZVMQLYONHzlRorX2nYkfqsqc8tm+vv7rrdhXuGrenNF7CEU
	MeFIJoVDhTWyunw9CA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q918w-007dmF-1P;
	Tue, 13 Jun 2023 10:20:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q918s-007djO-1R
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 10:20:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3728826f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686651647; x=1689243647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS1QZFq4PW+Cu7XRqqcuTNZQ+bcaoFopTjwE2sqYaSo=;
        b=odVd10yqz/T7OpVfq0G9VoZpLJ1BBVQ4kllhXUxAlpGSNXvZUOcJfB+/Dw896mY3cV
         AkDLdyyIN/0WjGsZw80p50HitmPdSlyiDihqvpTCWqjypydLtMDkZ8YQTybvmo9THfWh
         E6oVQOWqgPq0BqAAcw252YF7rieVwW8qhHMRmX0uuEWlm13VmWZaKovxh4KID1jELONh
         zmYSJ+nmRkCIF8FRlATHPNJWKvjSidkKwf/CcVn5SGpV+u/M+cmGd2Cdu24KWQXI0qNb
         E4vLrwTHIAgmrCHcO/1IsbiBkChyd8dqEING+nDPzzaeNCfaqyKBT9PcR9BhFfjANPe0
         L07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651647; x=1689243647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS1QZFq4PW+Cu7XRqqcuTNZQ+bcaoFopTjwE2sqYaSo=;
        b=ePjT91LL/wTlZ1mjw7/DnzjRS48grhznXSXLv2b5Z7MFqix2YHiPyn38k/xvNDQJKH
         GKZWdZNHcPtbJ4JE/9aQvWfKbXdwwfHJC4DOzrtzM3QsrzGiFHfjz/0fHAZSrpfIEK5Z
         ke41qH8OHW/tpkLfrenQCdUoqDkgVtPpEbSNPgUNgxRcWh6jlS+UwjMj68WI5Iuy72Vv
         0qPs082219OEHxa8fo5Fj/FundBrKnT2LCJ+WxQ5bAoZJWfnkW4WvgdDz3+/AWKMM+0p
         f0X1O/XmSeAMfk1YvBptfR1AwclUdB+1rUY6dbv5hjR1zKNBR2hYuq3eK67S8cdHBN29
         a7ow==
X-Gm-Message-State: AC+VfDzVe05JI81ecvSvzXsf3+4mx7uST0y6JalpB8OwR3B1Cmtc64/q
	KuzyBkhZXIZ9ZoGVaVguuJKXMg==
X-Google-Smtp-Source: ACHHUZ4mLybWRM2xTNVY4PZztaDFQwXjC4NSKZcZAbwZFCFt4OyBZrpM11GOww0BAaWgtIStwFNbIg==
X-Received: by 2002:adf:e30b:0:b0:309:53f3:6e3e with SMTP id b11-20020adfe30b000000b0030953f36e3emr5803184wrj.69.1686651646533;
        Tue, 13 Jun 2023 03:20:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d6bf:b78b:2fff:653a? ([2a05:6e02:1041:c10:d6bf:b78b:2fff:653a])
        by smtp.googlemail.com with ESMTPSA id q2-20020adffec2000000b0030632833e74sm14918579wrs.11.2023.06.13.03.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:20:46 -0700 (PDT)
Message-ID: <3ab066e3-97f5-8bd1-eaae-3d790432fb6f@linaro.org>
Date: Tue, 13 Jun 2023 12:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND 1/9] thermal/hwmon: Add error information printing for
 devm_thermal_add_hwmon_sysfs()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, thara.gopinath@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, anarsoul@gmail.com,
 tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 edubezval@gmail.com, j-keerthy@ti.com, f.fainelli@gmail.com
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230613095624.78789-1-frank.li@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230613095624.78789-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_032050_481805_9BAE214D 
X-CRM114-Status: GOOD (  18.35  )
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

T24gMTMvMDYvMjAyMyAxMTo1NiwgWWFuZ3RhbyBMaSB3cm90ZToKPiBFbnN1cmUgdGhhdCBhbGwg
ZXJyb3IgaGFuZGxpbmcgYnJhbmNoZXMgcHJpbnQgZXJyb3IgaW5mb3JtYXRpb24uIEluIHRoaXMK
PiB3YXksIHdoZW4gdGhpcyBmdW5jdGlvbiBmYWlscywgdGhlIHVwcGVyLWxheWVyIGZ1bmN0aW9u
cyBjYW4gZGlyZWN0bHkKPiByZXR1cm4gYW4gZXJyb3IgY29kZSB3aXRob3V0IG1pc3NpbmcgZGVi
dWdnaW5nIGluZm9ybWF0aW9uLiBPdGhlcndpc2UsCj4gdGhlIGVycm9yIG1lc3NhZ2Ugd2lsbCBi
ZSBwcmludGVkIHJlZHVuZGFudGx5IG9yIG1pc3NpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFu
Z3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gLS0tCj4gUmVzZW5kIHBhdGNoc2V0IHNvIHRo
YXQgdGhlIGNoYW5nZXMgdG8gdGhlcm1hbC9od21vbi5jIGFyZSBjb3BpZWQgdG8gZXZlcnlvbmUu
Cj4gICBkcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9od21vbi5jIHwgNSArKysrLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9od21vbi5jIGIvZHJpdmVycy90aGVybWFsL3RoZXJt
YWxfaHdtb24uYwo+IGluZGV4IGZiZTU1NTA5ZTMwNy4uYTU4MGFkZDVhMmY2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsX2h3bW9uLmMKPiArKysgYi9kcml2ZXJzL3RoZXJt
YWwvdGhlcm1hbF9od21vbi5jCj4gQEAgLTI3MSwxMSArMjcxLDE0IEBAIGludCBkZXZtX3RoZXJt
YWxfYWRkX2h3bW9uX3N5c2ZzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHRoZXJtYWxfem9u
ZV9kZXZpY2UKPiAgIAo+ICAgCXB0ciA9IGRldnJlc19hbGxvYyhkZXZtX3RoZXJtYWxfaHdtb25f
cmVsZWFzZSwgc2l6ZW9mKCpwdHIpLAo+ICAgCQkJICAgR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoIXB0
cikKPiArCWlmICghcHRyKSB7Cj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUg
ZGV2aWNlIHJlc291cmNlIGRhdGFcbiIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KPiAg
IAo+ICAgCXJldCA9IHRoZXJtYWxfYWRkX2h3bW9uX3N5c2ZzKHR6KTsKPiAgIAlpZiAocmV0KSB7
Cj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGh3bW9uIHN5c2ZzIGF0dHJpYnV0ZXNc
biIpOwo+ICAgCQlkZXZyZXNfZnJlZShwdHIpOwo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KClNv
cnJ5LCBJIGNvbW1lbnRlZCB0byBxdWlja2x5IHRoaXMgcGF0Y2guIFBsZWFzZSBkaXNjYXJkIG15
IGxhc3QgCmNvbW1lbnQuIEkgdGhpbmsgaXQgaXMgYSBnb29kIGltcHJvdmVtZW50LgoKQ2FuIHlv
dSByZXBsYWNlIHRoZSBkZXZfZXJyIHRvIGRldl93YXJuID8KClRoYW5rcwoKLS0gCjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMv
TGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0
dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
