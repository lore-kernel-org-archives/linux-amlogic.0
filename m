Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B2BC7EE22
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 20:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj0T4BOOIlhrGd2A0GEs3Y2VLiqrJxhDylDj644Kx5w=; b=Q6aK6OirvjJYfB
	ezrGQ8tNnEevuwuui/uDZ2hkhBsg6W08XCNtDOZcLgdjaIxroSBPi75ReeI0PhiZWHwapfEgx4eO7
	TgZLHW79/5Stsk3kjPqwKPfLUQN6SnjI5Du3MMNqAnrnwCvC6F21GiBtwmvumCOh9cLcE1BsmJejp
	UTqPbGPOWD1VGZDHedK2g7SuwSquA8UOegLIpFBateVwySn1A5aPrZlRFfkALSkWghbuoWAjGIlDB
	OtpI/GrlkHNd+UF6UNuc1jH7AWOqzik4EPgstPtUXaSXn8kxZk/K2tiCSAmP/iDJIAXRPprYb3DRA
	LoOKvWLDra4RnhZJDa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7EO-001JMN-0x;
	Mon, 08 May 2023 20:13:12 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7EI-001JLl-28
	for linux-amlogic@lists.infradead.org;
	Mon, 08 May 2023 20:13:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9660af2499dso572846466b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 May 2023 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683576784; x=1686168784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIYXjKK0hBvjiVVVHhHByeXrttVmKY8Bp2JHp345uLU=;
        b=S1ElEGS2VwyXZP+Juni4sOaWpcgHo+79kRLzdkK1qJ3jNbtqBMFlEOtKJ1Xe5grET8
         TRW64Blcbc3sS7H6Um20nYWZyMIOenbnrZKniZhQG/vn7WZK+9FZxhrRZyLaGhsaKu3a
         DGVVSRlp0yD8fqUykPLCsiiYJP+TAjm9vQ2pbzTQl6eCfssFBw203aDTEIYbIqZVIp0B
         ByFXtYXzty0lUuKgVEqrIejqCrcc3wdqlEGhtl+hwgOpg/pBgyWnDT+7gzmM1CX1yKKH
         vYhx1RxfgonHza9eXgDBU2i56l70ca0d49W+lqqqUUDdVsf+vYBbGMikQWehmDGzht4m
         cyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683576784; x=1686168784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIYXjKK0hBvjiVVVHhHByeXrttVmKY8Bp2JHp345uLU=;
        b=Nb+e0P0UUUpHtQL1APxaeGUIFw+/zk0IejOT2Pfs11+iY3v12KOr61mushDs2CT67s
         Yx7+zahmqykiAb95Zov6XOTGf0TPPoRGLsQk5iUdanYhC5o+cHt/TQCRcq1rXPreaKu7
         HsLgtnswanG6sPw9zyMkFg/Rx22i5cPPkA3gorn8KWfyKePnta36vTguCzZjwymW8UFw
         vkNHJYWOkKsUskMithS4D4S9tPDYSVxpYirGU9/1N8huaDkqWp6qzSAsenAJA6qfxYVu
         dD0IuhZeV/iVH9GdZabUWaj8QtE6tc7v2EadHYrA+SFQ5Myzlnz9JpUnOb6Vghh5E9lc
         Sk4w==
X-Gm-Message-State: AC+VfDxKhnJVqwFYeEjkkdEtZ+PjKboIfwBxmEEk5PynV8zHL4gTSI13
	82tYPE3i2iHp/tY+XtcT75kT0JEjr3rEYa7/I8s=
X-Google-Smtp-Source: ACHHUZ5v/7PMSKbP1WiZXfJkZSHAvJN9ticXlWIqYmUybc03sGb+Ueam1JXs3ObBQ+XxXEzvYoASiUj8KRE7GlVp31g=
X-Received: by 2002:a17:907:3207:b0:94f:5b91:7952 with SMTP id
 xg7-20020a170907320700b0094f5b917952mr9479149ejb.21.1683576784341; Mon, 08
 May 2023 13:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
In-Reply-To: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 22:12:53 +0200
Message-ID: <CAFBinCBf9A9M15uBCtCafB2NOWd+y0xYwfsa9QxBUTCRJCpxOQ@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>, Brian Norris <briannorris@chromium.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_131306_723636_B13C6A90 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

SGkgVWxmLCBIaSBCcmlhbiwKCk9uIFR1ZSwgQXByIDExLCAyMDIzIGF0IDE6MTPigK9BTSBNYXJ0
aW4gQmx1bWVuc3RpbmdsCjxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90
ZToKPgo+IEhlbGxvIFVsZiwKPgo+IHRvZGF5IEkgZm91bmQgdGhhdCB1cHN0cmVhbSBjb21taXQg
NGJjMzFlZGViZGU1ICgibW1jOiBjb3JlOiBTZXQgSFMKPiBjbG9jayBzcGVlZCBiZWZvcmUgc2Vu
ZGluZyBIUyBDTUQxMyIpIGJyZWFrcyBlTU1DIHN1cHBvcnQgb24gbXkKPiBPZHJvaWQtQzEuCj4g
KHllcywgSSBrbm93IHRoYXQgSSBhbSB2ZXJ5IGxhdGUgdG8gdGhlIHBhcnR5Li4uKQpJIHRoaW5r
IGl0IHdhcyBob2xpZGF5IHRpbWUgaW4gRXVyb3BlIHdoZW4gSSBzZW50IG15IG9yaWdpbmFsIG1h
aWwuCkNvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhpcyBvbmNlIHlvdSBhcmUgYmFj
az8gT3IgaW4gb3RoZXIKd29yZHM6IGdlbnRsZSBwaW5nCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
