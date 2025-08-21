Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BDCA0FE2
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Aug 2025 03:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZluRsEfecD30qyVoqcMXDKTNhItkd7NkXqW5kmYBdI=; b=MqsneKEbOVf5dT
	PeEzQXaT7cPkcVDnvWoKUteYwOxFc2gFlhlPa830kUT8InWksepAjfra44/jQhtIgsGR4IYCCwseb
	SzH/if8mEFXQWxUr3YvNuH0Bvuo8Cy4PzjJ5uzhy+JfJA2eOXBgNqFPammZNx5XmBqw2xCsE9fErJ
	FGppbVj9pjWTWc88m//7R64fxnCiSkkU/CRfTz8JUdT6CH0S9NFYR/CCvpfg93DeKvU7O+BYQo9zY
	eRvV7xzMc8a+pHtI+14M5Htqb6bsYpUeBdakCGbBO13q3HEY4bBBps7/EuBatssR8ywtopcfuGAqF
	QvTvNCDPh4lmqkDR3tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIJ3-00000001Mh1-429W;
	Fri, 22 Aug 2025 03:19:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC7j-00000000WLn-3KZG;
	Thu, 21 Aug 2025 20:43:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-245fb4c8738so17232555ad.0;
        Thu, 21 Aug 2025 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1755808983; x=1756413783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HMnbUJjOig9s+/+Eizv6zpmYG/IGENV4CSNveOOfxM=;
        b=lkxMy5UpLtV156REkC2bO+meBGLf/vqXPJ3BRpTE5oVfFiG2E5Ta7bmklds7lEUeex
         saHCZue9fCdYoP3VaWBPtpER579W9KAWD5Nmcij6dV3ECznZo0LJ66KFsIQKZZmzfDDe
         5xsGcmRYFuVhVE28meoui6gaLwkeO8j4tIZdiSxKbY/VoJbocrQBXb/Vm+ADrKqu6z9k
         PIZpd0cTYMUGif5zeDuQdSCZtRdEHnKeXBWu2uU8doVY6Gevds52AkipL3vnfL61ZXXX
         op5NKjZjmz/ytlgjaJargtaIp47xRrNpta1kp2o04HSxi0ltDw+8LwGOrUCiv4PnKxg/
         OFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808983; x=1756413783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HMnbUJjOig9s+/+Eizv6zpmYG/IGENV4CSNveOOfxM=;
        b=GiOrmMa+aAtuY8ex1cmpRtCF2aGdk8k111PWKaq/Gwg0uwI60AYSeL6hnJ2agYVgrO
         +vpuBjH+XfpdrxcLP0s+shu98IOPjbMRGc9pfl+YBomgtrsPE5BwvowepGyjNIyg0002
         M//V2bL4IDj36XF2xZ86spwBKgxn3QDZeazKCmfhdxI7qeczeygrCWRuimWAIjGCApZ9
         r+7K4A5h7x66jtuAn1e99t0l3XkrerW141ELOQTKA6fMt6NxxZCIxjSWAfFipuIy2eCi
         Y5/d3NSIyGbWauA27DA3Z4zUrUBe5hXUPaavVoZJwa4cfQq6tyle4DHZoGycA1MgNe8f
         JuMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqUz7njLI0r8kvpcvGmYv3Cdu77Tz7Du2BMRFV8SKcf4YanqS7IYIo8LICQ8o6O+mPWcMfzzB376dW0PuthTWgw==@lists.infradead.org, AJvYcCXaD5nSLnLov3ULWrUoWluBIpZr2E+0vPkVqnHAevQMJ88pIrIECcEPx2xZwSLBf3OPDJksppgiew81MmdP@lists.infradead.org
X-Gm-Message-State: AOJu0YznCCda1OrK2SCNAlYRKbazQ/FtXE/ekfNr1kvZeWBn/JvWxO8r
	djMHaBS67Elb4sCiWTdMXr2IDF27qo8nQ8Xv2NsYl9tTn3cY/LeStTtbvioQqEyrNGfEu+m1N4Y
	mK12wJrxFcpysxbfB2F/BhSXK0WsYZfQ=
X-Gm-Gg: ASbGnctRYYas3fb8gekgxeoeATlnfFR4hSW0Or4IA4OTZrl9i/fDXxoTHSET5Xer72x
	CIg0Zp/iRRZ6SGPVnCeecLfqUKCW0n1rJSW2JA4imaGFFFYEwTVqV3j8MkimD2qgsh5QqvfZtrR
	bR1irEh0WEovYgwpViIiY3v3WXiKQ+pBWHK8mi99XLNVnk6Kbuw8Q6j/+hPBGovEer8Du+KJPlF
	HPDO58wsQ3F+owUQ9/f8uBbpO2TS7Yaeo0yBdTY
