Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF9CCAC5A7
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Sep 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KP7skI13VM1o7rxn9VC6SQNVIQSMcHZEOLHJUFK4UpM=; b=YKIVCmPBauaDf6
	QQNSooMeSJ/zVQnA5hmiM2zCLnCtzJGZwlIXBrHKEe6oRECBHh8409e99yJd22T1WKsndVtTE6+ol
	Ot1uTilyh0MKc5gtp4WIUEfKsh0Y+aioJ8EMw4t1wUvGJ7+LZlXg5P3FGYxvF0bH7HWOtoGx4WFM0
	7tsbciwIT+VHDc9fh3Ol9fYunlBsYQTILgBZj88c22RkAesH26wDX1UU96aQzc8qEzXzgXvWCS8Lu
	zGqKBTTQ+D6nYGGKJtcr9cDco+m3Ukf++GnKTtI2pOfeMS3ErIhpaiJ8qdZEYCW36jCZhQoMo7e9P
	z3nIdHfuRWfn+gTttF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0J4Z-00000007S7P-2tgx;
	Sun, 21 Sep 2025 12:21:43 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0J4W-00000007S6u-11RM
	for linux-amlogic@lists.infradead.org;
	Sun, 21 Sep 2025 12:21:41 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b54dc768f11so2550027a12.0
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Sep 2025 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1758457299; x=1759062099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJSacj7AG4ILM3IhKBoSOgA0n/MoBkGpNIVRvcCoIHQ=;
        b=XbJS5fBWhceVsLriSWv311Q7vl72A/icWf32dET9xtm8IH68CkHcTVaWgigLujwcI2
         3oQaZPaWSfjx8hlm+hOAPD63Wm81f9dcvRANao4AQ9D0/4wiwDsTsDejhCLjp/WhJL1x
         vE0CZnL8Gdlyl+J3vcBUIxWuHYlozQQoKe/VCcl4/aGhedaNupBwDxO2NDpYGXnEodnb
         zrgp5ZXZIMdxBUS5DMB0UjQqQOZ4QQfRiU2O+aXp+qLU2GWDWqufcSrA57r3ciFX9oMb
         nylfSSmmC16EXg+ZCS5eMmpr1S9BZHo+SsLpXeZG9YZqErfLGmAKMmR2UA/Ai2mUh9ub
         /77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758457299; x=1759062099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJSacj7AG4ILM3IhKBoSOgA0n/MoBkGpNIVRvcCoIHQ=;
        b=gJ+XMbSkclKSim/ah+we8TskGqWz1jA4xOrVblsluynllh6UNX216F/UCrnDHJjrq+
         /bsna7BEstsZBuzyG2azRtMX6xlCHHHKk22q4uWyQy88DA8odhoNzyDyOC4GMKYPTVha
         esu67t9Mr6Z16GISHRK5FKeb5nBtpvbdkugRSk8ZeFYzasfhL3TrAZ1jBBnwVbPV9/Gw
         UCFUOpp9zOmcslZ/tRPgVWD2OY8Wrot78gcMiaf3cUmp1sPVy/EyWe43lbqEO30iDdNq
         +3IIF8MURcfpyu0PT2ACUf1fEASKI4tr7CIJ/OXgOVSqv5x/fF5kl8BWlQ8cVrbo3Pb4
         ZRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj1WegHCZlTmpH1mOiHFPWPLEy1WmRyaIB1V+ScVbmpd4j+RZNsuNVRiajWxczbl5cH0uidL/781q5WDP3@lists.infradead.org
X-Gm-Message-State: AOJu0YyEc5hqrKHJVrMOatVJxftWjoTk34hfY7FD5mAPVtAdO0XamAk0
	vrOQ1Z8bhHlfiGG+qmoIy7B/vJ0LeaDa+B5vwhWmwqlYGBDClBQcsDdrryKQJQHW5+zTq3eSzsC
	/jRoGK7JLW58AYCtde9TTF9I7BDj/wikez6+F
X-Gm-Gg: ASbGncuxYOp0r+uV/FkLw5KWCMOj25FEHSJnIz9fdo17IXjC4JVupu2FI+slEXsiYhu
	wJqChaYiMXcfjIv21Qhge/lVdgXK3+Fk8swSo8Zbt3tXEQAM58dbFQtcsgX81m4kEXsGQlL1D4p
	aZxzKShD3dyiSzdvj+vl4YME6DhRUpkWz9VzgnkYBwpLa0dNzOAWWB6npekTqUtVXOXFpxtMp1Q
	tz3WZt5cxc4Dug+3syhm91b9nL1zu2WureC17ss
X-Google-Smtp-Source: AGHT+IHxVUgYnrAwJ5OpwEe3a87VRT7ipKjcAWLyiv2qdzKscH5CGBdYdKav7D1rg7rvs2u3DavET/DGycZAJPZEzvc=
X-Received: by 2002:a17:902:ce0f:b0:26e:146e:7692 with SMTP id
 d9443c01a7336-26e146e795dmr86596405ad.17.1758457299072; Sun, 21 Sep 2025
 05:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com> <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
