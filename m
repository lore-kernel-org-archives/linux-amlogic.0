Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58332C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE0A206C1
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCAGv6B6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D3P0EVus"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE0A206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xeI7HoREFm/dr1Us36sNbATEsHRN0bAk83Bjz77MIk=; b=iCAGv6B6n34sYJ
	Xt9sg4Gaw73o0Q1fkT167ymfNlxcub9CuAJwDpXJRxnl7Ac9g1odLInwZE7ATw6TzhHZX7OXnItHs
	O21gcKvdsrIl77hQAhPMOHEsXT9zZ5pA3ZibYRZrvGY9orZEk4UUkEOrhSWt+/b9N6m8OC6Nm5K8m
	6efp+FQlG0zt1XVYudm4q56jmHiuaaOR2P+riNIwSbm4PKUPRJTT87MbbcM8q7+6vGplLb5YrSNmX
	BWf1NBGwhcYjTvOnrJFBLmZIQysvGgLa+RgJi+4Z522KCCxEIlaRzXNWlLPqCsshE41lY2sHR5QaV
	H4L94fwnNKfgcmqLDMZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTHs-00063c-El; Sat, 27 Apr 2019 19:47:04 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTHq-00063H-6y
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 19:47:03 +0000
Received: by mail-ot1-x343.google.com with SMTP id e5so5456307otk.12
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QnC9wW8bLhTgixXJHjwZfaafnkCtCkiIzI7KsiKrQ5g=;
 b=D3P0EVusslkqOu2NxAHkYAjshY5hTyCsXDxygXfOKRUwg9oGXA9SpbdvUANyO7+A6e
 4WbOzfIghxTsXTkfaGFuEhJRQWK8StNHaMtXGwOOziyiVlDMDnC+BCBlUPsdYXMFuuv7
 0BxevVxisEtSP5kdjc4P+fdZlCE5F6RmBnq9avDodG7/4L841sr2Zra98f1lOeIZ0UuI
 kbk2Xm3BTXk0M03JPyCrz6Bjtb+/7EP09gjJKWlJkfxop9Rf6XZa5ACmKVUr2uZPbEvx
 0udsy2MDNyyT0TIELI73nOHI54xANTTLl0Rs1sg9HT1xKoSOjcI5zigDxFsX1Ki9Ium/
 BTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnC9wW8bLhTgixXJHjwZfaafnkCtCkiIzI7KsiKrQ5g=;
 b=XAo9MfvNiwtwDuv7OZWOwH9bbYhJZLdizqWX9+StvErFxrc2OeUpSZN4B3diLCr6Rz
 Jk47XMEU6WmduNAqb37XoTfYs6/SIUy8Gd4pLvCvQ2UH5yijX4mluyQj8YARljgosHMw
 BJTpfvjYFBIL22b9UYBpp3jK9N5Ou9eBEsI+y0xjuuFeYdMl84Nsi0euy629dic5mxB5
 Y2n04cjKRLQC9+k1WD3RJDmihiXxl5Rf227q8IwC1pYZT78RY9XyKmFjmlguMOkPoIsZ
 CxhTwHR0x1GbX7TjmqoD4IYOAHSloaGBS5rfrLJF6L5tzoGF5I5vrOHZbly9gW4+SXFq
 Y6Jw==
X-Gm-Message-State: APjAAAVMvBsDo2QG65R7i6IVWWtyPH4PylmEr4JdJ2VL90rM6/kyHl1Y
 IfPGazf+BLamt9pd6uhjpNXG8qZn5Wy1VJ+wHOM=
X-Google-Smtp-Source: APXvYqzOCr6ZHZAvIYQ7cLYYckNGZXqEF3l4GCGyyPjKCt9lTVzG3xpx2kfc+9mooMdLyCzRekYktfZdUHMN6/jQy3k=
X-Received: by 2002:a9d:3db4:: with SMTP id l49mr32819522otc.131.1556394420732; 
 Sat, 27 Apr 2019 12:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <CACRpkdbLJYgU5ZP5CkwX1FBv8eHp+7TsAMv3_H51C_EOA85X4A@mail.gmail.com>
In-Reply-To: <CACRpkdbLJYgU5ZP5CkwX1FBv8eHp+7TsAMv3_H51C_EOA85X4A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 21:46:50 +0200
Message-ID: <CAFBinCCgGbvN6nLywsGk3TXT7eDLD=2A=uD_W07QumyBJSCAuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add drive-strength in Meson pinctrl driver
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_124702_309449_982EA6F6 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Tue, Apr 23, 2019 at 1:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>
> > The purpose of this patchset is to add drive-strength support in meson pinconf
> > driver. This is a new feature that was added on the g12a. It is critical for us
> > to support this since many functions are failing with default pad drive-strength.
> >
> > The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> > 'drive-strength' is expressed in mA.
> > So this patch add another generic property "drive-strength-uA". The change to do so
> > would be minimal and could be benefit to other platforms later on.
> >
> > Cheers
> > Guillaume
>
> This needs to be reviewed by Martin Blumenstigl, Martin can you have a look
> at this patch set? If you don't have the patches I think Guillaume can
> resend them.
thank you for the reminder - I just sent my feedback.
can you please also have a look at patch 4/4? there are two cases
where I'm not sure what the best practice of the pinctrl subsystem is


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
