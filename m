Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E91AC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 20:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA792082F
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 20:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ghGry16I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pKE9FWOa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA792082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYrRug1Mm760dNaAJnbtB0RZibuyV8/8zn5S5y6Nz3Y=; b=ghGry16If685F+
	GMcWpVzF+BFEanMCsGxEwLLtJwvVdmnc6TaHQtMXeYI3yaaonPImKv8YKhJbBajQdV/ZlnHwPMn2w
	DSk5dtlz1Ccqk0L21VmU4tT2edC5N+OZbQDJ2U86FmupgiE8U6at84qU2fYTIJui/UEDvxL2UKcp5
	dg5iYyqfqeXE6YksCxTdcD6KjlkGkTAkk3MBUIbijm69Rm1rnnYIBeRY6Y9gmvnL3Eh2lg58rYqRg
	IX5999HXtpmAKW753soBhd5phdWNfNiTFVAuLRV7DLwcUMiHt35jRRJQ5OWQhRASYyUDY1ECJiKLc
	PymsiEsPOQotwXvrgNBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Wdj-0000xF-WE; Thu, 14 Mar 2019 20:07:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Wdh-0000wf-Bn
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 20:07:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id a188so3942161wmf.3
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=FjAcSKJqzDX3s5cCpFMPy9SjU+PstHwSU7dyfv72OTo=;
 b=pKE9FWOaxLiTqR81OfppvwXr0XcHRrvqMl4ymocIFvQvv98Zqh5I7j3SNjAo+VxxVb
 rmZsfJVIdOb021IVqryQ3z6N+kwvfQei5wu/JUWqgUAxxn4ogGoahCGXmdyHlMlGZwzC
 BFbFbwGCQhz/PhoIBCnVK127M3yCDvUkciFXWSlNfj3q6OyqLkvmSvo8Hgj9rsdRUIQI
 wh/XncfEwRd1WhpLjVvoHkAsRr+J4x9vh7xzwtpay+U8j4bnlJHO7nIjELdHuFFFCmo7
 VmEouFkBKL7W3vuS2vIZf2RmBO7OPjCFUMEfOzFX/57sf6v4eungCzYXx26l8dD1tA9+
 Sunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=FjAcSKJqzDX3s5cCpFMPy9SjU+PstHwSU7dyfv72OTo=;
 b=mW5GOBpOpy1AbSex3JG/dyCwa5/NRrrdohl3JKlyM7yTuGAPE1L4us8nOSfcvCqQ4P
 XYldFUEKXOtDKtnO1+qkLcyilRjkptMQoect3/VJ7iBd2xdC+L4n7Y9chBCXy2HndRzC
 wpPdc5efEAyGCtLjbKdDBLwSws54/XUI/eoIHEFy68716Yjt1f32Qjdso9K4PuRSNA9H
 EKL+zBNLm49gpbdluEKw6Nnt8RyBKvlAG+8gIntmY9Szvs7DodtsoEVQWqECDy469wI0
 u+BdxtuTPqt3YU4cusT6yxn44YSApQB+El7o4SbM5tnHArvS5JS+ZueRENxfLvvylHxK
 lVPQ==
X-Gm-Message-State: APjAAAUY1sFIdLcNyHwA/ZDDBINep6ZLleL0qza7DPf8X3OYc8LIXFKO
 0BnwRRQuD3mdPSS2f5OvaPxJhrTkCCFEWePX
X-Google-Smtp-Source: APXvYqy1j+jdwlg6ZoMYfS11o4d9hri4qOmL3S1gJva4iASfo96QffmedFVYpyzZ6v0N06nqlwK8ZQ==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr169343wmc.112.1552594058763; 
 Thu, 14 Mar 2019 13:07:38 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id f6sm16481116wrt.87.2019.03.14.13.07.37
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 14 Mar 2019 13:07:38 -0700 (PDT)
Message-ID: <5C8AB489.3000202@baylibre.com>
Date: Thu, 14 Mar 2019 21:07:37 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/8] drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling
 support
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
 <1549022873-40549-2-git-send-email-narmstrong@baylibre.com>
 <CAL_JsqLa1QNYTo+Yj-5fC4k8C1bd+V8qi5LiHgLA_qZY+Gy5cg@mail.gmail.com>
 <36800d4e-0bb7-378c-e512-5ae02406865b@baylibre.com>
 <CAL_Jsq+-q3+PtU6zS-dLSy3Gx+xOzquLyuW3n3ey6iRT3tw9KA@mail.gmail.com>
 <6e0f70a4-8e12-7000-bc5d-de5093d173c5@baylibre.com>
 <CAL_JsqL+R_wyzQ9UB37N4jwD8na301+=B9x6+z1LSMdKer88qg@mail.gmail.com>
