Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D60606A32F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RAVIdQ4y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nqsIHqY1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FBRV4Q3+ltp4v06LXhmP1GioIY7pgRge1eQFA+7O5Ig=; b=RAVIdQ4yNZ3QZX5gBVrRdmVUs3
	hA5SPS1W6L13gsU+Um/Kg/1YfYKrlSjwJ1Vrzf+LgdTX+tF9zWm9H3A/XeMBkgjsbNBvjI0qKNCW6
	b6AZ6nTfzUkGgfgM5XXPZ/Hv38TtlQ5IJI8kKzbpylt5+NYUwPZ9kEGThVj7XMzlkoJsgUaYygL9c
	tkQ4V59WOUOg2zpVTJi3WvupLToWetXpEKd2LlF4xz0ZQ0I32FK8An/4eBryTQpZGEWH6uI9nHgnM
	7U0LpEBUVrHBnAfHTtsTU/6IpB9jBqhsDAjZ5ICebk6K/5J+D8c4vCKVYDrKtjEzNU/6vlbJN0//5
	7Ybp+5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShlV-00000000VZm-3ayM;
	Sun, 15 Nov 2026 21:27:57 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShlS-00000000VYJ-1lcw
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:27:56 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67da69e7c31so997513d50.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778073; cv=none;
        d=google.com; s=arc-20260327;
        b=FzHAFPT33z+BvDpN6dF/2ijk30u9oHLl0iQ/G8nSTsPwI6XltLXMABaJXOwW7167al
         dBlb5iXlZ62dnmRG+cb9rXNHJO9RQcVZQBhbtFdfyuNOkT5LAxEe6vQqzceCA2mCGSow
         WtmaoYqxgo3Xv05t7iUNLJXTbZdoFBXfMZ3IBSkII+wZs8deCzpQtlVE6uk20BnhezXS
         L405R6+HtpfS1iqZkFsNlMLAaebM7uHp8hU3hCJl4Xi7dVZsmcTGO1jGwwXXXbVa7xcA
         rkz43PDTVTB1EJk9lEMI3TwTD9kmNfhRsggUsnEthnJYZHw3+i+kRke6XwwdLqRqdeUp
         Wh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        fh=aJw5Qay1ykuYRq6R9Va+jCC4OFeCgPNkL/9Jy0rxrbY=;
        b=BGRyZ+kj5K6hsHYbQpRubvo29DCI7Zp25MKPKJXsTVjXbU2m8nO6MWutLEKWMDlmz4
         gCLq4waADGJp0l+H+lFjZgIKXHr8vahYzrAj6ps8o/vpRWk+3FG9890xjb0QiQ+r9X42
         kagQ3DvYTaUeYD8YLCfuaI1oM7dyY5XajKAtzUl6Z9HB1qSglRIP2wOXDJfXjAsNDhLk
         6opwo6UcgXC+1gRzENfLnItPXNfeVu/6igMxBqua2IrXS5DuYLBDUflXgtT80/u2QSAr
         nuWLvVGvW0S0NnqARp9/VouDeiODispWL8ZI+yCBaS7f3FMkt1J8HgwUR8UQvjofs4bI
         yJIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778073; x=1795382873; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=nqsIHqY1KbBZfQIiB2k0xBZXNuQ5AHneZOuJ6yokaSKQYgotLschKuezG4likZm4AO
         7imH86T7GA6eo1gWP9uy4ugdAA44fdPAP84cT6e0AVpIHBKcC6xHgdUiEf5ixpytFHM/
         BPI/vrWXx385MeUI1gLykbyT5hjeptseoSIKmzYZB9h8eczol5ITlZYuVKxxHmVc8oc3
         vGE3rhyhpMowEmq8GGQV+gIqJg/rQioimQGGJo+34hDMX6cGQH7XiITpXLNxGKWyNSBJ
         IqWDDu/5WLOZtA/Vm0IBeOlBQ2Cieo9ZJPDiwhhZndtap4TUcm56jthUsuSJPgCX3F/v
         mP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778073; x=1795382873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=l2LVvjmzw91mE2EL4lo1/sbTnXFC5q74ApctlMKqhPNrjzQQ3j3XFORfnst4kkoSMu
         BVg0yx3xv64m09X4HDyhvLvWmdq12BzjD9/48jPVVefbjXyhOo9AdL9sTgs/uEnXMYUk
         b0L69JSmMfs5sobJTkf7pT+jz2bFN56sTn4NDymJJ4K72DzjiO8hqznaR1Jo+YawG0kC
         gRuSXaSy+da77NWCcpwU0DHx+hSy2htd0nU4V2DTpV5o1MecFTcmuuL4W/Rkix9i3dLJ
         gqor/FGlIhjZvRlqjPRQpC7Miyn8qdL1UUPIECyZGqR5NWx9eTy4OqeQWK6cK6oDGkhm
         P1+w==
