Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23B2C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 22:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339C4206D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 22:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="whMxaUg/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDGJAoW+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 339C4206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPfhHvxOaU0W/BNo2SyLrErXqVHWAZRJpRK8+TKBw/g=; b=whMxaUg/IjPzz2utZALnMKiMLN
	wRKB6UqnGvR6DL3dinwq1jXWU8+Od1lutmw35jNA7velmRlcxjQ0NFN/UC7mmhtBaTsr6oxF9NQwd
	avMSP1dWnqrh6/9VwcDoMO3CgXLnmtPqaJa7tEF317WgHH5CT6jhUqADgQAkMvAOprckLKNvvhvHb
	L4xRQDvDfyfXJpyNnyQ5AzNASUhz5wGl5DDmxRgSjYPzskNg8sVdUb0G4wJWyhuu0EzJRnu14rQkV
	RUxSdTLBCccG72hcc/CxMheP3B82tEplBD0/CfMXkLyucGNjSvJQhpCMLxZWI7RHNW7O0xuoAuQ/d
	Tk/IUbzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki32C-0003v7-6N; Wed, 25 Nov 2020 22:13:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki328-0003te-4T
 for linux-amlogic@lists.infradead.org; Wed, 25 Nov 2020 22:13:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id e7so6708wrv.6
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2020 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nyuZB6pe2aVr8Jr1Y0KmQ//+PGX3XaEKFQv1Cw25khI=;
 b=KDGJAoW+H5ZOeq3z7CcJdvNkJSc9GX6I7RdvmhuBWTw34HLRNRqS/WAYwPmds/JP4N
 9BLely5o4sAXLMB7L8M1yhWb1MjNq6zTgILIJBVHFHg3M9BevtvpmitbJH3M9en5WWN2
 Dxow2NQRG7WLRIp/g5SJJZyvTO3E+0SMJ2SamBaT8Mgk9N35C15onCF6kaaH8Xbw/zan
 2lH4/ScO4ViS6mtMHBsiwch/PMhANeH2EeLFFynb2dB20kfg4PCVjuu+mGnOgBBCeamo
 Rhtieayez7zymmo3yLCIBvskn2lYAYHaUfbqT4nQaCk1femzAI/vmyIv+oDNMXLpReWw
 ymLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nyuZB6pe2aVr8Jr1Y0KmQ//+PGX3XaEKFQv1Cw25khI=;
 b=MaHp3X5O81lvs54fmdGbW4Rzbq88hPSA2/gjfhSnVbFb3q7eWArLnGTGTaet5ivjUw
 U5wYEfUSZDbkueRPIJ7Bj4KJ/2GCsJIIC9/XVk0nu9PUGRKwH1iD0cyH/o4+0CQorSa8
 Y8JPMghztxd4uksVZTvFoj/KdBCLXC//MmMWM9TPg531cIKAslSF4+xQHsm4WXMJiXav
 hdA3lViqgL+8+etxgAnJbxN7wvNZXrZehEDeo7SaFmExK/JUDb3QFN6djwlbwyDjfQlv
 ECByBogJuSDYTRL8ohINBils90KgXfnbYsarguXEtrBKaArdohBsXNVdTIFGXvLbv93I
 jhew==
X-Gm-Message-State: AOAM533yKzqQmCpRJPHBlWSrQ+dmsXeYlhZHS/Tdf1kNwuFaHSR3a0fK
 aakaClFoOmjKeiHgBosARHHlBw==
X-Google-Smtp-Source: ABdhPJwYYULUn86F9g4PzkbFNiPxMnLmOm0+6lcdwnFM4qThLCzo2lAaMWCogymQ+JgprSNFNd1CDg==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr38927wrn.408.1606342380540;
 Wed, 25 Nov 2020 14:13:00 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:c023:e75f:e8c4:d86?
 ([2a01:e34:ed2f:f020:c023:e75f:e8c4:d86])
 by smtp.googlemail.com with ESMTPSA id a131sm6423875wmh.30.2020.11.25.14.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 14:12:59 -0800 (PST)
Subject: Re: [PATCH] thermal: amlogic_thermal: Add hwmon support
To: Dongjin Kim <tobetter@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201125162405.GA1263100@paju>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c9e48840-2a96-4d90-38aa-27f95a31eef3@linaro.org>
Date: Wed, 25 Nov 2020 23:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125162405.GA1263100@paju>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_171304_489708_3D51D5DC 
X-CRM114-Status: GOOD (  17.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGkKClRoYW5rcyBmb3IgeW91ciBwYXRjaCBidXQgZXhhY3RseSB0aGUgc2FtZSBwYXRjaCB3YXMg
c3VibWl0dGVkIGFuZAptZXJnZWQgWzFdCgogIC0tIERhbmllbAoKWzFdCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXguZ2l0L2NvbW1p
dC8/aD10aGVybWFsL25leHQmaWQ9Y2I2OGE4NTgwZTIwODZmYWQzODU5N2FmNGM2MGQzOWRlOGRm
MGNkZQoKT24gMjUvMTEvMjAyMCAxNzoyNCwgRG9uZ2ppbiBLaW0gd3JvdGU6Cj4gRXhwb3NlIEFt
bG9naWMgdGhlcm1hbCBhcyBIV01PTiBkZXZpY2VzLgo+IAo+IAkkIHNlbnNvcnMKPiAJY3B1X3Ro
ZXJtYWwtdmlydHVhbC0wCj4gCUFkYXB0ZXI6IFZpcnR1YWwgZGV2aWNlCj4gCXRlbXAxOiAgICAg
ICAgKzMyLjIgQyAgKGNyaXQgPSArMTEwLjAgQykKPiAKPiAJZGRyX3RoZXJtYWwtdmlydHVhbC0w
Cj4gCUFkYXB0ZXI6IFZpcnR1YWwgZGV2aWNlCj4gCXRlbXAxOiAgICAgICAgKzMzLjQgQyAgKGNy
aXQgPSArMTEwLjAgQykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb25namluIEtpbSA8dG9iZXR0ZXJA
Z21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJtYWwvYW1s
b2dpY190aGVybWFsLmMKPiBpbmRleCBjY2IxZmUxOGU5OTMuLjJmY2U5NmMzMjU4NiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiArKysgYi9kcml2ZXJz
L3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBAQCAtMjksNiArMjksNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvdGhlcm1hbC5oPgo+ICAKPiAgI2luY2x1ZGUgInRoZXJtYWxfY29yZS5oIgo+ICsj
aW5jbHVkZSAidGhlcm1hbF9od21vbi5oIgo+ICAKPiAgI2RlZmluZSBUU0VOU09SX0NGR19SRUcx
CQkJMHg0Cj4gIAkjZGVmaW5lIFRTRU5TT1JfQ0ZHX1JFRzFfUlNFVF9WQkcJQklUKDEyKQo+IEBA
IC0yOTEsNiArMjkyLDkgQEAgc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAg
Cj4gKwlpZiAoZGV2bV90aGVybWFsX2FkZF9od21vbl9zeXNmcyhwZGF0YS0+dHpkKSkKPiArCQlk
ZXZfd2FybigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGFkZCBod21vbiBzeXNmcyBhdHRyaWJ1dGVz
XG4iKTsKPiArCj4gIAlyZXQgPSBhbWxvZ2ljX3RoZXJtYWxfZW5hYmxlKHBkYXRhKTsKPiAgCj4g
IAlyZXR1cm4gcmV0Owo+IAoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
