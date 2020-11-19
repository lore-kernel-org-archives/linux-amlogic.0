Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC33C388F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:33:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321D920867
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhqAYsYi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSMYoLed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 321D920867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WTZRmCZoHdtvfDvETx+Z7TCe23Xxt6xWSifyNhbYqTw=; b=WhqAYsYiVSwyFnkHIJX/uVPl8
	sHl9YKFYLyv9AvBxg0fqFHC20sRQ+/o6De1AMK4R9bluZmjtOe5V9saO8KlBcNaK/2jagmLPvGN0a
	swWmjK/RB8B4k7dDnh9mZ1UNPlzRyuJK0DR+gx8ZGV1Mls0gkyoJptR6V5C3J+kB9Ud+F53KSBGjE
	hZTo50ORmt3S2nJ9Crwj49OsnpLrZ1NY8w7LXUrEdCz+Mj9DvE0HVaNlJ1uaAJRQHrIFoecMbRHhf
	JIENpkOSuqWFp5GZPQ5wAr/UQfKJwj5q4AQA6ubR2uJFeGtyWziZ8rA+5pLg30M/9O8YPxQbFsAxD
	Zv0pdQyXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfiBg-0007dc-JQ; Thu, 19 Nov 2020 11:33:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfiBd-0007cZ-2s; Thu, 19 Nov 2020 11:33:14 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBB7A20867;
 Thu, 19 Nov 2020 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605785589;
 bh=IwzuzZJdgwM/mSCg/YGq4DFiccAa0AMjMOfLhF3JG8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KSMYoLedOZpStbTVjCff3VA/bScZg/ZBa6KN2hth62ft0nkMImZm0kHTF5TDUuxCj
 8rQwrf/w655P5dRXoelEcF1FC8r9D+7nMXVCDEv3HaDhKKjvQJ9u9NmQg1lZbGu2BT
 Z8cIAWKKIxlLFh7MZ+3urSr8owbFL0odZfYyGCpI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfiBW-00Bw2g-MO; Thu, 19 Nov 2020 11:33:06 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 11:33:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <48731911dbbe869a6d3bdafd819fa9ff@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, guillaume.tucker@collabora.com,
 kernelci-results@groups.io, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_063313_334178_0598E5D9 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0xMS0xOSAxMDoyNiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTkvMTEvMjAy
MCAxMToyMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+PiBPbiAyMDIwLTExLTE5IDA4OjUwLCBHdWls
bGF1bWUgVHVja2VyIHdyb3RlOgo+Pj4gUGxlYXNlIHNlZSB0aGUgYXV0b21hdGVkIGJpc2VjdGlv
biByZXBvcnQgYmVsb3cgYWJvdXQgc29tZSBrZXJuZWwKPj4+IGVycm9ycyBvbiBtZXNvbi1neGJi
LXAyMDAuCj4+PiAKPj4+IFJlcG9ydHMgYXJlbid0IGF1dG9tYXRpY2FsbHkgc2VudCB0byB0aGUg
cHVibGljIHdoaWxlIHdlJ3JlCj4+PiB0cmlhbGluZyBuZXcgYmlzZWN0aW9uIGZlYXR1cmVzIG9u
IGtlcm5lbGNpLm9yZywgaG93ZXZlciB0aGlzIG9uZQo+Pj4gbG9va3MgdmFsaWQuCj4+PiAKPj4+
IFRoZSBiaXNlY3Rpb24gc3RhcnRlZCB3aXRoIG5leHQtMjAyMDExMTggYnV0IHRoZSBlcnJvcnMg
YXJlIHN0aWxsCj4+PiBwcmVzZW50IGluIG5leHQtMjAyMDExMTkuwqAgRGV0YWlscyBmb3IgdGhp
cyByZWdyZXNzaW9uOgo+Pj4gCj4+PiDCoCBodHRwczovL2tlcm5lbGNpLm9yZy90ZXN0L2Nhc2Uv
aWQvNWZiNjE5NmJmZDAxMjdmZDY4ZDhkOTAyLwo+Pj4gCj4+PiBUaGUgZmlyc3QgZXJyb3IgaXM6
Cj4+PiAKPj4+IMKgIFvCoMKgIDE0Ljc1NzQ4OV0gSW50ZXJuYWwgZXJyb3I6IHN5bmNocm9ub3Vz
IGV4dGVybmFsIGFib3J0OiA5NjAwMDIxMAo+Pj4gWyMxXSBQUkVFTVBUIFNNUAo+PiAKPj4gTG9v
a3MgbGlrZSB5ZXQgYW5vdGhlciBjbG9jayBvcmRlcmluZyBzZXR1cC4gSSBndWVzcyBkaWZmZXJl
bnQgQW1sb2dpYwo+PiBwbGF0Zm9ybXMgaGF2ZSBzbGlnaHRseSBkaWZmZXJlbnQgb3JkZXJpbmcg
cmVxdWlyZW1lbnRzLgo+PiAKPj4gTmVpbCwgZG8geW91IGhhdmUgYW55IGlkZWEgb2Ygd2hpY2gg
cGxhdGZvcm0gcmVxdWlyZXMgd2hpY2ggb3JkZXJpbmc/Cj4+IFRoZSB2YXJpYWJpbGl0eSBpbiBE
VCBhbmQgcGxhdGZvcm1zIGlzIHByZXR0eSBkaWZmaWN1bHQgdG8gZm9sbG93IChhbmQKPj4gSSBk
b24ndCB0aGluayBJIGhhdmUgc3VjaCBib2FyZCBhcm91bmQpLgo+IAo+IFRoZSByZXF1aXJlbWVu
dHMgc2hvdWxkIGJlIHRoZSBzYW1lLCBoZXJlIHRoZSBpbml0IHdhcyBkb25lIGJlZm9yZSAKPiBj
YWxsaW5nCj4gZHdfaGRtaV9wcm9iZSB0byBiZSBzdXJlIHRoZSBjbG9ja3MgYW5kIGludGVybmFs
cyByZXNldHMgd2VyZSAKPiBkZWFzc2VydGVkLgo+IEJ1dCBzaW5jZSB5b3UgYm9vdCBmcm9tIHUt
Ym9vdCBhbHJlYWR5IGVuYWJsaW5nIHRoZXNlLCBpdCdzIGFscmVhZHkgCj4gYWN0aXZlLgoKVGhl
IGNyYXNoaW5nIHBsYXRmb3JtIGFsc28gYm9vdHMgd2l0aCB1LWJvb3QuIFdoYXQgaXMgdGhlIGRp
ZmZlcmVuY2U/Ck5vIEhETUkgc3VwcG9ydD8KCj4gVGhlIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHJl
dmVydCBhbmQgZG8gc29tZSBjaGVjayBpbiAKPiBtZXNvbl9kd19oZG1pX2luaXQoKSB0bwo+IGNo
ZWNrIGlmIGFscmVhZHkgZW5hYmxlZCBhbmQgZG8gbm90aGluZy4KCkl0IGxvb2tzIG1vcmUgc3Vi
dGxlIHRoYW4gdGhhdCwgYXMgaXQgYWxzbyBkZXBlbmRzIG9uIHdoaWNoIERUIGlzIApwcm92aWRl
ZAooYW4gZWFybHkgbWVzb25fZHdfaGRtaV9pbml0KCkgd29ya3Mgd2l0aCB0aGUga2VybmVsIERU
LCBhbmQgYnJlYWtzIHdpdGggCnRoZQp1LWJvb3QgRFQpLiBTbyB3aGF0ZXZlciBkaWZmZXJlbmNl
IGlzIGJldHdlZW4gdGhlIHR3byBEVHMgY2F1c2VzIGhhdm9jLgp1LWJvb3Qgb2J2aW91c2x5IG9u
bHkgdXNlcyBpdHMgb3duIERULCBzbyB3ZSBhcmUgbG9va2luZyBhdCBhIGtlcm5lbCBidWcgCmhl
cmUuCgpOb3QgaGF2aW5nIHRoaXMgcGF0Y2ggYWxzbyBicmVha3MgbW9kdWxlIHJlaW5zZXJ0aW9u
IChIRE1JIGNsb2NrcyBhcmUgCmRpc2FibGVkCm9uIHVuYmluZCksIHNvICpzb21ldGhpbmcqIGhh
cyB0byBiZSBkb25lIGxhdGUuCgpTbyBoZXJlIGFyZSBteSBxdWVzdGlvbnM6Ci0gV2hhdCBicmVh
a3MgaW4gbXkgY29uZmlnIHdoZW4gSSBib290IHVzaW5nIHUtYm9vdCdzIERUPwotIEhvdyB0byBk
ZXRlY3QgZWFybHkgdGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBjbG9ja2VkIG9yIG5vdD8KClRoYW5r
cywKCiAgICAgICAgIE0uCi0tIApKYXp6IGlzIG5vdCBkZWFkLiBJdCBqdXN0IHNtZWxscyBmdW5u
eS4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
