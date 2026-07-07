Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C75C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pP/2IenJdcUBDKp/Im3Er1MtGl/g/KGLvY2CiSAbkbg=; b=EShBYDIIfOZ3qR
	9TuR9VhsXqTVhzVrdweoTtq+kNwGWzBICTAafGqp2TVNeo5D59j12nTU05pyj/7W7ZlTpVGRhX5xS
	GN56rtCY9Gqhp0PPTlbsFXl5YZ1nx96miXi8n5oWWtmJzMJiLYPcmGYvkCDXLl2ZdypBMcHXrcF6p
	fZYVcO9ONwL89+LM4yDeD3IyY34BmVBxLGKU0Ctmsp/jZ3RpiyX15P5RUlLMYdVOzarOKZtHzKBcB
	/kHZxnKooV4J4MqLP+1M+mMx6FoKWeGiGn9/YuRC/H+ltH1bZtNOjPcBHkRJr0I0e+2eRFxssmZ4B
	0eOfbbHjFLBlG/3d1pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBc0-0000000FmJj-1DX7;
	Tue, 07 Jul 2026 19:37:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbu-0000000FmIJ-45v4
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:37:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cae1a3a744so34121995ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453058; cv=none;
        d=google.com; s=arc-20260327;
        b=n+eypWtXu5qVAbcA3W/k73ngpUUIDKgOCYI3oELU19CjrKZ47IC1HSIXcFhIDtEPd3
         0g+48funpwUkwgG0VCt1TUv0mvgbjtSfPGc71nmq7qxxuoAJhYajhY4v8gdxSjM8yFxf
         BYoTRHf2aCdor3eC0eNlBEwzMwUGsoEP8SOb+t3xLNUwWlCrlkk9J5uOl1B2072izOHC
         Z2wdhkfrZ9WPZT8qEYz669nPj8qsHct8vnjOENJFQ7ZHygbNSm8my4g5jJwJ0YsNKv7v
         NWiZUn9HlAxfSYy7JCWUixuhcN3jn5YEkx+R4olVgwIY9bzY5jMj+bFu3V2+9lx1IKkk
         yKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        fh=f/ywAY0Ctfr3xOgKHhGUwbOjcLxjSHJGw7aFRT7J9cs=;
        b=mSSjuCriNifJ0h3xjIycR9b98pAibYqDR3kRfqaI/x6t80Wb/uIiQrig995bOWgO/f
         s1+22xCxddqdaMFQxKBpAP+Suv4746f1AYJDfGNreAXnCpz323rVPY2ZLtNVUIz+p7ME
         8Iw2BMXWTQFAUYT7d9ORuPvpLTpwDT0kNnztTGU+dXt2+DqWAGez8hoi2ADO4MibQZRw
         2DhOI0C6MXsVSysdbdzxJrAAD7kVCBL4VTggAe67oqrW6aPZfGxU+qqbBr/GmMSYD6fl
         kZDvHydLvwA+KMqe3kOeWElo8Avv1qVHyWZpu4G9LUGa2pYh6+xcbEjC32mOURbw+rJw
         6Hrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453058; x=1784057858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=IhVwxawy+17uX6Zas4mg+z9xO53Yj2rdSk4QpCQPQ5AOCkfGEOXwhm7OhCu9kqCHJP
         qJ4K1mNtou7w7MGculx58TFmoWli68JQPvuGFsDMcXYrjjPRlRBG9K1IlSOSip4bL1S4
         CRnBtJ5uAH36Jp+yAHIjUo984V1fY8SvNHb452oFN02gQTFWs26vQ5xb0Cici0/S4nKy
         yx2N/ESoJZz/Vfrbc5DhpPmNcaAr/XtpcfDomhLW4hfEmQiSKmEHaw9lNkyeHEiANARK
         zWter1W9eZ0mH0l0nsBM516A7hu3nKO8b8pWxTx6smW7t90y6ggRw5gYRmeMOWuSQKPq
         T9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453058; x=1784057858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=IsuoFqquBZxxgpZhMMn9hEsRO9LpLVrIeXfy5O+LWR0d+PXJYfLsgTXy/td7XDkjEV
         9qPqu7+0Xc2q8QwFgTFQjsVgkUpCOd+m/kkT4pJVa/FQtKHuvcXgNm5zbh9QoWdQykMF
         tXVGIbiAixhbDzQ/xExN9DEQg0aNP728ttCGDCa+LuET24Nf8K2VOeiFaBbcYz4B4F4D
         s8rB+LDmLbOmB4r4s9IFZ54+Kkw1pHVDbHjET4bntIoKjY45zUuhVsHh4Xnuzpg3s2PR
         l/8kmxEmNCXsAL3xkmF4lJ0l22WjMFj/0Gf59rv7o5sEXrAM2v1ZIoIzFZkwDqEiZ1xf
         8w3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNQXUVcMGa1pE6SMJVJ+lW9DqdtNjAla65PVev5h+fKDvhz6k5yBJVlwDFLmwwRi2U0zyg1bF6Lm1AqRAw@lists.infradead.org
