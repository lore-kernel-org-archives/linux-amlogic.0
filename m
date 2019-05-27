Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94578C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D960208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBCDWckz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HUmc6rir"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D960208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ta9Ygtv2KxXpewWD7BlXfcL1NgMND94eXwDcyFA6gs=; b=vBCDWckz0I0THr
	ZfhWUBip6LQMa5ec4Jgc4ZEviZs27TT44KW7rQIFXtxznrfaboEvUhZdjtQujU/yvKXY2zeu5immv
	lDzovJj+TNUKasP3B+v43Q4Q/nAOHwwrgO/2rK97UF5hc8mE9kZDpj+Lq+1aK2Gb8+aEnbaxDI3Ar
	0VHWzlQLCpssPPiygvZ2mOdWJ4BAOmoGDVtwON6YDsp55BF4RBJwtJfNA2d38fFPVw8KPKzrddDW0
	q4na74GzkZiRr3M/eNorhM6ElL6cE+tCrxAsmwVZMTIEeutvi115g3eB+T9M5dBC8YAvJwvMEW1bM
	V/o4GUro+TbeAdImyMFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK0p-0003Ie-Rn; Mon, 27 May 2019 18:06:19 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK0n-0003IA-7Z; Mon, 27 May 2019 18:06:18 +0000
Received: by mail-oi1-x242.google.com with SMTP id w144so12411363oie.12;
 Mon, 27 May 2019 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=HUmc6rirKmR1hS/gQsUVm0RGGqPT4N9PmeqPlzvBsEmT/AclV6qMqetS2k+ZqseZt1
 O+Vonuz3IKhAeIac/8ALVXzw3wyEX0O0KXVQr/aS+HZJZcBcA17jb2xhJETkOllXc+Wz
 lzNv6hMZa5n3nvVMipKtUhA6sEdtCOqtcfP9W1yPgc40bJsoseywMbjinhqauVzZzYDe
 2DdtFuaMlbN4WS4utWCYQDwCF20MxmO6klYN0kIEqQldYJlwfqFroerA+UJZGPTxW9d4
 5CVNp7lh14MpD36j0VFTNVHkO/i61eb1Tqq7GSTXPIU2pjympknGZG9RbML3wfZSQsAV
 a4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=C5p+nxOgjXkVN0YnCcN2wwZW5nx1r4ZVOMBcn1hql5EGNycFvI/CpOzl0CtLaxRWmH
 a409ncYRt953vhYpV1+QLG0ZvhJCaia3fYD2xFwQJJPNMukjj4ASrmS/ZefoT6yLmVha
 9MAUyAJyCNJj5KXbC+P/1hJYkxHo9uk2i6xyOCVMPwZMlhpmFbtHtqjkkdeTNlfyw/WG
 oJ3Jy2Oac9QrZaHqGOS9k7c1+OU5zzTP6TgFTjKdLsPqTwfBCpqNAKsXRk2bdWiGpKrK
 DkzEMFkvfonFqoUqfnS3zgEn7VYyGrPaMoI8howoZ6juBDylz5BQBEVdWif849HC4Iq+
 suAQ==
X-Gm-Message-State: APjAAAWPfmofEW48RE7+xSpJHHPxelBK4wEVU4HRPeFxfUizR86l7uGC
 ArStyvKEPLreEEUwwM98As2LJBunRELiwaUwKNQ=
X-Google-Smtp-Source: APXvYqx9KJ2jcVtyv9sJYJEyKAm3S24vaMJ0KK9SArvolrcTJopXP7wsbVLGJgnh9WHreFlM6dw6JEOu0onvKFlRxFE=
X-Received: by 2002:aca:f144:: with SMTP id p65mr141486oih.47.1558980376467;
 Mon, 27 May 2019 11:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-3-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:06:05 +0200
Message-ID: <CAFBinCArHofRSpA+2Ti1gWzBPeOV8R9H-=gxkm9xFiiBt+4Vbg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] ARM: dts: meson6-atv1200: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110617_266357_5654605D 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
