Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB00C54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=95xc5Y6myouCa1fNW+BtQDXf4ByjJttR3cbQX/KcXm4=; b=ylVjXF42LkeL0p
	2zaJTznjpvOqRRdOxqn928Na0YsxV1/mwvL40aiQQMDr1N+px8lPX5jTreW3XXnGFLZTAFMMt5yAW
	TCJW+Seg/y8WUmEVAoZdgVY5xPekCF5cbL0ZG/1hBB0goSBdJ9CF9IebSzwxChGIEevGTAkBbKWhq
	gI9pvhRsQz0iEkUxVm/jqxWdqzCSyrK2TqZYRS1+2OrlOqGRfzihaHQQzrJB2Cv0yyM+NimunFxRj
	GzcgTY4119SnD0QDqOzd773MozE4gKAg8l1fa511Se+PV/RzPu7Pc4xCAVE/WraRDqYT9/T5pWCa/
	ZomrPUuxv75cehsWF24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPrR-002haO-Vy; Mon, 30 Jan 2023 08:49:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPpY-002hD4-9K
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 08:48:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so10405607pjb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 00:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lwvRDbnAenGl8y3f3+t7/ntRThwRmVB/T/xzZxOUyeU=;
        b=LVo4XBypNzo7dqzFqknGeu3VLSF3JpDkrXTb0fnPQVLbYd+ldt8JbhddFtnbik9K1M
         ee08p5qZyXIuAzkkMPbBFEUGuuX575Ab60t0xymux/N1Exihj6KNOke3ljdnZxiNqbPt
         FvWewLv6I0YIEPrjLwryqFEGsAuMiQ2eHAbs25KPRk/7ibW+ZkPGF8Q49u94DXcr9c1Q
         mRAWypjiD37ScKA6Kj888qmC58CtWG9AJqH80iISi0y+FZk/tVN59VRJ6bsmNTllry0L
         nyeO0GSrauZ+/Z/CRc/14l5f3Glj0RaxglsxN9QnUNtMnQYRFgNJwky+8YczeXoZpK4p
         swSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwvRDbnAenGl8y3f3+t7/ntRThwRmVB/T/xzZxOUyeU=;
        b=HQNIT492QSpw83x8tbBrMSncCONQroQes8TBYvwE9v50EJu6/rEkuGWEcmjmHOezbL
         SqQ6PQBCJMds//mJXr7drPq5YB8okYKzPWJ1Fbo8XosRNrban3rtUGJLI14XT1kygSMn
         3vgBkZxPXYsaTb8Kj9te31bQS+nXdFVoKfWrf0gvRPHc8q2A3qm/zD6P7piuQD8/4Wx3
         qNX/OvTa5mQUFbjNBaFCrJlkmBpPcYnY+Hugd7e2FyvvU/VZw5q9cQf6f/yIxUxRFQRQ
         C+zLk2tBc7pz8aqTLUuEcSwbHU8qLXaOrzsCe4PHlDyrPojqI6seTq6MLxtydZUel4CF
         oIgg==
X-Gm-Message-State: AO0yUKXKMmOdZtlyYA/d+mjd2rPQiq4XBlMmxqhw1wW1cBP6vUuZWe0o
	NIClcdaygfl85aY6Lfaxz6eWV8kCefk=
X-Google-Smtp-Source: AK7set9Ra02V7G4diCymOQEgwutGQW7xU3l5WlH7jhq7707SLhDn1mJVU7HwIG1s+SmRMi7l++WyMw==
X-Received: by 2002:a17:902:db03:b0:196:11b1:101d with SMTP id m3-20020a170902db0300b0019611b1101dmr26766001plx.28.1675068477189;
        Mon, 30 Jan 2023 00:47:57 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b00192d9258512sm7205284plb.154.2023.01.30.00.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:47:56 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: linux-amlogic@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH linux-next v5 0/4] Used onboard HUB to reset and add power to hub
Date: Mon, 30 Jan 2023 08:47:39 +0000
Message-Id: <20230130084744.2539-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_004800_348565_9A6248A5 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Amlogic board use gpio-hog to reset the USB hub.
so using onboard hub we could reset the USB hub and
also enable power to the USB hub.

v5: rebased on linux-next 
    Fix the $subject and review by Krzysztof 

v4: rebased on linux-next
    Fixed some small changes like the subject.
    Dropped the merge patches.

[3] https://lore.kernel.org/all/20230125143404.1424-5-linux.amoon@gmail.com

v3: Fix some small changes in $subject
    address the input from Neil
    fix the vialab device tree binding as per Krzysztof inputs.

[2] https://lore.kernel.org/all/20230121175639.12818-2-linux.amoon@gmail.com

v2: Odroid C1 / C2 : usb hub reset working as expected.
    Odroid N2 : dropped usb hub changes, since my board USB hub
                is hitting regression.
    Odroid C4 : Fix the device tree binding and used peer-hub for
                usb2.0 and usb3.0 hub.
[1] https://lore.kernel.org/all/20230118044418.875-10-linux.amoon@gmail.com

v1: Odroid C1 / C2 : were not working as expected.
    Odroid N2 : used single USB 3.0 hub reset.
    Odroid C4 : used single USB 3.0 hub reset.

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=707292

Any inputs for these changes ?

Thanks
-Anand

Anand Moon (4):
  ARM: dts: amlogic: Drop superfluous dr_mode in usb node on odroid C1
  arm64: dts: amlogic: Drop superfluous dr_mode in usb node on odroid c2
  arm64: dts: meson: move usb-hub node under dwc3 node on Odroid C4
  dt-bindings: usb: vialab,vl817: Cleanup compatible, reset-gpios and
    required

 .../devicetree/bindings/usb/vialab,vl817.yaml | 18 ++++----
 arch/arm/boot/dts/meson8b-odroidc1.dts        |  1 -
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  1 -
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 41 +++++++++----------
 4 files changed, 30 insertions(+), 31 deletions(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
