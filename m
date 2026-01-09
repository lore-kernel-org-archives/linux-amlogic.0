Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C31CD167EC
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDcj7WjTLoNMi1a+oLlnUpQx3wxPf8tfI+seaESVAzY=; b=2Th3Nl4rsDx8G+
	1MJ6r8927cG1kzkbTdm69zJeAJroRPIZp1rAtYRb0cV3idoRo7/2l2tyseSKgx7DUq8qqtqNqimPB
	QAOMtvsNZA7m/2dJQkamcgt8sI6Z1CuCvVDx9hGa9LCxFjuRNZ95Dcn1WGeT38KD34IL20adl8PDQ
	ot+iazFjhQJUk11mKNzT3bx+pvNVgkNNUT9AnaaXB5LxYlTCSnqR5fBNcWMzW2hDJLMlAcLqlUPDU
	bVY4EaAl/WCbs9JDVppvWYFGRR1iAdeBgya0H80gHWPR8STKGnsHKN2Ugxf+IjDSzwqGJ29G2nN8/
	+BGVn+cPxX0QiDX0ZaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sj-000000021lq-1hwK;
	Fri, 09 Jan 2026 09:34:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sf-000000021j8-3MvC
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 09:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3668C44335
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1675EC2BC86
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951245;
	bh=eOPj6csaxqSh/pD94Xiow8fswoPt4epubaYlDPDsNMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lR79fTbkQsjgiDlA6fkXm7nFk8wVuLWHxfCcZhKMCzk6nFbpiobQdH+19xNX1Edq8
	 Xu5QeqrJLJmlalUk0cX4DpHpHY9k1VxZ9yB7U7Fe08DVHs5dkYebQbpdDXSk1uGuMs
	 3NYEBRMjDXEQ7EyKut2fYDHiQqGOmhTyuFTWnsUWJnC8lAwsVSYvpIYCNB7FLTDCS9
	 C4J4iJ2k1oQ1yXqnsNmHma70GA7ZUgrFAVWtMfhy0tgm/5HSq9wirt4ixPTU16Mu2c
	 +lkpNLrYinmglFCoxuv5/Pzb5FFZDnCN4e5KeD4MboWw+Xp6Yv+qC9MI6/n5qR1hfs
	 PV1vQd6HCvjWg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fc0f33998so42002057b3.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 01:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMU9Zbb3WSFYRq0hl3BfOmzfn/zfxw8hM1VQmrwnwfv+UTKt4ooXe9OiKQD7NMfw+xbAPa+aAKOtfE8JEo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3i9GaWgJwkVTdmGClH+xzyJ7MjRT5gLC6FCpqpF/GHojdF2k6
	XEjXX8ti2cPp8BJ6BbMnd6C+LADDGGaQM+KdD21SmjqINjBiemDkxlOm8rFEN+G4HhYiUbl0zcA
	JXoB5LKW9PP1M3vGs4cv649iHy2JcCQU=
X-Google-Smtp-Source: AGHT+IEn0vqdkw8bEaFTh2evg/3/Gk5M0wvdcElU6mMy3Wg7wsSj3AKZVzV8/gWPdmB4yzqWtFjvi9yu72g/ac8yxEo=
X-Received: by 2002:a05:690c:18:b0:789:2be7:ae80 with SMTP id
 00721157ae682-790b582a8f8mr187013807b3.54.1767951244425; Fri, 09 Jan 2026
 01:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:33:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh3gljFKlGTGVVG8Mveu2qlxxn_p3yMb-Bc-OOzKbAyx_Ef35y9X6nAS98
Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013405_880258_EDBA7605 
X-CRM114-Status: UNSURE (   8.80  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjUz4oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKCj4gVGhlIEdQSU8gY29u
dHJvbGxlciBpcyBjb25maWd1cmVkIGFzIG5vbi1zbGVlcGluZyBidXQgaXQgdXNlcyBnZW5lcmlj
Cj4gcGluY3RybCBoZWxwZXJzIHdoaWNoIHVzZSBhIG11dGV4IGZvciBzeW5jaHJvbml6YXRpb24u
IFRoaXMgd2lsbCBjYXVzZQo+IGxvY2tkZXAgc3BsYXRzIHdoZW4gdXNlZCB0b2dldGhlciB3aXRo
IHNoYXJlZCBHUElPcyBnb2luZyB0aHJvdWdoIHRoZQo+IEdQSU8gc2hhcmVkIHByb3h5IGRyaXZl
ci4KPgo+IEZpeGVzOiA2ZTliZTNhYmI3OGMgKCJwaW5jdHJsOiBBZGQgZHJpdmVyIHN1cHBvcnQg
Zm9yIEFtbG9naWMgU29DcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXBvcnRl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUZCaW5DQWM3Q084
Z2ZOUWFrQ3UzTGZrWVh1eVRkMmlScE1SbThFS1hTTDBtd09uSndAbWFpbC5nbWFpbC5jb20vCj4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBv
c3MucXVhbGNvbW0uY29tPgoKUGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMhCgpZb3VycywKTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
