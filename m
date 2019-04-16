Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668D6C282DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E08C20449
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXApjG/X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pP2+6HU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E08C20449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FQUWe1DdJkR7v6rVprpMxakK6iKEBxalp+n0bRdiDA=; b=CXApjG/X+61kVM
	CsHZbXTLotGzDTVRMIYqxTgri7zfJAaclNbl4jMcN0YAPUNkFzUk7LajZscqgVfKUj9b+/Yj6tYJl
	zfCdzojk45KxRmqxCklc3bhrE+gqldOEX74wvz4cwYKMWJplCZevxVHhSW7pZSJgxTq1P7/yeIFrH
	Im6bcteb9Oh4XeBwmELURNqCuj2ER270s5XjHZqKaVb4RWrWEpFgfyB7xbxnfIic2NSFmNrhD6JZH
	PRo2b7Uw/NJdmMT0c+GcmDpn2el1GDnf3wbN/Fx8hOgvubTGISuCZlySEydnfRKH9KC4AzRi0yBOn
	37sPIKI3gediyJQYKAzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGSxx-0003EU-S5; Tue, 16 Apr 2019 18:37:57 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGSxu-0003Dr-RV
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 18:37:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id g12so10735572pll.11
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9cVQFHR8mlhd2qAgp1/A+upDixV+gKw7JndWUFbqxEA=;
 b=pP2+6HU9yIXMEk8QoT0BdgDUKalqsOuuADRceQ4juogT1XbHniL/i9C2j7WU2tO08s
 Tcb+qh27oquq5DgxW14+z00yY/QpCwudFJvoN6PlB1qqFsheHGyvTVwoxvmYJNjiJybd
 LEqQQodI76thGtGQY1T5pTAXooP5PyYERSquBz8VdEC2pSZMrStn97LSeC8mAnEa8ewa
 8gjg+Kf78KFszRSs0kFgkWXB5rEOMpaxH8ez9RjLhR0hjwHzTAm+uWlvzd7T3iK+AqOF
 DpUgfhFTLLyypUh8Vdd9JQhrD53KTIxsPklTx0fheKpbyd3G9VAMWwCGQAIN6Qq8+ZfS
 UXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9cVQFHR8mlhd2qAgp1/A+upDixV+gKw7JndWUFbqxEA=;
 b=daJ34fDiRBvDO+DOfufa9zob/XMG6HS9PrJjxmILbcfVAeP79YyaYW1u4FA3TbDtAS
 9HEGfWCAn4ZLlqExFCTC7tDehOx9qWCG6fpkhOZSbj5VFokjFsMMAqAmnlXwtFN0pT2B
 lgUnpShG9e2GOpfzgPOPJcDXcBGtkEGcOqTQz2+4DXsO4cCFezz3ENJam9eAaSJD8HoE
 ICQKpi5Mj+T9EJTg5JjNVV1nUhSUHR+nZXDd1VLBTdC07DvY1JKwuORaMixYjh+cW0YM
 Q91nm+dcb7tq+lt9vRdNh4ZHGivTXgYBgwqKd9X8pkkSqnCFxZ61fQKVgLDM42qICDyl
 KEXA==
X-Gm-Message-State: APjAAAXXyp8rO1+dSVVpJO+78zYKoh11arZCe9oQqEn5aFz1wKHayzIl
 O0Wj+VkhjYKz8muFhDvMhna/6w==
X-Google-Smtp-Source: APXvYqysvmcrxZ6m5GUlNH0uC5OfmhpVn5pkDQoLrADroBTlhKYdwoIdijD5VMD3rBzLe65bUnZvFw==
X-Received: by 2002:a17:902:a5ca:: with SMTP id
 t10mr81142767plq.234.1555439874080; 
 Tue, 16 Apr 2019 11:37:54 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id
 v20sm77778521pfn.116.2019.04.16.11.37.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Apr 2019 11:37:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [PATCH 0/6] arm64: Add initial support for Odroid-N2
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
Date: Tue, 16 Apr 2019 11:37:52 -0700
Message-ID: <7hd0llpzi7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_113754_911003_DB7D9690 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset adds basic support for :
> - Amlogic G12B, which is very similar to G12A
> - The HardKernel Odroid-N2 based on the S922X SoC
>
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture, but with these differences :
> - The first CPU cluster only has 2xCortex-A53 instead of 4
> - G12B has a second cluster of 4xCortex-A73
> - Both cluster can achieve 2GHz instead of 1,8GHz for G12A
> - CPU Clock architecture is difference, thus needing a different
>   compatible to handle this slight difference
> - Supports a MIPI CSI input
> - Embeds a Mali-G52 instead of a Mali-G31, but integration is the same
>
> Actual support is done in the same way as for the GXM support, including
> the G12A dtsi and redefining the CPU clusters.
> Unlike GXM, the first cluster is different, thus needing to remove
> the last 2 cpu nodes of the first cluster.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
>
> Dependencies :
> - Patch 1, 3, 4, 5 : None
> - Patch 2 : Depends on the v5.2 meson-clk PULL request
> - Patch 6 depends on the G12A Display DT patchset at [2]

These deps are merged/queued.

I'm assuming you'll take patches 1-3 via clk-meson.  After you have a
stable tag there, i can take the 4-6 via my tree.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
