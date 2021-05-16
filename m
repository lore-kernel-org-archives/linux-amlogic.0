Return-Path: <SRS0=q7sb=KL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E68C433B4
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 May 2021 17:00:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34B560233
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 May 2021 17:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34B560233
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+EcQQWdc0JUmBnETaLeIGMcZtyczaYnOaQqVfzqW6M=; b=DxfGfT95aO0YRUwf4P1Lkikr5
	BqlIKQ5Vfr2u+erhTySZ09Owz18gP60xxR9j98YJyOlQIdg9Sr0w1v3M3zgiLaXJ+iwJo4zenpAJ5
	iFUR2Ky6Wc1+j9viUOEvYPxegqov4MvSTBTJQZhEL4qyKk+lRsY6iLmZWzhbvBLwcz/x+RFG0oGp8
	KqZwqdrl72gU158DyWIbueV7z11K60+fkiXKuJmgilVDzES2JlcjF5jPOvBL9jdqv0aXy6qRZYTEd
	i1r8LCm2gwSTqROrJdj4jvi+8XXdLg2f0xkioIz4DzqhS4A3xlpLBwNtgNaoXUM+6RIpkUvBMRnNb
	sMvvq01ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liK85-00CcPa-Cg; Sun, 16 May 2021 17:00:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK83-00CcPQ-Os
 for linux-amlogic@desiato.infradead.org; Sun, 16 May 2021 17:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=OacnSilRwRDmiHxH7ZyZ6MmTG6nUv/il1KgBvxYRXc8=; b=pMdpJH5rXi+yCa4TNsAw6P1fyJ
 BLDPllzUjwqOJ9kIDXjZ2Pt/0ZTdQveVgBz5rOuFTwuImgrP06So43NF/bc/7FhpMu9fphEYF/Kkx
 gkBdtwflVK9DWqeyZOAULrvP/4zx65tpGmoQnZ7DyHv/lsp8bJqoryGLuscmOEOdNI9HAM6QKxV/L
 kY/efjZxSApiy9mf0GTNMXwVGKonexdObp1nowK4434sjS3Cts48bhyvj3+Cp97BV61JKgFBuh5cw
 YrtLc8RxcHcsHn18SPw9Squ1lYgmt6/r+9DOM7vBIZHPN4vkWaPU9cz99R/5K3nxyMBw+8pgsF4gg
 HsLCHxCw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK81-00D49B-8L
 for linux-amlogic@lists.infradead.org; Sun, 16 May 2021 17:00:34 +0000
Received: by mail-ej1-x62d.google.com with SMTP id lz27so5672581ejb.11
 for <linux-amlogic@lists.infradead.org>; Sun, 16 May 2021 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OacnSilRwRDmiHxH7ZyZ6MmTG6nUv/il1KgBvxYRXc8=;
 b=BtfhbgF0TY5Q5SPdAz7xga7SYJ0DMzDKYJYDfVeetBwEnYrHZ3FkK2rZ3YV0lHdVn1
 NpZH7Fv7P5nnGo0+wo2z5Ug25DiyigengSYjLh4P8ogSUIlmCi4G/TAyu+Vuq6d040Jm
 q+eU1FIKk1mlQ8OYao4qaUk/NMSoHOVnzZZVTSahdZw/sOuS6lJphJgYA4IcJq7NdRjO
 vcqzOiIH8bEF/vWd8SpYDuJSGC/G8DKaebcEv62NfjOiGAFwCRQLmCvHTiPgqRxUAzBA
 7Tn3r7EUc2BYrs4MqWElN6BJTNGutwdQIxbS+jDdeXaWVZLXM3xTbE2lAkUohhLmDT6d
 xaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OacnSilRwRDmiHxH7ZyZ6MmTG6nUv/il1KgBvxYRXc8=;
 b=j65Ri9jY19rDNZSDlZo6M5vrud5E+sSdf0WdEFOjRWuFnz9dPZhGOz5/XCd1Y3FVV1
 NmlsHZgT0v7a26Ec9i66Q3NS6wTQehlnLXCxnK5Z1yTx/ThDUsb7H6ByGXVK39cxwZfr
 r1x9NDiVnaZNTPATayoh7U9tjECgcuPPiTMP187uuQMHn5NTKE+AjEEW1c9o5oofqgc9
 k1fGbRlmYdcTYwYZNjZNWqu/YtIN8MdJVW+nwfQh3RYeU1SN7vV/LJuzD8JyX4qEFBN8
 ng5BnhDOs6ZvCPRgLnxUhsT30QgFma7k0yTavKmg8ZRGRPGkQI+FkTEhlFRm4lXi/53C
 i9Lg==
X-Gm-Message-State: AOAM533O2WJzm9ZHI6Pw5kNFvYSILrjfE3XWiYotD2q6B0ghrp+JkZ3x
 3AkYsOVYpxIoRxwMeUP6uPFqCyBXBoJAxBPjz/M=
X-Google-Smtp-Source: ABdhPJz0lFd8wY1CmZVADqXS4+E9OuaAfRQVnBqcZUFGvxtc0RHRhwjYR2FhBcVzL1RyVSPFzMImLMy5I3hdOMMMTjk=
X-Received: by 2002:a17:906:f256:: with SMTP id
 gy22mr21412629ejb.537.1621184431551; 
 Sun, 16 May 2021 10:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABgxDoJbnFb+=oSMNrhbBGbFCRZWBQ54Dkyy02YnYm5bveD4gA@mail.gmail.com>
 <20210510190924.990912-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210510190924.990912-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 May 2021 19:00:20 +0200
Message-ID: <CAFBinCAY21Y-zQGC-Un=e82VK9bGuFc+cDAxjSkJjm8E5sEQcw@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: meson: Simplify using devm_pwmchip_add
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Romain Perier <romain.perier@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_100033_321045_C9F1426A 
X-CRM114-Status: UNSURE (   8.52  )
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

SGkgVXdlLAoKT24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgOTowOSBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CkFj
a2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKWy4uLl0KPiAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAxMiArLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxldGlvbnMoLSkKSSdk
IHNheSB5b3VyIHBhdGNoIGFjaGlldmVzIGl0J3MgZ29hbCBieSByZS11c2luZyBtb3JlIGNvZGUg
aW5zdGVhZCBvZgpkdXBsaWNhdGluZyBpdCBhY3Jvc3MgZHJpdmVycwpUaGFua3MgZm9yIHdvcmtp
bmcgb24gdGhpcyEKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
