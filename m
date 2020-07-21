Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE09C433E8
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E904020720
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIXvIalS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FBZxMoMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E904020720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5UdqEJXYgdt9Uzo6HXjTFJ3rXpZMfU2LoYiS9c3gOU=; b=AIXvIalSUlDNnOFAxU93+R9Rjk
	JvUtZCL4e3VcSdb2KTfVKFLAJZEZgApWtKz9epyRa9dEpCwvOhOi2Wyr5Fx06gZQ5TgAfS31O5159
	mWkMje8CdvMPAj1DpLZUF+zd2mexcjOqXjusWA2+jgm7a0/hBLFNLkVLD6C8/XMDQhWz7bgqbBXLj
	3UE59XtXr2VUvH3v/1Zgi+hgAye9KmkAbnGk9w73m+HsGVXy+cNPszK0KhiSdZbWiHLaLRr5VoPB/
	nXmloFDlcqiq37rsM08LTssWT5ZH8ii5uhON1XaXZoLDzj7Lf1jLFTCDyIFAMD+dAXondiLFccGUt
	DnQam4gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzbA-0002Ql-Uo; Tue, 21 Jul 2020 21:14:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzb8-0002Ow-Oz
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:14:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id m9so66329pfh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Uk6YJuT856BNR4iZImXQR7yVi4i1mDik67FAAf4cPZQ=;
 b=FBZxMoMsxylHjcUvAbhV6gmt7acj3lLOJeUs0rme23xuscRhD6htClpZIjUn8KUD9y
 rQnb9qIfFNIqnf6DuMVaigHowzFvaponsCjdWoZRaXsEYhqFSEU6CZmj4b5nj0Asua/Q
 J/PKIHwCeH6HyQauOGtDc0TAtt7ZHRN6I2KJ7bvrsiy98O1LmyQVnsaqV61SKlfD7Xgf
 MmqjBgglGJ4Cv5dJF/cPTjvviKjfzviRlLx+q2yprJQgm0u520iCHvxend/i4bu311Oz
 d5ZnFiNLg6SLyfXNhdHgIbm8VZQdscvTWj0zqsK5QKbuU8fJ22Z6mwET+015vmi0B4hL
 5IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uk6YJuT856BNR4iZImXQR7yVi4i1mDik67FAAf4cPZQ=;
 b=J4qaxQm+s4KRHZZKsWsf/+siyYn396TkSeVC8Y2lA+PWEBomE9MwCGWT474vBck8DP
 AUzIeDbFeD6x/7YW14kLXB6OgtFZ4HipIpmrnDFAB5BPxq6Ez1ljnzZlJIgvvZPUxhyZ
 c7nTB8MxnHNNHdW08MhDuFGvp+IN+vd0uZ4dV77PZPWMcyuKnMNzgyu9cDH53QC1brP7
 eoQE3yDSyEbUMUfkyirmLlsvizTyZ9ReDz2FxG95JO+NdIn1ZuKlV9lCB+MMJQiu7A12
 XWrWKMNTF1uiupIOjFH7nCOpVzxQsk6AOH+oJ7+REUbIdgW8ZqD3FugohZ/aB3WRCVgZ
 Ra6g==
X-Gm-Message-State: AOAM531EaP1QSEvYR/P4ekbEcxpqesyRsn+gKDi8LqlbuOJDevW3p+8R
 X+0LG+Prtg+wvywAAOM8mXI5VQZiNas3TQ==
X-Google-Smtp-Source: ABdhPJybylTdnd9qyJY0SEkfZfMZYm9qVAb/EXUZnxUlWpc4ybwM7APQ7Rfpu652uIRJWWkcFky5tg==
X-Received: by 2002:a63:457:: with SMTP id 84mr24534756pge.219.1595366088049; 
 Tue, 21 Jul 2020 14:14:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id gv16sm4208949pjb.5.2020.07.21.14.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 14:14:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: meson: add more SM1 soundcards
Date: Tue, 21 Jul 2020 14:14:43 -0700
Message-Id: <159536607960.30777.2402620386587255771.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200718072532.8427-1-christianshewitt@gmail.com>
References: <20200718072532.8427-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_171450_854425_589ECA1C 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 18 Jul 2020 07:25:30 +0000, Christian Hewitt wrote:
> This series adds basic support for LPCM audio over HDMI interfaces
> to the Khadas VIM3L (reusing the same config as the VIM3) and the
> HardKernel ODROID-C4 devices. I'm sure support can be extended to
> include other hardware but this gets the HDMI port working as a
> minimum capability. I have personally tested with both devices.
> 
> Christian Hewitt (2):
>   arm64: dts: meson: add audio playback to odroid-c4
>   arm64: dts: meson: add audio playback to khadas-vim3l
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: meson: add audio playback to odroid-c4
      commit: 725da67ce4d77540d4d6f7ecc3ac5a885a684716
[2/2] arm64: dts: meson: add audio playback to khadas-vim3l
      commit: b8b85d01be916a30c9863a5456c218d802e01d97

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
