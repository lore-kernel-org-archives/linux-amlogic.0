Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3194DCCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAhb9m/dD6GwFFv/zc2rtNOi7184yU+mtqZNt5+Bec8=; b=LYgUh82hiodcFb
	yNc1EDUgp8wDqUO4eH4GAWSzoLqYnEsCtDkYQIZ8YJPQdvtLHaLpjA+A3RHKuVAschZXdbF6RuPlR
	BbL9Y2Wj3vLZR+PqlHs7lmh6y7/h+2GR/LhKKjylYiwh+D0QuRuhJbKMs6Sw9E7s4Di8zo56PcKX2
	BzYOJbYw1j5AYAU0Xk4gDFEqNF4Ho9GW69bvZtNnqr0sKSF6gpbv/P9HSp1+NhihkEDFX7tdu4ZpX
	XfI9DKfzXChL14Y0gQ8FeA/WgF4NUlDY+sA/1V6MXgAIcTVzv+wZRRaHPrc1rh2Qtg7xe1vmcLJnt
	9QjOXrAfDwuEIiX9Dimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stW61-00000006EfJ-0rxq;
	Wed, 25 Sep 2024 17:46:37 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stW0c-00000006Da4-2beN;
	Wed, 25 Sep 2024 17:41:04 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso993905276.1;
        Wed, 25 Sep 2024 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727286061; x=1727890861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndiDy1mSgmRg6sFvbSZ4TS1m80BKoGDmWCExnl0BG5s=;
        b=FfLMgt6IFgSVOdvC2snD2k7oj76HZAI+0I065QgWMjOTL6aiOwBVba7WWc9siB9+Ad
         H+qtFBqCThhTe3CaycwL5IZPynbijRLPBgUu82B5ymmkzueQPedBuGyuRILUDsouw6FU
         BrsVxPBbCOccKFXkGi9nJtDJS2aUh6nDxrpCVyqqZYnQrVuO9AGf/akTX2b8GbYC0kXC
         ztS/fUMVS07bB5L/mSeYNWkUfi1/f3/nmEuPFA3lhmn6JUkbtaZJAYUKauLi70hDDVO7
         YTzCoRLI35epLGhgoKENTE+uLYuIJ5dNBVE6GdWEYwenYD0T5d8MXFAYwGshXTSqIiF3
         goWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286061; x=1727890861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndiDy1mSgmRg6sFvbSZ4TS1m80BKoGDmWCExnl0BG5s=;
        b=WIEO4KyrDoIU/XMgXGFZHUkXsZ+Y+a4+uromdCncnVs4zUwcQ5NDrgmbS+FBXjEnn9
         t0WfHqdhp2SYPSex7SXquU+Y38Et3KvUlqy/1dA5lEHVvcFIIQcUVwLE9VpicBXZaCud
         +rw4QoET1MMfaj2RdtMXusKHBtt330oZN52yqlKajIR1LF5IKaW5TBQQzlFV47yUMPUN
         HcBMYjMzf0LZ1opxqGQ+yk/xwiFL0ylguPzRGfJ3VOwBVcznrdiyxj62cb1lLOFh7Pnc
         IXIzSadQzacqk05UvADRzeAlZRewxUXD3wiQAWfdpY5CUURU6rKR5nxNdIVc2Xxa8dD7
         rhzA==
X-Forwarded-Encrypted: i=1; AJvYcCUlb8DdBxl1IVIEZ7vLfqg/AqtLkGpfxthZ3LMimk/qAhCnhnYSS6jxy++JlInUzrEoxN2YFDLk3tbci9+lMzaf5w==@lists.infradead.org, AJvYcCWpXiFswT5dKiD0PVh2poa9K1RrCoQeXB06hGM+uYYq1HFuHiYy4iglJiNRhIftkhScc2N48PciHAEIidmG@lists.infradead.org
X-Gm-Message-State: AOJu0YxTE4kizF4TL+gxFbKt4ZX+JSe2kMvqmW0JpmCgznj8QJJ0CkLP
	03ZG1QRnQifMpEjKKut7hfVnlbx/Ur8uAMUhQxz+TE8dl1ktZtLEpO8QlICEdlmnDbfR7D1PFQT
	SStsvul0XdysziePixdtr0rLrRAc=
X-Google-Smtp-Source: AGHT+IH7V/blepTOk6kqhUyemsLlG5MBzFmZ7LiPRLoJn+pnqrgFqcO2vnQoG2KBg+pcrZuj7dlo1P12eL+WmXKFAms=
X-Received: by 2002:a05:6902:2d09:b0:e20:29e9:23ae with SMTP id
 3f1490d57ef6-e25ca96a25cmr413662276.17.1727286061032; Wed, 25 Sep 2024
 10:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-4-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-4-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:40:29 +0200
Message-ID: <CAFBinCAuo1JkYA0mrsR6drs7ezEBtj2zZ1EaLhYwuCN9t3uixA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] ARM: dts: amlogic: meson6: remove support for
 ATV1200 board
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_104102_682746_BB1F0410 
X-CRM114-Status: GOOD (  12.76  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgbWVzb242IGF0djEyMDAgaGFzIGEg
bG90IG9mIGR0YnMgY2hlY2sgZXJyb3JzLCBidXQgc2luY2UKPiBubyBhY3RpdmUgY29udHJpYnV0
b3IgaGF2ZSBhbnkgYm9hcmRzIHdpdGggTWVzb242IFNvQywgcGx1cwo+IG5vIHVwc3RyZWFtIEdQ
SU8sIHBpbmN0cmwsIGNsb2NrLCBNTUMuLi4gZm9yIHRoYXQgU29DIGVpdGhlciwKPiBsZXQncyBz
dGFydCBkZWNvbW1pc3Npb25pbmcgTWVzb242IHN1cHBvcnQgYnkgcmVtb3ZpbmcgdGhlIERldmlj
ZQo+IFRyZWUgZmlsZXMgZmlyc3QgdGhlbiByZW1vdmUgdGhlIE1BQ0hfTUVTT042IGluIGEgc2Vj
b25kIHRpbWUuCj4KPiBJZiBzb21lb25lIGlzIGludGVyZXN0ZWQgaW4gTWVzb242IHN1cHBvcnQg
dGhleSBzaG91bGQgYnJpbmcgaXQgYmFjawo+IGFsb25nIHdpdGggYSBmZXcgbW9yZSBwYXRjaGVz
IGZvciB1cHN0cmVhbSBzdXBwb3J0IG9mIGZ1cnRoZXIKPiBwZXJpcGhlcmFscy4KPgo+IFN1Z2dl
c3RlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
