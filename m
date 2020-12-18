Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCDEC4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:50:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A019E23A84
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A019E23A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaLC8s1M3szLL4e1tHsWi41GEiEYOGQUdPAtNfn+L6s=; b=EnJg2gncETvDH3yMxLKGY9xDsl
	Xcw2p83DFF2wGYC2iLK/3flmZrRfixrBV8p4SbXLNOHZsJkiLzumyrOHEGqgEmQ6j82/M+nJPsqAE
	y2V3MGytkX6Ax9PpaGwC0g4MVHxXY6Ve9C6sww4WMycf6E+ZUU7Mb8osHxf99NhhwgPtuZvkj4GVf
	+m28mfXAyc8mwlXSivLAm1VRJJEswC0OZ7Qy55miwAlC7F/toD/GmShQJwMa+7PFVvvbmnfDZqBkg
	f9C/FGVBSSvT0SRZJMATc3mQNWd+F+eAyZZHpbNFsWgPVAbn7rQQtuwDEMoVfJDA/LaCaLgvtPXMT
	eF6LNRSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCOd-0003CS-7L; Fri, 18 Dec 2020 09:49:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCOb-0003C6-9n
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 09:49:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id y17so1433179wrr.10
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i68DHKWuidoiLSCjV7Xg6b+4uHNmCRXnOuj5cVbm9rw=;
 b=05B+BYsTW+FvCB9LCMoqSbVULdUp85baC/MO0WnyfrQI0SLrOsx2hjAsDlIMtxZbEr
 D7131ePnDtqLEHgyBvDS9BztCid3lMaevi7v0WpB/04sejkEQ0/tYWXMhEFG83EQ57sX
 HcVaMqtoWMoFueO88KR6k3x4arentx866HvbJrDDXOxTQHMVHrOHBHObSW34LqOmtath
 wVmaYo/q7QWW2SM/lX5mdK93TYthmJpzMkY2I7Vsq6Tox3uMDxXddzP9Tg4kGyACs6zZ
 PNQjox69ljMrRl78/kWXciHUWSZsWcx0WR2AgsAUAquCM8E/pZtckVpzxPeH/ERSED9m
 6Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i68DHKWuidoiLSCjV7Xg6b+4uHNmCRXnOuj5cVbm9rw=;
 b=jYZmu1AqDGHqvJRmIAHDDyGscVa49TBWy28CVMQ5JqkaBNRZAchbTnRYZRLDzzrjfL
 NBATnUheJ65AA2RcE6MzeCCM8tMVw5QTJLbT1VDwZMk1mQJ17eAwWYNd70bh6l33R5Fw
 LCkJ2CwDzCGbalO3wG9uJI6M+YuJZxoh8rws8iEGnugk8OyqHy8Hw6ZHp9OEVusHS63G
 tQrY+QCT0hrQFG8t1TsqxPkiISNcaUfNMDM+N5riI26NNZhOu4gvClGCGY8o7nYlU3Cl
 lfVhxFtXBnvQqgJwPAvpgkLoyxZ5+tsZWoOcsEkpax8Go41tKLVriGFFfCGED8yji7ab
 h51g==
X-Gm-Message-State: AOAM530hKyoBJCA23RsFwrQUg/3Bs5oi35Maiz3l/XrYQVZJjibZ49F2
 adT+S4ATVrOs16ytLJ6tnGJDjomSKIoA8yoh
X-Google-Smtp-Source: ABdhPJwyHDcv752PXXDH53H2zPcoSKrVRKydQ25hcXYlOoCaSp0zoeIp3KK2d4T0w2Uuo9HzEozTDg==
X-Received: by 2002:adf:e348:: with SMTP id n8mr3503470wrj.148.1608284995964; 
 Fri, 18 Dec 2020 01:49:55 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad?
 ([2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad])
 by smtp.gmail.com with ESMTPSA id v1sm12169311wrr.48.2020.12.18.01.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 01:49:55 -0800 (PST)
Subject: Re: [PATCH 0/5] board: amlogic: add Beelink GT-King/Pro support
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20201218084545.29135-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <19d7f4a3-4c48-54f9-c4f0-73756ea4dc09@baylibre.com>
Date: Fri, 18 Dec 2020 10:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218084545.29135-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_044957_379456_3D715FA3 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/12/2020 09:45, Christian Hewitt wrote:
> This patchset adds support for the Beelink GT-King and GT-King Pro boxes
> based on the Amlogic S922X (G12B/W400) SoC. Patches are based on the
> u-boot-amlogic-next branch in the custodians tree.
> 
> Christian Hewitt (5):
>   ARM: dts: import Beelink GT-King/Pro DTs from Linux 5.10
>   boards: amlogic: add Beelink S922X board family support
>   boards: amlogic: add Beelink GT-King defconfig
>   boards: amlogic: add Beelink GT-King Pro defconfig
>   boards: amlogic: update documentation for Beelink GT-King/Pro
> 
>  arch/arm/dts/Makefile                       |   2 +
>  arch/arm/dts/meson-g12b-gtking-pro.dts      | 125 ++++++
>  arch/arm/dts/meson-g12b-gtking.dts          | 145 +++++++
>  arch/arm/dts/meson-g12b-w400.dtsi           | 425 ++++++++++++++++++++
>  board/amlogic/beelink-s922x/MAINTAINERS     |   9 +
>  board/amlogic/beelink-s922x/Makefile        |   6 +
>  board/amlogic/beelink-s922x/beelink-s922x.c |  54 +++
>  configs/beelink-gtking_defconfig            |  71 ++++
>  configs/beelink-gtkingpro_defconfig         |  71 ++++
>  doc/board/amlogic/beelink-gtking.rst        | 115 ++++++
>  doc/board/amlogic/beelink-gtkingpro.rst     | 116 ++++++
>  doc/board/amlogic/index.rst                 |   4 +-
>  12 files changed, 1142 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/meson-g12b-gtking-pro.dts
>  create mode 100644 arch/arm/dts/meson-g12b-gtking.dts
>  create mode 100644 arch/arm/dts/meson-g12b-w400.dtsi
>  create mode 100644 board/amlogic/beelink-s922x/MAINTAINERS
>  create mode 100644 board/amlogic/beelink-s922x/Makefile
>  create mode 100644 board/amlogic/beelink-s922x/beelink-s922x.c
>  create mode 100644 configs/beelink-gtking_defconfig
>  create mode 100644 configs/beelink-gtkingpro_defconfig
>  create mode 100644 doc/board/amlogic/beelink-gtking.rst
>  create mode 100644 doc/board/amlogic/beelink-gtkingpro.rst
> 

Applying to u-boot-amlogic-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
