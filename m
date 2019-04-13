Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9670FC10F14
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:15:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA16214D8
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VR11+SHO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bIpUOE8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA16214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ny7x9ecZ7icazoA+BKvTDo2bwEDgmhb9T1lwJpHQYzs=; b=VR11+SHOQz6Sk5
	yj2hHnjVYJrIFzD0jCvxRipXVVKE/PY8ijYuE4gQhIV+Nddk9Zo2iV1C6kiXrXn4uikrDQmdhIEHi
	JWXvzGQ+P7xfH6kXmBpgM2FoZ76Mvo+YmIMScCnNBIFwQT86m/jfVX0eiaX9FgsOW25Uypi1dOZe4
	nr/H6hq46xaGJ4pFX4g6EljTDqoOYELMSJwUOZq1Ux+tzrvEN4eErHhqHzeJ7/0gcXpuA4DMRh5o7
	E2ch8gCeBovm0LiBXz1vn0ck2CtKV0lRouN+yB0Er0Wzte59Bke6UwgkKU1SEDDWCVtUWmPHbqtwA
	duJTT3ZorTd2HmfF3zGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFMFq-0008SB-Ak; Sat, 13 Apr 2019 17:15:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFMFn-0008R7-Mu; Sat, 13 Apr 2019 17:15:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id y7so15987719wrn.11;
 Sat, 13 Apr 2019 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZ3paJ4iaXOzR0Hh0oek905P7Hhbe2Wppg/n8TWnHTU=;
 b=bIpUOE8jEzfxn96g3+L1cxFhVg5eOBg6wm3FOY1b4ni8R4YIqZAXDQ4ViGxB2s13vn
 oaRJorQjEvbqQcyt0vDtc11KV7eQOhUvrm1FxYbP+LAeRv2mybvLaDNi71/UfbDTq9NX
 1qwg/yByJLwZc1WCL+zpVKfWmrHw9X8w5gGdL5Riikk6nwdbxQWCQuWAxpAddDk4Ujm3
 xnDDFPtw+oCdnQdbOF+YxfpWsZsAgwPQvHAgAQgdgSc/ckC2ZrzAGI0fz42HIBMwL5Os
 8Ne4gEchcHb94vIrZVucFlw17V3FhfzSkjhSPVN89bLExBQ2QFhSfP4PnfxUfdnWjbAb
 aCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZ3paJ4iaXOzR0Hh0oek905P7Hhbe2Wppg/n8TWnHTU=;
 b=GCMXMuIgFpepUEiFw/NQ2VG6/Kgwju6kHto6+sT+xUO2Mm36fiou1LE/8zvFd9lixT
 zKhgzPnHwk+2w1kyIAyVXdKwO4tIXj5oZisWDTSW2oga1KkNiqv3Toi2CWz0jpTv5gnt
 yP5VsB/m5EomYDTfg07Sdjc4VaTnPo7+BynfBs44sa0pzVF/3NNNDXL8hSxN3pFsRYKW
 NPumQ1k2vpwXPtOmUETneIpARryxx2Yuv6ir0K4l8tQgQJ8hkuwXd8XvbA0ixb942Ve+
 tJ4oQU6MFvWi3YSBMhW+OHM+h/leZlJCsQbqtXbaVWl3USSKiipNIEj4lS3xD24tWMm7
 Ehnw==
X-Gm-Message-State: APjAAAUCcgfxSUKGGG+y9E81uhSS34AC6AuBXA5p73fi6Ln+pHgaFj87
 gh4swHTBHn2+xiH31J3qwYBjbZ9U
X-Google-Smtp-Source: APXvYqyLPrN8SL0qAjae7+xkaQ+fhy/5hHAS1Hp4VgGprS/2qeUOPbPT5Kvl71xDIZa0Fsg6V2ynJg==
X-Received: by 2002:adf:e443:: with SMTP id t3mr13640311wrm.257.1555175745527; 
 Sat, 13 Apr 2019 10:15:45 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0010B8127C043607D1.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:10b8:127c:436:7d1])
 by smtp.googlemail.com with ESMTPSA id h84sm16745965wmf.15.2019.04.13.10.15.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 10:15:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] 32-bit Meson: add the canvas module
Date: Sat, 13 Apr 2019 19:15:29 +0200
Message-Id: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_101547_757783_39709EB7 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: mjourdan@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
IP is used by the video decoder hardware as well as the VPU (video
output) hardware.

Neither the VPU nor the video decoder driver support the 32-bit SoCs
yet. However, we can still add the canvas module to have it available
once these drivers gain support for the older SoCs.

I have tested this on my Meson8m2 board by hacking the VPU driver to
not re-initialize the VPU (and to use the configuration set by u-boot).
With that hack I could get some image out of the CVBS connector. No
changes to the canvas driver were required.

Due to lack of hardware I could not test Meson8, but I'm following (as
always) what the Amlogic 3.10 vendor kernel uses.
Meson8b is also not tested because u-boot of my EC-100 doesn't have
video output enabled (so I couldn't use the same hack I used on my
Meson8m2 board).

This series meant to be applied on top of "Meson8b: add support for the
RTC on EC-100 and Odroid-C1" from [0]


[0] https://patchwork.kernel.org/cover/10899509/


Martin Blumenstingl (3):
  ARM: dts: meson8: add the canvas module
  ARM: dts: meson8m2: update the offset of the canvas module
  ARM: dts: meson8b: add the canvas module

 arch/arm/boot/dts/meson8.dtsi   | 21 +++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi | 10 ++++++++++
 3 files changed, 52 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
