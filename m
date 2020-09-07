Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D2C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:32:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F36208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4xDl8me";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RGeouUFK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F36208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qvgqU1qgqZJtM4wkI2p1STfw+BbH69TOQHsyCqtpQdg=; b=L4xDl8meqr7Fq4+JQ0NjfyJUX
	rpQg3YAZIOJInrdm+9lGyRnTzx/zR93OXkw01k4o9/TY1h5LO7divoONP9aHp3V30Fi8y31aRB5fX
	c/YHYRgSJL/TJ/mcH5oX4m22KNNx5hNKlgd+Y7fsVaBFEasBFNRDlmBgfzE7K/u/XvFAnJXi3E8Ji
	7sivMd8D4bFIzY1aU/1F0AGMLrNIBfpBR6lPNCqgRR3Zjy1o45FUGZ+hwSUqvTgCQEFgdrTV0zdXC
	w9o9q6woQezJ0nVTKaj3RPBzlTShlm1AgeHAds5XlaSFFnxsXF+i1X7X5KUza3Q5h8abP3jRLrjjT
	nGmnzkPAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCZD-0003GN-5H; Mon, 07 Sep 2020 08:31:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCZ4-0003CU-3b
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:31:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so14816783wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=cCcewAEiLE/OmDX2B0vNYIYLfVcreUZ7OxVxbcoyrBE=;
 b=RGeouUFKu+QpdbpoI+34Dkfyyl+XqAA1xXwShz6V66lBEdsZt5yX1SW296IcxMO+Hi
 G3re0x+hjDAmxAWbGF9Ap986eQ1hSDE6dvRfuD0xKOBJYeWiR0HY3oQ8m+7z45Z56qQ/
 sI2sc6WwBCpyzHi9JB9n2I5z9shO9+au8Wx8vTgX051jZ8BGWTaglwbtMkSJ2Gvsj2UQ
 u1rjuky9AWGOWuVP8162C+iThw9ekNtYzmhscgdgAy3F/umh+Y/R7PPRZ7AVBzD4Ri8r
 6j9hqgF8y+bTDkecyFvZcvbsPMxE+QAojle78NjPatGjk+PjV8y0wx65joYz0RdAVOH2
 XNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=cCcewAEiLE/OmDX2B0vNYIYLfVcreUZ7OxVxbcoyrBE=;
 b=nPBKGEFyj9pIi9Pp67zwtirAPyTlLTBpPL+HyYP9M7/x3KQv2GjOeDQ7Ih8EW8Yh2r
 92CmkyDmKMPjknEgGPBUYXFCQuGzTOfvFZl4c6uqZLTqvBhgpOJ5g2jW1KXdU2iiu2xa
 uR4CkXveBr7+qIoMKgF3YXOB2P50wi4KeoONFNC8zC5jGeMkk7drKbs+iU5ikNIW++af
 1IgSuNdZgTjD4iSczzZ32GGA0bQPn8Qh/AvS5FwDcc5ku8J3sM1hDMcpnIeFaDLqOq2v
 Hs6Xr8G3lOF6bageuIZ8vAvcwkuyn3T4iTFUqva5MMru5+Q1TEQRGRDmdLbEJ7Ys7GWE
 qeaA==
X-Gm-Message-State: AOAM532wvCtutrrCgDhwNvq4TyQDJURgAb8I8kn57IdFzmD6j4Hdf/yS
 1/+VN+a2FaWe/zqdwQWQXCdEmw==
X-Google-Smtp-Source: ABdhPJzhb+a9WFap1WkuGeN9Gg5Xb2WC16AJ/90y0PUIbr1rp2sP3ko3ohy7VthUSP/NCEt5qAA5bw==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr20346258wra.21.1599467509096; 
 Mon, 07 Sep 2020 01:31:49 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k8sm27013174wma.16.2020.09.07.01.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:31:48 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
 <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
