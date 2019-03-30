Return-Path: <SRS0=rMmM=SB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B290C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 19:30:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578CE20989
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 19:30:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdFq2iYk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JJvukiDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578CE20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzdQ6FAiNK+o+p2mDgHWx1+w268Jhf1FcWrCEOS2mAA=; b=pdFq2iYk4O7VBM
	085MJ9GX/QsxXt11UnFez48AgXBv6yWekIE8uamtDderkkNQ79hQn7HgQDJ6cuZEPEmGLAU2RhSIZ
	XDi+YH6uchrBBPkDyihXGC7nbtQotzwunwfHUFj1ryhVNUsny4YsniqyCi8HeZW779sLx6ZQjFXlB
	LJRVQ/j4QxnwrCSv8esrkRP+ZsoCZja678oD/7hJmWW3QJCAGx4mtgK30/Mc7h/Kq8LRQt5ovPFIq
	pHQvaHQDAOXNwv+p8f3xNeA2HC7Rih6QMCwOKFJgoYT5G3bBABAG9aMW/kEmUEyG3RzTpRkRtDplT
	cPCJLsc2At0JPvKL7h4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAJfr-0000DK-A4; Sat, 30 Mar 2019 19:29:51 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAJfn-0000Cv-S6; Sat, 30 Mar 2019 19:29:49 +0000
Received: by mail-oi1-x241.google.com with SMTP id t81so4241317oig.10;
 Sat, 30 Mar 2019 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E3qsfecLL9h7PueF/05aCXUcyy8uC+uxLap7FHg1oLI=;
 b=JJvukiDZK6piJa7w18mO2Sr0UIic7oHfTfXP5fMDsp7/PadyaGOOoap5p8ZwiT3sjQ
 eTNuZ3S59vVYnSUnTR2yJXxwsw3wgTY3oU33nS+6GR6b7LwtoJn+xJ+ZQgXabiENAxKb
 eD1gXPhlVswQUicBcqpBk5Cd6YOlc1oe3fQxK4Cqd1FbaEAKWzkmpBbUlUhd3UbZ5W5k
 RBah0roUdTOtftkyy5L3M4+/aHwz+WfdSeQxT601t7S6hmQRmr9Z4aHwIh9GHXPPHAzd
 FBVniLGDkAgrf43FInwns18VVM54dUMVtps+7qUK0TmW0/HwlxQN+9apVVU9d/Yvf5lZ
 9OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E3qsfecLL9h7PueF/05aCXUcyy8uC+uxLap7FHg1oLI=;
 b=frNWo4KI/0gc5MfpfcjcNT10OWdpoutH00YFdQdgf47oRphXbP3txvMTCyHnj87P55
 +h1w0K2sJROpIim1riSgwrBTiwX2XE/GzuLRa4R1Tc+5lMtZz3lRNS9bj/Ay8RrR4UDe
 DIdEyYMRw/7KuVAT/4QpnftrJ6ysRYlDiLnqwd7sVu7OXKChVRoRGIIeO1lfTESpxTOC
 WUJcTKmbHe/Vjm41QT2dL8XYnNLnJf1f484Rejo7SdtO76luzaAUjL7ZTlzIfDxtV/TJ
 50nDqzM1RIXCDG3DFAD60TWZrJN6/+Ayf/C04xI9z5+Hj74Lb+1C+6StR9BXvcAq6qCi
 KuOg==
X-Gm-Message-State: APjAAAVJXeB8G4B3SDN/4hXlBZTazVZyX9EaSf+fNiOKra+7goB12jDO
 J+Y1At8u6XsGabz9YlMrjlHzJnVVlXTfEC9gQiw=
X-Google-Smtp-Source: APXvYqyXCN/J68ByPD5PoJSsE6cJXP7X4dcIOprd7tCb4VO6S6QFy8ORvZYorNyRECYOmImw997LvfB+tJ0rgk8+auw=
X-Received: by 2002:aca:4482:: with SMTP id r124mr2147683oia.39.1553974186198; 
 Sat, 30 Mar 2019 12:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
 <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
 <20190325200730.cx73jgxfexz6ybzq@pengutronix.de>
