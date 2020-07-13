Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D484C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF2D20758
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCv18NNB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="05j+Bnjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF2D20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tFVjymvPhWeZ2ehcwnoK40tyz+6Pg/0IDeosnh0kzKo=; b=vCv18NNBO3Q6+vDOT9Ptjh0FO
	HY06LGnHEc1qrE6c2QRW1CYqx73m5DfdTocnVV7D4+E7tjbcHwHlt0HrLRku6zOy23vGWES7q2Ieq
	DF2A/H9mD5No8gNc0F96BrxZTRueQj39V0XKWrXGwUJSwCU0lr1tZ2SAptz/MMYsLcapVuP9rEQa4
	GWEqf65vHlM6KXepeOadzv+Iw7ePegX8ksPe2IX01sy1zuaPjCZ6tmkFIP9ymSfld6DBX5nHfQtuI
	VUuhuaii79HDjnBCWlD8rAn97jZfXQXUaXf0eEU5kDiJMZRc4b0qKBgU9coTR4YeUR7PpUn/tLiJz
	TfOZG0B5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3jm-0002tN-UN; Mon, 13 Jul 2020 19:03:38 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3jj-0002rI-Rg
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:03:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id i14so6406137pfu.13
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHxhQAK9LuDavbBz6xN+mD6z/1m9f7zdjELv2spH1pY=;
 b=05j+BnjlorcJPySlCT/ivZ5MViO89ApDtowq3wqQUo8El1N6cvn570cw125ycyN3kK
 5yJQIbQPS10yRu4LAFau/igdow96BuAsVDc/wZbjNeZnm/kZg4D87bNXyaNrHGLYZBPz
 AT98bVgUq2M60/W2D5wyUkj4A+OIsjd0hAlDHNf9I0b6mxmBppiahxTVyhCI6574WoiB
 1WnQ8TZWliQquHmGXSvIc8D4WeCQeovAzbCEqOYX+kyhPxVHtYmD9L/+jjSGrr70txh8
 xAD9DTup1vHxJhl7hC+OYsvtxX7ZVyQoqT70TdB23XeCVsHLmjN2dEZ+YvkvYB50ioKH
 DPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHxhQAK9LuDavbBz6xN+mD6z/1m9f7zdjELv2spH1pY=;
 b=a6uFToxhb/96e01tTRI6jDCGurVsM/NjHMYFdYob7Qws9siubNlW7l9eeYJkkYs4PP
 On9zR6LEoum9OrHi0PPW/c3bYPeRuXcs/gjNSiRoRNK1YaJHOxoiuwxqQitJA80sL7nw
 CDY2EkYEy9FgV0vxehDYDtsQFA3PH0S8sUzfLhweHRZCdmfxKbKE2dSeRYrqRr7wzCte
 fhQuzxa7kuyoXNAbKdr5sl8W8zPkVox4o+Ngm1WGgdn/owvY2O4NA6JdO6/WS/iJVNm4
 kyrKhJ/NF/Yk2XlriBwK5JxgHFh7pmJBqcpC3Do2kKntSY2wObrA9azk8ASuGRBozSDc
 YYwg==
X-Gm-Message-State: AOAM533aff3zzH8tlRBAo+PvvLlj/LPoPu9fPzlgzwhlfKNbV/zi8lYC
 r51xaCs8N5mtARMQg89d4y4vZeq4Ul61NA==
X-Google-Smtp-Source: ABdhPJwOT5rZ1S0GznDd+GMpG7ahpacIwFQXvwa4kPwp5tRxMqgDkXigFS7p16td6wzZcb4YnUbiCg==
X-Received: by 2002:a62:3582:: with SMTP id c124mr1144852pfa.288.1594667013653; 
 Mon, 13 Jul 2020 12:03:33 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k8sm16551380pfu.68.2020.07.13.12.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:03:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/3] ARM: dts: use the SDHC MMC controller for eMMC
Date: Mon, 13 Jul 2020 12:03:29 -0700
Message-Id: <159466696386.22745.6301055317421562776.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
References: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_150335_951331_6892E135 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 20 Jun 2020 18:36:51 +0200, Martin Blumenstingl wrote:
> Amlogic Meson6/8/8b/8m2 SoCs have two built-in MMC controllers:
> - SDIO (which is supported on mainline for a long time now but is
>   limited to ~40MHz bus frequency)
> - SDHC (which supports up to HS-200 modes at ~100MHz bus frequency but
>   for which we didn't have a driver)
> 
> Boards with NAND flash will now be able to use the SDIO controller for
> SDIO based wifi cards and the SDHC controller for the SD card slot.
> Boards with eMMC, SD card and SDIO wifi can only use two out of three
> MMC based devices for now until the MMC core and Meson SDIO driver gain
> support for multiple "mmc-slots" per controller.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: meson: add the SDHC MMC controller
      commit: 73106f75bf9498ff5d50f1052ad3cf03730d806d
[2/3] ARM: dts: meson8b: ec100: enable the SDHC controller
      commit: 73501b890a6f15460613878b463319d0e0cd1632
[3/3] ARM: dts: meson8b: odroidc1: enable the SDHC controller
      commit: d6a3873c7be6d58914ea5584dc7875f2045d6721

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
