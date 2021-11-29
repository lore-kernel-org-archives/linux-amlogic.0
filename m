Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD88C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Nov 2021 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=riqhPA6Pnw4um8i7au+oe98msTQnyZeRGb5mL3WJaMQ=; b=hpriAFuHIen6VmUGdK3Bas7aYj
	q3xzCA03r6fehjG0NkBndLidh9VfRzHXLq8CpAKhWgHJG3mrAKgZhQURY1Kus+QaBXdliGiMsoymC
	J1gV/4r8KBUkcBltWxvplx/714BrPo+ZsLlRhZCAMPuhYj47heyG+kS1elh5//elhP0ym2X1RSuJa
	gtyJV8V8lxrUdEs6/6Z63gp3bbYpZDZb3d62F6yqYEe88fMM/5hhQun40OHJexeDLUkt8l2GaL3cw
	n5r3e9rVoA585CWi/yXdXw36kxqER/5yoGNk7ELZ+NllcyXa2qy7+PBnE+08IxmthvvAiWMdeN6Fi
	JWvBsWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdse-000PZm-3D; Mon, 29 Nov 2021 10:27:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdsa-000PYf-NR
 for linux-amlogic@lists.infradead.org; Mon, 29 Nov 2021 10:27:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so12040771wmb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Nov 2021 02:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QI+Kjmn/F4SvLqkut6CRJaO32F/YOzz1yTH9UbDY6tc=;
 b=xaho+IPUaX0yfVev9HQ7wuPEGAop8gi86fsbJ9U2mSSIxqbdf6pjHPdfZa/V1k34D8
 FsKIC09ahz2Hi/gGEe26VufFKl6d6WbcBSfLZ0L6sHl1NIdvi3NxmqU/BSHKE3BbbPZw
 YfFvneLY3v1B9m0Q7VOtKNDkBYOcp0S0fqPVlcyihrqlDMfzR3Xhgpw+DTbZfwPZOMPE
 Eg86zig0TLapblgNIV1GnD0rKio3zFNDnPpTnoRxg6Xfjq0xG8bHKqKjmNNLPWZ6jcr9
 frFco3CiOYg+eDWtH/w7bZZc88hPk6ePDSRD99ZYUCSm2QgwyMP23ycvtEj3jbP9aVzY
 6GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QI+Kjmn/F4SvLqkut6CRJaO32F/YOzz1yTH9UbDY6tc=;
 b=nwzx97gGCGCkcrCcue5Y/0w9M6x9DcV5QD+SUtsDZj7VSW8irBaomx4v3bhOiAI1+z
 x9pCgJ6vPt0+MvwmcdSHUH4SGbBVQqz9buci0ZIkmGJBdtDesm+LvHHIDwv33Y9vs8BP
 grr/jiF3ioZapQX8y6u5EeLD/KMu7UnAZSlCcgsDTEoL2OirNpZ6MmcnevyHbw7rhtgy
 I7qLiCsXopvWJUgP3zsDSYpnKD7z8y54xzCQPSE10HaTOpVzLmnjPQEw3JcK7HCZZwQm
 g2iCEfoJ6l07tY+TjSOstMe9MDUeG4oU+ymWflhxZ5u4c1kd3lS2IZjsZY5Cps1iEwDV
 doBw==
X-Gm-Message-State: AOAM530YE+durO6/JEUO2loWF1olfJZI3GRfVruoKPIXlonhQtZ7fLTr
 qkozIZtc18gcC9RXH4Qjq+u2HbuhbqQEMmxj
X-Google-Smtp-Source: ABdhPJwz2abSgfcp1qwCWBsqZslR7XcMRMzzaYWKa0IH9FSvvECVw6wTOuaJxFPembknU9wWxyjVqQ==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr34386781wmq.123.1638181641421; 
 Mon, 29 Nov 2021 02:27:21 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d799:b459:bdc8:e9c5?
 ([2001:861:44c0:66c0:d799:b459:bdc8:e9c5])
 by smtp.gmail.com with ESMTPSA id z5sm24090425wmp.26.2021.11.29.02.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 02:27:20 -0800 (PST)
