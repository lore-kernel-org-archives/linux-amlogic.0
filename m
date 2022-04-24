Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926CBC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Apr 2022 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo4GF3kXX2hTnlT2pvv4vEeRyYITLPx4TqygJxJJbqI=; b=Bp7sfjV8EPjftw
	WUP7hDiwp0EzUwIi8IeVjT1EEnWczH54O+mZauL+ucEYHQGlJhH5MQy7JtdHlxidkB0ZQ1uPv2cF1
	gvB4Dyk2tf7KiWa6JIa/QMZoG/p+GgsWCXLlft655ZtWDVQiXki6ntG+3+FgGttyph6LoQaiSLY2k
	gyt0wZ19kyVKmYUrfMwAoI9K8YWAseYor2y6UXcBXc/1kHQVGZA0AC9sec+x4Te+YWPW+75514l6u
	G0FfUIMi6WApzKuBmep9l8kdxLeBEJADtQx+O178xHZF93y/CTwjBwaBzZI5Le/CWEVDFobYSy8Mx
	O0V+ITd8WcOlrQv5ulmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niYCY-006F0h-VJ; Sun, 24 Apr 2022 09:06:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niYCK-006ExV-CN; Sun, 24 Apr 2022 09:06:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id e2so10553043wrh.7;
 Sun, 24 Apr 2022 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nv7r/xRUGHwguyXkYCmqmqghuT1NE5yzHjE3f6i/LMg=;
 b=ZVhDU9S5WmmPTCXR4kxee+/C3o4Z3ZwdtmINHqCOjN+3oKVVPMCuZGuFk+LzvEF6Mb
 WdXVQYeIQH4wNaouNJTONrKiDQ31XBKBvlRiWEtVX+4SCKNzZSXsn7Z1JMud0muXJrC6
 DFHYyqv3NX4XqcLRsAw1tfby6rMGuqvrWQX0/o6cNZmp23bl2S6X+TQMxAMLTB/0TYcS
 ZR1VZL2r8QzHu7fu3RI4d3oGBROHoKNzf9wIgtOGr4CT42lV4G2xKjguVNq08jccw5be
 0jHP8TrdDWe1K1gPWw5C+kIR/eXZUJVm6xa/AWGFhzaXt3prmlLjFwJBUX4oovDCSl2M
 ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nv7r/xRUGHwguyXkYCmqmqghuT1NE5yzHjE3f6i/LMg=;
 b=dIIYbf4VFxQqWPT06a/C2P1NmcFmbYafNhAQAn2pGoYzBQyIGSF1tdvvhJ3jYEmOwq
 Aydl7eyqNpJIZsPQ/Lh0503nKH61CoIuf4SU+R8QYcww+jr4mLLFDJjUmFrgIBY+/H4W
 gX1JRpBasuvMKKNP8iYUx6CbjsG7gtusRP1b507YzOHLh1MfIJale0igl068UKqSYUM0
 B+iTzdwzN/Me284vbLa93sE7uwyjXQ7w70PoSdyWQCpxhlzo/IPCeywYFmHmK45xB0VD
 WETvhWwpgZyElZg+dD+9RWUpdntuLdf4mJRiK3wC3Wv7jts7dQPeyhIAGEh0LZRmZ5/f
 bBXw==
X-Gm-Message-State: AOAM530uNuhd9WHwUoE6X9ZFCIVlNfSmSzixBrp+jP9fFqDgjuvIMxX2
 miRw6l4/WmxTa36a/z8xOI8=
X-Google-Smtp-Source: ABdhPJy21ZMmMPYkeKcJPoKjZ9cyNADB0FQ2uMsA6brqM3EG5dDW2OkgMgQYVf6yQYf7HRrgwizR9w==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr10044687wrr.626.1650791185142; 
 Sun, 24 Apr 2022 02:06:25 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7675:9d00:50f9:6d67:ac70:5180?
 (dynamic-2a01-0c22-7675-9d00-50f9-6d67-ac70-5180.c22.pool.telefonica.de.
 [2a01:c22:7675:9d00:50f9:6d67:ac70:5180])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a7bc8c4000000b0038ebbe10c5esm8581477wml.25.2022.04.24.02.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 02:06:24 -0700 (PDT)
Message-ID: <aa97c09e-aa82-e2c4-326e-991330e65de7@gmail.com>
Date: Sun, 24 Apr 2022 11:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <CANiq72m+OVcX1gPit94D1hjzkduyVFoCWXKSXTxpUDFtKs8z6g@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CANiq72m+OVcX1gPit94D1hjzkduyVFoCWXKSXTxpUDFtKs8z6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_020629_386658_8CE933BC 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

T24gMjMuMDQuMjAyMiAyMjo1NywgTWlndWVsIE9qZWRhIHdyb3RlOgo+IE9uIEZyaSwgRmViIDI1
LCAyMDIyIGF0IDEwOjA5IFBNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
IHdyb3RlOgo+Pgo+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUaXRhbm1lYyBU
TTE2MjggNyBzZWdtZW50IGRpc3BsYXkKPj4gY29udHJvbGxlci4gSXQncyBiYXNlZCBvbiBwcmV2
aW91cyBSRkMgd29yayBmcm9tIEFuZHJlYXMgRsOkcmJlci4KPiAKPiBBRkFJVSB0aGUgZGlzY3Vz
c2lvbiBoYXMgY29udmVyZ2VkIGF0IHRoaXMgcG9pbnQsIGNvcnJlY3Q/IElzIHRoZXJlCj4gYW55
IGZlZWRiYWNrIGxlZnQgdG8gYWRkcmVzcz8KPiAKU3RpbGwgb3BlbiBpcyB0byBkZWZpbmUgRFQg
YmluZGluZ3MgdGhhdCBjYW4gc3VwcG9ydCBhbHNvIHRoZSBrZXkgaW5wdXQKZmVhdHVyZSBvZiB0
aGUgY2hpcC4gUm9iaW4gcGlja2VkIHVwIHRoaXMgdG9waWMgYW5kIGhhcyBzb21lIGlkZWFzLgoK
PiBDaGVlcnMsCj4gTWlndWVsCgpIZWluZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
