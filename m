Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FDDC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:15:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6454420795
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xUsSrypK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lOHqSdGo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6454420795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WGLvsNvHFunvKIwFhyveUTjgHI7nF7vsCTfRPUoF8cY=; b=xUsSrypKnRKwfRx4LLF2HKJhP
	NypZcxILUVEQgIM/fUwpCXQBLj0ZdkCzakplEvVftYL/vGLU9Nc7OBcTMWKa3bcqUTBe4rKEskcDq
	G9f92XKfmu2OksvJd7OrNLk0ZScQV5Qkg42L3NhBqwmNoPEi+fRU0+3v2sNCAfsrkSKO8485HffRf
	9tXP2KfQrHKF2y09Nxc7zUSQjZVBmYANSMNWZ1j6kSWQ5bXWC6fH9ehBuSutBTb10Z2yOgI9nRk8e
	4Adef/kS9DhBjoJ91rOLrqCUHEH7Pa2QPqVr0A6bbF53cHZeE4H+yzIAjgYRQkYLk1nOuIuHkvFzU
	psN2sDoyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQWQ-0007NK-0o; Fri, 02 Oct 2020 19:15:14 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQWN-0007LN-PT
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 19:15:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id g9so905698pgh.8
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=udoo1e1K/MJO7dXdLeUJ+C+ApV9G4bFA1xKDqjW6WKA=;
 b=lOHqSdGoeeYtkwNeXBZSY9F/sQyhvVzrfw+wrxQmBlkhxA12pGqgWkC0qIuDzemZi/
 u/ZsKociQof3/6FY+W4OT6JAnoISFxCGNva5ue2cNpW1unRaGMlsW+JxB2bo/nfQHImX
 aLHT3oLkOm2g6b1v+JFy2eLEtagA3Z+dvDZxXlobcPm/8zeD3stsj2MCSOtoQAJVIJ/N
 Ri/7dPIjq0sJF49P+KY8EpQpVntIIVKpbp0MjhiLpHBGtKHjrHWVxA9rP/hyngNVq8K3
 qaL9dbAaMMUa2U8OarsQEamDbRfoxw+dKRkezLiKzy803cyv5kclZIx3MoPAdaL0iemV
 C7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=udoo1e1K/MJO7dXdLeUJ+C+ApV9G4bFA1xKDqjW6WKA=;
 b=ZcBywfRBAbg1M+4qFXoEMdLAXpZs8EptCOcvzo8+09jAZX3uJthC5eU97zo2gPVH8A
 knsnd+Qi3xcoHpLd88pAVEi/D4CDydMElEFQ0rTVkdHujJhuCngmDPQUmfpSmT1gyexE
 MnMohf+x/06sHaK8jT6wvMoyDhexoB0ChXoBwbL1zzXO+W+Q7D/kpHnUM/ClqPxrZ6dk
 550CJ0MeAbYB5PfySDoPdI42I06wWJ1BewlWKSbtRNShSFjXh9zjyz1ajW8ylEcEou8l
 I4h5N6YG/aIxjNa+fnYuGk2E9S57c9w1IoP4DzIiIa54ijmtgySfmB0LD1DMpVic/GrT
 9rAg==
X-Gm-Message-State: AOAM533hXtuzdXSO3AeNTJDx+1r/dNXQUtC04glYBr1BHbCDOt86RsEE
 FyMP7Mm+nt487Na4sbg59KGlmQ==
X-Google-Smtp-Source: ABdhPJzC3SlwPqprCyyrT3tGHnKVwg9vLOUka3Wr13DIo2hHV3LZWIEZhJLHAbOEX+rIAC7yrf6AXg==
X-Received: by 2002:aa7:8c09:0:b029:142:2501:3983 with SMTP id
 c9-20020aa78c090000b029014225013983mr4007479pfd.72.1601666108837; 
 Fri, 02 Oct 2020 12:15:08 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id gb17sm2357323pjb.15.2020.10.02.12.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 12:15:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