X-Google-Smtp-Source: AGHT+IGuprKMUQEODaMep9Ho8yPNqOKRMqZI02yinYtRQ7Fki1XZs3M4IXAeEY52gzg1zE/0hwBQh7l6+wPOYT0Ocrc=
X-Received: by 2002:a17:902:e888:b0:246:570:2d99 with SMTP id
 d9443c01a7336-2462efc9965mr8562475ad.58.1755808982872; Thu, 21 Aug 2025
 13:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250814200953.1969944-1-da@libre.computer>
In-Reply-To: <20250814200953.1969944-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Aug 2025 22:42:51 +0200
X-Gm-Features: Ac12FXweMQUvhGMxkUIwx9HmkMNbiRniVi18J_hwc2Z1Wue7xjXq3oeWyHupql0
Message-ID: <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_134303_832073_FE03F559 
X-CRM114-Status: GOOD (  11.96  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMTA6MDnigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1
dGVyPiB3cm90ZToKPgo+IFRoZSBiaXQgcmFuZ2UgMTc6MCBkb2VzIG5vdCBtYXRjaCB0aGUgZGF0
YXNoZWV0IGZvciBBMzExRCAvIFM5MDVEMy4KPiBDaGFuZ2UgdGhlIGJpdCByYW5nZSB0byAxOTow
IGZvciBGSVggYW5kIEhJRkkgUExMcyB0byBtYXRjaCBkYXRhc2hlZXQuCkkgaGF2ZToKLSAgUzkw
NVgzX1B1YmxpY19EYXRhc2hlZXRfSGFyZGtlcm5lbC5wZGYKLSAgUzkyMlhfRGF0YXNoZWV0X1dl
c2lvbi5wZGYKLSAgQTMxMURfRGF0YXNoZWV0XzAxX1dlc2lvbi5wZGYKVGhlc2Ugc3RhdGUgKGZv
ciBhbGwgdGhyZWUgUExMcykgdGhhdCAuZnJhYyBpcyBbMTg6MF0gKHRoYXQncyBzaGlmdCA9CjAg
YW5kIHdpZHRoID0gMTkpLgpJIGdldCB3aGVyZSB5b3UncmUgY29taW5nIGZyb20gd2l0aCAxOTow
IC0gaW4gdGhlIGNvbnRleHQgb2YgdGhpcwpwYXRjaCB0aGlzIGNhbiBiZSBtaXNsZWFkaW5nIGFz
IGl0IHdvdWxkIG1lYW4gdGhhdCB0aGUgZnJhY3Rpb25hbApkaXZpZGVyIGlzIDIwIGJpdHMgd2lk
ZS4KCj4gVGhlcmUncyBubyBmcmFjIGZvciBzeXMgcGxsIHNvIGFkZCB0aGF0IGFzIHdlbGwuCkkg
Zmlyc3QgcmVhZCB0aGlzIGFzIHN5cyBwbGwgZG9lcyBub3QgaGF2ZSBhIGZyYWN0aW9uYWwgZGl2
aWRlci4KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQ6ICJUaGUgZnJhYyBmaWVsZCBmb3Igc3lzIHBs
bCBpcyBtaXNzaW5nIHNvIGFkZAp0aGF0IGFzIHdlbGwiCgpJIGd1ZXNzIGF0IHRoaXMgcG9pbnQg
dGhpcyBzaG91bGQgaW5jbHVkZToKRml4ZXM6IDA4NWE0ZWE5M2Q1NCAoImNsazogbWVzb246IGcx
MmE6IGFkZCBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IERh
IFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+CgpbLi4uXQpIYXZlIHlvdSBjb21wYXJlZCAvc3lzL2tl
cm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21lYXN1cmVfc3VtbWFyeSBhbmQKL3N5cy9rZXJuZWwv
ZGVidWcvY2xrL2Nsa19zdW1tYXJ5IGJlZm9yZS9hZnRlciB0aGlzIHBhdGNoPwpJJ2xsIHRlc3Qg
dGhpcyBkdXJpbmcgdGhlIHdlZWtlbmQgYW5kIHRoZW4gZ2l2ZSBteSBUZXN0ZWQvUmV2aWV3ZWQg
YnkKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
