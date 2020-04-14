Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70146C2BB85
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A3E2074D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cmPoZDQw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UUxL1PnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A3E2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4AC4NMpgHl42Ze5eapbx6AR8sLByt78YT7nQ3/R6nvE=; b=cmPoZDQw6QBDE3
	8L9wuMiv5bhef3/b89b1AM8+OcYszhmll+IA0mqROMkD7lqaxbxH+EeJMfxmO0elfO0W6UlzLD83N
	EyOtQEtgTbD84jcJO1qzCjZdLligYkkFeod4asAEW0Knkt/FuEtImhmtLyrDqkXY3FD2JIYNY+owj
	o7uaWFTK5al1WyXCqCWaMvxV1KYX2/fooAXN955BvVB+pluTziyfRVGooEyHhPYN45kr0dD0DUnfT
	KYmMJeEFT2SWy7pSwHla4AIm5y/lpvjqk5ojq23idF1ZFByGTcTk0bVMKcdAATBPjnW10DoVMkMF/
	lryhw9KR+FPCulP9n5PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORae-0006Xe-Eb; Tue, 14 Apr 2020 19:51:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORaZ-0006WC-Nl; Tue, 14 Apr 2020 19:51:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id i10so15940948wrv.10;
 Tue, 14 Apr 2020 12:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+N+iwx+s3b4ecaxzWwdiHxbedClo3dqSdoWLFQ6f1/U=;
 b=UUxL1PnKnUg8fIrCWtbyWVCvceOj6quFpI5/ZqIp5wWjHBQs2jj8vpenLiBMybtZMj
 eF9kGXUZn/M7fd8ZNyCtIQtIT5Z8fvBajTocjbk05VdH74TNqOKTbyek5eEC2qZK22yA
 EoXNTrjsZ/EeuJXkudxFEESAUBypRQ8CElySNf3Xu1ZtCao72FHYzsnewRgzCoolv7nd
 00a8xhEPPbDi3S0Pt3uyfHyxBizGsvzq1qJZteRoq9XQvErvnO+07byxwp65xHfuX4vK
 JuZYlUV/tubF5tUBLkSaUnWkCNht9HzMU0ycgoE1FPS9jPYFJUoGAT2bidaF+IJH/bdZ
 aGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+N+iwx+s3b4ecaxzWwdiHxbedClo3dqSdoWLFQ6f1/U=;
 b=fwVWoqXW4WsNctU2qt14CSiAG+EQijajCM+OT0U6zB+QT+R5jlngr9SuG+ZMBB822C
 LQSfxWHHKWq8/AUJAli/Q8UQdoTolzyjlJxnec4D1yokY9LCBmjvOQUynpy1neS8Uwdw
 jmea2tcectearaDxOWhq1nIgRDEtDMDmSb30QN7XD+oxeT1J8+6tfwZfXvZYFHlpvCFV
 nhPxmQQY8A0PfjoEMfOQDvk9gM/SOLVTZeJf02CJ+CFYQzLlArO0nGjq8U0NZkPM9LBY
 8ZXzaF+3EgWvDPI3orC4yHpfvCjGFJVC25mFVyTyzqBOFJZUgl5EZlolgc487qx8CqPb
 GpBg==
X-Gm-Message-State: AGi0PuYBJua3eX4yUDIuKysn5fxLV5rdssid1+suzukrAOigeO0n17/G
 uGJB8dJnNAt+lyKV3VNqra4=
X-Google-Smtp-Source: APiQypJYWEsJw+LuFClfHTnB3e9fwDUHMevyZXeHtabNPFK+dyJsx6HpmKnwmmfYDvv65aGRQFpHbg==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr11200017wrx.168.1586893876770; 
 Tue, 14 Apr 2020 12:51:16 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s14sm20886844wme.33.2020.04.14.12.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:51:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: meson: prepare GX and G12 for GPU DVFS
Date: Tue, 14 Apr 2020 21:50:29 +0200
Message-Id: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_125119_776527_703462F4 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This contains only the clock driver updates from my other series titled
"GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1" from [0]


Changes since v1 at [0]:
- update the patch descriptions to indicate that we explicitly don't
  want CLK_SET_RATE_PARENT on the muxes
- split into clock driver (this series) and .dts changes (future
  series, waiting for testing feedback on v1 from [0])


[0] https://patchwork.kernel.org/cover/11466399/


Martin Blumenstingl (2):
  clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
  clk: meson: g12a: Prepare the GPU clock tree to change at runtime

 drivers/clk/meson/g12a.c | 30 ++++++++++++++++++++++--------
 drivers/clk/meson/gxbb.c | 40 ++++++++++++++++++++++------------------
 2 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
