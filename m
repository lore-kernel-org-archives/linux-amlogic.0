Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540FAC433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:17:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B5F20656
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ik2W4mMK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sEILnmsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B5F20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZoUEo5YjsuDNiMZmfrXxJ+CEUlnRl6nPJ9vDyTeceOo=; b=ik2W4mMKHr3OiQMUpNlpEV5Jo
	YJaLo4wr7iFrQ6XkUiByEYCi7lorN+3HvzjwKexBffx15is7/w6L2qUaQEse/BPMct190bpWuWDQJ
	p2t5sZmw5vOYgHCJiX7piMJT8DxSmXtSSNSwZDGBN9rKh1AwKobGE/5ZowfcU7ax1Kc0vBnVCWY39
	i3RyvSJNFTQue8CH7cv4en6yAE9c47T1Pju32xHCYMhBAy7fEo3mvmTP6nvCPN7LsRhTNAc2OoAQJ
	ESrOETT8knWVb+/gQfsoqapLacnM80EDrtYbAoUeNZlee/6zL7+D5zq45TA/4WVIZ/lW3RKf9nTkM
	1cYEcKGVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAJq0-0004e2-FO; Mon, 24 Aug 2020 21:17:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAJpo-0004Yu-48
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 21:16:57 +0000
Received: by mail-pj1-x1044.google.com with SMTP id q1so99203pjd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQ557hoZ2m6wPs+B8z3gsPGHazVrjeepyEdR7xdhh1I=;
 b=sEILnmsVGJYQIQ1kZjL/bfYE6J3X18O5MGpTQhrCsvBCO/eh5FRRNd4X5eJm+hUi3d
 hcG4S+Xz+aHuZoTy2u5/rhdpujpa0JYImftVXFwVt3/JCxIWbNeUtg9Z73MK+aiNSqoU
 eFb2n1qsRJXSm83KAHCqerzbmJ4cuBdkDMJnLyNUM0Ju2eps4dVXlM8HR3LTkRXcI3DH
 y9HFTwLJpOKM87CFndS57VCIO6dI0NOSWSwRtpgTqn8b9wbo7ZOtq7jetjazIMwy/KGE
 1VOrLqQJ8KjBEIeS5Q24VWoFUwIljijZh66GL+a+Yac2YeUR+hQOMYKsTCbp4ZMW+IGQ
 ef0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQ557hoZ2m6wPs+B8z3gsPGHazVrjeepyEdR7xdhh1I=;
 b=q1IiVrg1UsS8Zlf06DGxLZQL6LCw9V0JQcqWCUAIoa1XVZPVMze5vMX5l/X8sYdxQ9
 DXeDKpn2XBi5n06aT5d9D3kxIXIsiCYCT4UIU3jY2dVZoN6v3c47CKSghVdpsfogndxQ
 rEFpieuKYmRHFJUPogy9pdJ66e4cwpHigef8fEjsEBBXwGxTADDfS2aJWpsc9XA7Fk3C
 +fCyJj+4LAS932JX8O35YjO3FXBMEvVtajwFbk54sKYRO24keQiwczdf3wu56/ahVzaf
 hg5BrgYHdajkMKASLb73aJBWPq82c4slpUPKUafYna39nATM8bTWKTku2kbjaB+9tUqA
 3p5A==
X-Gm-Message-State: AOAM531PYSj5ITAGLnS9inP8D6rY8fjx3wvDVUiWRg8WEa4IHxRca4+8
 6YJnGiU6uWdarCFoRXTDFxblWYFaeqpg9uX1
X-Google-Smtp-Source: ABdhPJxWXFWTTayf1UP+I8dQBt7qackDj95OuguDZWI865z8URWvIVg736s7YibH3MRh/uNbiHVDcQ==
X-Received: by 2002:a17:90a:6301:: with SMTP id e1mr889487pjj.5.1598303809377; 
 Mon, 24 Aug 2020 14:16:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o192sm13596290pfg.81.2020.08.24.14.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:16:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
Date: Mon, 24 Aug 2020 14:16:47 -0700
Message-Id: <159830380185.24712.3464811968459073992.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
References: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_171656_239779_B6C9D822 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 15 Aug 2020 20:19:57 +0200, Martin Blumenstingl wrote:
> The 3.10 vendor kernel defines the following GPU 20 interrupt lines:
>   #define INT_MALI_GP                 AM_IRQ(160)
>   #define INT_MALI_GP_MMU             AM_IRQ(161)
>   #define INT_MALI_PP                 AM_IRQ(162)
>   #define INT_MALI_PMU                AM_IRQ(163)
>   #define INT_MALI_PP0                AM_IRQ(164)
>   #define INT_MALI_PP0_MMU            AM_IRQ(165)
>   #define INT_MALI_PP1                AM_IRQ(166)
>   #define INT_MALI_PP1_MMU            AM_IRQ(167)
>   #define INT_MALI_PP2                AM_IRQ(168)
>   #define INT_MALI_PP2_MMU            AM_IRQ(169)
>   #define INT_MALI_PP3                AM_IRQ(170)
>   #define INT_MALI_PP3_MMU            AM_IRQ(171)
>   #define INT_MALI_PP4                AM_IRQ(172)
>   #define INT_MALI_PP4_MMU            AM_IRQ(173)
>   #define INT_MALI_PP5                AM_IRQ(174)
>   #define INT_MALI_PP5_MMU            AM_IRQ(175)
>   #define INT_MALI_PP6                AM_IRQ(176)
>   #define INT_MALI_PP6_MMU            AM_IRQ(177)
>   #define INT_MALI_PP7                AM_IRQ(178)
>   #define INT_MALI_PP7_MMU            AM_IRQ(179)
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: meson8: remove two invalid interrupt lines from the GPU node
      commit: b468412409c0e5752ad3396b147cac563ff8dd3b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
