Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904AC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:16:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077AA23432
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077AA23432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2lYu7+AXXQc/T9XdnUxje60ymQlA2MC64lClr3hmkAM=; b=GFTJT7+HBeZIas6BKra5dj+Mv
	ai78grLSLlSZAR6SJjjfYIYGDfPJdb19VXnpmTIZ96DTYTrE0UthNQBkmYsBW5hrFI1X7lZBpt8g9
	UL7CnTVE+45fvaY59vYPUKAUlvEhoWwmp8bhNDf0K+TWmJQGNrl29jyVplEvZQfbQpkhzfrOw+Z+P
	+fKmXKzgNHoz8S2YyJ9imOC3ZtP6MO7Vgu9IEC7L8jo2rjX1T9DsRUyezI0YnxUexqOUdiNngRERp
	xWkJW42vdKzqvEBroIaOrKQvETlSlYnHvcUyvixXH9RrV95RYVqBLHfQghSdqnYJ3Wy4l2AdiE9g7
	P6LAD7mOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLzR-0007i7-Un; Mon, 07 Dec 2020 19:16:05 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLz4-0007b0-FV
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 19:15:43 +0000
Received: by mail-pg1-x544.google.com with SMTP id n7so9745889pgg.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 11:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LnJzU6WP+ovepSLXSSQvICT4T9pkTHcxFgl83M2eeOM=;
 b=WDZfW2GGW+OwwLdd1mDkLVpMquOO8r743tRXy7ZZx/quMtJTLjP1xxInmvFCGkdkdg
 CEVoivd1pwV7Td0TdrK3UceODWN1H7f8coh6Awe7qEIUMfUoDdl17IYqUomTr6EzN4t8
 iwghmAA1EfXEsoQhUbf8ttWm5oLb752zdBua8CJrdvxtmrvJbV9erktjUXVpqveb7f0x
 QQjW/AfZ3WGeztUfUxFEvlnCbuRORF7KKcbYUbSg6uUo37BTa3k7tlrAVhszVv3KN7FB
 MbEpsmF3aQdJXXe2Ljd8/F8TGzg+/5PhT2P6bFGxvIorFNCaXRMH+Ds8XqFCgVzHAQ+v
 gCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LnJzU6WP+ovepSLXSSQvICT4T9pkTHcxFgl83M2eeOM=;
 b=RDS8tW7lORoEgYyJTmSJ5L7kUC6oSKBaJFjbOp51r+N46O2KseU1MhCmY1d++23zxT
 CzDqwYpHDV2tXtccvQYnxs5LuYg3tX8Edxs++vF2LK2pS4ZYIijZ3tiDuHK+n0+APz9T
 seb88pmEQZ3kneSMxpR+/rjIVZbTp5EmPnDpTeffdVlovl0EmgHf5HrpoV355vB4pZQX
 RVrpipCvX/GU+T38YEAj356Ai0UHKO5odiR6cq2h2PvDzbV17qNCMTycC+8Oz5Jbc7KY
 +nfQqGaUAftyHOIJTqAT/AGkCxiUiOs6SurOgBb4XGhUr1HsnS4xp5meQZHWaIlOeGEC
 vNPw==
X-Gm-Message-State: AOAM530TJX56z190YzSuHDKbfwdyMhxlZ3bYmzz0TfJrC8CLYgPi/Sb8
 8SgiHoMUmjIfJgzOly4caubiNA==
X-Google-Smtp-Source: ABdhPJzcpr2y042rE0RmoiIswrfb+gUUuUmyMfvbFPBdRSUxNrwCtJfF9J7y0zFe46jVLKJc7R+LZg==
X-Received: by 2002:a17:90a:6287:: with SMTP id d7mr303715pjj.80.1607368539904; 
 Mon, 07 Dec 2020 11:15:39 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k21sm14429457pfu.77.2020.12.07.11.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:15:39 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v3 1/5] arm64: dts: meson: g12b: odroid-n2: fix PHY
 deassert timing requirements
Date: Mon,  7 Dec 2020 11:15:34 -0800
Message-Id: <160736852894.39684.3406899524817191739.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <df3f5c4fc6e43c55429fd3662a636036a21eed49.1607363522.git.stefan@agner.ch>
References: <df3f5c4fc6e43c55429fd3662a636036a21eed49.1607363522.git.stefan@agner.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_141542_575877_3E70BC3B 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, jian.hu@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 7 Dec 2020 18:57:59 +0100, Stefan Agner wrote:
> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
> 72ms "for internal circuits settling time" before accessing the PHY
> registers. This fixes an issue where the Ethernet link doesn't come up
> when using ip link set down/up:
>   [   29.360965] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>   [   34.569012] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>   [   34.676732] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>   [   34.678874] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>   [   34.687850] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed

Applied, thanks!

[1/5] arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements
      commit: 1c7412530d5d0e0a0b27f1642f5c13c8b9f36f05
[2/5] arm64: dts: meson: fix PHY deassert timing requirements
      commit: c183c406c4321002fe85b345b51bc1a3a04b6d33
[3/5] ARM: dts: meson: fix PHY deassert timing requirements
      commit: 656ab1bdcd2b755dc161a9774201100d5bf74b8d
[4/5] arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirements
      commit: 3d07c3b3a886fefd583c1b485b5e4e3c4e2da493
[5/5] arm64: dts: meson: g12b: w400: fix PHY deassert timing requirements
      commit: 9e454e37dc7c0ee9e108d70b983e7a71332aedff

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
