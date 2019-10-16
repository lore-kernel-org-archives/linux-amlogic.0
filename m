Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA61FA3728
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DB820663
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zicqrwp3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ha6hDOJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DB820663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVIXn4OHM8rIDmyywFPIgAg237hLRIr6rFqWonswiP4=; b=Zicqrwp3OFNFYQ
	C1L2pL9Xmq5pIm093IoUqSNL2M0jvihNuPUMuOwf/YNMvU07EALh2PFxcyePc6IvuZXuGelBDtNBR
	14BB0z5oJTGflV+kN7ikv//UfTC/vPcFzn/NlrG3nTS/Xvd3XDmdp5EQqIFeJNUUmD+8nJU3M62bF
	dv5K4FZhQG83dujemkax7KjxG1DngGLiM1If64WL5VMef4u7v3e6XSoJwNDAr0d63T7mScdb83Ebz
	hRgJLNCW/HoBfkJyObolJSLKDLL8gCd/kWTbl22JlTqaY8PPbaKQpzsTW3IWpdHuU6JBS026MZBim
	HYFBcTQGbUDuwU9jZeQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKlyR-00047h-0S; Wed, 16 Oct 2019 16:16:31 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKlyN-00044H-Rt
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 16:16:29 +0000
Received: by mail-pl1-x644.google.com with SMTP id j11so11502035plk.3
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ResC/hhiygB40CQNO8g6ikuMbA0ju2V41a3xODY1vVE=;
 b=Ha6hDOJlpfX3oR0Lo71lCcmpwUHRfznUaoRUnv6VA0oW8DYo3V3iOQyLrQhSnQHMDH
 1ZqNiwjWcgmcyZNCR5vx+Haaa5wXkWQpq6vttdANH4PDcoef4Xkwm1JLMkYH177KuT9U
 aE0h4rllUx2sP597BRDIh2bm46Peqp4URVGQAF0COhIR3qBtfppzGOgxAypDH0WUJ9Bd
 u3jfndnQaIm/XpKsIRf/sfxd0Nq6lXDXR4k1bVCGe3GEm+2qA8S2Mo2JeuPHeSk8I8Q/
 XUMLkJAyfF6Cgy7WQ4R3zO49FexD4uBIReK0ZZeILFTcqg6NC6smoewkpTm81cIregw/
 3/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ResC/hhiygB40CQNO8g6ikuMbA0ju2V41a3xODY1vVE=;
 b=lVm0JesZjN3QoCvYoaT5zwhiulipgfXz3Iw3KYIijKnn673zSVb0xuj09fRICc2j6S
 NGgHddARQt97AtDV+fWjIB5AV32crDFQikepJO5NEQDADzAh6FFQyH0IrcvoHRMl3SrZ
 aGCNilp9sKDCof1DK7s20io/20MRHAQ4TqUC7pt7vqsOuzhRwaHBA1B0MfSTwhqOiXTa
 tv5uX7Lp9YkGZahNRKuNLQHe1kaQwqtouVzFpsvUc2/tcbla6pn2zC/kkDfTqfrnTr6u
 hmTefcWgJF5PrAmL1n9kW4y913LNwfDyzWSh5fu4kc0mZwr1NjIPH0hle2ExEAmTcd0F
 VxHQ==
X-Gm-Message-State: APjAAAW1qRBYOdBizEGCrvkLd3TqYQ4RrtRKrrmh5U+U33EYBIQwEM5k
 GExz6bfpndIWPWrpjXtviatHew==
X-Google-Smtp-Source: APXvYqzcmnTEOiuKSt7BT2tO2CZWNSW1Cst0QeV7AzXL8vZ26nPCMzLc9eVwAlMHXVXLysywqp/i0A==
X-Received: by 2002:a17:902:a5c3:: with SMTP id
 t3mr42557480plq.335.1571242585996; 
 Wed, 16 Oct 2019 09:16:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e10sm34459145pfh.77.2019.10.16.09.16.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Oct 2019 09:16:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: sm1: add audio support
In-Reply-To: <20191009082708.6337-1-jbrunet@baylibre.com>
References: <20191009082708.6337-1-jbrunet@baylibre.com>
Date: Wed, 16 Oct 2019 09:16:24 -0700
Message-ID: <7h7e54hdif.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_091627_902067_F95A843C 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds audio support on the sm1 SoC family and the
> sei610 platform

Queued for v5.5.

> Kevin, The patchset depends on:
>  - The ARB binding merged by Philipp [0]
>  - The audio clock controller bindings I just applied. A tag is
>    available for you here [1]

I've pulled both of those into v5.5/dt64 so that branch is buildable
standlone.

Thanks for details on the dependencies.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
