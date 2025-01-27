Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5DEC0218C
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jan 2025 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PS2l/xVqjflF//hNvOjo5RwV2TFWsqUX4hDdjceHO3w=; b=A2aU6eKx743PMf
	bWQBQ5StQyMbaQKXoGuFa2bVaeYLStoEblOJG4Jhj0ujr0QFwunX+hlQePXoD1bGysrbCjhrOdgHv
	IG9LRxryayJTtO5QDXFdu0PkXIKKj/5IQQYecauYeiBsOiCXWKWf7NStl2wLC4QstsgJUC2MhRh+m
	qNBMcGLc6ieFu7nvbJx+Ym4DcXYGgCDn1c0EP+HFNWPrf4Q2TLSfteWH74iAlRv/jDO0N/46EcPN5
	oZaRIvrzIAuVsXbY8NwvFHHECVMa5nCW+NLwrPmlzlmRUuTL/8RewTYxmpIx0tIcc12StNZ72Ym8Q
	B/KUApjGoYL9tcM7RA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLu2-000000025V1-3RIg;
	Mon, 27 Jan 2025 09:59:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLu0-000000025Tk-2u29
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Jan 2025 09:59:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4282037e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jan 2025 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971970; x=1738576770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=R29CjJFdNJ/yH6bP5Are1le53wqs4sMBL61m/JfKb5rCiHdCoZZCsq4Qk7QVBj803g
         eo4HQE8QAtF+P0Ip0KHSy10Ar8Pv1ch0FW5NSjzJB+Xrlhx/xKRMC53G2//7Ev/QmjZv
         HLjhlQOsm8c3fMzmYd9EA5tkNAORBD6wcfE8F3Vv3302R1SUFgK8i0Jo6DMbdhkxUCzP
         x7d9e7JuG2E5iM/BfcMBdNGT206ZFypIYSWqIm1FU8XmQMbRBAnu18sMsTOUV2mRC1rW
         P4NXBHpZjWMtSs79BCASLVowW4r6vsaFD4hU0RNXbS2HmK2Zy7tjivU6Jiq6qnlmrSpW
         1eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971970; x=1738576770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=M5xZf7wLxhuKyY/HnDiqRaTq9pHwHYERWG3UyEQSXJJOFCfIHy0SU33Q+ZUjCEy5Rx
         TsUJn72CzgE6dW/TVZL+VicFD8JfF58MzRzUBeMgf7sdSZCNQ64uj5qUcBo8P1RQeK/g
         y03HVOq0KtMJ+ExE+2UgNy4mZ6HwAshDDwlvucqynxlbxDz7MXjWhAypRtIiRkRGopKZ
         5+Q1xBnCXfFx18buEO1a1NImNK6kfPt0jVAqxWw2HmgTqeXQp8E+/Qiqe5PtTrcROUtT
         /7BI2qU5Z93nMYGfu2vfp01LwVml6hV8zb3+L8+fCAmTUW3syt8kAecQtwHbHPBCD/yT
         Vzbw==
X-Forwarded-Encrypted: i=1; AJvYcCUu/7vn1u21BjuChSLrZX2/aOH5P7fsJFGrTv/seiIw52xhtEYZLN7T1nAi9m+6zVr0qW658lgSbg4CbrB3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+DimQLnDHpysRR7riBhTAuuLy9AkLWFGJhC7hEOAmGu6TsANq
	Gbg5wpIseaSk/GdJVhQ2chWOe2TGgnRRiLQitBFlkeXgEJy93UZmlwfU7UgAoA/8/ognZ6keQdT
	oEFUkaRtFkDoN1oSwJ6enc2BSf3hjGwVx5ae8ag==
X-Gm-Gg: ASbGncsNv5ThdYIgUzxKCYOsfj62XBrJIL8t3xiF/KwXixS9IRbmasA/5rHU3Qqvj+y
	EfRz0TK7yFZfM5BXKuZHmsfGwCBDY9fkRCChx5i4byclRmCB6GCBdj6TyPbm7
X-Google-Smtp-Source: AGHT+IHqpm1ys9+lwbd/QxujcbzJL4i0yKhhKzjeujkw2d5Z1I5Id1mRs2qKI/MXH9CQY+F8hE4OzkVsIK/ZHQmuZJE=
X-Received: by 2002:a05:6512:1312:b0:542:234b:9a6a with SMTP id
 2adb3069b0e04-5439c281f9amr15646461e87.33.1737971970154; Mon, 27 Jan 2025
 01:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com> <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
In-Reply-To: <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jan 2025 10:59:19 +0100
X-Gm-Features: AWEUYZlw3ilYGs0ATdzTHL2yQh4eIVQWc6_6OrIXQyU_MtlIHFv72pFxPtpk8xc
Message-ID: <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_015932_740720_BC86A7BD 
X-CRM114-Status: GOOD (  12.07  )
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

SGkgWGlhbndlaSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFdlZCwgSmFuIDIyLCAyMDI1
IGF0IDQ6MjbigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJlbGF5CjxkZXZudWxsK3hpYW53ZWku
emhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogWGlhbndlaSBaaGFv
IDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQgYSBuZXcgcGluY3RybCBkcml2ZXIg
Zm9yIEFtbG9naWMgU29Dcy4gQWxsIGZ1dHVyZSBBbWxvZ2ljCj4gU29DcyBwaW5jdHJsIGRyaXZl
cyB1c2UgdGhpcywgc3VjaCBBNCwgQTUsIFM2LCBTNyBldGMuIFRvIHN1cHBvcnQKPiBuZXcgQW1s
b2dpYyBTb0NzLCBvbmx5IG5lZWQgdG8gYWRkIHRoZSBjb3JyZXNwb25kaW5nIGR0cyBmaWxlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvcGluY3RybC9LY29uZmlnICAgICAgICAgICB8ICAgMTggKwo+ICBk
cml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtYW1sb2dpYy5jIHwgMTA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCgpQbGVhc2UgbW92ZSB0aGlzIGZpbGUgaW50byBkcml2ZXJzL3BpbmN0cmwvbWVz
b24gYXMgSSByZXF1ZXN0ZWQKZWFybGllci4gV2UgY2FuIHJlbmFtZSAibWVzb24iIHRvICJhbWxv
Z2ljIiBsYXRlciBpZiB0aGF0IHBsYWNlbWVudAppcyBjb25mdXNpbmcuCgo+ICtjb25maWcgUElO
Q1RSTF9BTUxPR0lDCgpUaGVyZSBpcyBhbHJlYWR5IFBJTkNUUkxfQU1MT0dJQ19DMyBhbmQgUElO
Q1RSTF9BTUxPR0lDX1Q3CmFzIHdpbGwgYmUgdmVyeSBhcHBhcmVudCB3aGVuIHlvdSBtb3ZlIHRo
aXMgZHJpdmVyLgoKV2hhdCBpcyBhICpwcm9wZXIqIG5hbWUgZm9yIHRoaXMgZmFtaWx5IG9mIFNv
Q3M/Cgo+ICtNT0RVTEVfTElDRU5TRSgiRHVhbCBCU0QvR1BMIik7CgpPbiB0aGUgdG9wIG9mIHRo
ZSBmaWxlIHlvdSBoYXZlOgo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CgpTbyB0aGlzIGRvZXMgbm90IGFkZCB1cC4gRml4IG9uZSBvciB0aGUgb3RoZXIuCgpZb3Vy
cywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