In-Reply-To: <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Sep 2025 14:21:28 +0200
X-Gm-Features: AS18NWBkK72iXzXS1RwqWQ8AGRSrCLxvKKstfcdk8Ru-9k8WuxA-Kr0_IG8ezi0
Message-ID: <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and factorisation
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_052140_306539_BFD019D3 
X-CRM114-Status: GOOD (  19.93  )
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

SGkgTWFyaywKCk9uIFN1biwgU2VwIDIxLCAyMDI1IGF0IDE6MjXigK9QTSBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDU6
MjU6NThQTSArMDIwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiA+IFRoZSB3b3JrIG9uIHRoaXMg
cGF0Y2hzZXQgc3RhcnRlZCB3aXRoIHRoZSBzdWJtaXNzaW9uIG9mIHRoZSBBbWxvZ2ljIHQ3Cj4g
PiBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIgWzFdLiBUaGlzIGNvbnRyb2xsZXIgaXMgZmFp
cmx5IHNpbWlsYXIgdG8KPiA+IGV4aXN0aW5nIGNvbnRyb2xsZXJzLiBPbmNlIGFnYWluLCBpdCBy
ZWRlZmluZXMgdGhlIHBlcmlwaGVyYWwgY2xvY2sgbWFjcm8sCj4gPiB0aGUgcHJvYmUgZnVuY3Rp
b24gYW5kIGNvbXBvc2l0ZSBjbG9jayBoZWxwZXJzLCBldmVuIGlmIGl0IGlzIGFsbW9zdCB0aGUK
PiA+IHNhbWUgYXMgaW4gb3RoZXIgY29udHJvbGxlcnMuIFRoaXMgY29kZSBkdXBsaWNhdGlvbiB0
cmVuZCBoYXMgYmVlbiBnb2luZyBvbgo+ID4gZm9yIHRvbyBsb25nIGFuZCBub3cgaXMgdGhlIHRp
bWUgdG8gcHJvcGVybHkgYWRkcmVzcyB0aGUgcHJvYmxlbS4KPgo+IEZyaWRheSdzIC1uZXh0IGJy
ZWFrcyB0aGUgYm9vdCBmb3IgbWUgb24gdGhlIExpYnJldGNoIEFsdGEuICBUaGUgc3lzdGVtCj4g
ZG9lc24ndCBzaG93IGFueSBvdXRwdXQgb24gdGhlIGNvbnNvbGUgdW5mb3J0dW5hdGVseToKPgo+
ICAgIGh0dHBzOi8vbGF2YS5zaXJlbmEub3JnLnVrL3NjaGVkdWxlci9qb2IvMTg1MzIwNCNMMTYw
Ngo+Cj4gVW5mb3J0dW5hdGVseSBlYXJseWNvbiBpc24ndCB0dXJuZWQgb24sIEknbGwgdHJ5IHRv
IGRvIHNvIGF0IHRvbW9ycm93IG9yCj4gVHVlc2RheS4KPgo+IEEgYmlzZWN0IHBvaW50cyB0byB0
aGUgcGF0Y2ggNGM0ZTE3ZjI3MDEzICgiY2xrOiBhbWxvZ2ljOiBuYW1pbmcKPiBjb25zaXN0ZW5j
eSBhbGlnbm1lbnQiKSB3aGljaCBsb29rcyBsaWtlIGl0J3MgYSBzcXVhc2ggb2Ygc2V2ZXJhbCBv
ZiB0aGUKPiBwYXRjaGVzIGhlcmUuICBEdWUgdG8gaXNzdWVzIHdpdGggdGhlIGJvb3Rsb2FkZXIg
aXQgY291bGQgcG90ZW50aWFsbHkgYmUKPiBhbiBhZGphY2VudCBjb21taXQgYnV0IHRoaXMgbG9v
a3Mgc3VzcGljaW91c2x5IHJlbGV2YW50LiAgQmlzZWN0IGxvZywgbXkKPiBpbmZyYXN0cnVjdHVy
ZSBkb2VzIHJldHJ5IHRoZSBib290IGEgbG90IG9uIHRoZXNlIGJvYXJkcyBzbyBldmVuIGlmIHRo
ZQo+IGZpbmFsIGVycm9yIGlzIGEgYm9vdGxvYWRlciBpc3N1ZSB0aGVyZSB3aWxsIGxpa2VseSBo
YXZlIGJlZW4gYm9vdHMgdGhhdAo+IHN0YXJ0IHRoZSBrZXJuZWw6CkEgZmV3IGRheXMgYWdvIE1h
cmVrIHJlcG9ydGVkIHByb2JsZW1zIG9uIGFuIE9kcm9pZC1OMiBhbmQgcHJvdmlkZWQgYSBmaXg6
IFswXQpJdCdzIG5vdCBxdWV1ZWQgdXAgZm9yIC1uZXh0IHlldC4KClBsZWFzZSBnaXZlIE1hcmVr
J3MgcGF0Y2ggYSB0cnkKCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dp
Yy8xNzU4MzQ0MzcwMDYuNDM1NC4xMTkzMzU0NTE3NDAwNDYxNjM3M0BsYXpvci9ULyNtMjkxMjhi
MGFjZWMyZGI2MmQ0NTk3MWQ5NGExYzM4ZmVkYzg0OTNhMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
