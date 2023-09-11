Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6258BEE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSlt01ajVK+YkPzSy3N6v1Mzr/M0Zounrv8IBJvmpAs=; b=MGbfudOkDg0sC8
	5HpNFOUgHnA2AEdT3cRFIWzMvacf0yS6fpyYa1eIQgkFqJX6cOv3sL1qRdwuadVl6nZgbIzBSSDtS
	bn3aEnwghexlSMU1MMHLWEyEwtdF9QPt6p2tjnDEUIPXJDtCo14Fol4zLmSgr9BMc1tJDQpBBJ3bv
	+Mro6GfcG6nfwTIw4tiVYPKn9ftW/oK96PiYcCE6pnc5kS+7DSaZzY2SekS1cQLCbiIdmmg21qDs7
	VKPFdcYibIC9QWxTDuoXBRm1BMUQ3gNAxk3FrskiaFdHnNCyvTtjqHV80yKXu80hI0732IP0jnhag
	IVAregO3u20ksrwgkTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfhwQ-000hx0-0z;
	Mon, 11 Sep 2023 14:31:06 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfhwM-000hvi-2v
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 14:31:04 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso3891715276.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694442662; x=1695047462; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MRMbduXBtm2u3hpR450ozQ9ET1j6hRdg7A226yfqXL4=;
        b=bFyLtDdI2QIfsdiQuSws3s1siq3Sz77WaJxwx+617k8tCNjDQ9BunojU2qcThWhWUG
         z9mkmm9MNUkmloOmzF2AHUavOoFOuWhCPz1RecIN4iHcpTtOLuij7/K5fm0Hy8V+j7Cl
         7qUopSt8tNRe1HZyg3jLdrsZj77sWlocoKuuWRdTMCDzbcaPmcI+9+CrCYizSQrQju2A
         6o9qJnmubFHLKncq3YtNs5QdFduXctDzX2v/c5DhHlXEdJEWkc5Ik+mtWHRLMHliRMN3
         pN4tkrrLWYNepnImR8Fnjjb8ZEBoTcxZchEk7D1INJHN4DCfRGm+jbaf2EzwqBKefbZf
         GP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694442662; x=1695047462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRMbduXBtm2u3hpR450ozQ9ET1j6hRdg7A226yfqXL4=;
        b=IFBKpwH0BYBDx7oLkNMA0X5bExaglFqZXK7TQfxlYXFszr7iqwKhZFlMTwD7H7iYPd
         p6x6G98O/UXsR9BPmizGdL37yA46qqtWMjrhoTasNWR4+wzXl6nvjHY9SLX6PA89fRBE
         rS4oVkpoiffRf+RTOWOsjoZljh0WXMj21K5wkpD57wP9uSxCzPP6GtXCkA1uQaoOjU0Y
         9q1rNXDZtQz2QohO9RWS06P9AgbyunZoMkJvLFk8mAbavmSSJdDxXGDR6AGzXcSiOO+9
         Xfx8lGsdyt9zuAncY2ZXqV077G23gVDqMCdoPuE8yL05dsGSjbnWElXWD17TwkGo9v+G
         p4Jg==
X-Gm-Message-State: AOJu0YyLIgW4ahrUJe3Gzwl7yJz/YHU7/L4w2KISu4obzWlRrXFVE5G8
	MxBz0JCrggN5BD9OEJQYvouzqI61Hmh4d3rHy5WzIQ==
X-Google-Smtp-Source: AGHT+IHM9lDnQetC5LLtRbUDBIR/L+NWqkeueFcXF7OnhW3zZVv6Wnt9N3vGRRwv0ZYdb7tOzOpDbqjMCh4fQJ5M7tk=
X-Received: by 2002:a25:7392:0:b0:d7e:761d:cc83 with SMTP id
 o140-20020a257392000000b00d7e761dcc83mr7054140ybc.14.1694442661879; Mon, 11
 Sep 2023 07:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
In-Reply-To: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Sep 2023 16:30:25 +0200
Message-ID: <CAPDyKFqTs=mRnBRREbT+WFj_4qTLd8LTKigY_1TAZOqGGUKk3A@mail.gmail.com>
Subject: Re: [PATCH V3 RESEND 0/6] Power: T7: add power domain driver
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_073102_947770_9664D1EB 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, 11 Sept 2023 at 04:52, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>
> First patch is that remove C3 some power domain ALWAYS_ON property.
> Second patch is that add driver to support power parent node.
> Third patch is that turn on power if initial power domain with
> "AWAY_ON" property state is off.
>
> Other patchs adds power controller driver support for Amlogic T7 SoC.
>
> Changes Since v2:
>  -Modify subject.
>  -Define PWRC_NO_PARENT UINT_MAX
>  -Remove modification that transform is_off into 1 or 0 using !!
>
> Changes Since v1:
>  -Fix license from "GPL-2.0-only OR .*" to "GPL-2.0-only OR MIT".
>  -Modify T7_NIC flag  "ALWAYS_ON"
>
> xianwei.zhao (6):
>   genpd: amlogic: modify some power domains property
>   genpd: amlogic: add driver to support power parent node
>   genpd: amlogic: init power domain state
>   dt-bindings: power: add Amlogic T7 power domains
>   genpd: amlogic: Add support for T7 power domains controller
>   arm64: dts: amlogic: t7: add power domain controller node
>
>  .../power/amlogic,meson-sec-pwrc.yaml         |   3 +-
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   6 +
>  drivers/genpd/amlogic/meson-secure-pwrc.c     | 127 ++++++++++++++++--
>  include/dt-bindings/power/amlogic,t7-pwrc.h   |  63 +++++++++
>  4 files changed, 185 insertions(+), 14 deletions(-)
>  create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
>
>
> base-commit: 413f5c02929bb33042bbc4ee233166550a5fca70
> --
> 2.37.1
>

Patch 1 to 5, applied for next!

The DT patch (patch4), is available on an immutable branch "genpd_dt" too.

From now on, I will continue to put changes for genpd DT bindings on
the above branch, to allow SoC maintainers to pull it in to manage
potential dependent updates to DTS files.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
