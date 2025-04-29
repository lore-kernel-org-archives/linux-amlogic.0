Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2B7C369D5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDlOVIC+53j1OPKhXVMyHoV7BSfCzL9RmH0eCg9S/64=; b=zz9YWGS3oO0Qn2
	GhCFjlC5GrddHFqjoEBRPTuYeBFFqNWW5IAfUT+wZ2D/JHiLBdE8Iwucxea47gKyJbweoU2dOsqH1
	S+5OLTxDUN7oAJqCRceBwrH7Gpj+2F6SJ78GoqJJf45NpsV0yVfkWEkkCKBBxcu4K+1s2h54ewkpz
	MTv+e3DEMXaDiwWBzAJ49w1/cLCJ2VhZEDd7uR6OlENkptRnY1WTWMqePBMS7L8MgypTBZXjWGIwd
	7QaviuFBmXcwa0tDIi69Es1ijxrt7Kf1fqT8fby8SRuPeazM62hhFji/YbxDf3QQKgT/lHy0Q+p1f
	iuDfYBnluKO5So1TB4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z5J-00000007w9f-1LvK;
	Tue, 29 Apr 2025 00:44:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z5G-00000007w8y-3Lfi
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 00:44:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301302a328bso7640982a91.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745887466; x=1746492266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=UEGAmY/gHbx6zf1fmLYGmUS9GcUWa5Bil1F1UUsmcPHJI9pbF3xdp8vp13RbmLWvst
         06SoCVSDC5Piz4mk8J/fzrrvY5O7A4M1go9l7GkImXm8Tv4tkvlN2jgAGHk9nEkNjFjt
         ZJJ922gK6OxoJguD3VM9jG/QBaWxLHjjwy/aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745887466; x=1746492266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=ADnJ7AQM4F0XvyP0hlgIOsM3ot3OzvcPC8cAQftY4Ignd2racfSrC52BcISax9ql4d
         c03Logb9m5ghGXMvQgql0G+7zGuBDclCevx40JNC4d20sLv29spSvDHPaEgf0alPhsrn
         RB+ZDEBg3ed2dmJUuXDmMBMMfF0L8Xh7xDg4jXKKywBMoGP7uf0KOISRXE24QpQStKNA
         1JmbQbXJ/7FmfOUzeWsbJkn4Ijnt3HbFy53hWgc/fVMrAzlPmbfT6F5MPa7MFYCStuOJ
         mubnmP5fWi4+u2bR2w7oTvO+iIQw5TennDYhe/ynqEDYAXS4S0sd0j8ORIwq/zfgXyjB
         wh1g==
X-Forwarded-Encrypted: i=1; AJvYcCXDBYkdlH2i9hjeMOWki49fYR5alYPuAU3AGluOjxOXqOyD1PK408REkQasjLBRv983hSfKqbe7I541NWfQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7igLuGlIkNM+fAbuTpB57tZWwbg8R6VpW9ZF9lANoJbZOP0hQ
	7SbMeIjyt32Civfv8S+h8sj76qYDfatlWLtil0X/Cn3EETvNPTYtpEYyJhlQtsuHmVWna+mIVZe
	8fm2L0uU/gW76Z/iQ9npwYwkPBmTgB0SVR/h8YA==
X-Gm-Gg: ASbGncvOlq26fGvzGKjUZU+fpfB175kZhiUIr90Y+xGpxefQ5XDmJeLgGZur3fvK72E
	bMcmhAVVL6itFtubTD+CnZZu3zPBgdbca+ZI9yy1G8av6u0Wj7RJ6dVsiPlMeuQCHTrg0nxgEpx
	7aWG5QFjDEQzAHtXMccl3cMdQPjH45Uo471qdonrDIEzoaU/yyFA36keE=
X-Google-Smtp-Source: AGHT+IFjPL18h5P/u4F4dyTMOcvewGcroYbUT0gU7VtQUvVqhIshw60ZVQaT8g8ZD4qgd/tbKkO0lKtc/fcYY5m9kdU=
X-Received: by 2002:a17:90b:280c:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-30a21546d6fmr2342151a91.1.1745887465903; Mon, 28 Apr 2025
 17:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250425192009.1439508-1-da@libre.computer> <20250428181242.GG3339421@horms.kernel.org>
