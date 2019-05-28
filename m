Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE67CC04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 18:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D2420883
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 18:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGtIQbY1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S96DHKfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D2420883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3VYPnx+3QiUFkBiF+JX42yxAj0IpwyePYSiaULJUIs=; b=cGtIQbY1pBIgbN
	A6zoPzxL2AIuebOK7mESwSgha5nBxhLl8ousEF+xJbFDGkvrrINqwhuFL5YU93gxg0j0N87vbrLbf
	mDCtsAJjOb6omyIWRSjFYTZnX6Or63KQyNIxunB1vpax7tVvyM9LIK5M47v2RYhyhj0a3U2dIf2tS
	IrTmMX/JZ15tmxSrXowN+4/ZNBxwBapWPVaw5qvCoPXV0dwJeyKYAGADXMlsMhdAhGoLdmIEx0i4N
	qDlJsd8lpMW7owyRWeP8s8cbipHSSISo6TUMG1l52Jlyy8xl+5Udo8Br+I6PQHiVRTveYi5cnYTFg
	GNJpJHpxYVza4Mai2dkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVgTK-0001Ni-0v; Tue, 28 May 2019 18:05:14 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVgTA-00009X-9T; Tue, 28 May 2019 18:05:12 +0000
Received: by mail-ot1-x344.google.com with SMTP id l17so18674889otq.1;
 Tue, 28 May 2019 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CQxWFe6czG2bT+E5vQ0cGm/ESs62tRcAolQyTGumg4o=;
 b=S96DHKfGnrWA3fayeAGBuk0VhGyiR0EWi0nRny8YntXYzTGPKq58f4EJtve596fjOJ
 codwqPXsn5sDeRcmx9hR2FbNzwUumlg5Rt6mZQuoPP8TJSunDqzcQ1eI+hkckvuwNaw+
 T0rvJ7Bnyzxl6cWLPWN4nJsqxzOagnXoBx9Vx+WjGun77D+76DZCCPsyWUuwDYsGWTLg
 E1KClD0GDUyCh+M8yKezXOJZX11761ZeraD7tFnD4LbLBbt7wUREWFG0H+ROARi8GwJA
 C/x0Rr+/RApnvVW65xyNSSC9PWexT4EaZ9qspfSTB75Dscey7bP0hKUFl/YTI9gEErrv
 39jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CQxWFe6czG2bT+E5vQ0cGm/ESs62tRcAolQyTGumg4o=;
 b=QnjuXW1D9zVWJN/vhD0Dd8ReJIpO1N129p8fRoBXm3WsFi6ZZIU1k6Ej/V+L7LQL1N
 diOZURzbepJzltR8lxunkZ9n6B8BwNAwSU1jq3YbhjZ4T39JCdi4UmVABW2PsMwMBZhp
 OYXhY/FNhijeDIfgYdU2IQeetyrUuAF8YSZA2YkPjehB6wVRbSL6pzc+Te/n+E1gfus/
 b5b/cpev2Moz41dXwynbuQpelpD7fm4B9x+7iwENv/k1oFLFUHjsFm39N20M/0154nYD
 /GvaOBBqQvS6Bv8+PP6hB49D4ZIpPDW5TquLxksHNtGL/lNJZkH30tWkfCf59blpd5R+
 BoFg==
X-Gm-Message-State: APjAAAVynjzS0yu9IXFlxwYa62oEre3BwTIHpvZLkJ9HbX9YxKCsN7L3
 9fmOzsdCTa2JjbAKZ3bDJUw4GwCj00P3fAfFNNA=
X-Google-Smtp-Source: APXvYqxQxsGkXFE+oqzGgB8Id81ggPL3jwHGjadRwPTCK4xlA9P4CLJsxyz90d3Pkk+rQcnZDov0VfIxSa3LyGBHu3I=
X-Received: by 2002:a9d:744d:: with SMTP id p13mr54509230otk.96.1559066696707; 
 Tue, 28 May 2019 11:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-5-martin.blumenstingl@googlemail.com>
 <3b61897a-267b-fd6e-181b-a8c7e47918fb@baylibre.com>
 <CAFBinCDXNy4=6U2gsh6vK6WEtJKAdfDGPMrpPJthbp5Rru1hbg@mail.gmail.com>
 <20190527180047.nfsjfqs22coyqmvp@pengutronix.de>
