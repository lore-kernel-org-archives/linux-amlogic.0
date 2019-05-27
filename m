Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3FEC072B1
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D4B2146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EIkIz2b8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cD/KMYcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D4B2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ardXauSkQ1OdwTlgeGCFKEmhr+48Db0ntugxv4VLlw=; b=EIkIz2b8bjF7iX
	xzJ/UA894Qr0S/2n36N22LsN7c94fUQZj8xhUv1VPc4lHlfuzMg9a8EfAIYz3Usb5A+TdL/JtCYIG
	6HcxwSyu0BPMUmA5oLrdK3WivRiO+fIBSLwQM4ISWC9sRwx53haCQhLSjOMA1zS+h4CbPcGWG/QlS
	L5vElpLy2zrhidSHLv0PWQs5aBWmvusgOprZh4Hh0UxTTV3tL8UU7X2ORjwWwpvJaIi4Oj3+sWFiO
	9N+8wqvLzp9unTchZM6DyPKthC5ZVKeq8X7adRs8LD9/pO5Zsyc0+cGmvG9GlHaTNpy0Qwc7/q4n2
	92n109soxk4hNYi3oQEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEpX-0004gS-9x; Mon, 27 May 2019 12:34:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEp9-0004G1-Io
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:33:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id e2so8009852wrv.6
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+cVOiVFCJq/gjwV+btY3+Tpn5Lp/RZnsuWYYB3guIMU=;
 b=cD/KMYcYKdCaRofRRaoCOCqlDeF88o6vA7EX1SknRosohJiylXLjWoPhAYXjxyvAHu
 w7j+zVTZn5os5e8lM+/A9Jh1N+WWjfJYLtEZe5s2IYp4Ujcxl+W318MjSW87viEOi/AJ
 dWFZFQE4kOeaonFjW0iOT9dXyhGbxHRb4Ph4VtYNoNJ+m6ez4JTDTEttmJnKflKaLgrT
 dChTnYUUvsSnkJk2A4tldQH/ZW2dfcixuGe1lmttykhsk9x9H8yVoZmhw7IrqAGZefpD
 gS62iTL0hTR6Vi2hUekCwvODxPthOCvl8VYFn9sFT6AU2cSB+9c2gwF0dsCc1CCbly49
 um7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+cVOiVFCJq/gjwV+btY3+Tpn5Lp/RZnsuWYYB3guIMU=;
 b=udf3MC/gyEwjTRKnkc+VJmUWkk7zEO6xa30YUjP4wefDVhsRCGpDGre0pbIP4sFPst
 HFSzXqUsU2GtJWhKMF32YGPJMMbIXPKG3/ODh9E9/S+l/qrI0IWvPOVzMJEowuc4pACN
 A+YTooh6UcZgd+hEpWAQqWUzRqTViV/x4VL2QbGTUVZMBrX0fHmoxhApkVWsjFu/XL2E
 moCl/fXyoF1kJjATCi5Oro0321a8MTpsZF5H2CSUcrIcRVvhGJdci73iRzK1ZwezUgun
 QWOfkxFPyAX6b+yT5aYKYz+9Hbccjh+VqXo0HTqjWQw6GRUKoyGCuNBg0IOsScBiKul0
 5WYA==
X-Gm-Message-State: APjAAAUiHEtEIRN272jKkS9KvU4SvBHvEhrb8v96XIcWxqxuyoK5Bf1B
 pO+PdyB90xZI2pzOQuQuLquIeg==
X-Google-Smtp-Source: APXvYqwnPwjtuEjQwUJWuvt7XAdXU/uj6r0mgRRLit94T91pyyxyMOmC5kVUPbZEQb8acNTD4G1m+w==
X-Received: by 2002:adf:e344:: with SMTP id n4mr21535770wrj.192.1558960434048; 
 Mon, 27 May 2019 05:33:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y132sm15173687wmd.35.2019.05.27.05.33.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:33:53 -0700 (PDT)
