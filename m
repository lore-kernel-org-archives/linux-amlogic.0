Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E515BC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 16:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6232173E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 16:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LH/r4xuR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j/qmk0il"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6232173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViEWOrr0WFyGPBd1Xrjw9qQsPr1AbbQPdTppf9CN1bc=; b=LH/r4xuR+iruAI
	kLFIurQgr68xs5ZXBxLEdL1Ac7xVm6jjZOkIHhHmqoebGyOEohqjKE6kpGgbHpWaVmHfoeQsoDTo3
	DeGEAZOPDlQJxnprs7xQkPXDWGOGm9b2O4pnNsbIupPiNkY5ouMspRkDU1HoivnT4zTC86B5i9UF7
	qaugPL826W7mppfpUtWqwF0TWRdjbpUphif+ar26EXCbZNESMb45IFXK2Wz3s3VtAKhbwZYmeQXEa
	Z6TKMPHvHcy/G2UaKPziJbiPsZxlGUSRZ5S+/thMx4V+1ChGZlFM8k6apScdIJmchj3avnOjMfhMj
	GtNTvs/yXdTorOPY4KEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1C8f-00022D-GH; Fri, 23 Aug 2019 16:10:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1C8b-0001Cf-Ud
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 16:10:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id c5so9432903wmb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qCpJ5DiOoAHU5lhDofCgzNtjT/DAKjPBpHrmlHOG6vQ=;
 b=j/qmk0ilPhQUF7l0BN9NueVXnVk2TKnE2zRM8pYHg2uQDvM/AGnH+Bfx6hFLi7fMA5
 +pwScOhCd4T7VHxRIEH4eBmsM4mLGXagmBK8019XMPY7vfm4XHPmV9qMAoyE+idALv01
 o7oNlPtNdnmURS3gpvwjKwUcVItSTRYeVFdCPkJZZPVwvRd1joN4Ni+1b0OLf73t1wbN
 th/Tv6JxhO5HfB+s8kXKbo0JAlOSinY2G7P9cRqm4RQSzqsYnM3u3JxjmeJRPXAqt19Y
 CtUXa/GyRT/rRgMqOLJofptHhMWhFh8rOycf/niTiIfDQd+JvLT3tunPocq01Y86lZHg
 8hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qCpJ5DiOoAHU5lhDofCgzNtjT/DAKjPBpHrmlHOG6vQ=;
 b=LloAHe6G0OVJ8/YrObYo08kAUiknwUT+7nS4Cbo1EItpjM3z5ZFysL4R/UpXvZH51/
 OU1+Bck9YJ5am9IY+O5TPtoIULrcdQjKJ+V7WRv7wv69J+TlKxCI9H1pJxuiJXOKylzB
 2BnWZwqxOlmEMSnOejCmBQBcSDb/44raa2IpWvr5On8meRZgKZyaZ5ZdidivENelgkhp
 tTZuy1sThzLgP9h6hgoSOAumXA4PBA3fCV/hit7tpHDwwt7fuQH5Lqw4O7wfYJ02ttLS
 VsZg6ELA+6ZQsmP87sHmk6IyL5RbYp/7hBIbqc0mtJv8YZ7I3+/745kVgVMdy0HSmUp2
 kouQ==
X-Gm-Message-State: APjAAAVXUwrxREnmnfz6WoKE3q3mdzY4hZ1/Y4P90pJS1CkHRelh0LTl
 4sEs26MkFfIR32D3xDdYgF+H1+Ip1iQ=
X-Google-Smtp-Source: APXvYqzAdjPuuRgo0jN5MfNpSucyg8E+yaUYECo/wLyzD0iRmP6TdW/S7hVnAWdyxU8Skx4en26LQQ==
X-Received: by 2002:a7b:cd17:: with SMTP id f23mr6259424wmj.177.1566576603459; 
 Fri, 23 Aug 2019 09:10:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s2sm2909998wrp.32.2019.08.23.09.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 09:10:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [PATCH 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
Date: Fri, 23 Aug 2019 18:10:01 +0200
Message-ID: <1jlfvjeucm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_091006_030304_FC621000 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 22 Aug 2019 at 16:24, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
> enables DVFS on the SM1 SoC for the SEI610 board.
>
> The SM1 Clock structure is slightly different because of the Cortex-A55
> core used, having the capability for each core of a same cluster to run
> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>
> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
> with a bypass mux to use the CPU0 instead of the dedicated trees.
>
> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>
> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
> G12A only a single version of the SoC is available.
>
> Dependencies:
> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
> 	but is not a strong dependency, it will work without
>
> Neil Armstrong (6):
>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>   clk: meson: g12a: add support for SM1 GP1 PLL
>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>   clk: meson: g12a: expose SM1 CPU 1, 2 & 3 clocks
>   arm64: dts: meson-sm1-sei610: enable DVFS
>
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  26 +-
>  include/dt-bindings/clock/g12a-clkc.h         |   3 +
>  6 files changed, 697 insertions(+), 5 deletions(-)

Series looks good to me overall.
Just drop patch 5 and expose every ID necessary directly with patch 1
(same goes for the GP1 clock ID)

>
> -- 
> 2.22.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