In-Reply-To: <1jmu14qx1q.fsf@starbuckisacylon.baylibre.com>
References: <20201002141619.14387-1-christianshewitt@gmail.com>
 <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
 <785296E3-FA91-4F5E-A8C0-1FAA8C576A17@gmail.com>
 <7h7ds8mppz.fsf@baylibre.com> <1jmu14qx1q.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 02 Oct 2020 12:15:07 -0700
Message-ID: <7hy2kol9s4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_151511_848181_9EEB2DA5 
X-CRM114-Status: GOOD (  21.36  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gT24gRnJpIDAy
IE9jdCAyMDIwIGF0IDIwOjQ1LCBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPiB3
cm90ZToKPgo+PiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4g
d3JpdGVzOgo+Pgo+Pj4+IE9uIDIgT2N0IDIwMjAsIGF0IDY6NDQgcG0sIEplcm9tZSBCcnVuZXQg
PGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPj4+PiAKPj4+PiBPbiBGcmkgMDIgT2N0IDIw
MjAgYXQgMTY6MTYsIENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29t
PiB3cm90ZToKPj4+PiAKPj4+Pj4gVklNM0wgbm93IGluaGVyaXRzIHRoZSBzb3VuZCBub2RlIGZy
b20gdGhlIFZJTTMgY29tbW9uIGR0c2kgYnV0IGlzCj4+Pj4+IGFuIFNNMSBkZXZpY2UsIHNvIGxh
YmVsIGl0IGFzIHN1Y2gsIGFuZCBzdG9wIHVzZXJzIGJsYW1pbmcgZnV0dXJlCj4+Pj4+IHN1cHBv
cnQgaXNzdWVzIG9uIHRoZSBkaXN0cm8vYXBwICJ3cm9uZ2x5IGRldGVjdGluZyIgdGhlaXIgZGV2
aWNlLgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0
aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tc20xLWtoYWRhcy12aW0zbC5kdHMgfCA0ICsrKysKPj4+Pj4gMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+PiAKPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEta2hhZGFzLXZpbTNsLmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEta2hhZGFzLXZpbTNsLmR0cwo+Pj4+PiBp
bmRleCA0YjUxN2NhNzIwNTkuLmY0NmYwZWNjMzdlYyAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+Pj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEta2hhZGFzLXZpbTNsLmR0
cwo+Pj4+PiBAQCAtMzIsNiArMzIsMTAgQEAKPj4+Pj4gCQlyZWd1bGF0b3ItYm9vdC1vbjsKPj4+
Pj4gCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwo+Pj4+PiAJfTsKPj4+Pj4gKwo+Pj4+PiArCXNvdW5k
IHsKPj4+Pj4gKwkJbW9kZWwgPSAiU00xLUtIQURBUy1WSU0zTCI7Cj4+Pj4+ICsJfTsKPj4+PiAK
Pj4+PiBUaGUgc291bmQgY2FyZCBpcyB0aGUgc2FtZSBzbyBJIGRvbid0IHNlZSB3aHkgdGhlIHNt
MSBib2FyZCBzaG91bGQgaGF2ZQo+Pj4+IGEgZGlmZmVyZW50IG5hbWUuIElmIHlvdSBhcmUgbm90
IGhhcHB5IHdpdGggdGhlIG5hbWUsIHBsZWFzZSB1cGRhdGUgaXQKPj4+PiBpbiB0aGUgY29tbW9u
IGZpbGUuCj4+Pgo+Pj4gSXTigJlzIGEgbmljZS10by1oYXZlIG5vdCBhIG11c3QtaGF2ZSwgYnV0
IHRoZSBjdXJyZW50IExFIGltYWdlcyB0aGF0IGFyZQo+Pj4gaW4gY2lyY3VsYXRpb24gdXNlIDUu
NyB3aXRoIHRoZSBwcmV2aW91cyBib2FyZC1jb3JyZWN0IG5hbWUgc28gSSB3YXMKPj4+IGxvb2tp
bmcgZm9yIGNvbnRpbnVpdHkuIFdlIGRvIHNlZSB1c2VyIGZvcnVtIHJlcG9ydHMgKGluZnJlcXVl
bnQgYnV0Cj4+PiByZWN1cnJpbmcpIG9mIHdyb25nbHkgZGV0ZWN0ZWQgaGFyZHdhcmUgd2l0aCBv
dGhlciBTb0MgcGxhdGZvcm1zIHdoZXJlCj4+PiBzaW1pbGFyIG5hbWUgaW5oZXJpdGFuY2Ugc3Vy
ZmFjZXMgdGhlIOKAmHdyb25n4oCZIGRldmljZSBuYW1lIGluIEdVSXMsIGFuZAo+Pj4gSSBsaWtl
IGFueXRoaW5nIHRoYXQgYXZvaWRzIHN1cHBvcnQgd29yay4KPj4+Cj4+PiBJ4oCZZCBzdWdnZXN0
IEtIQURBUy1WSU0zLVZJTTNMIGFzIGEgY29tbW9uIG5hbWUsIGJ1dCB0aGVuIGl04oCZcyB0aGUg
b25seQo+Pj4gZGV2aWNlIGluIHRoZSBjdXJyZW50IGRldmljZS10cmVlIHNldCB0aGF0IGlzIG5v
dCBwcmVmaXhlZCB3aXRoIHRoZSBTb0MKPj4+IGlkZW50aWZpZXIsIHdoaWNoIChPQ0QpIGZlZWxz
IHdyb25nLgo+Pgo+PiBUcnVlLCBidXQgdHVybnMgb3V0IHRoZXJlJ3Mgbm90aGluZyBTb0Mgc3Bl
Y2lmaWMgYWJvdXQgdGhpcyBzb3VuZCBibG9jawo+PiBzaW5jZSBpdCdzIGlkZW50aWNhbCBhY3Jv
c3MgU29Dcywgc28gc3BlY2lmeWluZyB0aGUgU29DIGlzIGJlaW5nIHRvbwo+PiBzcGVjaWZpYy4g
Cj4+Cj4+IE9UT0gsIHdoaWxlIEkgYWdyZWUgaXQgbG9va3MgIndyb25nIiwgaXQncyBwcmV0dHkg
Y29tbW9uIGluIExpbnV4IERUIHRvCj4+IGhhdmUgdGhlIFNvQyBwcmVmaXggdG8gbWVhbiBvbmx5
IHRoYXQgaXQncyAiY29tcGF0aWJsZSIgd2l0aCB0aGF0IFNvQywKPj4gbm90IHRoYXQgaXQgKmlz
KiB0aGF0IFNvQy4KPj4KPj4gSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoYXQgY2FuIGxlYWQgdG8g
Y29uZnVzaW9uIHdpdGggZW5kIHVzZXJzLCBzbwo+PiBzaW5jZSB0aGlzIGNoYW5nZSBoYXMgbm90
IGZ1bmN0aW9uYWwgY2hhbmdlLCBhbmQgb25seSBhIFVYIGlzc3VlIGluCj4+IHVzZXJzcGFjZSwg
SSdtIGZpbmUgdG8gYXBwbHkgaXQuCj4KPiBJdCBpcyBub3QgVVggb25seS4gVGhpcyBzdHJpbmcg
aXMgdXNlZCBieSBhbHNhLXV0aWxzIHRvIG1hdGNoIHRoZQo+IGNhcmQuIEZvciBleGFtcGxlLCB0
aGUgc3RyaW5nIHdpbGwgYmUgbWF0Y2hlZCB0byByZXN0b3JlIHRoZSBjb250cm9scwo+IHNldHRp
bmdzIHdpdGggYWxzYWN0bCBvbiBib290LiBWSU0zIGFuZCBWSU0zTCBhcmUgdGhlIHNhbWUgc291
bmQgY2FyZAo+IEFGQUlDVCwgc28gaXQgc2hvdWxkIGJlIHRoZSBzYW1lIHN0cmluZy4KCkFoLCBP
SywgdGhhbmtzIGZvciBjbGFyaWZ5aW5nLiAgIFRoZW4gSSB3b3VsZCBzYXkgaWYgaXQgZ2V0cyBj
aGFuZ2VkLCBpdApnZXRzIGNoYW5nZWQgaW4gdGhlIGNvbW1vbiBmaWxlLgoKS2V2aW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
