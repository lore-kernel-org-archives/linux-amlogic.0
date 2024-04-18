Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BA0C4345F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2024 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdbXsXxxc1qTHfz9xqVGPkR1CtYlBAfGFYTWzUL6JF4=; b=a52FzyFC6myUv7
	dL0opQmgVXYTx1PeHwVSt0GdDbaKnuYjvxH8c55wv4ymcFRZ7egtaYIp0dcM0uC2MvXivAYTFnK5S
	ZOQOrdNQeDk2YFzmTBxoyc+GFHT4RiTIx9D6W31EeoVxXHKsLRKmKyy9h27hghVJQeej6nZChcbmh
	6FxJjHzAygjqulrk0sEIildfBMvBCZQJjSeHzOB267hrLCYkfNqzxTql/2aNJYCNRuD13d5BcNz8m
	F1KMo2nDAg1u1fWL/Cfqs2VnuQC/b4ALp2Pq0d9enWASeTv7EOBp7izRDLBzIZzW7XDmp6VaSMxm6
	KLW+cavQKKvQOZ6mg8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQPN-000000025PY-0Uzv;
	Thu, 18 Apr 2024 11:58:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQPJ-000000025O0-2YXZ
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Apr 2024 11:58:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-418c979ddd2so5498435e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2024 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713441503; x=1714046303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPinJVRyhqHu/v9gEjCPoBsAucy1v6DhCrUwhF/wDyo=;
        b=BeDhYfcAsclo53U0j3rGlhPm7YjtspXc5h2KDFidqgt23ICuTzILAh29G+rYxHjrpf
         cKYxfGUIQMvw8/zVD67CcbVRxQZJZzduPdcwjObBZ4seXRZust6bO9O+f5JUGrOYaxR4
         vV23JN4yCtJy2zxKh8xFuLQFdAe4nNvG+z1N6+pBAbqb5FWbkysC0YCeUPsM2Br1xRjL
         9q8O5IGIW5zoNIdamiuig+jGQicMYw4tEZgLE6o1y1ft+gtPDJFRS9+L1BlFLO1Q1t//
         jsoslSO4Mm+eQ9KXqWfl16Kfs++aJ64jbOYtqQRSbuL8QnIgfTo4WaNTB8QdWiX4jrZe
         x5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441503; x=1714046303;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPinJVRyhqHu/v9gEjCPoBsAucy1v6DhCrUwhF/wDyo=;
        b=Exy8ZFbiDle8L+V80aHYDzruzXeDyzBQ8KcuYggsVUUZgjrtdTxzEE6Y9AvV6h03uR
         ixjzOZyfqvg90PQV73Q9mLF1sgnfdjCkqTUQP3KBvI4gy9LTUW+YYlxkIZU7Zv3kCXmr
         FI26uOSKe2AlWYRsKRIlYDXys2Gcxop16paCR8CYOFwY4uSQ/61r6sb1282789VOz7MZ
         qUCN2bobFmsb+1o96LrovaNQPTSavCtZonZKI8qFISQeV8xCT5IEbF/1hScxNbjl36DA
         J2EJaWSfZ+uDqss2/bFamEHYEpQ/eD4ZiIG9GOFyhXFf8amuruJ1T65Y17X1YllG89pI
         hXHg==
X-Forwarded-Encrypted: i=1; AJvYcCW8LNojzB0O4SVBENCwdgSaI1evMQmqCdoUrq45Cfy3gXlM0wb5CC9+7Ucx5fxL28pJa2H8LzKEhG039pSyH9JgUtnOKJT4HprpuDDhXLLBjrY=
X-Gm-Message-State: AOJu0YxCRsyyzm9avKj7y4EYB3CdBFRt2YEZfBaEFpYQwx30sedZti9I
	fG23NW8Y9vsiVGbLY8NkRGs2uN1nISaUam1rdyTCk4hlyIvKuHloTN3urZiyTMk=
X-Google-Smtp-Source: AGHT+IH+ypEXEnKApXif3+7iV5cx+ug+vkoC+Z6959v+sNY3h0cmujX0MOmJ4M28zqLTPsn2KUXHJw==
X-Received: by 2002:a05:600c:a10:b0:418:792d:f8b4 with SMTP id z16-20020a05600c0a1000b00418792df8b4mr2480514wmp.23.1713441503081;
        Thu, 18 Apr 2024 04:58:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e54:be3b:baad:80ee])
        by smtp.gmail.com with ESMTPSA id k29-20020a05600c1c9d00b00418948a5eb0sm6286143wms.32.2024.04.18.04.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:58:22 -0700 (PDT)
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-6-jbrunet@baylibre.com>
 <24ec3iiudmfapiosygpsvgu7kmdqe6csbkpuzx3p3sa4oyodqu@hshmbpvzhufb>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao
 <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to
 sm1
Date: Thu, 18 Apr 2024 13:57:03 +0200
In-reply-to: <24ec3iiudmfapiosygpsvgu7kmdqe6csbkpuzx3p3sa4oyodqu@hshmbpvzhufb>
Message-ID: <1jplumc276.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_045825_681737_7F1D16E2 
X-CRM114-Status: GOOD (  22.77  )
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

