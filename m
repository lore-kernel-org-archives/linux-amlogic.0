Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B124C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOaMhSBwVaR+YDGyL5OOBHvLEdriHsJHFHMDheiEvQk=; b=0xUxJ/jof64ITl
	Fp00X4IR1b5UgK4lad87mlWv+o9SefyxLEjMwrx9vQij2KJPd1K4QQMlweQqsjBohbO+cSFVBlKXq
	aswo23dw1/ENkIEItuhPLaYwBoSyc5Q+m8bSHZEpe/0BjereaRzRl4eik0KpzQuu57wsLBZPBCD90
	kyvE2RnjkTL1aXBZs9GMJojvf4fb1Vb98reXYAm/vNU+Rp+e9OBqzLWDxb4Pf/IpQwSg+KYWaog62
	U+GLS64Mmr6pzVLnxZTtKpbrqJepSzGOeIIZ6DAN+bjaCWvOkQfsNj3G7Czc9w8v5HeCXaKjIDMiM
	lYlSVF+sOJLWHwd3HrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8oX-00000006wT7-0b1y;
	Tue, 09 Jul 2024 11:15:17 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8oT-00000006wSL-31rJ
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 11:15:15 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-64789495923so42166147b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523713; x=1721128513; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JRnxn5kBog1S4c87fuPJ8CVw2ogmUFe7KoQqF9HGur4=;
        b=kNIuVZNco2wUIgUC1REBYC0B6b31iY0PgC8Tuv72ZBBdIptVuTVgRHlLrr2KnCv6An
         tNW9VK8Gio/MuiVtGJ2N2GZqDOunHvV625mZQ73hmAZLy8+28R7vhRzQgDrReyjKo0IM
         ZCpKFZmw5z/QemNw9dNlgJev1GVf7HxqOXzT2S1aFlPVStb5sRsPJUa53CgSk+tqI0a5
         U5m96/Xvg/teHDZlvjLjUbLhJOrBSYFCTchb4u5Rsgl96HihQVJCHbK2YCHoqcvBBjW4
         d0CBv6/zdelvvkUs+iCjQiEXcn6uSTpZMK+v4q+glkFP3NCLA+zotlHLt1ZKNRlR0jyI
         Zw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523713; x=1721128513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRnxn5kBog1S4c87fuPJ8CVw2ogmUFe7KoQqF9HGur4=;
        b=XQpBHz9EQExNLE6MMzUBLOowaPq0DY7FlZaEqoO4ZKp7uv7/NsE5LoB3OM45QNFUQM
         /0dUbTnI3/KCMeJgb5GzjnIdMnyPInm3CIUiW/xfsYqCsPcV7QU67P5oy+mlS8vsUB33
         tuAJfnM7WAN0aJ7AXwyk1aV141w7tqc6zVxhWIjLtL5YucbwRGcT95gdlD7Jaks7XBhe
         N96go2uCXPUunElKxEjZ0hl9so2+o0xo16yjM//EnFQykJdLY/QHJYau40QG8GLYWX1r
         PmhCTbZK4nPUPPmgKCr0IgH9i3jVme73MlCO6VEa49nj6jUY5lYgzOKO5cQi+uKfQjzA
         SPgg==
X-Forwarded-Encrypted: i=1; AJvYcCVfDMYhKRkA7dpWAGUMZy4KNUQn46byyWF8QudK2cGmczpXb5VNION6e+a5uoaM8vJdzQboPj8Nxd+nOAe3rkPKoep3MmMACLmfstduJjYUi/I=
X-Gm-Message-State: AOJu0YzDjL1O8g7AHrbIScqrMBKVMghcCJQU5PnbGlfBEccDwdTHTh+Z
	UsT2gg5BpOcKvoxclxPiS9ucIuSf5Ork16YLctNQIXIvoJp01qhM/YIxk8nOTiIVd8UiyvH54nV
	HhoJa4YRkZr8vxHWOoYKlvsHpBDxSK3wtkC4b7Q==
X-Google-Smtp-Source: AGHT+IHvO18cEkcdgxI9LdmOavq97SRmsNIECRYT+ECXAWD9UTP9pFQ6ZQOwH4TjXmRjZ21qPReOQ/XXVr1I24f4iJ4=
X-Received: by 2002:a05:690c:4b06:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-658ef249fc6mr31666527b3.29.1720523712710; Tue, 09 Jul 2024
 04:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
In-Reply-To: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Jul 2024 13:14:37 +0200
Message-ID: <CAPDyKFrY6rL-aCo=GtmRBoJNBH=p3DteWWfBmWkFnWhpwHLnLA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Power: A5: add power domain driver
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Hongyu Chen <hongyu.chen1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_041513_807863_21B43135 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 27 Jun 2024 at 13:47, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic A5 SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (3):
>       dt-bindings: power: add Amlogic A5 power domains
>       pmdomain: amlogic: Add support for A5 power domains controller
>       arm64: dts: amlogic: a5: add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
>  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 10 +++++++++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 26 ++++++++++++++++++++++
>  include/dt-bindings/power/amlogic,a5-pwrc.h        | 21 +++++++++++++++++
>  4 files changed, 58 insertions(+)
> ---

Patch 1 and 2 applied for next (patch 1 is available at the immutable
dt branch too), thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
