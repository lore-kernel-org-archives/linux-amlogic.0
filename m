Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F576C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hKE0AItrcLiWq/T1YMPpeX/DYVxT95aMBCmc5OZSeJ8=; b=g3xg+KCAcVW/Da
	YgCx/v/WIxIBTkalvOLapEeDuMUf6I58yiWtXcXDhMOLw6BjQIOWVcgBLJGTtV1uf65kp1j9YNg0c
	0apcJ+q9qoczxqeS20TrUZFqOQI/9YFZDco88eJxBqZC7KEgX+QIrZhyj+STPBeSVL8aV1Zk/10cK
	zYCAUcyctcX07OhoKjo5SmeaMIV3wUHvd3OQej39knT13fIToUjMPWBPdCnCxOvIaX61Oh4xFDFbO
	CLLvF+Ks45B+n+YqDYyWVMmWhJirlfNRp15eURTMcEWT0FyVFiKnGpxdu/ITy3JGoVyraxVNp4O1Y
	DNR6ia8BEBfkjnISGbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKU6-004MxC-Bk; Tue, 24 Jan 2023 14:41:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKU3-004MvR-8R
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 14:41:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id z13so14914290plg.6
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 06:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtuOzmIjX4z4XOJTxg5rHrWEGaMvNm9LHx30Z3RJuGE=;
        b=bR6Z0GqwX97vTn5NUTSP1fsszZZ0zyiGotGFuJvFXSwecPc9AWRVbQjvlfyllK+t5e
         KUp9+uIzwCEQwjMksYr1GoBWQCpqiaYEYtwWu+d3H2p/x72coqRL523jAGiV5mQSZRMA
         23rgXK8ud0Wu3iAveCOvz81qfDd8MhJul+ZHZ+fSQb88eNimSMNWlvEmCUgHgyPkO5vY
         5Vgs/LUdjGOcG+WFEFK2/PUVEGOMRGrCwQdUFFep0oJ+yh2RIW8eS3i7HqQiUiVWGBmU
         iQyG+ot72nPpPvA33XBmPl8K6bSnie9S5tDF5hHZ1hwP0/bnx2cPW1ItPRK4F5iT//c+
         Kvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtuOzmIjX4z4XOJTxg5rHrWEGaMvNm9LHx30Z3RJuGE=;
        b=f7um8VWRYzggQkWF4CE1esSpv/7rRzn7Nnd92UVV9vPMT5ATpbFqe1zJIKV3YdSqyh
         VroWu0b66zvn9xtsYLQncJYr/sSpY1EYf4hvrle8h48wTAhvxAWG5uRTRQKRH2Ku6RfB
         1rh3PTPLBh+WiZFb/j3qmhp6jrDr7zSVE5EUOADMd/FjvcvyUYksbv1Dm39VmYgU8JuV
         q3KuMkrlSEaqepnN39ZXygdhmRQVh9HljF2iwBIQSPJSsYN0l5ifnCtyOyTyGkTS/sVo
         ZLPZg9PhoJwvsWbEAomAbq82aTxDyICQsg+A4b2+07vneIqYj1ahPOAIA6JJbLlfbhkm
         19aQ==
X-Gm-Message-State: AFqh2krNikvv6hToGaA2qf6rur1XDCtD+r0LZvQ4nP6JBNiorWGHRX+8
	Cut53ouwEp8v4Sa9eJ7edJR5JE9XxQY=
X-Google-Smtp-Source: AMrXdXuW8/hUEdtv9P0YUdiSD/jFROvmPB/t+RDZVt9jBThscLhtdzLRTLvZKgzmnskbP5WbBDaZfQ==
X-Received: by 2002:a17:903:2487:b0:194:9874:5e07 with SMTP id p7-20020a170903248700b0019498745e07mr28716168plw.18.1674571266738;
        Tue, 24 Jan 2023 06:41:06 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019602dd914csm1747865plc.180.2023.01.24.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:06 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org
Subject: [PATCH linux-next v4 0/4] Used onboard HUB to reset and add power to hub
Date: Tue, 24 Jan 2023 14:40:49 +0000
Message-Id: <20230124144054.13556-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064111_314734_8BED0F61 
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
    Fixed some small changes.
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
  dt-bindings: usb: Fix device tree binding for VL817 hub controller

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