Ck9uIEZyaSAxMiBBcHIgMjAyNCBhdCAxNDowOCwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMDQ6MTE6NTFQTSArMDEwMCwgSmVyb21l
IEJydW5ldCB3cm90ZToKPj4gSW50cm9kdWNlIGEgbmV3IGNvbXBhdGlibGUgc3VwcG9ydCBpbiB0
aGUgQW1sb2dpYyBQV00gZHJpdmVyLgo+PiAKPj4gVGhlIFBXTSBIVyBpcyBhY3R1YWxseSB0aGUg
c2FtZSBmb3IgYWxsIFNvQ3Mgc3VwcG9ydGVkIHNvIGZhci4gQSBzcGVjaWZpYwo+PiBjb21wYXRp
YmxlIGlzIG5lZWRlZCBvbmx5IGJlY2F1c2UgdGhlIGNsb2NrIHNvdXJjZXMgb2YgdGhlIFBXTXMg
YXJlCj4+IGhhcmQtY29kZWQgaW4gdGhlIGRyaXZlci4KPj4gCj4+IEl0IGlzIGJldHRlciB0byBo
YXZlIHRoZSBjbG9jayBzb3VyY2UgZGVzY3JpYmVkIGluIERUIGJ1dCB0aGlzIGNoYW5nZXMgdGhl
Cj4+IGJpbmRpbmdzIHNvIGEgbmV3IGNvbXBhdGlibGUgbXVzdCBiZSBpbnRyb2R1Y2VkLgo+PiAK
Pj4gV2hlbiBhbGwgc3VwcG9ydGVkIHBsYXRmb3JtIGhhdmUgbWlncmF0ZWQgdG8gdGhlIG5ldyBj
b21wYXRpYmxlLCBzdXBwb3J0Cj4+IGZvciB0aGUgbGVnYWN5IG9uZXMgbWF5IGJlIHJlbW92ZWQg
ZnJvbSB0aGUgZHJpdmVyLgo+PiAKPj4gVGhlIGFkZGl0aW9uIG9mIHRoaXMgbmV3IGNvbXBhdGli
bGUgbWFrZXMgdGhlIG9sZCBvbmVzIG9ic29sZXRlLCBhcwo+PiBkZXNjcmliZWQgaW4gdGhlIERU
IGRvY3VtZW50YXRpb24uCj4+IAo+PiBBZGRpbmcgYSBjYWxsYmFjayB0byBzZXR1cCB0aGUgY2xv
Y2sgd2lsbCBhbHNvIG1ha2UgaXQgZWFzaWVyIHRvIGFkZAo+PiBzdXBwb3J0IGZvciB0aGUgbmV3
IFBXTSBIVyBmb3VuZCBpbiBhMSwgczQsIGMzIGFuZCB0NyBTb0MgZmFtaWxpZXMuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPgo+IEFm
dGVyIHNwZW5kaW5nIHNvbWUgYnJhaW4gY3ljbGVzIG9uIHRoaXMgb25lIEkgdGhpbmsgSSB1bmRl
cnN0b29kIGl0Lgo+IExvb2tzIGZpbmUgdG8gbWUsIEkgb25seSBjb25zaWRlcmVkIHF1ZXN0aW9u
aW5nIGlmIHRoZSBkZXZfd2Fybl9vbmNlIGlzCj4gdG9vIG9mZmVuc2l2ZS4KPgo+IGI0ICsgZ2l0
IGFwcGxpZWQgdGhlIHBhdGNoIGp1c3QgZmluZSBldmVuIHdpdGhvdXQgcGF0Y2ggIzQgb2YgdGhp
cwo+IHNlcmllcy4gV291bGQgeW91IGJlIHNvIGtpbmQgdG8gZG91YmxlIGNoZWNrIGl0IHdvcmtz
IGFzIGludGVuZGVkPwoKSXQgZG9lcywgVGh4LgoKPgo+IEJUVywgYjQgZGlhZ25vc2VkOgo+Cj4g
Q2hlY2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4u
Lgo+IC0tLQo+ICAg4pyXIFtQQVRDSCB2NSA1LzVdIHB3bTogbWVzb246IGFkZCBnZW5lcmljIGNv
bXBhdGlibGUgZm9yIG1lc29uOCB0byBzbTEKPiAgICAgKyBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjQwMjIxMTUxMTU0LjI2NDUyLTYtamJydW5ldEBiYXlsaWJyZS5jb20KPiAg
ICAgKyBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgo+ICAgLS0tCj4gICDinJcgQkFEU0lHOiBES0lNL2JheWxpYnJlLWNvbS4y
MDIzMDYwMS5nYXBwc3NtdHAuY29tCj4KPiBJcyB0aGlzIG9ubHkgYmVjYXVzZSBpdCB0b29rIG1l
IHNvIGxvbmcgdG8gcmVwbHksIG9yIGlzIHRoZXJlIGEKPiBjb25maWd1cmF0aW9uIGlzc3VlIHdp
dGggdGhlIGJheWxpYnJlIE1UQT8KCkkgaGF2ZSBubyBpZGVhLiBUaGlzIGlzIHRoZSBmaXJzdCB0
aW1lIHRoaXMgaXMgcmVwb3J0ZWQKCgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCgoKLS0gCkplcm9t
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
