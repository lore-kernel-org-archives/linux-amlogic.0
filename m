Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE07C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 18:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB2A60F5E
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 18:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CB2A60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGOSHtJ3/1AjWHJytyQH4GTCxeONWDpVAjEbInT5HtI=; b=CdBjAwRP0jOPip
	melbfedyA79GU+x1oEji0w2x/zWQGSh9Y9kDYyhYnnSSQMkTGIFR5ZFDBxDSHx58dzVtqbux8Mfvl
	EFEYUVORbPHNATo6hQE6t26f5r/pgSd9kFqOFQg/mqKoCKsXZjw/Q+UsBJWYfDqtxEjT9y2utvhmj
	tCJO1z8FPECuyuYHmzIJ1PHWYzjVQL22Ph62Y4DgD8Mcr3aaOr/i4HRZqg19gSIu49ar4z4McpA/C
	l7K/GiDuFIgKs0s+dmzJ/WvN7EBuMjQgjO5Owy/WhqE8xqSkUt/qeWM9ehlq5VDXi8sCrh6PE8kvj
	oaMZPOIZaFeQe2TnTakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG3ad-003D4S-Dg; Tue, 17 Aug 2021 18:13:31 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG3aN-003D1p-QN
 for linux-amlogic@lists.infradead.org; Tue, 17 Aug 2021 18:13:22 +0000
Received: by mail-yb1-xb31.google.com with SMTP id z128so41021192ybc.10
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Aug 2021 11:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7NwteNlJ+8u23Hsu+twQzUFRuemkI7ld+ynYvkYabfE=;
 b=qnkltiRrheB1/zeeBQyRovwwnZPrTnoZCc1KiYhGyjZ0LumWrBP5AwNCUd/G5V9YEE
 mUHY59DBJd8QqanxPvUvpe6IJsyR4U6azBJx4SjG5SBt631OzyGhkHkPgN7GPFgbF1Kw
 Qyo3SArQMQd9yvyGmToQxBywYPUIxwxU90KexT8XowUM97Kt+QYDCpgXhr+Fs0mzZIir
 X7cYB7eYFGFhrG9MRTSQNEd9LPGjAUh+n1TovDrAecoVFJP4M59fWfiLKSxXjL4Ggls6
 FTjDUabcyrRaeUC+iAb9XPvNm/8MKzy9kQmDXwHyikhnI1k1wcKrxTZOZlLGJUrhfz4r
 eK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7NwteNlJ+8u23Hsu+twQzUFRuemkI7ld+ynYvkYabfE=;
 b=EPDfjQJaILKNFSA0XfsBw6O4IPsq3snUT5tHoctzXyhfNh/XaYmq+zeWnQ2RJrahBZ
 XUy9Q43+G6sFGBVsywx2pbRZC3+IDgf+gEaDO0poreysl82LSK7ag783O9wk1MDMQreN
 C12F6sVQD5KLrqmCbN59shtQisQk0YUq0u8u5ESnPrmJwFL34LFHN2e2224EFieZPNY0
 +LIVOEPN4tKHK6FstJl+C5p4x1uo8ryigjNQEGcOAY/RdOVCyS/EuvgDPlbONJTUOI0K
 Zc3TqeN6ncXJJa8+KcpW3LFgOozCUbzxVF1i8qQBNQtBAr5TGv/Wn09E3uYyqxe5K7uX
 m68Q==
X-Gm-Message-State: AOAM530KsZTKCKO8Pq6+LbEyZ16KuwP/LNl8OZWClkLcNnU+8f25eGr3
 WX0PxyLMu7bJk5UaS9MYMx9fmFN88HSHMw8ymw1UMg==
X-Google-Smtp-Source: ABdhPJxg04YMhrsXZwM6lu/UTiwn7kooe/YZ9Az9RT53o7XkLiL3cQyAC7OwEeGCeol8R0kbAV7dGZ7ndc/P9K4N0IM=
X-Received: by 2002:a25:d1c2:: with SMTP id i185mr6203714ybg.466.1629223990252; 
 Tue, 17 Aug 2021 11:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
 <YRtkE62O+4EiyzF9@google.com>
