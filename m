Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642FECAC5A7
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Sep 2025 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yapTixJisceW8o5zQ4EIDOQIH4S3AgYetWoLzmuZ2eE=; b=sK7BAm2HsFPs9V
	RZzRiUprbnE7lwm81ZJcPfpi+eJZVjqDhAJWNaJE/iBkDHmAi/nAdEO7217iz6YmPHgUpcvSaiz9I
	SSLEnD70TA3AeeI9UFkFenLIZ5XFhRSZDVkvJttwJKwZgCNCPba6j/tjkRsk6NwGFHpRcZ2PvE0md
	rdWpFMFWRFeo4IUoYcFW8BDuLBs2DivIbmLjwnV/2hQ34nj/+MDVL0C+2aeCyHta6kYsa8XdlnS8l
	BRNCTLeg0nBf7nftwRCXI8ZxcNA5TwB1XtOMHfFgCM8qiVi8gFbfohzH7YEVx4YwhfJqHIf1qSfEV
	BXkR07MsGlDJxyGA5zzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0JfH-00000007Ub7-0Up2;
	Sun, 21 Sep 2025 12:59:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0JfC-00000007UaB-1Ygx
	for linux-amlogic@lists.infradead.org;
	Sun, 21 Sep 2025 12:59:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so511505f8f.3
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Sep 2025 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758459572; x=1759064372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5idkSU+BKR3ZQwW7g3jePyMPbexa7ttPs8Jbe39d6Y=;
        b=PWyfqlzYO+QXOi5vV2EOVFoVsSFDrvpXM4NKCc3ZFCU0qKrFBE9PC6U3OPJdqBlDj1
         xWYpJas3oOuyMP1c7pFDqhLJR8ZcBfwrdVpOtaDnp//kuD5lb9i6bxxa+yUY+/i5s2vJ
         PzAU4Oe/wdwG3FoJfkH4SMkEQmpqRTw2B2wcKW36dO7M6mInyTFLQyQ5FbvgP2zyYfzP
         Z2mpiH5Qs65GXW8KTwsrhoV0A17JXOh9x/W7NfJypUbY+OoP3hpKmx6JVFire1rECQp0
         2knXTbFlkCDjLNW+O8KZwhU6FHfDXiMNo3LscSeKGKpYVwZhdo0cHMRtD3D0BdRbsuPX
         kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758459572; x=1759064372;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5idkSU+BKR3ZQwW7g3jePyMPbexa7ttPs8Jbe39d6Y=;
        b=bbMJyvVdWmSsAcuPuEan/i31MMIlZFmxQmQLj+5/ZerIWW9qrUTKh1SajP8SfLcM3p
         m1u4gaQ4K1+iuPugzfR9QsGp+tpUqfkjiTRHrGEv5HwdQtaOq0Cncr7UQPfxRmxPu4lF
         MOQO9Rgg9XQq3uaWlNis1lSqbI2j0x6bBrybBG6q8p4RhktTBKcaPxQXly5SLh1eNUjn
         ijsdnAsmedblkES1Kh7y4UslTSpXWH5m3wjj4vM3Pr+ycCWTXEOOjf9EixP46tSLho2T
         jO/V/eYPrVVXYT9O7tgRoLlaPRNlybl66FY8qgzWWN+nTgOrluzvSPT4VpH6hRwarKsk
         ao+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjeAEZv+i/huFYqTlNrsQoxgA0r1gHKSE01Mpj54tqyXdKM+8vvskWh9kUIVXMi1lWHNOLClgBXbZJbLFK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4+gP/96mMICNC01uE5BwGzZFEWVVJwtlP9qO/sfbpjNYqOK0f
	ZREGEziEiKsqlJD3Ij9M/VmFuNQMdaXAMB2RBk+1App2t0ObmakjUmw8ZYbXxV8wP6A=
