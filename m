Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54A2E7718B
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2024 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyeP/NG4yGZVpSMwpxcQmGRES3pl5iA6SWNcDtq2prc=; b=ijMe3e0EAMCd/H
	ThM4gDGUre37FnO70RXEgM3ZWrPIrqwdwN+ipU/+wCdSBQ9UAYMQEi4AiPFUybNA9ImgXj9DyM9SH
	RvTSfi6nHdZY1n4JdI7uX+GhMYK8i9rgFnVV3RqFUdj/4rr7RfzfS2YL6J2M2aqImE2QMquZSfsyO
	W5l/oFTYsaNZNKt64LZwfDxJcB1VyjVz48JUCvseOZZh8skxR8/0ehLT/fcbgouJWlR6cQuqsWVlt
	AnNLSEJ9q+IA47FK35kWf3JozU2gAImmvKnsTkA3gMBuda2aGs443urrq02STC7M8apABvtjgNB9D
	DGO4jiOrDD0cOv6QrF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE81-00000000ikT-2lYR;
	Fri, 27 Dec 2024 17:28:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDzc-00000000hj1-1cAi
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Dec 2024 17:19:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so7857332e87.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Dec 2024 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319958; x=1735924758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=DzZKboGiSl+4FUq1ztL0Eey0oxWQlc9kswBy5BPkg8JMtwndEZa+8Ek11egMNFPFx0
         ZEJtxu3wKkB7YBSX1156lEhRwri7HW/lL5A0rcu0uyd5bER1vMB/GWzqIV8RSuhkxUTi
         zPmv07EPUqTyO3vwFn53GBBFt2wFKETIqEWBffHllRkCzO8uCV8V06joL8KOVszSxDo6
         mNjKyzVEoX3LngH6oFgjjIbi+NgFqvU/50nS9K/L8JJ02nL1B7a8g6h4b1lGyeXJGfjA
         xlaZ0ycZ7C3wcTK4zAFlj+glb3590QTDP+L/eFYSGPdlLWplhZeWLat4tH6n/D6YIb/9
         rtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319958; x=1735924758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=npL8TXtaNLeT1uiqR1QGFfuPZLSoUZO5hytGpyM1mVRwdpNhIq8gx1TZfvDoJA6T01
         y2a3knPHaNMRzsX5S8JfTJgr9GwyRht7HGFcEl11fBf1Vj97u/SYV1dX49ojGizZcq76
         +GkuJsO2xN4wmvPjnr8eQPpArhsD0t1iAoXbKFNgwykXrFOe+CVA+YDRRzY/ze359VC3
         a62HNOYL6/DCOfSAPfEa+3QSoGFOld3IfX9lH7lv7RGYhv/72sD36EZIMJg/cVH9u5uJ
         FhN9409xBgepQ3AtUHNfPPmstGmQrC4xXXfVUpNhqA29bRfTZZRkXt7q1maXp/NB4FAq
         gt+A==
X-Forwarded-Encrypted: i=1; AJvYcCUI3FxRgcjzZMmdTWIOQ9ccpuhepSK9AISnx3MtfrVK4N7FPlKhiXRAMkETN9AjbZI8rYLJY5+vZHu4z7nx@lists.infradead.org
X-Gm-Message-State: AOJu0YwZtllpFacUNnCBpyOnORxn6ThqT8xeGf2Tny6EUgs7vn/ePFPz
	8CO+1Az0GQYXSsSJma54UxqkoNnGboaBdOrDn2KvmH8o4mFVQ15JLgsqGlOs9c7/PuWn5yvsxba
	wASPY8Zci8QvR3O5RqwlptGjQLJHgAXQoA5XMaw==
X-Gm-Gg: ASbGncsgL7UDdVFesTOftr5BFBgDbE0wprm/YCQa2IawA6q+5yY4vv0px05ral7mQN4
	GjXGmuVyDYL/dLUyjTd19/5DuUK/yxTo+LG7B
X-Google-Smtp-Source: AGHT+IFzNcSWitAgqLSjOZTRtHRUbR1A89jwQ+VY2x1PRVkphXKNjTxz5Znr8iriDFxh86d6rMupXkeYXSvCWzdEP2Q=
X-Received: by 2002:a05:6512:1246:b0:542:28a9:dcb1 with SMTP id
 2adb3069b0e04-5422954b10fmr7658536e87.26.1735319958460; Fri, 27 Dec 2024
 09:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com> <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
In-Reply-To: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:19:07 +0100
Message-ID: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Huqiang Qin <huqiang.qin@amlogic.com>, 
	Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_091920_441512_BB15CF7C 
X-CRM114-Status: GOOD (  14.73  )
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