Subject: Re: YUV Display
To: E Honsch <honsch@telus.net>, linux-amlogic@lists.infradead.org
References: <ba04a76e-377a-9cef-1539-634d27483d18@telus.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3ead7839-f5dd-b7bd-abb3-6033b1517e02@baylibre.com>
Date: Mon, 29 Nov 2021 11:27:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ba04a76e-377a-9cef-1539-634d27483d18@telus.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_022724_830796_5759442F 
X-CRM114-Status: GOOD (  14.27  )
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

SGksCgpPbiAyNy8xMS8yMDIxIDA4OjA2LCBFIEhvbnNjaCB3cm90ZToKPiBJJ3ZlIGJlZW4gdXNp
bmcgYW4gT0Ryb2lkIEMyIGZvciBvdXIgcmFjZSBjYXIgZGFzaGJvYXJkIGFuZCB3ZSBkZWNpZGVk
IHRvIHVwZ3JhZGUgdGhlIHNjcmVlbiB0byBhIG1vcmUgZGFzaGJvYXJkIGZyaWVuZGx5IHNpemUu
IFdlIGVuZGVkIHVwIGdvaW5nIHdpdGggdGhpcyBvbmU6IGh0dHBzOi8vd3d3LndhdmVzaGFyZS5j
b20vd2lraS8xMS45aW5jaF9IRE1JX0xDRAo+IAo+IFdoYXQgdGhleSBkaWRuJ3QgbWVudGlvbiBp
cyB0aGF0IGlzIG9ubHkgdGFrZXMgWVVWIGRhdGEuCgp0aGlzIGlzIHdlaXJkLCBEVkkgbWFuZGF0
ZXMgUkdCIHN1cHBvcnQgYnkgZGVmYXVsdCwgWVVWIGlzIG9ubHkgZm9yIEhETUkgZGlzcGxheSB3
aXRoIHRoZSBEUk1fRURJRF9IRE1JX0RDX1k0NDQgaXMgRURJRC4KCj4gCj4gQWZ0ZXIgZGlnZ2lu
ZyBhcm91bmQgSSBmaWd1cmVkIG91dCB0aGF0IFlVViBzY2Fub3V0IGlzbid0IHlldCBzdXBwb3J0
ZWQgaW4gdGhlIG1lc29uIGRybS4KCkl0IGlzLCB3aGVuIGRpc3BsYXkgaXMgYW4gSERNSSBkaXNw
bGF5IHRoYXQgc3VwcG9ydCBEUk1fRURJRF9IRE1JX0RDX1k0NDQgaXQgd2lsbCBzY2Fub3V0IGlu
IFlVViBpbnN0ZWFkIG9mIFJHQiBieSBkZWZhdWx0LAoKPiAKPiBIb3cgZmFyIGF3YXkgZnJvbSBi
ZWluZyBhYmxlIHRvIHN1cHBvcnQgWVVWIGlzIHRoZSBjb2RlIGN1cnJlbnRseT/CoCBEb2VzIHRo
ZSBkb2N1bWVudGF0aW9uIGV4aXN0IHRvIGltcGxlbWVudCB0aGUgZmVhdHVyZT/CoCBJZiB0aGUg
aW5mb3JtYXRpb24gaXMgYXJvdW5kIEknZCB0YWtlIGEgc3RhYiBhdCBnZXR0aW5nIGl0IGdvaW5n
IGlmIHNvbWVvbmUgcG9pbnRzIG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24uCgpDb3VsZCB5b3Ug
Z2l2ZSBtb3JlIGRldGFpbHMgYWJvdXQgd2hpY2gga2VybmVsIHlvdSBydW4gYW5kIHdoYXQgbWFr
ZXMgeW91IHRoaW5rIFlVViBpc24ndCBzdXBwb3J0ZWQuCgpOZWlsCgo+IAo+IFRoYW5rcy4KPiAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
