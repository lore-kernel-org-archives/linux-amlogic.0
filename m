Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9067E9B365
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8I16/ZORVHkKvkDgztGrQSNJjBKOgCZ6kh0apvGzBEA=; b=RrPqwd1fVHkAy7
	gZg0HUaOLM0WUy2F0Agt/MjmnMRTJK76mXg6XFa4rNmyUd8kZAEmUmsKJxOWHzZbQvlRa2h0IEZJq
	HPW3BWAoW2QkEW17dXAN8qQyAaXjocYwsbkNYvN6k/Yp43grgn7fAE3IsYWSZkOdenP/rRMCWzGIq
	gp0W/aZprfCPLCqRP/J5PfLlkMjuFdVBgK87G9cz1EvyN68TjkLoC4VYNFoGzDguVjVmSeFnQwqXU
	dySWFORsRvHhdKvoKZ9uVK+j1elsR23xeVeitkzLQfgLvX0y22l+ljvKI0BIHPORAfWVXEGdCy+KL
	gjSZhW5xy51MnYrbOkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1nK-0000000Crn4-0BNf;
	Mon, 02 Mar 2026 11:50:38 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1nH-0000000Crkx-0YhJ
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 11:50:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82748257f5fso2164490b3a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 03:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452234; cv=none;
        d=google.com; s=arc-20240605;
        b=gRjVz99DW9Yr1mwy4vVNZ85n2LA0OUUuP0oeL1rvjkuM0/30tXaVaq1pfx/7jsYFea
         946WxGJmibqNZR3MsBw27l57wTVND0dDMpd3IW+HKDaryDcLZM88IoBRbuutMOJp3akJ
         6MpNiCquAigF8cCkzS0dNekQ7157tcy7ONCkWVt7UM4SqUbeMMW6GMP9nO1V8CdNOLOq
         Zv/aoB7HqObaXxIbE3PQpd4a92ANQX/TZIy2l9X/Ow9d9YoKNLVFciQorUGf2q8tDjQ1
         mZwafAyxB0sZCd5Deh5+R6QCp2Mj1SJbQx5XgofFWWQq1Og9Hp53+4Ot+4oq/Ozymqx/
         d92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        fh=bEh7XiwZoxe0l17Es+QqGNsgYxhjuSHlIBTVjTi8NcM=;
        b=ATY5Pj20Y38JzcjlHDCXZd7pKQuLb5vno/ZJAoZfnlUl7EANtcTHOeTnSwAhLYbLvZ
         HoxRZyAViFyGxvIgJmKhiSZGIoQiuLU9q7buYaNGnwNFprORjRZTuEFKLxvXEiMNw72c
         Z2ceZLyC9NQSMnYX5tECt10HqO3DdFt0vRBiMPChYoVQ0n4ihOdunSjdNa/etbXc15So
         7ch1gpFrFM6R6Tqx/zdTQ5RgZR6fa7RFtHL9/DnBBYozKlfPk+Z4ioOz2AsnEP+SF7qB
         S3IlneHULRuY2JQ6sEczDYC6waLmNE7ZkCE0TLNIxiPn1yQ/m9WL/3nw4NIXHDxvWhfq
         cJ5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452234; x=1773057034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        b=AmSFBlqf9cvoy/c4BfoUGzCgOGqOTM+vVjmmaQ0wxl9XYcFfOqTGhBf0SBsyqSftON
         GoqvHcSBwShMSFWQkZuuErr4e/AYyhv8sYkXuMbc1QUm0nUYAvhFaK7Sf5AHbqdbsB5K
         yHzgXifQe2+rWSqACe8mQD4Pp5wv5Ky9jleFug+omZIl9UVNrk9pM/a0cvtf7c9B+ZDw
         5ZrRL1AWM2ME0qUy64+Jmc3J70lSkc7WnouB+rEcklWpI6NzTpWCphmvTxlijaPztofC
         S9AHp0uBedNge/CisatDZ7CckDhU5G6028vso1x7mVhhNlp9piidCVF0TqXInXAlKXQn
         lfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452234; x=1773057034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        b=LI4kL7CvKWOJWDYrTaRXUYlLdtqbHqJLbtKllYCdbKwlVd3aEW8pe8W3wX5sIlzU6q
         3SVM/NnR+oUJ5eVCPBsc8K2/cmSkl0m2tULInJsN1uyMtqITYLGeaNsO9cAJruCFPEii
         eIrA32CN1MHg1gtZOnrVAWlHowBzSKhlT7QEFomDVaxTC8QW5iDBZlzZwgb8jLGqIo3g
         L+7cdbxeDIi758qcXlIbgyS7KjULSMkGFBjbo9FqgCaWvM+1whb98WOEAV4aKSP+6yny
         Im48QeVXvaWeMSeEvOG3TcW0OaF3iJJwM1tqt6gI9sZNLn57Du7Gu+tDmN0wHLZT6E10
         guqg==
X-Forwarded-Encrypted: i=1; AJvYcCVsbeDA8ETOARX6oRPPKwgjOskkxcdXk2KcDbhe6FKSc0uX1oyJDtf4XMfI/9DPACtjo12f9IBD8uHkrnX8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7otIbOEtt+VWGjEQmDWVfqU4hO6qX+xtagsxNvm77ahkUS7Dj
	6owsyKsUxlGSXdZnll8RbbbP72TQeH6jsiIHs/OD5yDC2Q9oGSP2wGcOX/r3WYdseoWUyzB7Xdu
	Yg8VJoT9rJ51oC96o65/AHIJTb2B72tA=
X-Gm-Gg: ATEYQzy8+LYZWRLhri72hxrHS2P/yU5DPHzwXhkh4dMrYuQZ5GWnujYP02tN8OFvbuK
	Ok0d55ElCl+OkDq+HsBO+AiVPhYvY+ySybqr5soIXhKl832cgW5k8r4jK1XVteK9/gOalkoD9s1
	8X7NSIZKdlnh4oKEHepJEAvFdacrXEMBpSjlsWO8o4NfWnMW6gaUjdmHcjbRDGE1WywWT3i7Y7G
	xyfHKqNGOyG8oSHYoy9lQjGeEvIVbsdOVxoYqn5p60JLEZsGveCXDxkgsq9jVy7XYsfKDssTZNf
	s/gE2y34dqfGDOQt4q6uzM5M5evPi9FRvveTlpxZ
X-Received: by 2002:a05:6a20:1587:b0:38d:ec17:180 with SMTP id
 adf61e73a8af0-395c45380dbmr11083219637.5.1772452234257; Mon, 02 Mar 2026
 03:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-4-nick@khadas.com>
In-Reply-To: <20260228065840.702651-4-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:50:23 +0100
X-Gm-Features: AaiRm50FgM0_ss2LirCLzQnYitD-NcE8mXa7mwvdIpZAszvT_xHoXBROvJuWmHI
Message-ID: <CAFBinCA-sFP1ueM5CCXHWXxrHgbjYhJejq5ShHCZzs7JKm5uAQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035035_175353_FB422490 
X-CRM114-Status: UNSURE (   6.20  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgNzo1OeKAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBTQVJBREMgY29udHJvbGxlciBub2RlIHRvIHRoZSBNZXNv
biBTNCBTb0MgZHRzaS4KPiBVc2VzIHRoZSBuZXdseSBpbnRyb2R1Y2VkIFM0LXNwZWNpZmljIGNv
bXBhdGlibGUgc3RyaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFz
LmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
