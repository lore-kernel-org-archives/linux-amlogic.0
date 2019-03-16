Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E1DC10F0C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49DCC21900
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlHmT5UK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T2sBBrDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49DCC21900
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4jmJTzZ8gNycitalH1e82W6r6Bhlf8Kngy+kTihvKc=; b=HlHmT5UKW/ZwnK
	1U/MKvvJ2gZ1bW0fMPOIn+oxdg26o0AMXwFTAaaOtGoi8Kurw7ZdW/P8+uRxvGLRRJUCQg0n/W6Bj
	AVv1AwPlZjaec+4mpKoIGWoIkLfwAr0a/NN266XG+eqEhFGm+HD/zMuQ0LX680NxNnmMAlHT8NTTi
	7SMVSHnlpQ4f0nx98uJnGDLrerjIs5rG8AEpNPF5KCWXa922dQpsSJ+sc0Ouje3X3YZai77YeD9hB
	EZzJssQQ6RrYMkC1N4zwmKLwyrpZEB6IBr1ubPEz86ehmvmPAYV7v1HtAjDIzGlgdRpjMXHTNGWbo
	4hbPF422FiLaVHwpy0TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AGp-0004K2-Bz; Sat, 16 Mar 2019 14:26:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AGl-0004JP-Ju
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:26:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id p8so12445995wrq.6
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=ltoa3Upv+P0qAZWyzwpPOOef5iHNrRysFUSATTIsPTM=;
 b=T2sBBrDzk53ESyl8fhj407/QWiHF7+tN1dVMh0+MPfSGoiMNG0Bt3N7B4/DJtcZ5SO
 VccBV6ZafHkTfQqMtFCte6RAua4W2GZ82viM8nJ1XedAqeL33iA2xJEEQ1iGKdBtfwAh
 LMrlmsCPoL79i6/8IEWyVbe70zBPtR82v4ieE7ArYUngICuOMRJb+IWJR/XA3UfJv+wf
 iyzrGkNGLHrlmKvbSv4iXW5znBnsHSSVw/UxEVDEjKiHwGoHSLp2/J77r15iBsliF5Ad
 Th/ktG9ohJxQctdHYvRX9mryJplLY7Yy9MwdpWHi1HfL7hYYbY6vJmxxckAR4DP0IrIe
 Fysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=ltoa3Upv+P0qAZWyzwpPOOef5iHNrRysFUSATTIsPTM=;
 b=DManOn8plf1D4fcZRB+8EXHBXGKXjrBn4YtC6blnBL1yKmvBbXvqkxutdg3G01twjw
 ruiTrUxb6aVSiJ0IYw0xa2sQ2QDpm/jpPRqU4lHsBqB4fL+pdITIJ+gy6M5QWTxKTQ/o
 5UmpLYZ0R2Uil7+N7zGhavklcOZg0OHOGPtDwGhiVEocYRn3AzMR0kI7yNH7TPo614PS
 xWAbyctVR+OUVDj3mhT0NkAy9vWqMRJNeDfXh1PdvA6Bg0icnm6zSCHT6yzZ3M5zvWfc
 241woO0WAeK+jAK2r2gyWtftVV7hT5255KIlSppdBmAmrE2mVGaXSQnLMbXcuz6F6CbD
 nIbA==
X-Gm-Message-State: APjAAAVjyEgQ6Tl8oJgDBClZU4CGDNLPCCSeEuxWpylE2NXHVdIEL8hB
 asWcPdvTSu3Mox85UkNZSUnd6g==
X-Google-Smtp-Source: APXvYqxJyd8JDPQX+cmqgIRxJ2EMiZxWvPTWmtR8krzWrbe90k4wG5XmLH33lAwo/lo9BfLuF8jS7Q==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr6434159wrj.92.1552746397157;
 Sat, 16 Mar 2019 07:26:37 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 e5sm2922034wrh.71.2019.03.16.07.26.36
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:26:36 -0700 (PDT)
Message-ID: <5C8D079B.5020803@baylibre.com>
Date: Sat, 16 Mar 2019 15:26:35 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/9] arm64: dts: meson: g12a: Add AO Clock + Reset
 Controller support
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-2-narmstrong@baylibre.com>
 <CAFBinCCF81Af=5F19NT337Tfx+oQzx7-zFu2063z7wSfU3qfjQ@mail.gmail.com>
In-Reply-To: <CAFBinCCF81Af=5F19NT337Tfx+oQzx7-zFu2063z7wSfU3qfjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_072639_707979_BE37960B 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpMZSAxNS8wMy8yMDE5IDIyOjA3LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoK
PiBIaSBOZWlsLAo+IAo+IE9uIFRodSwgTWFyIDcsIDIwMTkgYXQgNDoxNCBQTSBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Pgo+PiBBZGQgbm9kZXMgYW5k
IHByb3BlcnRpZXMgZm9yIHRoZSBBTyBDbG9ja3MgYW5kIFJlc2V0cy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4gLS0tCj4+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS5kdHNpIHwgMTcgKysrKysrKysr
KysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEuZHRzaQo+PiBpbmRleCAxOTFkMzFk
Yjk4NTMuLjBlYjUyMjBkYTgyYyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMmEuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZzEyYS5kdHNpCj4+IEBAIC0xMjIsNiArMTIyLDIzIEBACj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICByYW5nZXMgPSA8MHgwIDB4MCAweDAgMHhmZjgwMDAwMCAweDAgMHgxMDAwMDA+Owo+Pgo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBydGk6IHN5cy1jdHJsQDAgewo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neC1hby1zeXNj
dHJsIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNp
bXBsZS1tZmQiLCAic3lzY29uIjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4MCAweDAgMHgxMDAwPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByYW5nZXMgPSA8MHgwIDB4MCAweDAgMHgwIDB4MCAweDEwMDA+Owo+IGlzIHRoaXMgc3VwcG9z
ZWQgdG8gYmUgMHgxMDAwIChHWCB1c2VzIDB4MTAwIGhlcmUpPwo+IG15IHVuZGVyc3RhbmRpbmcg
aXMgdGhhdCBHMTJBIGhhcyB0aGUgQU8gQ0VDIGF0IGFvYnVzICsgMHgxMDAsIHNvCj4gdXNpbmcg
YSBzaXplIG9mIDB4MTAwMCB3b3VsZCBtYWtlIGl0IG92ZXJsYXAKCgpIbW0sIExldCBtZSBjaGVj
awoKTmVpbAoKPiAKPiAKPiBSZWdhcmRzCj4gTWFydGluCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