TmV3Y29tZXJzLCBsYXRlc3QgcGF0Y2ggc2V0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1ncGlvLzIwMjQxMjI2LWFtbG9naWMtcGluY3RybC12Mi0wLWNkYWU0MmE2N2I3NkBhbWxvZ2lj
LmNvbS8KCkkgaW5jbHVkZWQgc29tZSBvZiB0aGUgcHJpb3IgbWVzb24gYXV0aG9ycyBvbiB0aGUg
dG8gbGluZSB0byBzZWUgaWYKdGhlaXIgbWFpbCBhZGRyZXNzZXMgc3RpbGwgd29yayBhbmQgaWYg
dGhleSBoYXZlIHNvbWUgZmVlZGJhY2sgb24gdGhpcy4KCk9uIFN1biwgRGVjIDIyLCAyMDI0IGF0
IDEwOjA44oCvQU0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90
ZToKCj4gPiA+IC0gUmVuYW1pbmcgZHJpdmVycy9waW5jdHJsL3N1bnhpIHRvIGRyaXZlcnMvcGlu
Y3RybC9hbWxvZ2ljCj4gPiA+ICAgIHNvIHdlIGtlZXAgdGhpcyBzb3J0ZWQgYnkgYWN0dWFsIHZl
bmRvciwgc3VueGkgaXMgYXBwYXJlbnRseQo+ID4gPiAgICB5b3VycyAoQU1sb2dpYzpzKSBpc24n
dCBpdD8KPiA+Cj4gPiBJdCBpc24ndC4gU3VueGkgaXMgQWxsd2lubmVyIFNvQ3MuCj4KPiBNeSBh
cG9sb2dpZXMuIEkgbWl4ZWQgaXQgdXAgY29tcGxldGVseS4gOigKCkJ1dCB3YWl0IGEgbWludXRl
LiBJIHNlZSB0aGVyZSBpcyBtZXNvbi4gQW5kIGluIHRoZSAibWVzb24iIHN1YmRpcmVjdG9yeQp0
aGVyZSBpcyBzdHVmZiBuYW1lZCAiYW1sb2dpYyIgLi4uCgokIGxzIC0xIGRyaXZlcnMvcGluY3Ry
bC9tZXNvbi8KS2NvbmZpZwpNYWtlZmlsZQpwaW5jdHJsLWFtbG9naWMtYzMuYwpwaW5jdHJsLWFt
bG9naWMtdDcuYwpwaW5jdHJsLW1lc29uOGIuYwpwaW5jdHJsLW1lc29uOC5jCnBpbmN0cmwtbWVz
b244LXBteC5jCnBpbmN0cmwtbWVzb244LXBteC5oCnBpbmN0cmwtbWVzb24tYTEuYwpwaW5jdHJs
LW1lc29uLWF4Zy5jCnBpbmN0cmwtbWVzb24tYXhnLXBteC5jCnBpbmN0cmwtbWVzb24tYXhnLXBt
eC5oCnBpbmN0cmwtbWVzb24uYwpwaW5jdHJsLW1lc29uLWcxMmEuYwpwaW5jdHJsLW1lc29uLWd4
YmIuYwpwaW5jdHJsLW1lc29uLWd4bC5jCnBpbmN0cmwtbWVzb24uaApwaW5jdHJsLW1lc29uLXM0
LmMKCj4gV2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhlIGlkZWEgb2YgYSBzZXBhcmF0ZSBkcml2ZXJz
L3BpbmN0cmwvYW1sb2dpYyBkaXJlY3RvcnkKPiB0aG91Z2g/IEkgdGhpbmsgdGhlcmUgYXJlIGFs
cmVhZHkgcXVpdGUgYSBmZXcgYW1sb2dpYyBTb0NzIHRoYXQgbmVlZAo+IHRvIGJlIHN1cHBvcnRl
ZCBhbmQgbW9yZSB3aWxsIGNvbWUuCgpTbyB3aGF0IGFib3V0IHJlbmFtaW5nIHRoZSBleGlzdGlu
ZyBzdWJkaXIgIm1lc29uIiB0byAiYW1sb2dpYyIKYW5kIHB1dCB0aGUgZHJpdmVyIHRoZXJlLgoK
QWxzbyBJIHdhbnQgdG8ga25vdyBpZiB0aGlzIGRyaXZlciBhbmQgaGFyZHdhcmUgc2hhcmVzIGFu
eXRoaW5nIHdpdGgKdGhlIGV4aXN0aW5nIGRyaXZlcnMgaW4gdGhhdCBkaXJlY3RvcnkuIEl0IHNv
bWV0aW1lcyBoYXBwZW4gdGhhdApkZXZlbG9wZXJzIHN0YXJ0IHNvbWV0aGluZyBmcm9tIHNjcmF0
Y2ggZGVzcGl0ZSB0aGUgZXhpc3RlbmNlIG9mCnByaW9yIGFydCBzaW1wbHkgYmVjYXVzZSBvZiBv
cmdhbml6YXRpb25hbCBpc3N1ZXMsIGFuZCB3ZSBkb24ndCB3YW50CnRoYXQga2luZCBvZiBzaXR1
YXRpb24gdG8gbGVhayBvdmVyIHRvIHRoZSBrZXJuZWwuCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