In-Reply-To: <20250428181242.GG3339421@horms.kernel.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 20:44:14 -0400
X-Gm-Features: ATxdqUEf_AoTzAnuf_I1pvf8_AvQf7sxk_KOWa8wGk2GqUmGhIm8SEm3MmjT6RI
Message-ID: <CACdvmAhcBmoDNyuu0npZzyExfhyLKdyPw9HvHvV+OdADxEfJJQ@mail.gmail.com>
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
To: Simon Horman <horms@kernel.org>
Cc: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_174426_837334_21F165DB 
X-CRM114-Status: GOOD (  22.07  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMjoxM+KAr1BNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyNSwgMjAyNSBhdCAwMzoyMDowOVBNIC0w
NDAwLCBEYSBYdWUgd3JvdGU6Cj4gPiBUaGlzIGJpdCBpcyBuZWNlc3NhcnkgdG8gcmVjZWl2ZSBw
YWNrZXRzIGZyb20gdGhlIGludGVybmFsIFBIWS4KPiA+IFdpdGhvdXQgdGhpcyBiaXQgc2V0LCBu
byBhY3Rpdml0eSBvY2N1cnMgb24gdGhlIGludGVyZmFjZS4KPiA+Cj4gPiBOb3JtYWxseSB1LWJv
b3Qgc2V0cyB0aGlzIGJpdCwgYnV0IGlmIHUtYm9vdCBpcyBjb21waWxlZCB3aXRob3V0Cj4gPiBu
ZXQgc3VwcG9ydCwgdGhlIGludGVyZmFjZSB3aWxsIGJlIHVwIGJ1dCB3aXRob3V0IGFueSBhY3Rp
dml0eS4KPiA+Cj4gPiBUaGUgdmVuZG9yIFNESyBzZXRzIHRoaXMgYml0IGFsb25nIHdpdGggdGhl
IFBIWV9JRCBiaXRzLgo+Cj4gSSdkIGxpa2UgdG8gY2xhcmlmeSB0aGF0Ogo+IFdpdGhvdXQgdGhp
cyBwYXRjaCB0aGUgd3JpdGVsIHRoZSBwYXRjaCBpcyBtb2RpZnlpbmcgd2lsbCBjbGVhciB0aGUg
UEhZX0lEIGJpdC4KPiBCdXQgZGVzcGl0ZSB0aGF0IHRoZSBzeXN0ZW0gd29ya3MgaWYgYXQgc29t
ZSBwb2ludCAodWJvb3QpIHNldCB0aGUgUEhZX0lEIGJpdD8KCkNvcnJlY3QuIElmIHRoaXMgaXMg
c2V0IG9uY2UsIGl0IHdpbGwgd29yayB1bnRpbCB0aGUgSVAgaXMgcG93ZXJlZApkb3duIG9yIHJl
c2V0LgpJZiB1LWJvb3QgZG9lcyBub3Qgc2V0IGl0LCBMaW51eCB3aWxsIG5vdCBzZXQgaXQgYW5k
IHRoZSBJUCB3aWxsIG5vdCB3b3JrLgpJZiB1LWJvb3QgZG9lcyBzZXQgaXQsIHRoZSBJUCB3aWxs
IG5vdCB3b3JrIGFmdGVyIHN1c3BlbmQtcmVzdW1lIHNpbmNlCnRoZSBJUCBpcyByZXNldC4KVGh1
cywgd2UgbmVlZCB0byBzZXQgaXQgb24gdGhlIExpbnV4IHNpZGUgd2hlbiBicmluZ2luZyB1cCB0
aGUgaW50ZXJmYWNlLgoKPgo+ID4KPiA+IEZpeGVzOiA5YTI0ZTFmZjQzMjYgKCJuZXQ6IG1kaW86
IGFkZCBhbWxvZ2ljIGd4bCBtZGlvIG11eCBzdXBwb3J0Iik7Cj4KPiBJIGRvbid0IHRoaW5rIHlv
dSBuZWVkIHRvIHJlc2VuZCBiZWNhdXNlIG9mIHRoaXMsCj4gYnV0IHRoZSBjb3JyZWN0IHN5bnRh
eCBpcyBhcyBmb2xsb3dzLiAoTm8gdHJhaWxpbmcgJzsnLikKCkdyZWF0IGFuZCB0aGFua3MhIEkg
anVzdCBzZXQgdXAgZ2l0IHNlbmQtZW1haWwgc28gSSdtIGEgbGl0dGxlIHJvdWdoCmFyb3VuZCB0
aGUgZWRnZXMuCgo+Cj4gRml4ZXM6IDlhMjRlMWZmNDMyNiAoIm5ldDogbWRpbzogYWRkIGFtbG9n
aWMgZ3hsIG1kaW8gbXV4IHN1cHBvcnQiKQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYSBYdWUgPGRh
QGxpYnJlLmNvbXB1dGVyPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ID4gKiBSZW5h
bWUgUkVHMl9SRVNFUlZFRF8yOCB0byBSRUcyX1JFVkVSU0VECj4gPgo+ID4gTGluayB0byB2MjoK
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hbWxvZ2ljL3Bh
dGNoLzIwMjUwMzMxMDc0NDIwLjM0NDM3NDgtMS1jaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbS8K
Pgo+IC4uLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