In-Reply-To: <YRtkE62O+4EiyzF9@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 17 Aug 2021 11:12:34 -0700
Message-ID: <CAGETcx-FS_88nQuF=xN4iJJ-nGnaeTnO-iiGpZuNELqE42FtoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Lee Jones <lee.jones@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_111315_884959_B240CAC2 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVHVlLCBBdWcgMTcsIDIwMjEgYXQgMTI6MjQgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDE2IEF1ZyAyMDIxLCBTYXJhdmFuYSBLYW5uYW4g
d3JvdGU6Cj4gPiA+ID4gPiBJIHNlbnQgb3V0IHRoZSBwcm9wZXIgZml4IGFzIGEgc2VyaWVzOgo+
ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDgwNDIxNDMzMy45Mjc5
ODUtMS1zYXJhdmFuYWtAZ29vZ2xlLmNvbS9ULyN0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gTWFyYywg
Y2FuIHlvdSBnaXZlIGl0IGEgc2hvdCBwbGVhc2U/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLVNhcmF2
YW5hCj4gPiA+ID4KPiA+ID4gPiBTdXBlcnN0YXIhICBUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byByZWN0aWZ5IHRoaXMgZm9yIGFsbCBvZiB1cy4KPiA+ID4KPiA+ID4gSnVzdCB0byBjbGFy
aWZ5Ogo+ID4gPgo+ID4gPiAgIEFyZSB3ZSB3YWl0aW5nIG9uIGEgc3Vic2VxdWVudCBwYXRjaCBz
dWJtaXNzaW9uIGF0IHRoaXMgcG9pbnQ/Cj4gPgo+ID4gTm90IHRoYXQgSSdtIGF3YXJlIG9mLiBB
bmRyZXcgYWRkZWQgYSAiUmV2aWV3ZWQtYnkiIHRvIGFsbCAzIG9mIG15Cj4gPiBwcm9wZXIgZml4
IHBhdGNoZXMuIEkgZGlkbid0IHRoaW5rIEkgbmVlZGVkIHRvIHNlbmQgYW55IG5ld2VyIHBhdGNo
ZXMuCj4gPiBJcyB0aGVyZSBzb21lIHJlYXNvbiB5b3UgdGhhdCBJIG5lZWRlZCB0bz8KPgo+IEFj
dHVhbGx5LCBJIG1lYW50ICp0aGlzKiBwYXRjaC4KCkkgdGhpbmsgaXQnbGwgYmUgbmljZSBpZiBO
ZWlsIGFkZHJlc3NlcyB0aGUgc3R1ZmYgTWFyYyBtZW50aW9uZWQKKGlkZWFsbHkpIHVzaW5nIHRo
ZSBtYWNyb3MgSSBzdWdnZXN0ZWQuIE5vdCBzdXJlIGlmIE1hcmMgaXMgd2FpdGluZyBvbgp0aGF0
IHRob3VnaC4gTWFyYyBhbHNvIHByb2JhYmx5IHdhbnRzIG15IG1kaW8tbXV4IHNlcmllcyB0byBt
ZXJnZQpmaXJzdCBiZWZvcmUgaGUgdGFrZXMgdGhpcyBwYXRjaC4gU28gdGhhdCBpdCBkb2Vzbid0
IGJyZWFrIG5ldHdvcmtpbmcKaW4gaGlzIGRldmljZS4KCi1TYXJhdmFuYQoKPgo+IEJ1dCBoYXBw
eSB0byBoYXZlIHVubG9ja2VkIHlvdXIgcGF0Y2hlcyBhbHNvLiA6KQo+Cj4gLS0KPiBMZWUgSm9u
ZXMgW+adjueQvOaWr10KPiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vydmlj
ZXMKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBG
b2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
