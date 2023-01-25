Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E1CC61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8arQW3JBBiKPQb/hGBgfSREVoFA+Hvu6CjZhXDMQEg=; b=hQEZsAsOhnOah2
	TQ7A4mlMouOJ7AgoId/INqN3AEP4Oa9/KosWqTiEAqWtnqcpA8JnujzSRaYGU86aMVnUU7MJ2cD8x
	voLG9SYhrMaw5o6Zt+uZd0PGVXV9plPfMQVo18SBev1vn3OiB+eS520FleQm+sJFjHZEUjZh8DyI8
	/tYcuEzU+sh/UHLSg98ZShqHx8WL8YZkp2OuxF9d0opOe7z2LL+L79b2+fVDNwC/3EudFJtoGg1yf
	dKShIbFfltdQkBfyjp7wAs0HQOyjDWnJl44EkEqYMxtj3cetri7v5dKatPcJHn0+QgeqHiX3rD9CN
	ildJpvc6OpRWhYy5zz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgqz-007Z1p-Qz; Wed, 25 Jan 2023 14:34:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgqw-007Z0l-UI
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:34:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id k13so18105347plg.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 06:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRGU3Y0mw2H+4CP9C18Vwb5nAjyH4vOHqzjvCDnBh7s=;
        b=nR/aKMcfWq2H7FTAmxRuIzKUexQwH9e1qvzJTyK8yJES/VrvqhN/JGeLgi0rvfwkyE
         /oqxRUohUo7HDJCjCuxUSgF7YWp7/tiefl4xZtjp0qpDE5IXRTenXL64lDWUlf8NpXVL
         MgRtX8zaXagUL7FjpL8i98PkPL2u7MDhQQG3BccLSrJHnDuRhO0WY8UGOTqdxPpCSA0y
         Z7soG3reIn6il+RiXo89vQG7KhAZJZjWSpdCCrs9g3nvNrdzVhqe0REZHxHoQbFSZpjg
         lsszfNQD2p1CmTt+ojO3a8SZwDqpKLw88jLXqopnd6DKHTW/dce7rw7AtAUaF7n/LyZN
         sqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRGU3Y0mw2H+4CP9C18Vwb5nAjyH4vOHqzjvCDnBh7s=;
        b=0O7iJSL3WakISranHvE7kZWwXhs7JpyfXwjPXR/3wXHZh+8aQhgjP5DkcqqKjveyaz
         vo0OUhwFFG5G9263tcXL/o7DbBpydNWy0sYlNGUwuN3SSTkESoHpC2gQ5rAj+QDKqeuQ
         WlC7Mxvud9rpfjr/heZ36OOC8NfZ3w5gLluAbXZcogRAgOi2ptexIF5iMlI/nU+BdIqU
         2SY4RdgS54XXKCoPDQe+i63otoE6fbJnzf3xdVjcL65DDEtXH/+vZ/F4VCHXxJTdvv5X
         zzl/55akmzzL2g73exkcvcC7g3tET2BZEI3ZbRXMC7GAx6ZJTEifTFLmWTNzQUe2YZM6
         muXQ==
X-Gm-Message-State: AFqh2kpKoSM5eWhP+0ITHXr4TB/iCLLAH8xZ7RE/1KAPCmr86N1pZb4p
	0EVviJyCUhzsfef6DdzAjEQduhFu9hc=
X-Google-Smtp-Source: AMrXdXvIJzYykAxuOgJ0S+n3ygYmDHyX0c92I44khsCBLPvkLo39t52TD0S/Mc+LBogQMTJPKcbiww==
X-Received: by 2002:a17:90a:428c:b0:223:b920:28df with SMTP id p12-20020a17090a428c00b00223b92028dfmr33323770pjg.29.1674657256980;
        Wed, 25 Jan 2023 06:34:16 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm1671465pjd.41.2023.01.25.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:34:16 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND linux-next v4.1 0/4] Used onboard HUB to reset and add power to hub 
Date: Wed, 25 Jan 2023 14:33:59 +0000
Message-Id: <20230125143404.1424-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063418_996275_94C3CDB2 
X-CRM114-Status: GOOD (  11.12  )
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
