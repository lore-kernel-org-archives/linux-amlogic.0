Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323A6C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 06:43:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F15DC20773
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 06:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQ4LXV+s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZse55qA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F15DC20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xYJ69R/Va7exWiE2enzGAg1eBTdhdAn660QlauAf4uw=; b=oQ4LXV+se6t6U1Q62mOG75qdP
	yPIhJn2Y5lvCgpZJXrFoQcycTXesi+7OEPP0AxXFp8784SYRlKlxh7PydVUR5k9PqdMgwmN6jJtPh
	C/TFptlSMoSBrUm6U9/stu/YUexjMIvjeb4Lz9Gj1nenb5nX9qWiH0aRMlAbcWLTen2Jx35CzinIm
	E31TyypS7+ezlfdOyWMXNCRoa92ORpwfzebL4JHZH3m1yNPnqGDrhIO1i2jpZxeWsz8f4MimQ/Z6n
	t3cminNlvRNkRKRmxaPXzkw7IB3WlOOHPKD1CVGH+3WSqtUQxxc1Z0HwVsi3IUr/ZwWMWhu4jLAkK
	A8DQLUYoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joLbj-0007vl-Nt; Thu, 25 Jun 2020 06:43:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joLbf-0007uz-7j
 for linux-amlogic@lists.infradead.org; Thu, 25 Jun 2020 06:43:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id g18so4619935wrm.2
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 23:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T1pmjhgsNTk091RaYm31ooGiGs4gpOBrKUYgQuZlqHM=;
 b=BZse55qAiC3YfYLdIQqPuA5+DPwgkKScMKNg/h4JVt+eNxqyzWzg+4RCgc/4QzK/de
 IT7Fiw5Y5C4YfW8JqtgaFLCQIDYLr4FXYuhOXWa87XKoXtsqr/RIGBBFVAzrxt3mgwhY
 fch0v4d6aC953Wk+oJVkIpH674JE+LnN9nG7shGGvszDdy8XoZfhkcyT84Oc7+GIZvct
 /l1i5gcArVlgaIVLpzU4vkyYb1vntwJKgoRrS1oBEqA7NNLDrlxfNAnzBMJ5xQsEatoN
 5Fv2efLoaQcaUOx7rPg/WjR8DkDlY3DftcCZpsrdL664AWHBiJazbGVFE3O47nZtfHgC
 OQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T1pmjhgsNTk091RaYm31ooGiGs4gpOBrKUYgQuZlqHM=;
 b=R0Ef4W6VEGZUJRE42EF6fMJWE3woaORoNezXPtzkjaUUtxIhFUnqpuACploBC6TXZj
 xMsyZdFAOqJyBdL+JL8pq9waEt9gUr2YU21owAysKcEeH6JcjcgDzqOIfND0Psbhdyb+
 jViOO6XIbL/d9wRpIWoPr9VUYIFB4d+ha2jjemkjB4ged2S0o9qrCE2Ln/M9Y7ksdG/R
 D1hzTH4fR22XnzFM1CYS1cVeL70Fau8HFuZWF/HJBL50NaGdifq4Qv1U8E7PcQOWlWV+
 ZWRInDivaKSWUk07c2bZUjP8WitOs8v31ISLT4zMq5ygFwMDpSqzLhSoj3BAcR1mAKlV
 YRdg==
X-Gm-Message-State: AOAM530Bc4wLaJk2If4g6ZPIqf+u3uscHBCG3Q/JT7Mtc2TVWt1Nwd1s
 NyTDXk3SVOYRtwrB6O7KLkscDg==
X-Google-Smtp-Source: ABdhPJy1S/a+AMaeSQFU5/H9jGC6zRm2J783jA1FKw6ZOCKPHQ7SzwS9JmNv+hZp+cgOowTDDLCGwg==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr186414wrm.387.1593067409915; 
 Wed, 24 Jun 2020 23:43:29 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f12sm40402wrj.48.2020.06.24.23.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 23:43:29 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:43:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 1/2] thermal: add support for the MCU controlled FAN
 on Khadas boards
Message-ID: <20200625064327.GL954398@dell>
References: <20200624161528.12664-1-narmstrong@baylibre.com>
 <20200624161528.12664-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624161528.12664-2-narmstrong@baylibre.com>
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Amit Kucheria <amit.kucheria@linaro.org>, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNCBKdW4gMjAyMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cgo+IFRoZSBuZXcgS2hh
ZGFzIFZJTTIgYW5kIFZJTTMgYm9hcmRzIGNvbnRyb2xzIHRoZSBjb29saW5nIGZhbiB2aWEgdGhl
Cj4gb24tYm9hcmQgbWljcm9jb250cm9sbGVyLgo+IAo+IFRoaXMgaW1wbGVtZW50cyB0aGUgRkFO
IGNvbnRyb2wgYXMgdGhlcm1hbCBkZXZpY2VzIGFuZCBhcyBjZWxsIG9mIHRoZSBLaGFkYXMKPiBN
Q1UgTUZEIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFtaXQgS3VjaGVyaWEgPGFtaXQua3Vj
aGVyaWFAbGluYXJvLm9yZz4KPiAtLS0KPiBIaSBEYW5pZWwsCj4gCj4gSXMgaXQgb2sgTGVlIGFw
cGxpZXMgdGhpcyBwYXRjaCB2aWEgdGhlIE1GRCB0cmVlIHNpbmNlIGl0IGRlcGVuZHMgb24KPiB0
aGUgbGludXgvbWZkL2toYWRhcy1tY3UuaCBoZWFkZXIgPwo+IAo+IFRoYW5rcywKPiBOZWlsCj4g
Cj4gIGRyaXZlcnMvdGhlcm1hbC9LY29uZmlnICAgICAgICAgIHwgIDExICsrKwo+ICBkcml2ZXJz
L3RoZXJtYWwvTWFrZWZpbGUgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvdGhlcm1hbC9raGFk
YXNfbWN1X2Zhbi5jIHwgMTYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy90aGVybWFsL2toYWRhc19tY3VfZmFuLmMKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