In-Reply-To: <20190325200730.cx73jgxfexz6ybzq@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Mar 2019 20:29:35 +0100
Message-ID: <CAFBinCCGWsb+1WHFe6uwrpUYgH4iix0WT8_v_Nj5BhGKRyjiLQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_122947_934411_96BBC4E9 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gVXdlLAoKT24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgOTowNyBQTSBVd2UgS2xlaW5lLUvD
tm5pZwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKWy4uLl0KPiA+ID4g
IC0gRG9lcyBzdG9wcGluZyB0aGUgUFdNIChpLmUuIGNsZWFyaW5nIE1JU0Nfe0EsQn1fRU4gaW4g
dGhlIE1JU0NfQUIKPiA+ID4gICAgcmVnaXN0ZXIpIGZyZWV6ZSB0aGUgb3V0cHV0LCBvciBpcyB0
aGUgY3VycmVudGx5IHJ1bm5pbmcgcGVyaW9kCj4gPiA+ICAgIGNvbXBsZXRlZCBmaXJzdD8gKFRo
ZSBsYXR0ZXIgaXMgdGhlIHJpZ2h0IGJlaGF2aW91ci4pCj4gPiBJIGRvbid0IGtub3csIEkgd291
bGQgaGF2ZSB0byBtZWFzdXJlIHRoaXMgd2l0aCBhIGxvZ2ljIGFuYWx5emVyLgo+Cj4gSW4gcHJh
Y3Rpc2UgeW91IGNhbiBkbyB0aGlzIHdpdGggYSBtdWx0aW1ldGVyLCB0b28uIEp1c3QgZG8gc29t
ZXRoaW5nCj4gbGlrZToKPgo+ICAgICAgICAgcHdtX2FwcGx5X3N0YXRlKHsgLmVuYWJsZWQgPSB0
cnVlLCAucGVyaW9kID0gNXMsIC5kdXR5X2N5Y2xlID0gNXMsIC5wb2xhcml0eSA9IFBXTV9QT0xB
UklUWV9OT1JNQUwgfSk7Cj4gICAgICAgICBwd21fYXBwbHlfc3RhdGUoeyAuZW5hYmxlZCA9IGZh
bHNlLCAucGVyaW9kID0gNXMsIC5kdXR5X2N5Y2xlID0gNXMsIC5wb2xhcml0eSA9IFBXTV9QT0xB
UklUWV9OT1JNQUwgfSk7Cj4KPiAoYXNzdW1pbmcgdGhlIFBXTSBzdXBwb3J0cyBwZXJpb2RzIHRo
YXQgbG9uZykuIFRoZSBleHBlY3RhdGlvbiBpcyB0aGF0Cj4gdGhlIGxhc3QgY29tbWFuZCB0YWtl
cyBuZWFybHkgNSBzIHRvIGNvbXBsZXRlIGFuZCB3aGlsZSBpdCB3YWl0cyB0aGUKPiBvdXRwdXQg
aXMgaGlnaCBhbmQgb24gcmV0dXJuIGl0J3MgbG93LiBJZiB0aGF0IGlzbid0IHRoZSBjYXNlLCB0
aGVyZSBpcwo+IGEgYnVnIHNvbWV3aGVyZS4KdGhlIGxvbmdlc3Qgc3VwcG9ydGVkIHBlcmlvZCAo
dXNpbmcgdGhlIDI0TUh6IGNyeXN0YWwgYXMgaW5wdXQsIHdoaWNoCmlzIHRoZSBzbG93ZXN0IGlu
cHV0IGNsb2NrIGFuZCB0aHVzIGdpdmVzIHRoZSBsb25nZXN0IHBvc3NpYmxlCmR1cmF0aW9uKSBp
cyAzNDk1MTQ0MDducyAodGhhdCdzIGFwcHJveC4gMC4zNSBzZWNvbmRzKS4gbXkgbXVsdGltZXRl
cgppc24ndCBmYXN0IGVub3VnaCB0byBtZWFzdXJlIHRoaXMgc28gSSdtIHVzaW5nIG15IGxvZ2lj
IGFuYWx5emVyIHdpdGgKcHVsZXNldmlldyBpbnN0ZWFkOiBbMF0KCkkgYWRkZWQgdGhlIGZvbGxv
d2luZyBjb2RlIHRvIG1lc29uX3B3bV9yZXF1ZXN0OgogIHN0cnVjdCBwd21fc3RhdGUgZW5hYmxl
ID0gewogICAgICAgIC5lbmFibGVkID0gdHJ1ZSwKICAgICAgICAucGVyaW9kID0gMzQ5NTE0NDA3
VSwKICAgICAgICAuZHV0eV9jeWNsZSA9IDM0OTUxNDQwN1UsCiAgICAgICAgLnBvbGFyaXR5ID0g
UFdNX1BPTEFSSVRZX05PUk1BTCB9OwogIHN0cnVjdCBwd21fc3RhdGUgZGlzYWJsZSA9IHsKICAg
ICAgICAuZW5hYmxlZCA9IGZhbHNlLAogICAgICAgIC5wZXJpb2QgPSAzNDk1MTQ0MDdVLAogICAg
ICAgIC5kdXR5X2N5Y2xlID0gMzQ5NTE0NDA3VSwKICAgICAgICAucG9sYXJpdHkgPSBQV01fUE9M
QVJJVFlfTk9STUFMIH07CiAgcHdtX2FwcGx5X3N0YXRlKHB3bSwgJmVuYWJsZSk7CiAgcHdtX2Fw
cGx5X3N0YXRlKHB3bSwgJmRpc2FibGUpOwoKdGhpcyByZXR1cm5zIGltbWVkaWF0ZWx5LiBteSBs
b2dpYyBhbmFseXplciBkb2Vzbid0IHNlZSBzaWduYWwgY2hhbmdlCihJJ20gc2FtcGxpbmcgYXQg
MU1IeikuCgpjYW4geW91IHBsZWFzZSBjb25maXJtIHRoYXQgbXkgdGVzdCBjb2RlIGFuZCBtZWFz
dXJlbWVudCBwcm9jZWR1cmUgaXMgY29ycmVjdD8KaWYgaXQgaXMgdGhlbiBteSBvYnNlcnZhdGlv
biBpcyB0aGF0IGRpc2FibGluZyB0aGUgUFdNIGRvZXMgc28KaW1tZWRpYXRlbHksIHdpdGhvdXQg
d2FpdGluZyBmb3IgdGhlIGN1cnJlbnQgcGVyaW9kIHRvIGNvbXBsZXRlCgoKUmVnYXJkcwpNYXJ0
aW4KCgpbMF0gaHR0cHM6Ly9zaWdyb2sub3JnL3dpa2kvTGNzb2Z0X01pbmlfQm9hcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
