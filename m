Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FCAC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 08:15:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BA6208C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 08:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaPAmyMW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeeHyY+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38BA6208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Afr+p//RxW7mvlQCOZladA/u+hLskLKrd/h0l7h2Hyo=; b=BaPAmyMWTd5Dv9
	7iTxuoTloiaq4fDAXDXDC044zu5/SkNuhRVwapV4yFhglpe336yz4vXLDF4oK8o8yrVY2ffYw2Rvm
	LTIrYsdLM90N7KYQlYajQFYiZWgZHZWH3ATwo+xfxi/NKaf2pqiZBy1rW6NGCM5zrGYZg+gDNoBdx
	+lKML1tSv2RB69pFvmra7TmglTKGVOqs/jMM4Ife9sS/zk10Ij+EbYSAZDt2fNYa6unktTyZIWv2/
	e/Ag8OVPNQz6KN6PyGHHpwZUkvdSUC0HWXjmgvjss8bUAilZ9XiZ99pJ6ZKrMvqt3Ng+XGsiUkZ+3
	ESIXPaf1p+sr2FnQO0qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlphj-00040N-FN; Thu, 18 Jun 2020 08:15:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlphg-0003zm-PR
 for linux-amlogic@lists.infradead.org; Thu, 18 Jun 2020 08:15:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id p5so5012275wrw.9
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2020 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VFAtsOIUbu3lSU/HEGGn9hrUEMDItq984a8uDB0vTG4=;
 b=OeeHyY+YKwWr2fRsYI11CjIJOMFFkdCm85UynZj7MpMoE9cp+TT0NoE8bPVmdKNSzf
 QTIAlb3B23TkGeN9VzxVOhsSJ1N47FjHc0HndFsFSgJunxiS3u/Xh0o6KkKOngoTOzQK
 mzSxMd7ej+ALbFugboPDoWizoX/iKpXRGYPK3I0cDW7KYMWWo/cVVI1DplpNBfOTrIFJ
 DFKek/jSOY2zOffnNr75HeaTp4uUyeotKBquwFBZwQTL7NIrn/D+1UUorehTACtmSScG
 6RsxLv6wCrP/2KFNpXHu95CoxXxBW3VT/5dUcI4iHiTz4sZF8UAEIQVnrQPCBO+p7cdT
 5kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VFAtsOIUbu3lSU/HEGGn9hrUEMDItq984a8uDB0vTG4=;
 b=ul/iKq5gqNhp+s8xEbT2wPGyumy82IC/ONUkgXfnFRkqAWiIIRFaJfgC7hulTTtSTu
 nhRSn1eZWyO4Y3cAPwY44kmr19kazOOzk1Oh5akZvHLiBRLPd1mjGXyH9/rNRqjZdKtt
 QiaSaVuodRFQpYNsK6a2u7TrfdM6IgnFyvAtPdSsNxfi5yZbUuXrt98uFK3LBUHxrgcR
 /6t/zHyloeH9XD/P2nCCyWMESne8JhcKO9Lpw3FNgmh+uVfWcHiWAPnVJn3z4JFDaDY5
 x/RnMpkyUWzQ935Xc8uBgRnjKZr4NjMtgd7YbeyzmFDH/xT8qoHnoQuBS5rmNw36vXcK
 UHyw==
X-Gm-Message-State: AOAM531ntAG7BqE/aUQJtjFwVZr8JCVcn3796SvLePu/iBRXRWf8+sGJ
 SRONWEDuJp8go0A/jBu/7FmYpw==
X-Google-Smtp-Source: ABdhPJw7v4a6RUSX4JeAquXGtY8pIltUKnas1QX4AmwEVUOoZpZugP52IHFdKrlL7jAb5gwUMH7j6A==
X-Received: by 2002:a5d:6809:: with SMTP id w9mr3485714wru.182.1592468119418; 
 Thu, 18 Jun 2020 01:15:19 -0700 (PDT)
Received: from dell ([95.149.164.118])
 by smtp.gmail.com with ESMTPSA id h203sm2112690wme.37.2020.06.18.01.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 01:15:18 -0700 (PDT)
Date: Thu, 18 Jun 2020 09:15:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 2/5] mfd: add support for the Khadas System control
 Microcontroller
Message-ID: <20200618081517.GA2608702@dell>
References: <20200608091739.2368-1-narmstrong@baylibre.com>
 <20200608091739.2368-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608091739.2368-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_011520_831816_57D5385F 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwOCBKdW4gMjAyMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cgo+IFRoaXMgTWljcm9j
b250cm9sbGVyIGlzIHByZXNlbnQgb24gdGhlIEtoYWRhcyBWSU0xLCBWSU0yLCBWSU0zIGFuZCBF
ZGdlCj4gYm9hcmRzLgo+IAo+IEl0IGhhcyBtdWx0aXBsZSBib290IGNvbnRyb2wgZmVhdHVyZXMg
bGlrZSBwYXNzd29yZCBjaGVjaywgcG93ZXItb24KPiBvcHRpb25zLCBwb3dlci1vZmYgY29udHJv
bCBhbmQgc3lzdGVtIEZBTiBjb250cm9sIG9uIHJlY2VudCBib2FyZHMuCj4gCj4gVGhpcyBpbXBs
ZW1lbnRzIGEgdmVyeSBiYXNpYyBNRkQgZHJpdmVyIHdpdGggdGhlIGZhbiBjb250cm9sIGFuZCBV
c2VyCj4gTlZNRU0gY2VsbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQoKQSBwYXRjaC1sZXZlbCBjaGFuZ2UgbG9nIG1h
a2VzIHJldmlld2luZyBlYXNpZXIuCgo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAg
fCAgMjEgKysrKysKPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAg
ZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jICAgICAgIHwgMTQyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9raGFkYXMtbWN1LmggfCAgOTEgKysr
KysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjU1IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQva2hhZGFzLW1jdS5oCgpOaWNlbHkgZG9uZS4K
CkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2hu
aWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
