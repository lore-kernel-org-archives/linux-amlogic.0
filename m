Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FCAC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8arQW3JBBiKPQb/hGBgfSREVoFA+Hvu6CjZhXDMQEg=; b=S1CUJ0w+VPMsrC
	vQtnHY9NlBTLinsM9NYhCc6tVpIgBG5Ky+dPX3ciwOMhDCB3XPR4sA4z5kcPavXBv0bUe5GeITCbL
	oapKnUk6uq5dwZHGyU/qf0s0Wk6Bkn5GC3hi7tdq6LO41I7Qc209Ld4+PIrESub9wiXfsWd5yaORB
	aKE6LoUjbgNLd74ek53OnYWt0dC/VzR0sbybE+bAaqFCnFiA7DyRE+ecq4OCpNsaB32N31xFqZKnF
	vKDffHmvNbT1X/0MbbjcpxmzbDePNPYl0hiqXZDf0ljQCaF/i9dLI54zLvGcAYui/3O4pUPP3uiZJ
	d4Pi34rKS92ShmBYYe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaAt-006EJ4-LZ; Wed, 25 Jan 2023 07:26:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaAn-006EHo-QC
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 07:26:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso1150188pjf.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 23:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRGU3Y0mw2H+4CP9C18Vwb5nAjyH4vOHqzjvCDnBh7s=;
        b=I35nSulw4YHNFnLHy1C0zRxN1kJJGjN9oXI6uH4eyGAHJXJU9+jHZn7Kp/5rwMRy5k
         jUwq5Tf/u9bpABKig1ur0jiKq+5Uum+vCz3trunp8EdhGrLOGjRExR1Jo2QQABsp7/VR
         Idbh5l3Thnw/vyOP3vE8OiDIutyf+38dXSRIlyHfxQY86QkZkXWV7juiVaWF7SdYDYzs
         xzToLQjSPWsRtZC5ds5pRfWHjYNW8dVZPh7IaIvUw74ysgilumE45zLh68iDoU5zdqOg
         ez5EyEEJyj+UiwRH+tHaQReZfbXHHNBYrqd/jzXqPCy86VTubdLfahA2SmdHhcBtSIZy
         R3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRGU3Y0mw2H+4CP9C18Vwb5nAjyH4vOHqzjvCDnBh7s=;
        b=3fBEFXQejc4mzwkAlu4hFoMQa2gTd4Y+A9speRgl0oFsb36AneJFAWtBWqwahAm3Mg
         pzBb7iSMkUxr4SB9S4X5uZAehJiOqZ9tKc0TMN1xwg8koL2lSBx0PmNEQSWERwzbZos/
         H37QoRwlgI9/Tv4NjN8tZS0RjP+q6bwlzr2iG4CfGK2eNjVsQAakNhkzwYikoVkKRFxl
         JJRBN0eUU7CvfgNpXXMiQEQj0A2L+DMWn7ZDHSRhVJRNd9E1jBRvVb3uDdT/GDYRJWJE
         UOVAESqXZIA5Vc+kSGoEd9ny+8XhuIoByhX3IpGiCeOr3O80yqRlP3Thvh08a8JmZ42Q
         MQ/A==
X-Gm-Message-State: AFqh2koZlc3QyPNAg9L6nMMiGuNkAsqDNUcfISEcUPmDAFxRJf1wWEPn
	Wlgs4GDqrMZj4O0reB48pkNeduezg+g=
X-Google-Smtp-Source: AMrXdXu+iE83vhoOAg9OjmHPIk1ugGFZY9KJnvwuvNbHIkxlX10zK7ninWPwIaOG0Z7QdmmgjLWdSg==
X-Received: by 2002:a17:902:e844:b0:194:d8e2:4337 with SMTP id t4-20020a170902e84400b00194d8e24337mr25777966plg.59.1674631577990;
        Tue, 24 Jan 2023 23:26:17 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001769e6d4fafsm2902500plf.57.2023.01.24.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:26:17 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND linux-next v4 0/4] Used onboard HUB to reset and add power to hub
Date: Wed, 25 Jan 2023 07:26:00 +0000
Message-Id: <20230125072605.1121-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_232621_878562_FB97130C 
X-CRM114-Status: GOOD (  11.32  )
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

v4: rebased on linux-next
    Fixed some small changes like the subject.
    Dropped the merge patches.

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
  dt-bindings: usb: Fix properties for VL817 hub controller

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
