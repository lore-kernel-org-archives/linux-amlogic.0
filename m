Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74C7C2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 09:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA38621D79
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 09:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5F1mcd1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA38621D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyfrU6qd6F+L3S9OiQPBYCafUmwshehYXoYfslwi/EI=; b=r5F1mcd1ZialGr
	HipyATzdEj0xPQMhsjA/iElPY+5qqqCoblEqqOC2GQtQG4tF3/lbgfBF92ZnhKgTxT0+ylE5T69SJ
	WvQN8nE6fsmETjOUQ7vrvGRuoVnEBBwPML9YkGYauLjrJywrN78AmTHPEDhUVDO6XjJ4l+CAsXv17
	xcLASAUkj2Zx8mVAihjSiIFvjE9G+uxxKYHKzcbbESRNls7eMiBf6GUGf0bzNt8VspxHDtqjnrfKr
	4TodlyrH11nIvRheiDJQfIW4Pv2dMb3wJgsAxoXKebTsA9f8IOgVdS0P7L8C574KSutBfHc4vYoG4
	KrUNwJVDDjn17C317amA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP16i-0004Z7-8B; Thu, 16 Apr 2020 09:46:52 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP16f-0004YP-Ks; Thu, 16 Apr 2020 09:46:51 +0000
Received: by mail-ot1-f65.google.com with SMTP id i27so2545912ota.7;
 Thu, 16 Apr 2020 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RM/nTDzMiJT/jjtvKRl0rtdDn36SiM29khhvLS3Fy9U=;
 b=fzL7OoYxg1tvmULaxZ6iZzZSThbnfvbaYNiRSS9Ow5jqShiIIy6G8rAkQSZoW/X+kx
 7XdiSTgIPMPR1zoBP/T5GnNPZ8Tm27RPyImnt2XWOtCJW8L+ESSVd0+o1sKl0+x3wV//
 XnFJdg3sOC4F0v3n/ciuT1J0XDlXxyta8xzkchBgmKE9xCJ4KJcfJ8Hs9w8f3/6xWOuy
 Dhr1ZqgMURM4fkukgcbF+KxKyyp1ASJxbxTj7bofRyqQyVhsiaczyaG7SHwbDZxY8dNV
 K96Oqga0z8yJKhQ8Dgr5qNM2KM90MgVAdgAMSKahu2lsNZuiGDCdLlwdKF4J9lJrqSJG
 E+JQ==
X-Gm-Message-State: AGi0PuZ9MEjrfzn0/UblETfuZNkG6OHQhB9IDhwnGAj+gbSTHuKwr2JE
 Vb02DaaIXnJsFLLb1GQTktZ1CObQ3SOtwtTd1pc=
X-Google-Smtp-Source: APiQypIl3DcyhF0BNQx8p7xql+qmz/EnqLfrFLnv69mUOw78OJnDaQgEns2mc5nF+ZGDxENyc+UKCUv1ihzy5/CmGB4=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr20179548otk.107.1587030408635; 
 Thu, 16 Apr 2020 02:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
 <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
In-Reply-To: <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2020 11:46:37 +0200
Message-ID: <CAMuHMdXuq0SVUUE3gN5sF2pPaHfhQXX8JsXaR6+qXdnBXVikHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: move CEC platform drivers to a separate
 directory
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_024649_679223_1A7903E2 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mauro,

On Wed, Apr 15, 2020 at 12:32 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> As CEC support doesn't depend on MEDIA_SUPPORT, let's
> place the platform drivers outside the media menu.

Thanks for your patch!

> As a side effect, instead of depends on PCI, seco driver
> can select it (and DMI).

I don't think that's a good idea, as it suddenly enables selecting all PCI
drivers on platforms that do not have PCI.

    WARNING: unmet direct dependencies detected for PCI
      Depends on [n]: HAVE_PCI [=n]
      Selected by [m]:
      - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 ||
COMPILE_TEST [=y])

However, it already exposed some bugs that were hidden by PCI=n ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