Date: Mon, 07 Sep 2020 10:31:47 +0200
Message-ID: <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043150_229555_4954A8BF 
X-CRM114-Status: GOOD (  25.32  )
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
Cc: Dan Robertson <dan@dlrobertson.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIFdlZCAwMiBTZXAgMjAyMCBhdCAxNjoxMywgQW1qYWQgT3VsZWQtQW1ldXIgPGFvdWxlZGFt
ZXVyQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+IExlIHNhbS4gMjkgYW/Du3QgMjAyMCDDoCAxNzoy
NSwgTWFydGluIEJsdW1lbnN0aW5nbAo+IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwu
Y29tPiBhIMOpY3JpdCA6Cj4+Cj4+IEhpIFBoaWxpcHAsCj4+Cj4+IE9uIFR1ZSwgQXVnIDI1LCAy
MDIwIGF0IDEyOjIwIFBNIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdy
b3RlOgo+PiBbLi4uXQo+PiA+ID4gcmVzZXRfY29udHJvbF9jbGVhcigpCj4+ID4gPiB3b3VsZCBi
ZSB0aGUgd2F5IHRvIHN0YXRlIHRoYXQgdGhlIHJlc3NvdXJjZSBpcyBubyBsb25nZXIgdXNlZCBh
bmQsIHRoYXQKPj4gPiA+IGZyb20gdGhlIGNhbGxlciBwZXJzcGVjdGl2ZSwgdGhlIHJlc2V0IGNh
biBmaXJlZCBhZ2FpbiBpZiBuZWNlc3NhcnkuCj4+ID4gPgo+PiA+ID4gSWYgd2UgdGFrZSB0aGUg
cHJvYmUgLyBzdXNwZW5kIC8gcmVzdW1lIGV4YW1wbGU6Cj4+ID4gPiAqIDFzdCBkZXZpY2UgdXNp
bmcgdGhlIHNoYXJlZCB3aWxsIGFjdHVhbGx5IHRyaWdnZXIgaXQgKGFzIGl0IGlzIG5vdykKPj4g
PiA+ICogZm9sbG93aW5nIGRldmljZSBqdXN0IGluY3JlYXNlIHRyaWdnZXJlZF9jb3VudAo+PiA+
ID4KPj4gPiA+IElmIGFsbCBkZXZpY2VzIGdvIHRvIHN1c3BlbmQgKGNhbGxpbmcgcmVzZXRfY29u
dHJvbF9jbGVhcigpKSB0aGVuCj4+ID4gPiB0cmlnZ2VyZWRfY291bnQgd2lsbCByZWFjaCB6ZXJv
LCBhbGxvd2luZyB0aGUgZmlyc3QgZGV2aWNlIHJlc3VtaW5nIHRvCj4+ID4gPiB0cmlnZ2VyIHRo
ZSByZXNldCBhZ2FpbiAuLi4gdGhpcyBpcyBpbXBvcnRhbnQgc2luY2UgaXQgbWlnaHQgbm90IGJl
IHRoZQo+PiA+ID4gb25lIHdoaWNoIHdvdWxkIGhhdmUgZ290IHRoZSBleGNsdXNpdmUgY29udHJv
bAo+PiA+ID4KPj4gPiA+IElmIGFueSBkZXZpY2UgZG9uJ3QgZ28gdG8gc3VzcGVuZCwgbWVhbmlu
ZyB0aGUgcmVzc291cmNlIHVuZGVyIHJlc2V0Cj4+ID4gPiBrZWVwIG9uIGJlaW5nIHVzZWQsIG5v
IHJlc2V0IHdpbGwgcGVyZm9ybWVkLiBXaXRoIGV4bHVzaXZlIGNvbnRyb2wsCj4+ID4gPiB0aGVy
ZSBpcyBhIHJpc2sgdGhhdCB0aGUgcmVzdW1pbmcgZGV2aWNlIHJlc2V0cyBzb21ldGhpbmcgYWxy
ZWFkeSBpbiB1c2UuCj4+ID4gPgo+PiA+ID4gUmVnYXJkaW5nIHRoZSBjb25kaXRpb24sIG9uIHNo
YXJlZCByZXNldHMsIGNhbGwgcmVzZXRfY29udHJvbF9yZXNldCgpCj4+ID4gPiBzaG91bGQgYmUg
YmFsYW5jZWQgcmVzZXRfY29udHJvbF9jbGVhcigpIC0gbm8gY2xlYXIgYmVmb3JlIHJlc2V0Lgo+
PiA+Cj4+ID4gTWFydGluLCBpcyB0aGlzIHNvbWV0aGluZyB0aGF0IHdvdWxkIGJlIHVzZWZ1bCBm
b3IgdGhlIGN1cnJlbnQgdXNlcnMgb2YKPj4gPiB0aGUgc2hhcmVkIHJlc2V0IHRyaWdnZXIgZnVu
Y3Rpb25hbGl0eSAocGh5LW1lc29uLWd4bC11c2IyIGFuZCBwaHktCj4+ID4gbWVzb244Yi11c2Iy
IHdpdGggcmVzZXQtbWVzb24pPwo+PiBmb3IgdGhlIHNwZWNpZmljIHVzZS1jYXNlIChzeXN0ZW0g
c3VzcGVuZCkgdGhpcyB3b3VsZCBjdXJyZW50bHkgbm90IGJlCj4+IHVzZWZ1bCBmb3IgdGhlIHR3
byBkcml2ZXJzIHlvdSBoYXZlIG5hbWVkLiBUaGlzIGlzIGJlY2F1c2UgdGhlCj4+IHBsYXRmb3Jt
cyBvbiB3aGljaCB0aGV5IGFyZSB1c2VkIGN1cnJlbnRseSBkb24ndCBzdXBwb3J0IHN5c3RlbQo+
PiBzdXNwZW5kLgo+PiBpZiBvdGhlciBkcml2ZXJzIGFyZSBnb2luZyB0byBiZW5lZml0IGZyb20g
dGhpcyBjaGFuZ2UgdGhlbiBwbGVhc2UgZ28KPj4gYWhlYWQgYW5kIGFkZCB0aGUgbmVjZXNzYXJ5
IEFQSS4gVGhlbiBJIGNhbiBhbHNvIHVzZSBpdCBpbiB0aGVzZQo+PiBkcml2ZXJzLiBob3dldmVy
LCAoYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCkgSSB3b24ndCBiZSBhYmxlIHRvIHZlcmlmeQo+PiB0
aGUgbmV3ICJmaXhlZCIgYmVoYXZpb3IKPj4KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBNYXJ0aW4K
Pgo+IEhpIFBoaWxpcHAsCj4KPiBSZWdhcmRpbmcgdGhlIG5hbWluZyBvZiB0aGUgbmV3IGNhbGws
IHNpbmNlIHJlc2V0X2NvbnRyb2xfY2xlYXIoKSBpcyBub3QKPiByZWFsbHkgcmVwcmVzZW50YXRp
dmUgb2YgdGhlIGludGVuZGVkIGJlaGF2aW91ciwgSSBoYXZlIHRob3VnaHQgb2Ygc29tZQo+IG90
aGVyIG1ldGFwaG9ycyBzdWNoIGFzOgo+Cj4gcmVzZXRfY29udHJvbF9yZXNldHRhYmxlKCkgICAg
KHNvdW5kcyB0aGUgbW9zdCByZWxldmFudCB0byBtZSkKPiByZXNldF9jb250cm9sX3N0YW5kYnko
KQo+IHJlc2V0X2NvbnRyb2xfdW5zZWFsKCkKPiByZXNldF9jb250cm9sX3VudGllKCkKPiByZXNl
dF9jb250cm9sX2xvb3NlbigpL2xvb3NlKCkKPiByZXNldF9jb250cm9sX3VuZmV0dGVyKCkKPgo+
IFdoYXQgZG8geW91IHRoaW5rPwoKbXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSByZXNldF9jb250cm9s
X3B1dCgpCgo+Cj4gUmVnYXJkcywKPiBBbWphZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