X-Gm-Message-State: AOJu0YwUAaf4GJtRNhObFsGmjVvPK0s0J1M092eDJIY8xicpXv/qhb/N
	QDkvvYbUSvY6hmGP6KWacGye70WEglYEZsQ7KllSDpm/428RhXKGjnLjm/NqBeNTALtWl9Xdy2u
	zxbNWhkDoDhfAQ6DplLjC8lZph6rA09auc9rF
X-Gm-Gg: AfdE7cmop2s669bsRKdQRfMbz0xomvipzIZOzl81fBF7C0uqleTCX1nyk4V73PBHxO/
	3w/avSqc81lM8zPuvfDsZpTejfyzROVp1yYsjvT67quUy5CMnUyudpHoxtF4kmCm+CWC8x6oC+i
	+lFj9SA5sn362HbFx2HLio2mGyi1S5E0dyzRwywgNE28mgwrlRzlsS7FqtGNhtvSg3Ksqc+LccD
	7KlS9AGGVWQUy98nEXWbMYeJHd4IyE3BihPsPcHd/GH/n2KsrFdJmlCZFsBxc0keDm+YbE4BRnp
	szll/X7/9nKEMvzrzNOPFwr0OKl1UU8bMv6i
X-Received: by 2002:a17:903:244a:b0:2cc:9a86:9c42 with SMTP id
 d9443c01a7336-2ccbf1b95demr64908935ad.45.1783453058116; Tue, 07 Jul 2026
 12:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-3-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:37:27 +0200
X-Gm-Features: AVVi8CfQK0siXaeTDeQArGj0PmVREFVpRuWfBiz3ACt-27jHdJsP7_vY7xQZbzo
Message-ID: <CAFBinCDjAo5WTmap1si1=BapdaGzdbP-FDyR4Evx5_EvWSvSig@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing
 nand_rb0 pin to nand_all_pins
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123739_014706_B4246608 
X-CRM114-Status: GOOD (  10.29  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMzo1N+KAr1BNIEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgbmFuZF9hbGxfcGlucyBwaW5jdHJsIG5vZGUgd2Fz
IG1pc3NpbmcgdGhlIG5hbmRfcmIwIChyZWFkeS9idXN5KQo+IHBpbiBkZXNjcmlwdGlvbiwgd2hp
Y2ggaXMgcmVxdWlyZWQgZm9yIE5BTkQgY29udHJvbGxlciBvcGVyYXRpb24uCj4KPiBBZGQgaXQg
dG8gdGhlIHBpbm11eCBsaXN0Lgo+Cj4gRml4ZXM6IGJlMThkNTNjMzJiMiAoImFybTY0OiBkdHM6
IGFtbG9naWM6IG1lc29uLWF4ZzogcGluY3RybCBub2RlIGZvciBOQU5EIikKPiBTaWduZWQtb2Zm
LWJ5OiBKdW4gWWFuIDxqZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0
aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
