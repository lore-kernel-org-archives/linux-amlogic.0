Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3A9CD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUG51sNl3f0Hnf6kfAEvtoT0Vr+JAjNC+aCakTs3lCY=; b=yLQ+GW4K79RLQs
	WgH6YurBgKJ08W0UZtXWI6YrUkKA0s//MByDhwv7Rnp65JzmKiEOznltyMC3huCTA1RhmgKCsQrB1
	eDrHEu/bwFbAcP0tam6yDvh/V9pRzIq7CrgJscjguqWhIp/Lm5qx05UAhl8Ho/uL4C5N8R9jeCWPd
	xAzRzER5mAgbCnQ9J+h03BQXI+wY8zyxRCGRq/1HjlRBP5xHXNMUBfWD1+twBF9P8qwN1K75choT2
	NiEn24hTgLeGwVBY1iYW+93lxvpKjPO+x2svwBI/FafJe+/Bfl31PeejcFDzkcFP9P9Am1+vfJ1al
	4vgY2oN9+EcdT+yGzNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsnD-0000000GLkY-2rOY;
	Mon, 08 Apr 2024 17:28:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsn9-0000000GLiO-41mt;
	Mon, 08 Apr 2024 17:28:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ecea46e1bfso4412779b3a.3;
        Mon, 08 Apr 2024 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712597303; x=1713202103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK8GiSvFSo2V8qUPnqrwK3403k5I7vbDgJq4v/eqDhE=;
        b=lkR7TBflRwamCyoSnfPSwhC0HsEwFswXLwwp7pOwFJ29aO891uRzxDT4hay3TvyYfT
         YCXrj+36MY7BUGAxAB6ddi0WJna5AuEY2vD/L2U7/aOR4IWFR9w7u8GFG3T6OR0S4Woa
         IkEB8oiGia6aBbNqfjlWC4lo7nK6B8BBs+ydXXp+bTPVHsHo1cK5nnS0nOqjLKz6PWZM
         0AOGcCNl7CvzDiw2XSHugaiQdccqTAg7PmEU0+Xd1oU1M3vDlUlo8YJRaBJ6IfmpF2Zw
         POvWVMtKWIW4m2judJVXTmA7j7XEGUVTXrHj/pUXB6VTUqujRMjISdQlvTbjZ7mJFHh+
         pvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712597303; x=1713202103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KK8GiSvFSo2V8qUPnqrwK3403k5I7vbDgJq4v/eqDhE=;
        b=dl7IrL5q6zWcyUv4hMySeO+TriUGaoAXAbtt/xRQS61IZp5GyUy/fzzpVwh5i8KTR0
         kGvWxY5OKGmXlS2l6fFt27Q7p3bV/l+VcNBWxkJfg2dourDs3mz/tQY65AkrY2cFiR6g
         MhX7Fy1Z+ZiGocndwdCfZ4RhXiFVxCs2UBB3ES+HCbAXSd55dufBTSItcA0/KZMcavY8
         3LyATF1oZrgrK8+W6Vkl/+XeJbg6xJUWKabsZWqHaQ6ecx3pCNZuZ66eMI4gzLh9W+HX
         uwqpyMs4g0FO5E5KqYa0KJOleo0fquKiyubbbHGgSBAVq+kN0ajFBwrMzlMCRTdacZmN
         krgw==
X-Forwarded-Encrypted: i=1; AJvYcCWuy0NCJHoEh4tq8WJ8fVZPUP3ZjRyYQQ9VM5829ZapWm+kk8V8QKdLdLWlWqaKkOea8GPjbrMfIN2KJQqy3DXmT3YqE0Cfy2DN7G/GQofE0YT0OcXrGjSGaTj9K1htLNBCvmCZEBTb6WLuWItM5VL5v6OYSZ2SVQ==
X-Gm-Message-State: AOJu0Ywp+go60rIOntpLJM8AT+j/OxeCpEjlLSvDCQFsHG6bJoV0dYwO
	+wOQGDMrvpnG5SzGoufBIG28teKGOOIxyAPU+VEa8i8a522HWoJRhfAEPb6nNauuB32qe9Ff2aI
	/bEksuEypD5u409bsaAGcnp7XrJk=
X-Google-Smtp-Source: AGHT+IFP6Z5pdRwrSLwARLzJ699fJGpW0H4+2+OpwDmZEkfRQGnMSXvUFgpa3p6th/TN1PAwzKX59Po/azxvXbfA8xg=
X-Received: by 2002:a05:6a20:9155:b0:1a7:49c1:d326 with SMTP id
 x21-20020a056a20915500b001a749c1d326mr7381136pzc.1.1712597303058; Mon, 08 Apr
 2024 10:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com> <20240401-basic_dt-v3-3-cb29ae1c16da@amlogic.com>
In-Reply-To: <20240401-basic_dt-v3-3-cb29ae1c16da@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Apr 2024 19:28:10 +0200
Message-ID: <CAFBinCA1XchHvRuFNGeKOrpjzggM_LSNtA5ixn071=MkQvdc5A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A4
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_102824_052242_417D2674 
X-CRM114-Status: UNSURE (   9.04  )
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

T24gTW9uLCBBcHIgMSwgMjAyNCBhdCAxMjoxMOKAr1BNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBbWxv
Z2ljIEE0IFNvQ3MgdXNlcyB0aGUgc2FtZSBVQVJUIGNvbnRyb2xsZXIgYXMgUzQgU29DcyBhbmQg
RzEyQS4KPiBUaGVyZSBpcyBubyBuZWVkIGZvciBhbiBleHRyYSBjb21wYXRpYmxlIGxpbmUgaW4g
dGhlIGRyaXZlciwgYnV0Cj4gYWRkIEE0IGNvbXBhdGlibGUgbGluZSBmb3IgZG9jdW1lbnRhdGlv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
