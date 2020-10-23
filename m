Return-Path: <SRS0=1A+6=D6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2519FC388F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2020 22:22:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C82F20BED
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2020 22:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ql3QDlNK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j+Quc/So"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C82F20BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8N0f2rlt25F6P/Qnb+0xrjoOdQEjQRI7bSmnKA2ZuEo=; b=Ql3QDlNKp62QdqeUL9wD+CYRL
	+6T9xaqFnIUb9yd90k8ThlbM/WKXMHMoHjp+rg0NDcPwdIs9Ja3eyFPVvgPNMHrcGj+fZoNN6erQA
	3YhuNXfBhr5RHbK3m9DfoAHaudADqxV5hPQp1u1suCVuToIgxb7ANuSkGmw4GY4Ot82f27O7n9uEU
	KRbLpuq3yNNt5uYyS2VrQ3AXxyESnfx6P+rpHtRyZLOb7Up/11ZC5RNtaxx/gwmJY2XKhDw1eadT8
	4NT9ZSnezCejou4W5qemonu4s3qkkjosvdKuYKTrW7SXW+2DpWBMvnyt8x0AOogf8/xSBVK+09jft
	WkmTmGQ2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW5SO-000667-SK; Fri, 23 Oct 2020 22:22:44 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW5SM-00065e-RF
 for linux-amlogic@lists.infradead.org; Fri, 23 Oct 2020 22:22:44 +0000
Received: by mail-pg1-x541.google.com with SMTP id t14so2457366pgg.1
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2020 15:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C1Ip8+osESeLsCFu90lfDedJ11QjKePQOjL1SbRil8Q=;
 b=j+Quc/So19JFyWFMmmyuYKqEQ6P+WbC4hfNC1Z/QcKB4zKS9jqmHa+ICJha6q5Di0j
 zGfFeNhd55GNNFsa3xuHpufBVaBzFDBy1bjRA46V4JBAwQZ5Jaovo4Rd/T9DVhSk+tPb
 UNKALP7pTXolLPGc2WX6lUZCyRb3g5++5a75p5/ZjaoSqDkIeLv0et7p0l8sXBIP+GEa
 7AgT+JcvgFrL2J5FHGEUKRBnSnLYBOTTcC41whPZcLQRxhBIB3vHzSYlta8U7xHrOlqe
 tt3tP5jZN8fuaFszMDjqVXUk+UrG8kNprpyLPkbeu4b9YtfunRMEsOkY1Q9gPCbYmDXM
 twdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1Ip8+osESeLsCFu90lfDedJ11QjKePQOjL1SbRil8Q=;
 b=Ri50ATLyuJBZX0h4e1cXgsG+RPJpPjjmGD1ywMRkr1FsklG+MJjIy0tiSmCtRgPZ0H
 ttR7+4NxX+72Vkiw9q7P5lvThyPFMhP1hcID/G3xMVCG3sMxUAnaOIQhf1023l7ynWlF
 qqQq83iV9DOSW8KE87p2BMmDP1Kq4ChrqTLN//4eW/eRtzcsPWU2pIQFc3chx2fvwE+p
 KFQOtRWryA792tR4aw6wLtjWrSNVRN88uRPRK06aeWHNHRc8OPDRJmAot2ygabdbZVK7
 MKgwOS55hdXyA/fNSBwNg5nI6sD5x7F3s8SMCRktbEj0P92MaoY1po5ONkOax/60DXX2
 LxGw==
X-Gm-Message-State: AOAM532RGkwRn07tT5rr6Pw/Uv3BBnqgdcYiJsvMLrgB8SwFfK6IqBDx
 vc2ed38boVu2mupkzjPltw31aA==
X-Google-Smtp-Source: ABdhPJxFJMZBEAO+yw5bAYSfWaAzwg+iomn89fo5s/GO4gTGSrQMkxnZh6co61LpC956+SMRRVMVXw==
X-Received: by 2002:a65:5606:: with SMTP id l6mr3881479pgs.49.1603491758132;
 Fri, 23 Oct 2020 15:22:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o78sm3068383pfd.105.2020.10.23.15.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 15:22:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm
Date: Fri, 23 Oct 2020 15:22:36 -0700
Message-Id: <160349175086.30235.13810218277836413722.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023094139.809379-1-jbrunet@baylibre.com>
References: <20201023094139.809379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_182242_904179_F0DDF1FE 
X-CRM114-Status: GOOD (  11.88  )
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
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 23 Oct 2020 11:41:39 +0200, Jerome Brunet wrote:
> On the odroid N2 plus, cpufreq is not available due to an error on the cpu
> regulators. vddcpu a and b get the same PWM. The one provided to vddcpu A
> is incorrect. Because vddcpu B PWM is busy the regulator cannot register:
> 
> > pwm-regulator regulator-vddcpu-b: Failed to get PWM: -16
> 
> Like on the odroid n2, use PWM A out of GPIOE_2 for vddcpu A to fix the
> problem

Applied, thanks!

[1/1] arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
