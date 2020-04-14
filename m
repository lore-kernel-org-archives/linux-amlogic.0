Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824E2C2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 13:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDD22078B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 13:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmlkzid9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UyQbo7MJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDD22078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7CbZNH7sWAugvU76vZmSQdKS6oghfc+Dkl0nQAzv0IQ=; b=hmlkzid9hfZpLmFQ5uwLKPWkEI
	iB0Sv6rI+2XqIvEXcVzpsWMse0YghMy+Be90olK1vs9WudTuyZyZpvi3EwAElk1lNzsWq+0DKvAuD
	vaEvO3xEgPN0no2QjryILc2qBB7kXDIX/0194lBx90IEUTYr7rREL9da6nefez3YDCm//QCftDla/
	pb6NZKoXlOA0Ro2SRRod3E74fx0/9zV5b10Y9Gw+8Ym38/9ZHUa7T3Nuw+T5Aujxt1PqtVWcq41Xg
	g0wGYMgl8ZCD+xYAc7ej/NfBBZBzfRGH7UOEmHOBayrDKoYfXhNJvhY9fs5TBreoQIeXRLina0e2i
	fbonSMiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOLG9-0000ys-PB; Tue, 14 Apr 2020 13:05:49 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLFo-0000dG-0C
 for linux-amlogic@lists.infradead.org; Tue, 14 Apr 2020 13:05:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id d27so5024086wra.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Apr 2020 06:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=hXwIQYgoQP2Wup93C1/59d2xx2g3UUkrum6b3g6XEYk=;
 b=UyQbo7MJKG1NihktiWx4FwRnJw5Y/jhDfqPKDzBCTAnc3WqjnfQ/r8MXmIK4H2tTcc
 p/suue+ZEK+pVaNOs6LS+XEDherVb2ELvDV3m+CCOdnmZ7LUmlSkF83KfwIE0byLOtbw
 iHvrkfYP+0z/V/MbtwnwT1czz90p5UT2RrjBNhc6GjdHa7Af859SsPQAzcnFmpM/zkCG
 ongBPvM7Zj3IMiwBjBcpWjBJewL221NaOWh7Y1Y4IFBXdjQAQ1SRqHVMiSf4LwkETeiv
 lsHf4UojuwH3EeQvz64OlDVcDd2O8e8O0UvizYkWaPpibK0sDuMefLzpyhTJC5+5qfRr
 p1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=hXwIQYgoQP2Wup93C1/59d2xx2g3UUkrum6b3g6XEYk=;
 b=sEpIoz1qKMfWfzf+xNyqpZ3EWWgOD/2ZWJIAbXRI/WFhqmWNI/rjmbyZTW3LyrWerO
 GMCOVT6jVqcEDxqW00Se+75WWuK58uXU4S+vR9Fjt0GR37zZXQamnAH+RBNd78o/h1uK
 yLt/W00lBUxzsHwB5n+F3cHhrkVUtaoe5/rW3yaIVwx8KvaHbQCsMqJCqQrU/rard1y/
 ubq02mYN7iWCTegLHgIY04NP3cWnHXf4tvYcWzAY/cP4M7dOvB2T2V5P7Zz5oyhUd5UT
 IPCYF2gs/VHDNaZ1KMLO/eeahWR/kiK3iPivxWoUmAohuHFfHWhw0/JtN/b8nOcVUO6R
 xB0A==
X-Gm-Message-State: AGi0PuZObVGliW1LlWzO6aga8GZi4p4ZhE5ieeSSy2jye2hI39Z7yabb
 aJYjnfMUTNNwshhh8fDMcEO/PQ==
X-Google-Smtp-Source: APiQypLVat6kUor59eAwhpTgIo0JZwEUdzMv6AqD1oJjYDhA/1hYzmlEALMZYP/w2KFVxCghsnhsSw==
X-Received: by 2002:adf:a54a:: with SMTP id j10mr22627237wrb.233.1586869526464; 
 Tue, 14 Apr 2020 06:05:26 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k3sm9397220wru.90.2020.04.14.06.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:05:23 -0700 (PDT)
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 narmstrong@baylibre.com
Subject: Re: [RFC v1 0/5] GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1
In-reply-to: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
Date: Tue, 14 Apr 2020 15:05:22 +0200
Message-ID: <1jftd6tdyl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_060528_082391_B3E68C77 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 31 Mar 2020 at 00:10, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

>
> [0] https://cgit.freedesktop.org/drm-misc/commit/?id=1996970773a323533e1cc1b6b97f00a95d675f32
>
>
> Martin Blumenstingl (5):
>   clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
>   clk: meson: g12a: Prepare the GPU clock tree to change at runtime
>   arm64: dts: amlogic: meson-gx: add the Mali-450 OPP table and use DVFS
>   arm64: dts: amlogic: meson-gxm: add the Mali OPP table and use DVFS
>   arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS
>
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 49 ++++++++++-----
>  .../boot/dts/amlogic/meson-gx-mali450.dtsi    | 61 +++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 51 ++++------------
>  .../boot/dts/amlogic/meson-gxl-mali.dtsi      | 46 +++-----------
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    | 45 +++++++++-----
>  drivers/clk/meson/g12a.c                      | 30 ++++++---
>  drivers/clk/meson/gxbb.c                      | 40 ++++++------
>  7 files changed, 189 insertions(+), 133 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi

Clock part looks good to me and aligns with meson8.
Please resend the clock part without the RFC tag

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