X-Forwarded-Encrypted: i=1; AL+hErFHjkL7LhlEdOzxJc4zKZSABjtkqbw1ylg2B9MDYUpTOKSr4U8PIb2T/YPmtmCoExD7ciRM0wwz003JGWkF@lists.infradead.org
X-Gm-Message-State: APuU4Z8AIT+4y6aDUnMMXrO2MTl70JDq6YlTXQ1ypCKvhIQZVpsVxTy7
	zN+0NOwyy72I390b6Vr1Pt0n4RdEJ3HzuBi2PT5wjE6BDS3Y4y/IdLBHZDMJY506R5f5O+p3fOk
	GXhofyqtaNJ6pkDktbPlD3cyowcXybbQ=
X-Gm-Gg: AZFdTZeOPzpuYmVOZSkC+Y/sDTivzmjh70GKWW/8qGiBzauN0UT/X5JDf7EgTNqsMh6
	LRlohLzk3pQv5Eq2aOQR3k4tnPN7o+gkIlOBhBebXNndYY/xppfilLo5DDzn67JHqIcxfsLQJWn
	l9kPxfw7bl8NwwaorWgQcIvbFx681dpm4HMDDl/DpzS4iwXwj8OCB1VZ3eyQJXGlPy1SbJBEpYR
	UzmgmjXl9m2FJ9YE0CubornfqKTtSTPtZDdDun7pNlDgXEFgjKBI3E+ESR40XdwHZuuHX+CmrsC
	E34lDZ1OwPWjGQhlbLL4w5YRvn3u5sdfFjo7zOnXbVcIXu4Rp+c4D/YNfW7lF1fEouhCYeqBMie
	v406U5HL6HkSEvgdTPhTLeHXsJmWqy4dYPMioUhcW+qdpHoIeCFv5sr/56wUWp3tmkozy2g==
X-Received: by 2002:a05:690e:130e:b0:67d:bcde:a150 with SMTP id
 956f58d0204a3-67dbcdea64amr71968d50.65.1794778073162; Sun, 15 Nov 2026
 13:27:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:27:41 +0100
X-Gm-Features: AclHuK-tHWEVaVNE_O7wlDFFBv_6XVrqFZ8dhMwLJs0OnAdbKC_ynIhtYeGD0qw
Message-ID: <CAFBinCC-R=apWQ7729NueJYSi9d_pn_z9ukyFL5qPMXe=VQqAw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132754_468815_09479F47 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEFkZCBjYXB0dXJlIHN0cmVhbSB0byBDUFVfSTJTX0VO
Q09ERVIgbWFraW5nIGl0IGFibGUgdG8gaGFuZGxlIGJvdGgKPiBwbGF5YmFjayBhbmQgY2FwdHVy
ZSBzdHJlYW1zLiBDYXB0dXJlZCBkYXRhIGlzIGZvcm1hdHRlZCBmcm9tCj4gImF1ZGluLWZvcm1h
dHRlci1pMnMiIHdpZGdldCwgYnVmZmVyZWQgZnJvbSAiYXVkaW4tZmlmbyIgaW50byBhbiBpbnRl
cm5hbAo+IEZJRk8gYW5kIHRoZW4gYnVsayB0cmFuc21pdHRlZCBpbnRvIFJBTSB3aGVuIHRoZSBG
SUZPIGlzIGZ1bGwuCj4KPiBBcyBmb3IgdGhlIG5hbWluZyBvZiB0aGUgc3RyZWFtICJJMlMgRW5j
b2RlciIgaXMga2VwdCBhcyBiYXNlIGZvbGxvd2luZwo+IHRoZSBzYW1lIHBhdHRlcm4gdXNlZCBm
b3IgdGhlIHBsYXliYWNrIHN0cmVhbSBhbmQgd2l0aCB0aGUgZ29hbCB0byBtaW5pbWl6ZQo+IGNo
YW5nZXMuCj4KPiBTdXBwb3J0ZWQgZm9ybWF0IGZvciBjYXB0dXJlIGlzIGN1cnJlbnRseSBsaW1p
dGVkIHRvIFMxNl9MRSBiZWNhdXNlIGl0J3MKPiB0aGUgb25seSBvbmUgdGhhdCBoYXMgYmVlbiB0
ZXN0ZWQuIEFjY29yZGluZyB0byB0aGUgbWFudWFsIGFsc28gUzI0X0xFCj4gc2hvdWxkIGJlIHN1
cHBvcnRlZCwgYnV0IHRoaXMgaXMga2VwdCBhcyBmb2xsb3ctdXAuCj4KPiBSZXZpZXdlZC1ieTog
SmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmFs
ZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
