Return-Path: <SRS0=Hgg4=5O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6683AC43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 09:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3900F20675
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 09:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+IOq2MF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlBBbPjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3900F20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKgM9qQk4AfiLgAOLImW9QOtcqx+0cyh5G9QoJ/prJ4=; b=s+IOq2MFfTSKe/
	7WNshhbKItCm0cbvME/eWZ6tlkq/tyrMc/EQOi2gKMND9G1+P5/lEcDkA+U4+8M7MW4sRoRBOVi7k
	FMZIU2dLs0rKBsDxcvhDpZzSZ7+NdOGzA9CjfHiOFvacYy+ADmQ66CPAviUI0E1yZxexgSZYERAw+
	dLwsG2ZaOHN0cr231Je84BvwGJFsf7IqHeW6fAAnTSbQIGcB4sK6g7DUOx2M8vzqxc3ouF23Fo98s
	6mf2UsHieb5EJNpxvRRwqsZdF+bRlrdRc0BdrVsnktX6STKFDG3bH4nfxXADcZTDo2rCgw7kul08Y
	I5W0ElM1r8uxNgVfVU0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIUhC-0005aa-80; Sun, 29 Mar 2020 09:57:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIUh7-0005ZD-3v; Sun, 29 Mar 2020 09:57:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id d1so17797022wmb.2;
 Sun, 29 Mar 2020 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5/ybwGZw15O183cB6hxraMKImcCya/+VsT5AgJC+wk=;
 b=PlBBbPjoSfFFs7coNzHn9y18vAv7tg8/gEY0ie5YIkK13kmI6SbdzQoLrfMgSy8Rm5
 M6+sZHbgLbuUP3x7Yi4JOEBmBfnVda+LdwY0Bj/l8h0ZA7GwdUMMPV9FgLFKvYJaQfy9
 dD02x2Np6E67W8gO2RBaVF56KZAtqp1CEFtuUIbWKhYVCXseO4V7/kzmWJsWVWZ9RPT2
 MTCiMRujzIQ9JvGhJ3qoItKdllyaL5MnMUvQlC6O810X5BaS9f5mhH3x/grKuoDdvGDe
 vVpv82zY7bvOSu48mbqHv8jw67oBX8GWFwfg19KElJa2K4zU3TB3rSUoXgPMAwgFG8Mf
 gAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5/ybwGZw15O183cB6hxraMKImcCya/+VsT5AgJC+wk=;
 b=Tk0etenGsGOKRLacFjtKIRikOMrrI4Sd1zd+0ASJfIIbUY5FufY3LIf8btDxTUCgd5
 9SsffS0v9TIu3Yv8/3iOi27T3/riDaXwVuy+/EnkzIYepoij51uw4/6SOWyEgNo76FKS
 36N4FfXpLEyU3XqqJpEu9Sv1Yo1b2KT66dNmyYBW6DUM9d4WYusyb0UgnpWxeOSkzFa+
 qVDY/30tsZ655cWcOeVi47oIzKhAZQcXNfOzWd8tnI2OTA+M1Q70NN7UUmEJtUVj3ukV
 KUM4/cGvviNxPRfSg3SWua+0M66RPfwJh75EN48kKEu3uyMFhe3ELFCjn5XZJjDCZozR
 KEXQ==
X-Gm-Message-State: ANhLgQ280r53lBhwfOJnKpet8BoY1z413ZmTT/0Aj+I/SMuKe47iB3W1
 KL4eK9O1BZXkB1bIuvN7cc15ZED+4U2Baq5K4z0=
X-Google-Smtp-Source: ADFU+vt/KWuDksi8mUndNDmzSr2QWqqKzTuw0aQvhAAxtapcUeVPe+tjCaP46IlOCkv0ET3XIlL1gz6wNhFoqGMdrKY=
X-Received: by 2002:a1c:1942:: with SMTP id 63mr4990909wmz.133.1585475844683; 
 Sun, 29 Mar 2020 02:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
 <20200319203427.2259891-3-martin.blumenstingl@googlemail.com>
 <CAKGbVbtKqdCEcawkjG=7TRd30df6GJ+gagV_JegntyqRpzC4cg@mail.gmail.com>
 <CAKGbVbvAvk0L5sGQmuqfxeL6AwtVnSsYyCp6YBYV6ZHKepWBXg@mail.gmail.com>
 <CAFBinCDUhVaky6EUA7dOAhAZM9itbydQ+w=0P-1m2u0o0HUUeA@mail.gmail.com>
In-Reply-To: <CAFBinCDUhVaky6EUA7dOAhAZM9itbydQ+w=0P-1m2u0o0HUUeA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 29 Mar 2020 17:57:13 +0800
Message-ID: <CAKGbVbsHXUhpaU34ovRPqc51LSavERUzMySx3hG7AqdO-oobHw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/lima: Add optional devfreq and cooling device
 support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_025729_186446_70D8F836 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I'm not the maintainer of patch 1 file, so please contact:
  - Rob Herring <robh@kernel.org>
  - Maxime Ripard <maxime.ripard@free-electrons.com>
  - Heiko Stuebner <heiko@sntech.de>
to review and apply patch 1.

Regards,
Qiang

On Sat, Mar 28, 2020 at 6:20 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Mar 28, 2020 at 9:40 AM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > Applied to drm-misc-next.
> thank you!
>
> regarding patch #1 - can you apply this as well?
> patch #1 just takes this midgard change [0] and ports it to utgard
>
>
> Thank you!
> Martin
>
>
> [0] https://cgit.freedesktop.org/drm/drm-misc/commit/Documentation/devicetree/bindings/gpu?id=982c0500fd1a8012c31d3c9dd8de285129904656

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
