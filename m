Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABC5C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:44:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F112083E
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F112083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ICwu5gBOKBd24Akns2SSqjHuzb8m6Jmgq72wrg18Iw=; b=IgBLkbS6I5edEg3Olwhd7E12T
	fEAEkVHRW8/mPo36Qq7BBWkmk7xtr8VfL0zct4nDEEWOLHs0wo2nKfmIOxkgmvvPegpJGJdNRaz9e
	6w2Nz2ecfDNQmQWA0WivAVSRJMllJv2JCYPFnPruLNYQNEUSBNa3VXtJmjcbkkvjtHCWXAHAV99kS
	Fm1lsmNstzZx4xvUux7CBIH21rCE/ttVRncsdBgRdBGP79eNlXU1pkWkiytg9EdMrFsMYuYHui4ge
	9QeT2YQDnsiyEy8R4IkepNxDtttgGbHdoC80KNCdVvokYT4GG/etmKts8HDyoHmYpfZ6J1gd2529I
	tpuIaaYPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46qI-0000JZ-Ad; Mon, 25 Jan 2021 18:44:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46op-0008Dk-C8
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:42:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q2so5445746plk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6IMD/3EVFRPzNGhInOTTOaIXZ53SaZfmjF6b6Hf1LXE=;
 b=BL8vFuEA6G4xwdr7XrCZ0Mbo/nqiLG12UjmWJ5pD1kb86Eqs4hCm4uIh43zEePWUdv
 ONd6PYpu6LLqAE3NmmR1/LcmIZ4pqTH3Xu0DNlgmML8312cVwtFkyRBNwxToU4k9BS34
 /sekyOn5vQsreOYBl4VkBMv8UDefxWMhSCKOqu3+XJGZVQkeSgeJ6MEs7nsGaNr9oYYn
 X/SX9OH9xxtRdCgwP+SBw/rIc4gLGOqpTajNS1sFV3+FDKC0fq3KrzlRLHeLR6n5v61q
 9oZ/Ss4ei8J0dXtHH+GeSVKubt+8jZzO3DBpxqWk+TXy0RRu+OSvB5pUx3S4ptSAH++/
 juJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6IMD/3EVFRPzNGhInOTTOaIXZ53SaZfmjF6b6Hf1LXE=;
 b=mLH37XoKo23QvoJG7t/elInD8kCExHMLdczoSOYYSfiA1LsTlg4SbSTCZig4HSf3QI
 SyZEyOM0UnJdfECMVsk1g7dbvBMFXuGIjPfkh5tksQK5g9cPvUKmEOV3s9njic0hbc1U
 JHddJx7SoXgTpgeS4akKoygYpvKOu9IVxAuPMnpzH4HQ0jjSQzoG06pEBlBiR6H9+VTO
 h5P6/8QwdQK+DlsvNQc1bIfsbRgCBnxMLTd3ybJPx891G+rYPg5gudDy6PRSxsFDXfti
 f68P5AlgoGxVnbN72/ccqazPsMKi6VL3HHOAS0obE3fG1qhoFMpCtyXtIHcvyLRfy0C4
 r1Fw==
X-Gm-Message-State: AOAM531sgDEyXVWnpTRmatzbZi3Y9lkI0paxdnsKLQAi8000xufi0bcw
 GhFgqSF1okck2NmAvFZBfeRxhA==
X-Google-Smtp-Source: ABdhPJxa5POpl2b9HYAmn/t6jBq7D+W3jCbNSCQXWjXy0Brrr4rxHf2vQGFz9zpTslQzUgtrJSP3BA==
X-Received: by 2002:a17:902:e84b:b029:de:7c27:c90b with SMTP id
 t11-20020a170902e84bb02900de7c27c90bmr2073904plg.38.1611600148931; 
 Mon, 25 Jan 2021 10:42:28 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b206sm16779194pfb.73.2021.01.25.10.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:42:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson: switch TFLASH_VDD_EN pin to open
 drain on Odroid-C4
Date: Mon, 25 Jan 2021 10:42:22 -0800
Message-Id: <161160013614.17631.18041536575978094036.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122055218.27241-1-m.szyprowski@samsung.com>
References: <CGME20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180@eucas1p1.samsung.com>
 <20210122055218.27241-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134231_530893_907945E0 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dongjin Kim <tobetter@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 22 Jan 2021 06:52:18 +0100, Marek Szyprowski wrote:
> For the proper reboot Odroid-C4 board requires to switch TFLASH_VDD_EN
> pin to the high impedance mode, otherwise the board is stuck in the
> middle of loading early stages of the bootloader from SD card.
> 
> This can be achieved by using the OPEN_DRAIN flag instead of the
> ACTIVE_HIGH, what will leave the pin in input mode to achieve high state
> (pin has the pull-up) and solve the issue.

Applied, thanks!

[1/1] arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4
      commit: c649d91a8ec4dda78bcbd3890156bffb4df2fa16

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
