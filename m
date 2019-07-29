Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C5C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E90012070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZW7ntuV0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JaMcne2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E90012070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffs8PDg5cEpzRUZ16+tqIkkvTYn6BYsRbJNZDO/NHhQ=; b=ZW7ntuV0UIrSQh
	HpC/YIyHIDlwi5nN4XnW2a38iyABETLa6c2i6BxjAtjURL6vDNv7bXtb+QNKbAyfuGt8bkuJuCUX1
	8sVR2mMaJXdJGKG97kGSmGPsOYTNogK5+xTvXHbOgd+tm++hqF7+cmUfThAsKPCV3+zf6go+Va4Yc
	uuvzOqDxovL2KMZsWPfMJbglGFMvhpsJILCtwVxBVVf246PU59azCaqB4AGvQct2Q3+WQmWph3OZr
	Ey2TDLsqOOsGKsz8DfXZySuQ38/lArVksqeyYg343xjkZcPsxt2NHQK9P4cP5SYKVF2OrtolLhKaz
	jRYUi0Y/dKKDCcJ0IIvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs3Hq-0000H3-KZ; Mon, 29 Jul 2019 10:53:50 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs3Hi-00008n-3r
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 10:53:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id 207so53415210wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=P3COhzyH6iXhkUqb58Ll+n9CaZJ1lhlavM2fMRktAGU=;
 b=JaMcne2DiIeeVdHaTOx7JgVOlm1khWybU1LyPFgBTqmdGdKfa9IF6b1ryZ2sB+bASI
 Fi2JBz7VOeu8iKN+vl4MO5yNst6wEnE2TqUsVhBiNePV0f3zFT3jzs2RL7c+Sb9kcQxm
 CG59Hh/jNrQbPWIpCAo9g+OsOTjKTyUjGfA990pehRyBz0gvUdzeP1pzVdohzIdGOemP
 fiVrSttr2vz+jWzQxvJ7d3GcWtgQdpmSyiv50M02cUS1ChTJ8z7Fnj+45R8o4VejuBRO
 jUHBx90LyQtnv7Tklc6uaYD0QK7/OWaB6JmVSEU19GSqhUnO3kxP8m3sLeaiYIVbb7o2
 385w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=P3COhzyH6iXhkUqb58Ll+n9CaZJ1lhlavM2fMRktAGU=;
 b=c8H8MrnnEAp5olFN+RrWxGXM5swRpalS2KztHKtAdDziskUkJgAUWcmuCp4TkWqcXR
 MHIqwJF61ozFmSYabcY4nRe/31Z1kzK0EEu/SB/gZpCYnIhECtEAI2y7wZcCVw4Ngw0J
 J72wRbdazxna3JS2NBz7pJkMoLyYNBkJMmQFdAxJLklylV1xkNzxY96nSNRG7mEu2buJ
 1B+NI3exBPCcHM88TPIND1Nn6hKJgzGJhaEm4Y6xlSoGZ1w6rwTHk0jIYuGK8hwieaLy
 qYvwC/L/ZvaTPtVrwZB19NwKoX6JxVddp8P57+/ya85HtQfx7rMu2jCX4EbMiHEc5gny
 zH2g==
X-Gm-Message-State: APjAAAXebhBpLBSgJANqEuBkmHKNPV+xQC1IVJkpOCNdGB0TVuT+bHWM
 ZdtEsm2aA4Ajnlz9Z8RU5VDuwQ==
X-Google-Smtp-Source: APXvYqxwuWo8lB42LjgZDeetJ6kM9JIYJvns12qyruinqHeJddpFQariDUkpt28Qlhw6t91UoVT+pg==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr41453713wmh.165.1564397620334; 
 Mon, 29 Jul 2019 03:53:40 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id i13sm53855709wrr.73.2019.07.29.03.53.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 03:53:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v2 0/4] clk: meson: ao: use the new parent description
 method
In-Reply-To: <20190725164126.27919-1-amergnat@baylibre.com>
References: <20190725164126.27919-1-amergnat@baylibre.com>
Date: Mon, 29 Jul 2019 12:53:38 +0200
Message-ID: <1j36ip9knh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_035342_625910_DE512384 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 25 Jul 2019 at 18:41, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> Meson SoCs clock controllers use the string comparison method to describe
> parent relation between the clocks, which is not optimized.
>
> Its also use bypass clock made from device-tree clock to provide an input
> clock which can be access through global name, but it still not optimal.
>
> A recent patch [0] allows parents to be directly specified with
> device-tree clock name or without string names from localy declared clocks.
>
> This patchset replaces clock string names by clock pointers (as possible),
> removes bypass clocks and uses directly device-tree clock names in parent
> assignment.
>
> Tested on GXL, GXBB, Meson8b, AXG SoCs by comparing the clock summary
> (orphan too) before and after migration.
>
> [0] commit fc0c209c147f ("clk: Allow parents to be specified without string names")
>
> Change since v1:
> - Improve clock parent assignment for "fixme" using name instead of fw_name.
>
> Alexandre Mergnat (4):
>   clk: meson: g12a-aoclk: migrate to the new parent description method
>   clk: meson: gxbb-aoclk: migrate to the new parent description method
>   clk: meson: axg-aoclk: migrate to the new parent description method
>   clk: meson: remove ao input bypass clocks
>
>  drivers/clk/meson/Kconfig       |  1 -
>  drivers/clk/meson/axg-aoclk.c   | 63 ++++++++++++++-----------
>  drivers/clk/meson/g12a-aoclk.c  | 81 ++++++++++++++++++++-------------
>  drivers/clk/meson/gxbb-aoclk.c  | 55 +++++++++++-----------
>  drivers/clk/meson/meson-aoclk.c | 37 ---------------
>  drivers/clk/meson/meson-aoclk.h |  8 ----
>  6 files changed, 114 insertions(+), 131 deletions(-)
>

Applied
Thanks !

> -- 
> 2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