X-Gm-Gg: ASbGncucoVw5SlweIaJifZrEcDyyWaogLIQOesb+jh7Kxwou8b4NVktTcFa/61C0oDs
	jJEosonOWLp7K/vlM4C8SYtLqqqyPHiKIUICebu9x+wBkILNgtuBcwq7lpYvSj7FdpYaXsT2QGl
	y+Oc4Vy19Iz50Eg4NZ9egaj2vUwdGhpGSrKZJ2hWPeITLr1Ps7S3Yk6A7kGIM9zuzQpyaDUYIFt
	wMkD3TiHhqjtXr18JrzDBQhnNmXaJ9IDYPqGdftWJuEa1RgAI1ifhYIgggKk9yJ1GXr7OHvHzpU
	4uczI4kIZ8NtY3pA8ZkdSJ2PGxe7Yo6qaIh05Ibfx0uLdsp/5FB0xa3S25jBoBCfcYJ3vXBBgbU
	tFAU0ZctZUuS8ectrnxYU
X-Google-Smtp-Source: AGHT+IF5u5KFKGE6iHPiMYbq57D+M8vvvTozHCB8HNpcyQ3vLH+m58k6knvjof0DtBjLGD8fC8CtWA==
X-Received: by 2002:a5d:5d88:0:b0:3fb:bb69:d91b with SMTP id ffacd0b85a97d-3fbbb69dc8amr1338524f8f.2.1758459571949;
        Sun, 21 Sep 2025 05:59:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:585:dcf4:2643:85cc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbf1d35sm16734349f8f.55.2025.09.21.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 05:59:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mark Brown <broonie@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
In-Reply-To: <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 21 Sep 2025 14:21:28 +0200")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
	<CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 21 Sep 2025 14:59:30 +0200
Message-ID: <1jldm855cd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_055934_669181_1B3D8572 
X-CRM114-Status: GOOD (  22.48  )
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