Subject: Re: [PATCH 14/14] pwm: meson: add documentation to the driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-15-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <afc7da5b-dda2-84e0-a6c8-0ab3c41f7e0e@baylibre.com>
Date: Mon, 27 May 2019 14:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525181133.4875-15-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_053355_665619_F242047D 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjUvMDUvMjAxOSAyMDoxMSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBBZGQgYSBs
aW5rIHRvIHRoZSBkYXRhc2hlZXQgYW5kIGEgc2hvcnQgc3VtbWFyeSBob3cgdGhlIGhhcmR3YXJl
IHdvcmtzLgo+IFRoZSBnb2FsIGlzIHRvIG1ha2UgaXQgZWFzaWVyIGZvciBvdGhlciBkZXZlbG9w
ZXJzIHRvIHVuZGVyc3RhbmQgd2h5IHRoZQo+IHB3bS1tZXNvbiBkcml2ZXIgaXMgaW1wbGVtZW50
ZWQgdGhlIHdheSBpdCBpcy4KPiAKPiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gQ28tYXV0aG9yZWQtYnk6IE5laWwgQXJt
c3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3
bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gaW5kZXggYmI0OGJhODVm
NzU2Li42YTk3OGNhYmE0ODMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMK
PiArKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+IEBAIC0xLDUgKzEsMjMgQEAKPiAgLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgQlNELTMtQ2xhdXNlCj4gIC8qCj4g
KyAqIFBXTSBjb250cm9sbGVyIGRyaXZlciBmb3IgQW1sb2dpYyBNZXNvbiBTb0NzLgo+ICsgKgo+
ICsgKiBUaGlzIFBXTSBpcyBvbmx5IGEgc2V0IG9mIEdhdGVzLCBEaXZpZGVycyBhbmQgQ291bnRl
cnM6Cj4gKyAqIFBXTSBvdXRwdXQgaXMgYWNoaWV2ZWQgYnkgY2FsY3VsYXRpbmcgYSBjbG9jayB0
aGF0IHBlcm1pdHMgY2FsY3VsYXRpbmcKPiArICogdHdvIHBlcmlvZHMgKGxvdyBhbmQgaGlnaCku
IFRoZSBjb3VudGVyIHRoZW4gaGFzIHRvIGJlIHNldCB0byBzd2l0Y2ggYWZ0ZXIKPiArICogTiBj
eWNsZXMgZm9yIHRoZSBmaXJzdCBoYWxmIHBlcmlvZC4KPiArICogVGhlIGhhcmR3YXJlIGhhcyBu
byAicG9sYXJpdHkiIHNldHRpbmcuIFRoaXMgZHJpdmVyIHJldmVyc2VzIHRoZSBwZXJpb2QKPiAr
ICogY3ljbGVzICh0aGUgbG93IGxlbmd0aCBpcyBpbnZlcnRlZCB3aXRoIHRoZSBoaWdoIGxlbmd0
aCkgZm9yCj4gKyAqIFBXTV9QT0xBUklUWV9JTlZFUlNFRC4gVGhpcyBtZWFucyB0aGF0IC5nZXRf
c3RhdGUgY2Fubm90IHJlYWQgdGhlIHBvbGFyaXR5Cj4gKyAqIGZyb20gdGhlIGhhcmR3YXJlLgo+
ICsgKiBTZXR0aW5nIHRoZSBkdXR5IGN5Y2xlIHdpbGwgZGlzYWJsZSBhbmQgcmUtZW5hYmxlIHRo
ZSBQV00gb3V0cHV0Lgo+ICsgKiBEaXNhYmxpbmcgdGhlIFBXTSBzdG9wcyB0aGUgb3V0cHV0IGlt
bWVkaWF0ZWx5ICh3aXRob3V0IHdhaXRpbmcgZm9yIHRoZQo+ICsgKiBjdXJyZW50IHBlcmlvZCB0
byBjb21wbGV0ZSBmaXJzdCkuCj4gKyAqCj4gKyAqIFRoZSBwdWJsaWMgUzkyMlggZGF0YXNoZWV0
IGNvbnRhaW5zIHNvbWUgZG9jdW1lbnRhdGlvbiBmb3IgdGhpcyBQV00KPiArICogY29udHJvbGxl
ciBzdGFydGluZyBvbiBwYWdlIDEwODQ6Cj4gKyAqIGh0dHBzOi8vZGwua2hhZGFzLmNvbS9IYXJk
d2FyZS9WSU0yL0RhdGFzaGVldC9TOTEyX0RhdGFzaGVldF9WMC4yMjAxNzAzMTRwdWJsaWN2ZXJz
aW9uLVdlc2lvbi5wZGYKPiArICoKPiAgICogQ29weXJpZ2h0IChjKSAyMDE2IEJheUxpYnJlLCBT
QVMuCj4gICAqIEF1dGhvcjogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
Pgo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTQgQW1sb2dpYywgSW5jLgo+IAoKUmV2aWV3ZWQtYnk6
IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
