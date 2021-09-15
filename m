Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24CC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59D16113E
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B59D16113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4xdAOECKkxjZSKPk4RuQQDxiofs+t5Cdg6+ePhECWAs=; b=JvjtFzSj6x3OkUhxk+sw4ivONq
	ouVZNsxM7j4koARpxYQSf9pwxrkCeeO+/5dFY/7z4QeLB8F8E2BkojRewYS8j9+dfSX4+FjtWHWf2
	6vRNcCQgMy06arsDnPuPkJINufG3iPQO5Wz3W2HmtkgLXD0eh7pkK9LC394lkexYR8w0X8Hy7VRCu
	+b7FGdwzWbA/NiwnIlh/pHtAtGRx+fz0G0c4xShxTASR7+k/oLGI3lh3NoovQzWMawWlvKqA9gOVR
	sE44YmC0fSiafrXP+a6yf/mMb/b+IKr1R64pg8GK83iobQ0kvTITSYr/sesGBWz5pUn4QptVq2mHN
	s9p7Lapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQ3R-008R1i-3R; Wed, 15 Sep 2021 08:14:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQ3K-008Qzn-3X
 for linux-amlogic@lists.infradead.org; Wed, 15 Sep 2021 08:14:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id u15so2443310wru.6
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Sep 2021 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVEQkAxDMKOzrfhEy+02V5t0PQYVTOvMQsfZO862NZ4=;
 b=NIb52wkyb63W7nS/n7zUfgWHLeEY95gpU6CHyYhSEPMVHflp24xG5CSL/PtJ0vM1z7
 jrd5tHOEjlTUoZZGMTmaS1ZIAvesG94Ln4M1QjbQeQXmFH3+K60mAlxzILrXniWEmwaX
 53a0loc7mqmUGQOOlRychMWnmCfpCxv1eVEbrG9ASbSyGD7/2X5IRjKusigN9uGYNeqI
 b1l5bT0XclBJzPv+HRHxL+OwO+iNOgbgf7JC8mydOTTODmtvqzDoB1t44RLHX9VNsLL5
 b5RFtGZZ5a8+YRbgPVFgd9WtIAsGq1H4Zst+g69RNYUU4yl+vFJc6uea9Wma8dAzvsCg
 3jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZVEQkAxDMKOzrfhEy+02V5t0PQYVTOvMQsfZO862NZ4=;
 b=g3NvLxs3MFYv/UnfHT46R5dxjQzY6pyXmYj/mjnWw9TKp+6duPsuXZjlDLXLyVStZH
 VfDVNyyVr58Q1UE05chClwQw7hj47DxKJicpBmNwH2kbCjA/sTF9DyX9U1bCZKYAZX3L
 YUQFEC+91d7vxMXfFX+ZA+oNxCczMLMR3KFR0yRyVB/gvNOOL8NcojZYyXDjtc1YTvVK
 s5LYSg08niYGiGKHShk7uenFq9S7k50zhDfS13s+XFEierROiADZAHSHSYr/tHW1WaQM
 gG69/cml5DfnCwiYaujxB7muOS7ygayCc1RYi36BvU4XFDhYqspLlW/wmmy+wki1HS3v
 Csqw==
X-Gm-Message-State: AOAM533n5eNTB/sTabxrRbugUAPz9k7AI3cv3hqatiaiKD3pPRIeCtVG
 PQOBKXWuivuaA5GvP7T/vBKZCg==
X-Google-Smtp-Source: ABdhPJzwRA0TKa9jdINdtle9VV7hKHDLxy6rVGv7xrGO84QUCgs1I+5BZDBmMuIXlrpdifqz6IDYtw==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr3387573wrr.399.1631693635280; 
 Wed, 15 Sep 2021 01:13:55 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:e510:7c15:5de3:6849?
 ([2001:861:44c0:66c0:e510:7c15:5de3:6849])
 by smtp.gmail.com with ESMTPSA id n3sm3596037wmi.0.2021.09.15.01.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 01:13:54 -0700 (PDT)
Subject: Re: [PATCH] hwrng: meson - Improve error handling for core clock
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
References: <20210914142428.57099-1-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <07a4f824-5a80-7c0b-d8c9-82e89446bd87@baylibre.com>
Date: Wed, 15 Sep 2021 10:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142428.57099-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_011358_231942_13F25CAD 
X-CRM114-Status: GOOD (  21.55  )
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

T24gMTQvMDkvMjAyMSAxNjoyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gLUVOT0VOVCAo
aWUuICJ0aGVyZSBpcyBubyBjbG9jayIpIGlzIGZpbmUgdG8gaWdub3JlIGZvciBhbiBvcHRpb25h
bAo+IGNsb2NrLCBvdGhlciB2YWx1ZXMgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSBpZ25vcmVkIGFu
ZCBzaG91bGQgYmUKPiBlc2NhbGF0ZWQgdG8gdGhlIGNhbGxlciAoZS5nLiAtRVBST0JFX0RFRkVS
KS4gSWdub3JlIC1FTk9FTlQgYnkgdXNpbmcKPiBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKS4KPiAK
PiBXaGlsZSB0b3VjaGluZyB0aGlzIGNvZGUgYWxzbyBhZGQgYW4gZXJyb3IgbWVzc2FnZSBmb3Ig
dGhlIGZhdGFsIGVycm9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2NoYXIvaHdf
cmFuZG9tL21lc29uLXJuZy5jIHwgMTIgKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2hhci9od19yYW5kb20vbWVzb24tcm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29u
LXJuZy5jCj4gaW5kZXggZTQ0NjIzNmU4MWYyLi45ZjNlMmViODAxMWQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYwo+ICsrKyBiL2RyaXZlcnMvY2hhci9o
d19yYW5kb20vbWVzb24tcm5nLmMKPiBAQCAtNTQsOSArNTQsMTUgQEAgc3RhdGljIGludCBtZXNv
bl9ybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChJU19FUlIo
ZGF0YS0+YmFzZSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoZGF0YS0+YmFzZSk7Cj4gIAo+IC0JZGF0
YS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiY29yZSIpOwo+IC0JaWYgKElTX0VSUihk
YXRhLT5jb3JlX2NsaykpCj4gLQkJZGF0YS0+Y29yZV9jbGsgPSBOVUxMOwo+ICsJZGF0YS0+Y29y
ZV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoZGV2LCAiY29yZSIpOwo+ICsJaWYgKElTX0VS
UihkYXRhLT5jb3JlX2NsaykpIHsKPiArCQlyZXQgPSBQVFJfRVJSKGRhdGEtPmNvcmVfY2xrKTsK
PiArCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVk
IHRvIGdldCBjb3JlIGNsb2NrOiAlcGVcbiIsCj4gKwkJCQlkYXRhLT5jb3JlX2Nsayk7Cj4gKwo+
ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJaWYgKGRhdGEtPmNvcmVfY2xrKSB7Cj4gIAkJ
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNvcmVfY2xrKTsKPiAKClJldmlld2VkLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpUaGFua3MsCk5laWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