In-Reply-To: <CAL_JsqL+R_wyzQ9UB37N4jwD8na301+=B9x6+z1LSMdKer88qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_130741_468247_1C401DF4 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Huicong Xu <xhc@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKTGUgMTQvMDMvMjAxOSAxOTo1NSwgUm9iIEhlcnJpbmcgYSDDqWNyaXQgOgo+IE9u
IE1vbiwgTWFyIDExLCAyMDE5IGF0IDM6NTMgQU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiB3cm90ZToKPj4KPj4gT24gMDgvMDMvMjAxOSAxNTo1NCwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4+PiBPbiBGcmksIE1hciA4LCAyMDE5IGF0IDI6MDUgQU0gTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEhpIFJvYiwKPj4+
Pgo+Pj4+IE9uIDA4LzAzLzIwMTkgMDA6MTMsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4+PiBPbiBG
cmksIEZlYiAxLCAyMDE5IGF0IDY6MDggQU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBBZGQgc3VwcG9ydCBmb3IgU0NEQyBTZXR1
cCBmb3IgVE1EUyBDbG9jayA+IDMuNEdIeiBhbmQgZW5hYmxlIFRNRFMKPj4+Pj4+IFNjcmFtYmxp
bmcgd2hlbiBzdXBwb3J0ZWQgb3IgbWFuZGF0b3J5Lgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgcGF0Y2gg
YWxzbyBhZGRzIGFuIGhlbHBlciB0byBzZXR1cCB0aGUgY29udHJvbCBiaXQgdG8gc3VwcG9ydAo+
Pj4+Pj4gdGhlIGhpZ2ggVE1EUyBCaXQgUGVyaW9kL1RNRFMgQ2xvY2stUGVyaW9kIFJhdGlvIGFz
IHJlcXVpcmVkIHdpdGgKPj4+Pj4+IFRNRFMgQ2xvY2sgPiAzLjRHSHogZm9yIEhETUkyLjAgMzg0
MHgyMTYwQDYwLzUwIG1vZGVzLgo+Pj4+Pj4KPj4+Pj4+IFRoZXNlIGNoYW5nZXMgd2VyZSBiYXNl
ZCBvbiB3b3JrIGRvbmUgYnkgSHVpY29uZyBYdSA8eGhjQHJvY2stY2hpcHMuY29tPgo+Pj4+Pj4g
YW5kIE5pY2tleSBZYW5nIDxuaWNrZXkueWFuZ0Byb2NrLWNoaXBzLmNvbT4gdG8gc3VwcG9ydCBI
RE1JMi4wIG1vZGVzCj4+Pj4+PiBvbiB0aGUgUm9ja2NoaXAgNC40IEJTUCBrZXJuZWwgYXQgWzFd
Cj4+Pj4+Pgo+Pj4+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1saW51eC9rZXJu
ZWwvdHJlZS9yZWxlYXNlLTQuNAo+Pj4+Pj4KPj4+Pj4+IENjOiBOaWNrZXkgWWFuZyA8bmlja2V5
LnlhbmdAcm9jay1jaGlwcy5jb20+Cj4+Pj4+PiBDYzogSHVpY29uZyBYdSA8eGhjQHJvY2stY2hp
cHMuY29tPgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPgo+Pj4+Pj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250
ZWNoLmRlPgo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4+Pj4+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCB8ICAxICsKPj4+Pj4+ICBp
bmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICAxICsKPj4+Pj4+ICAz
IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+
Pj4+IFRoaXMgY29tbWl0IGluIGRybS1taXNjLW5leHQgaXMgYnJlYWtpbmcgYm9vdGluZyBvbiB0
aGUgUm9jazk2MC4gSQo+Pj4+PiBoYXZlIEZCIGFuZCBmYmNvbiBlbmFibGVkLiBUaGUgYm9vdCBo
YW5ncyBhZnRlciB0aGlzIG1lc3NhZ2U6Cj4+Pj4+Cj4+Pj4+IFsgICAgMy4wMTIzMzRdIFtkcm06
cm9ja2NoaXBfZHJtX2ZiZGV2X2NyZWF0ZV0gRkIgWzE5MjB4MTA4MF0tMjQKPj4+Pj4ga3ZhZGRy
PShfX19fcHRydmFsX19fXykgb2Zmc2V0PTAgc2l6ZT04Mjk0NDAwCj4+Pj4KPj4+PiBDb3VsZCB5
b3UgZ2l2ZSBtb3JlIGRldGFpbHMgb24gdGhlIHRyZWUgdXNlZCA/IGRpZCB5b3UgYmlzZWN0IHRv
IGZpbmQgdGhpcyBjb21taXQgPwo+Pj4KPj4+IEFzIEkgc2FpZCBhYm92ZSwgZHJtLW1pc2MtbmV4
dCAoZnJvbSBkcm0tbWlzYyB0cmVlKSBpcyB0aGUgYnJhbmNoLiBJCj4+PiBiaXNlY3RlZCBiZXR3
ZWVuIGl0IGFuZCB2NS4wLiBSZXZlcnRpbmcgaXQgZml4ZXMgYm9vdGluZy4KPj4KPj4gVGhhbmtz
LCBjb3VsZCB5b3UgZ2l2ZSBtb3JlIGRldGFpbHMgb24gdGhlIGVudmlyb25tZW50ID8gRGlkIHlv
dSB0ZXN0IG92ZXIgdGhlIGxhdGVzdCBsaW51eC1uZXh0ID8KPiAKPiBIZXJlJ3MgYSBsb2cgb2Yg
dGhlIGRybSBwYXJ0czogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vdEZKOUdzNmgKPiAKPiBsaW51eC1u
ZXh0IGFsc28gaGFuZ3MuCj4gCj4+IENhbiB5b3Ugc2hhcmUgdGhlIEVESUQgb2YgeW91ciBtb25p
dG9yID8KPiAKPiBNYXliZSBub3QgbW9kZSByZWxhdGVkLiBJIHRyaWVkIGZvcmNpbmcgdG8gMTI4
MHg3MjAgYW5kIGl0IGhhbmdzIHRvby4KPiBJbiBhbnkgY2FzZSwgaGVyZSdzIHRoZSBwYXJzZWQg
RURJRDoKPiAKPiAyNTYtYnl0ZSBFRElEIHN1Y2Nlc3NmdWxseSByZXRyaWV2ZWQgZnJvbSBpMmMg
YnVzIDMKPiBMb29rcyBsaWtlIGkyYyB3YXMgc3VjY2Vzc2Z1bC4gSGF2ZSBhIGdvb2QgZGF5Lgo+
IENoZWNrc3VtIENvcnJlY3QKPiAKPiBTZWN0aW9uICJNb25pdG9yIgo+IElkZW50aWZpZXIgIkNZ
Uy1SMTAxIgo+IE1vZGVsTmFtZSAiQ1lTLVIxMDEiCj4gVmVuZG9yTmFtZSAiQ1lYIgo+ICMgTW9u
aXRvciBNYW51ZmFjdHVyZWQgd2VlayAyOCBvZiAyMDE4Cj4gIyBFRElEIHZlcnNpb24gMS4zCj4g
IyBEaWdpdGFsIERpc3BsYXkKPiBEaXNwbGF5U2l6ZSAyMjAgMTMwCj4gR2FtbWEgMi4yMAo+IE9w
dGlvbiAiRFBNUyIgInRydWUiCj4gSG9yaXpzeW5jIDMwLTEwMgo+IFZlcnRSZWZyZXNoIDQ4LTc1
Cj4gIyBNYXhpbXVtIHBpeGVsIGNsb2NrIGlzIDE5ME1Iego+ICNOb3QgZ2l2aW5nIHN0YW5kYXJk
IG1vZGU6IDE5MjB4MTA4MCwgNjBIego+ICNOb3QgZ2l2aW5nIHN0YW5kYXJkIG1vZGU6IDE5MjB4
MTA4MCwgNjBIego+ICNOb3QgZ2l2aW5nIHN0YW5kYXJkIG1vZGU6IDE5MjB4MTA4MCwgNjBIego+
ICNOb3QgZ2l2aW5nIHN0YW5kYXJkIG1vZGU6IDE0NDB4OTAwLCA2MEh6Cj4gI05vdCBnaXZpbmcg
c3RhbmRhcmQgbW9kZTogMTQwMHgxMDUwLCA2MEh6Cj4gI05vdCBnaXZpbmcgc3RhbmRhcmQgbW9k
ZTogMTI4MHgxMDI0LCA2MEh6Cj4gI05vdCBnaXZpbmcgc3RhbmRhcmQgbW9kZTogMTI4MHg5NjAs
IDYwSHoKPiAjTm90IGdpdmluZyBzdGFuZGFyZCBtb2RlOiAxMjgweDcyMCwgNjBIego+IAo+ICNF
eHRlbnNpb24gYmxvY2sgZm91bmQuIFBhcnNpbmcuLi4KPiBNb2RlbGluZSAiTW9kZSA1IiA1NC4w
MCAyNTYwIDI2MDggMjY0MCAyNzIwIDE0NDAgMTQ0MyAxNDQ4IDE0ODEgK2hzeW5jICt2c3luYwo+
IE1vZGVsaW5lICJNb2RlIDAiIDI2Ny44MSAyNTYwIDI2MDggMjY0MCAyNzIwIDE2MDAgMTYwMyAx
NjA4IDE2NDEgK2hzeW5jICt2c3luYwo+IE1vZGVsaW5lICJNb2RlIDEiIDE0OC41MDAgMTkyMCAy
MDA4IDIwNTIgMjIwMCAxMDgwIDEwODQgMTA4OSAxMTI1ICtoc3luYyArdnN5bmMKPiBNb2RlbGlu
ZSAiTW9kZSAyIiA3NC4yNTAgMTkyMCAyMDA4IDIwNTIgMjIwMCAxMDgwIDEwODIgMTA4NyAxMTI1
Cj4gK2hzeW5jICt2c3luYyBpbnRlcmxhY2UKPiBNb2RlbGluZSAiTW9kZSAzIiA3NC4yNTAgMTI4
MCAxMzkwIDE0MjAgMTY1MCA3MjAgNzI1IDczMCA3NTAgK2hzeW5jICt2c3luYwo+IE1vZGVsaW5l
ICJNb2RlIDQiIDE0OC41MDAgMTkyMCAyNDQ4IDI0OTIgMjY0MCAxMDgwIDEwODQgMTA4OSAxMTI1
ICtoc3luYyArdnN5bmMKPiBPcHRpb24gIlByZWZlcnJlZE1vZGUiICJNb2RlIDUiCj4gRW5kU2Vj
dGlvbgo+IAo+PiBDYW4geW91IGNoZWNrIHRoaXMgcGF0Y2ggOgo+IAo+IFN0aWxsIGhhbmdzIHdp
dGggaXQuCgoKVGhhbmtzIGZvciB0ZXN0aW5nLCB0aGUgb25seSBpbXBhY3Qgd291bGQgYmUgaWYg
aGRtaV9pbmZvLT5zY2RjLnN1cHBvcnRlZAphbmQgaGRtaV9pbmZvLT5zY2RjLnNjcmFtYmxpbmcu
bG93X3JhdGUgd2VyZSB0cnVlLgpIb25lc3RseSwgaGRtaV9pbmZvLT5zY2RjLnNjcmFtYmxpbmcu
bG93X3JhdGUgd2Fzbid0IHJlYWxseSB0ZXN0ZWQuCgpDb3VsZCB5b3UgZHVtcCB0aGUgZWRpZCBp
biBiaW5hcnkgZm9ybWF0ID8gb3IgcGFyc2UgaXQgd2l0aCBodHRwczovL2dpdGh1Yi5jb20vcnBh
dmxpay9lZGlkLWRlY29kZQpzdXBwb3J0aW5nIG1vZGVybiBIRE1JIEVESURzLgoKClRoYW5rcywK
TmVpbAo+IAo+Pgo+PiAtLS0tPjwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+IGluZGV4IGE2M2U1ZjBk
YWU1Ni4uZjMzYzJhYzE1OGMxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYwo+PiBAQCAtMTI2OCw4ICsxMjY4LDYgQEAgc3RhdGljIGludCBoZG1pX3Bo
eV9jb25maWd1cmUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4+Cj4+ICAgICAgICAgZHdfaGRtaV9w
aHlfcG93ZXJfb2ZmKGhkbWkpOwo+Pgo+PiAtICAgICAgIGR3X2hkbWlfc2V0X2hpZ2hfdG1kc19j
bG9ja19yYXRpbyhoZG1pKTsKPj4gLQo+PiAgICAgICAgIC8qIExlYXZlIGxvdyBwb3dlciBjb25z
dW1wdGlvbiBtb2RlIGJ5IGFzc2VydGluZyBTVlNSRVQuICovCj4+ICAgICAgICAgaWYgKHBoeS0+
aGFzX3N2c3JldCkKPj4gICAgICAgICAgICAgICAgIGR3X2hkbWlfcGh5X2VuYWJsZV9zdnNyZXQo
aGRtaSwgMSk7Cj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
