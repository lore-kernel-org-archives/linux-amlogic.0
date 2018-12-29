Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1DDC43387
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Dec 2018 14:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1342087F
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Dec 2018 14:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcb5IG4D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hY7FlQeD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1342087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/XLfU86ZYsVV1335aiybKYW1PHyF5icA+5wo/QCsNU=; b=fcb5IG4DZ3ndW0
	1qgOUK/HADS685mx92x0jB06h8lbLsUUdhdtKarsyugRh8SM/J9lA+VNSSJmPmRjvDxYppv7k7tXc
	e9yEAqUgcbs5eCKA5M5X4udtIbNL8FUQApXeNHIPIAcqDjECa4rwTwu1HC+3aZSHXmjEkB0m3GyTV
	6VY3t6p+gJBnq7SEsihHceKeI8O75eCGFJrZ10ticixkhjtiwDfBe/afndwHzR6Pc3LSKNSdE35wI
	VrFeOT/lqZYwy/Cks4/nfe2Z7gr9iqecdBNDhcxSdFWBh+G8raL3Rl6AjNCZeCXz5D68uqE3Qzsxk
	WxXFgQq+7pAE9asmvI2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdFcY-0000gR-2y; Sat, 29 Dec 2018 14:29:46 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdFcU-0000fo-Oq; Sat, 29 Dec 2018 14:29:44 +0000
Received: by mail-ot1-x342.google.com with SMTP id a11so20654470otr.10;
 Sat, 29 Dec 2018 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ie9auksBhJoXtAc+Y/yaeP1FssPIISyrcQYmTk85oIk=;
 b=hY7FlQeDRMO29Gx81zoHkNgWaZVaxcONGfYmzyk8vWgVjEKb7XLOL2IF2qr9p/i0RU
 mEXeAAvGQNizoPwPSe8tDjqHQqSyyCJs6QV6q4Rqjw0evUXeJKHIlBPI0aeG2TnOGDIi
 a40O/wGwPILrM0MJkDwLf+09PbQOUCL0nFVJ6MarkqxbM4efEv1X6A1G3HuJ3KevPt41
 SQRiw08OqY8zI+6cs31yAMvbu+45QyP9R3tL1DQuztPGnOEJ5YXEbAV3dTrd5UZfW5hQ
 IeVlhYIAm4QpmFCxq1cp8Xyv1NwSnlPTitZliqn+2v5kfcJORfPz2M8+r9R9d0Wzhran
 dLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ie9auksBhJoXtAc+Y/yaeP1FssPIISyrcQYmTk85oIk=;
 b=UWvFNjLWXjX8BfYp1glyFXr04AURyznAyvLmcaVkf3xE5RRB7cjjOqGz1uuaFIiFAM
 rEmPFo3MccAI4KYVPJuIKWMePwhhx2WC2Vj5w63rHeeeak2BNv9bSj91/xmshFgKfycy
 qWPoCVPNFqTmJN4D2+h9x0AM09Qwv8+G3sbRlNzfRJZTl7ygBnyS3j+IXQGruCBn72pR
 +BKVfmb5Hi9AWZjPiu+GaQDaaG8v4I+1YO0YV7mKcRGHa5kYe0KRjhzvO+DlY46gwgkm
 cEaivjmBEiVraQGRTXDChd9BSHsmOVmI82gpGKxasahBbRDBaGvItXR/XXeFZU3KH0iu
 9ebQ==
X-Gm-Message-State: AJcUukeSA1rlfwCxfuYGUtCP0lBgG+CsK6HzdllqQGmezkiHbIMzBwvF
 g16cAikRQMDwRMznahOuh9HpXKHFXftw12ACSqv1AgY9
X-Google-Smtp-Source: ALg8bN57O9bRVZadMEpInEcEjClNttCqBLs78cW0zP1oBYfkAk6RuIXr19m4W2JEVL0BRFUj0PuZdiQIvxZerLIO8SE=
X-Received: by 2002:a9d:7749:: with SMTP id t9mr22401989otl.342.1546093771264; 
 Sat, 29 Dec 2018 06:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Dec 2018 15:29:20 +0100
Message-ID: <CAFBinCCpsy40NuB124TqDUWy9zogeMrLsCGCanbbvpfd-yVDdQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: meson: fix SD card cd-gpio (pre v4.21-rc)
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, 
 linus.walleij@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181229_062942_818767_206C7A39 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: linus.luessing@c0d3.blue, bgolaszewski@baylibre.com, balbes-150@yandex.ru,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 29, 2018 at 1:57 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Today I noticed that my Odroid-C1 doesn't see it's SD card anymore.
> My board is not the only one, Odroid-C1 on KernelCI suffers from the
> same problem:
> v4.20-6428-g00c569b567c7 still sees the SD card (mmc0): [0]
> v4.20-8955-g903b77c63167 doesn't see the SD card (mmc0) anymore: [1]
>
> My Endless Mini (EC-100) is also affected by this issue.
>
> a git bisect run points to this commit:
> 89a5e15bcba87df5120d4656e0ff33d4f7cd6152 ("gpio/mmc/of: Respect polarity
> in the device tree")
>
> and indeed, reverting it makes my Odroid-C1 and EC-100 see the SD card
> again.
I started a separate discussion for that topic on the linux-mmc and
linux-gpio mailing list for this topic: [0]

comments regarding this series are still welcome!


Regards
Martin


[0] https://marc.info/?l=linux-mmc&m=154609359306732&w=3

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
