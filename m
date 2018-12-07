Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B42C64EB1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 04:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541ED2082D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 04:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQSMDQug";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BqE2xAyu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541ED2082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KCp0WRXz+/OgVa1NqTTsfZuG2x2n/3z2qESRhUkNX8=; b=WQSMDQugYHz79B
	skRv2/W5xirM/JkM7M5g2JGE7wXo7M1x23AIg0mdULETDytxWiORZfjcS9TdRkP2SI0De3mDWhzss
	mWK8Me2TSr2OzCkEUyJrneZQ6/o3hxykHNA4a2hr3I4rUVKiyjz/BUpbcnSNlWp9AnmIW0GhTXOkk
	WZYw5DPJmBZWRsCOHKzRCNw4XGW6akLU/pC10Krbxt2tNBcxWZTZHvlYE97leQrWGsyO4vJHUru1J
	MzYQJ+roX/GBPmCH1vDxCTgdBsURnisw+O8KnXt4n1tN4eP8JU1I3WxkJJICoNoUpbNqxQpvafAq0
	eVY64/PVex0u4GOUe4Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV7ag-0002kM-Hr; Fri, 07 Dec 2018 04:18:14 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV7aT-0002cw-SU
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 04:18:05 +0000
Received: by mail-pf1-x441.google.com with SMTP id g62so1262360pfd.12
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 20:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pQJgfkliWdqBVgYrK8T6lXx+XA37kSfvPJD5/x/FrOI=;
 b=BqE2xAyuOCM/D7gYKELkW/w3OudRTCe28o3nzBgrVxhGKuj/+Cwxc0a4fxpXiwcsBF
 /Oq5ZV6BnAEjZ+Jnxmkqqbyssph4F75+I2HDIgTjLRQgeCSJ8UmJh+GuGQ7NrvK/AZ0d
 cp17BESrM62b659qT3SWuoWl9TYIMWKOVNas7GgV/Ak7ytxYfXSbtQGVmxDD7rZN3Pxg
 PIOu87rXQsbcBV50CT7T28JJa7jmKBjd+v6YqF/XyeU0vbo++3+XOuQbfhpj6mZlwlvg
 ih8SKTEECT+IkMzXB4CCHqoRIUilwezg7CHTOLczcr5mDgVGBmpRQcbANnYet/XIxs9H
 BmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=pQJgfkliWdqBVgYrK8T6lXx+XA37kSfvPJD5/x/FrOI=;
 b=DfdUPKkTrtPTFMzJ35bLMdSgi6HGsYOvoyDxLfsj3fMAq0eXhJ/mj2/2tSx9L0+H+Y
 v2SeYL47+Go0beLnSIfjUzxsSXkkqudQOXMTWmmynkZdzs/QZ7urxJMo5MA3LwniGejo
 G3l/z0rhzNalnHmdC6BmOk/CtuPyBmIYsXZ0B6zDWsVgerPMiGHKGfSFB4kHrCVV3MkE
 agw14Ot6JD1IVQE8IlobcmjqVKJD6ltnh02VWuPhcMLCIMc7YuE6dkv0Kil64VNEeHL4
 DgSONSEJkLPjguQl0B74BsThEMskj4tBBCS62ZitNX4SQGSrSvXAxqVVDETvi6m448pW
 kuYw==
X-Gm-Message-State: AA+aEWbZgJBubh+u7hXG7asJNsLtNBay5BC8lbJTWxsAWi3bPbQZ47eF
 mqs4wTuSnlEOv5aCPZV+etcNJw==
X-Google-Smtp-Source: AFSGD/XL83txPD2nID8GuJWr33MnhGIY7owClz3sUupOALkTKsH1Wjn6UAzOdKZvnDyPaOc1aNxVMA==
X-Received: by 2002:a62:4181:: with SMTP id g1mr753967pfd.45.1544156270828;
 Thu, 06 Dec 2018 20:17:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id h82sm2766349pfa.105.2018.12.06.20.17.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 20:17:50 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
Date: Thu, 06 Dec 2018 20:17:49 -0800
Message-ID: <7hsgzax95e.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_201801_933655_33C91547 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Q2FybG8gQ2Fpb25lIDxjY2Fpb25lQGJheWxpYnJlLmNvbT4gd3JpdGVzOgoKPiBUaGUgd3Jvbmcg
SVJRIHRyaWdnZXIgdHlwZSBmb3IgdGhlIG1hY2lycSB3YXMgY2F1c2luZyB0aGUgY29ubmVjdGlv
bgo+IHNwZWVkIHRvIGRyb3AgYWZ0ZXIgYSBmZXcgaG91cnMgd2hlbiBzdHJlc3MgdGVzdGluZyB0
aGUgRFVULiBUaGUgZml4Cj4gc2VlbXMgYWxzbyB0byBmaXggYW5vdGhlciBsb25nIHN0YW5kaW5n
IGlzc3VlIHdpdGggRUVFLgo+Cj4gVGhlIGZpeGVzIGFyZSB0ZXN0ZWQgb24gYSBBWEcgYm9hcmQg
YnV0IHdlIHRoaW5rIHRoYXQgdGhlIHNhbWUgZml4IGlzCj4gdmFsaWQgYWxzbyBmb3IgYWxsIHRo
ZSBvdGhlcnMgQW1sb2dpYyBTb0MgZmFtaWxpZXMuCgpGb3IgYnJvYWRlciB0ZXN0aW5nLCBJJ3Zl
IGNyZWF0ZWQgYSB2NC4yMS9kdDY0LXRlc3RpbmcgYnJhbmNoIChvbiB0b3Agb2YKdGhlIGN1cnJl
bnQgdjQuMjEvZHQ2NCBicmFuY2gpIHdoaWNoIEkndmUgbWVyZ2VkIGludG8gdGhlIGludGVnIGJy
YW5jaApzbyBpdCBnZXRzIGEgc3BpbiB0aHJvdWdoIGtlcm5lbENJLm9yZywgYW5kIG90aGVycyBj
YW4gZWFzaWx5IHRlc3QgdGhlCmludGVnIGJyYW5jaCB3aGljaCBoYXMgYWxsIHRoZSBvdGhlciBz
dHVmZiBjdXJyZW50bHkgcXVldWVkIGZvciB2NC4yMS4KCknCtGxsIHdhaXQgZm9yIHRoZSBkaXNj
dXNzaW9ucyB0byBzZXR0bGUgZG93biBhbmQgdGVzdGluZyByZXN1bHRzIGJlZm9yZQpkZWNpZGlu
ZyB3aGV0aGVyIHRvIG9mZmljaWFsbHkgcXVldWUgdGhpcyBmb3IgdjQuMjEuCgpLZXZpbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