In-Reply-To: <20190527180047.nfsjfqs22coyqmvp@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 May 2019 20:04:45 +0200
Message-ID: <CAFBinCCWYf4TJ8GTL3PrHMRfL3=Ma-QrTAGSyAp5OQc0M-67Jg@mail.gmail.com>
Subject: Re: [PATCH 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_110506_139029_0C300E35 
X-CRM114-Status: GOOD (  20.16  )
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
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoKT24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgODowMCBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5
IDI3LCAyMDE5IGF0IDA3OjQ2OjQzUE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6
Cj4gPiBIaSBOZWlsLAo+ID4KPiA+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDI6MjYgUE0gTmVp
bCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gMjUvMDUvMjAxOSAyMDoxMSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+ID4gPiBN
SVNDX0NMS19TRUxfV0lEVEggaXMgb25seSB1c2VkIGluIG9uZSBwbGFjZSB3aGVyZSBpdCdzIGNv
bnZlcnRlZCBpbnRvCj4gPiA+ID4gYSBiaXQtbWFzay4gUmVuYW1lIGFuZCBjaGFuZ2UgdGhlIG1h
Y3JvIHRvIGJlIGEgYml0LW1hc2sgc28gdGhhdAo+ID4gPiA+IGNvbnZlcnNpb24gaXMgbm90IG5l
ZWRlZCBhbnltb3JlLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuCj4gPiA+ID4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3B3bS9wd20t
bWVzb24uYyB8IDQgKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiA+ID4gPiBpbmRleCBjNjJh
M2FjOTI0ZDAuLjg0YjI4YmEwZjkwMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3B3bS9w
d20tbWVzb24uYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gPiA+ID4g
QEAgLTMzLDcgKzMzLDcgQEAKPiA+ID4gPiAgI2RlZmluZSBNSVNDX0FfQ0xLX0RJVl9TSElGVCA4
Cj4gPiA+ID4gICNkZWZpbmUgTUlTQ19CX0NMS19TRUxfU0hJRlQgNgo+ID4gPiA+ICAjZGVmaW5l
IE1JU0NfQV9DTEtfU0VMX1NISUZUIDQKPiA+ID4gPiAtI2RlZmluZSBNSVNDX0NMS19TRUxfV0lE
VEggICAyCj4gPiA+ID4gKyNkZWZpbmUgTUlTQ19DTEtfU0VMX01BU0sgICAgMHgzCj4gPiA+Cj4g
PiA+IE5JVCBJIHdvdWxkIGhhdmUgdXNlZCBHRU5NQVNLIGhlcmUKPiA+IHRoYXQgd2FzIG15IGlu
aXRpYWwgaWRlYSBidXQgSSBkZWNpZGVkIGFnYWluc3QgaXQuCj4gPiB0aGUgdmFyaWFudCBJIGNh
bWUgdXAgd2l0aCB3YXM6ICNkZWZpbmUgTUlTQ19DTEtfU0VMX01BU0sgICAgR0VOTUFTSygxLCAw
KQo+ID4KPiA+IGhvd2V2ZXIsIHRoZSBhY3R1YWwgb2Zmc2V0IGlzIGVpdGhlciA0IG9yIDYgKGRl
cGVuZGluZyBvbiB0aGUgUFdNIGNoYW5uZWwpCj4gPiBhbmQgSSBmZWx0IHRoYXQgZHVwbGljYXRp
bmcgdGhlIG1hY3JvIHdvdWxkIGp1c3QgbWFrZSBpdCBtb3JlIGNvbXBsaWNhdGVkCj4gPiBzbyBp
bnN0ZWFkIEkgY2hvc2UgdG8gYmUgY29uc2lzdGVudCB3aXRoIE1JU0NfQ0xLX0RJVl9NQVNLCj4K
PiBBbiBvcHRpb24gd291bGQgYmU6Cj4KPiAgICAgICAgICNkZWZpbmUgTUlTQ19DTEtfU0VMX01B
U0soaHdpZCkgICAgICAgICBHRU5NQVNLKDEgKyA0ICogKGh3aWQpLCAwICsgNCAqIChod2lkKSkK
Pgo+IChOb3RlIEkgZGlkbid0IGNoZWNrIGEgbWFudWFsIHRvIHRoZSA0IGFib3ZlIGlzIHByb2Jh
Ymx5IHdyb25nLikKdGhhdCAob3IgYXQgbGVhc3Qgc29tZXRoaW5nIHNpbWlsYXIpIHdpbGwgd29y
awp0aGUgY2F0Y2ggaGVyZSBpczogd2UgdXNlIGl0IHRvIGluaXRpYWxpemUgdGhlIG11eCBjbG9j
ayBhbmQgdGhlCmNvbW1vbiBjbG9jayBmcmFtZXdvcmsgZXhwZWN0cyB1cyB0byBzZXQgInNoaWZ0
IiBhbmQgIm1hc2siLCB3aGlsZQptYXNrIHN0YXJ0cyBhdCBiaXQgMCBpbnN0ZWFkIG9mIHNoaWZ0
Cgp0aGlzIGlzIGhvdyB0aGUgY3VycmVudCBjb2RlIGlzIGJlaW5nIHVzZWQgYXQgdGhlIG1vbWVu
dDoKICBjaGFubmVsLT5tdXguc2hpZnQgPSBtZXNvbl9wd21fcGVyX2NoYW5uZWxfZGF0YVtpXS5j
bGtfc2VsX3NoaWZ0OwogIGNoYW5uZWwtPm11eC5tYXNrID0gTUlTQ19DTEtfU0VMX01BU0s7Cgpz
byB3aXRoIE1JU0NfQ0xLX1NFTF9NQVNLIHRoaXMgd291bGQgYmVjb21lOgogIGNoYW5uZWwtPm11
eC5zaGlmdCA9IG1lc29uX3B3bV9wZXJfY2hhbm5lbF9kYXRhW2ldLmNsa19zZWxfc2hpZnQ7CiAg
Y2hhbm5lbC0+bXV4Lm1hc2sgPSBNSVNDX0NMS19TRUxfTUFTSyhpKSA+PiBjaGFubmVsLT5tdXgu
c2hpZnQ7CgpvciB3ZSBjb3VsZCBkeW5hbWljYWxseSBkZXRlcm1pbmUgdGhlICJzaGlmdCIgdXNp
bmcgZmZzIG9yIGZyaWVuZHMKCm15IG93biBicmFpbiBwYXJzZXMgdGhlIHZhcmlhbnQgZnJvbSB0
aGUgcGF0Y2ggYmVzdApJJ20gaGFwcHkgdG8gY2hhbmdlIGl0IHRob3VnaCBpZiB3ZSBjYW4gZmlu
ZCBzb21ldGhpbmcgImJldHRlciIKCgpNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