T24gU3VuIDIxIFNlcCAyMDI1IGF0IDE0OjIxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgTWFyaywKPgo+IE9uIFN1
biwgU2VwIDIxLCAyMDI1IGF0IDE6MjXigK9QTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIEp1bCAwMiwgMjAyNSBhdCAwNToyNTo1OFBNICswMjAw
LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiA+IFRoZSB3b3JrIG9uIHRoaXMgcGF0Y2hzZXQgc3Rh
cnRlZCB3aXRoIHRoZSBzdWJtaXNzaW9uIG9mIHRoZSBBbWxvZ2ljIHQ3Cj4+ID4gcGVyaXBoZXJh
bCBjbG9jayBjb250cm9sbGVyIFsxXS4gVGhpcyBjb250cm9sbGVyIGlzIGZhaXJseSBzaW1pbGFy
IHRvCj4+ID4gZXhpc3RpbmcgY29udHJvbGxlcnMuIE9uY2UgYWdhaW4sIGl0IHJlZGVmaW5lcyB0
aGUgcGVyaXBoZXJhbCBjbG9jayBtYWNybywKPj4gPiB0aGUgcHJvYmUgZnVuY3Rpb24gYW5kIGNv
bXBvc2l0ZSBjbG9jayBoZWxwZXJzLCBldmVuIGlmIGl0IGlzIGFsbW9zdCB0aGUKPj4gPiBzYW1l
IGFzIGluIG90aGVyIGNvbnRyb2xsZXJzLiBUaGlzIGNvZGUgZHVwbGljYXRpb24gdHJlbmQgaGFz
IGJlZW4gZ29pbmcgb24KPj4gPiBmb3IgdG9vIGxvbmcgYW5kIG5vdyBpcyB0aGUgdGltZSB0byBw
cm9wZXJseSBhZGRyZXNzIHRoZSBwcm9ibGVtLgo+Pgo+PiBGcmlkYXkncyAtbmV4dCBicmVha3Mg
dGhlIGJvb3QgZm9yIG1lIG9uIHRoZSBMaWJyZXRjaCBBbHRhLiAgVGhlIHN5c3RlbQo+PiBkb2Vz
bid0IHNob3cgYW55IG91dHB1dCBvbiB0aGUgY29uc29sZSB1bmZvcnR1bmF0ZWx5Ogo+Pgo+PiAg
ICBodHRwczovL2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVsZXIvam9iLzE4NTMyMDQjTDE2MDYK
Pj4KPj4gVW5mb3J0dW5hdGVseSBlYXJseWNvbiBpc24ndCB0dXJuZWQgb24sIEknbGwgdHJ5IHRv
IGRvIHNvIGF0IHRvbW9ycm93IG9yCj4+IFR1ZXNkYXkuCj4+Cj4+IEEgYmlzZWN0IHBvaW50cyB0
byB0aGUgcGF0Y2ggNGM0ZTE3ZjI3MDEzICgiY2xrOiBhbWxvZ2ljOiBuYW1pbmcKPj4gY29uc2lz
dGVuY3kgYWxpZ25tZW50Iikgd2hpY2ggbG9va3MgbGlrZSBpdCdzIGEgc3F1YXNoIG9mIHNldmVy
YWwgb2YgdGhlCj4+IHBhdGNoZXMgaGVyZS4gIER1ZSB0byBpc3N1ZXMgd2l0aCB0aGUgYm9vdGxv
YWRlciBpdCBjb3VsZCBwb3RlbnRpYWxseSBiZQo+PiBhbiBhZGphY2VudCBjb21taXQgYnV0IHRo
aXMgbG9va3Mgc3VzcGljaW91c2x5IHJlbGV2YW50LiAgQmlzZWN0IGxvZywgbXkKPj4gaW5mcmFz
dHJ1Y3R1cmUgZG9lcyByZXRyeSB0aGUgYm9vdCBhIGxvdCBvbiB0aGVzZSBib2FyZHMgc28gZXZl
biBpZiB0aGUKPj4gZmluYWwgZXJyb3IgaXMgYSBib290bG9hZGVyIGlzc3VlIHRoZXJlIHdpbGwg
bGlrZWx5IGhhdmUgYmVlbiBib290cyB0aGF0Cj4+IHN0YXJ0IHRoZSBrZXJuZWw6Cj4gQSBmZXcg
ZGF5cyBhZ28gTWFyZWsgcmVwb3J0ZWQgcHJvYmxlbXMgb24gYW4gT2Ryb2lkLU4yIGFuZCBwcm92
aWRlZCBhIGZpeDogWzBdCj4gSXQncyBub3QgcXVldWVkIHVwIGZvciAtbmV4dCB5ZXQuCj4KPiBQ
bGVhc2UgZ2l2ZSBNYXJlaydzIHBhdGNoIGEgdHJ5Cj4KPgo+IFswXQo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMTc1ODM0NDM3MDA2LjQzNTQuMTE5MzM1NDUxNzQwMDQ2
MTYzNzNAbGF6b3IvVC8jbTI5MTI4YjBhY2VjMmRiNjJkNDU5NzFkOTRhMWMzOGZlZGM4NDkzYTAK
CkhleSBNYXJrLAoKQmVpbmcgb24gdGhlIEEzMTFEIGFzIHdlbGwsIGl0IGlzIGxpa2VseSB0byBi
ZSB0aGUgc2FtZSBpc3N1ZS4KSSBzdXNwZWN0IHlvdSB3b3VsZCBub3Qgc2VlIHRoZSBjcmFzaCBp
dCB3aXRob3V0IGVhcmx5Y29uIGluZGVlZC4KClRoZSBmaXggaXMgaW4gY2xrLW5leHQgYWxyZWFk
eSBzbyBsaW51eC1uZXh0IHNob3VsZCBnZXQgaXQgc29vbi4KU29ycnkgZm9yIHRoZSBpbmNvbnZl
bmllbmNlIGFuZCB0aGFua3MgZm9yIHRoZSByZXBvcnQuCgotLSAKSmVyb21lCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
