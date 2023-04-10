Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B68C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 23:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0c/C+gK3HKIOflU2zgBGeY/eUWRKF6dZ2eenFlvEsXM=; b=VArj0ILoqG/aaw
	WVV5hsnAv9OAfHVukFBHWPx3j/jzcytKNEB7hrhbVVLDWiGRMmIv5hVNNOKof9/9ghyvaHUTshaTf
	nKuEs48t9z+RUBGEWjb/JloVOHqnQ1fOutbw0m3/riFv0lw74rFovwCNbIjXB9exwQiCKFqXPwxeH
	eSrq65R89Kw5XPDpBDI0ub1cYrSFn6pJE2Txmn+Xs3B2oByG6cAV0EXQMeXVG4RFgyOAHL/vI5SRA
	haqCDiCXXBFXM5wSzKGSpVYQRDtdAhW4uKJS7li3MeYzd8/DulVCgVbqNV4YpHxFxxwSa5urgehO/
	JrX1LsitbI7JeypBUnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0hn-00G3Ay-1z;
	Mon, 10 Apr 2023 23:13:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0hj-00G3Ad-2r
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Apr 2023 23:13:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ud9so15772587ejc.7
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Apr 2023 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681168422;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vYCRP+KrlDlbA1Ibo/A0cTBAFRfyjiKjYzNUeLYUHNM=;
        b=b86yQvYJywZnlnP3IrOiP8D5lc4U68ihljTY6XuXNu5BEGdmV9H49PEZJu0SII5Zuk
         4Awb0S3s1pWnT55GpB3eRthVZFJ4YSncT2lEcI3bWpnyMvcsYvI6GY2I5TebQgVos/KS
         P5W83VKOPEZwbFl9qUhJ+RYD0eAFLSdFVCsHgFnLTCnWV+oE6dJNHB+4rOHMOcixc7BX
         Mqby4BuC3EKAgy3RixF6tHr7inI0rgnun9ArzY78ocNznoureBLo28s3ZKu9Y+HY0pe9
         7bNt/m6Ppn3YqBzLpE3LFiDH7UQOf3N87+H/PjTiXAj70+0W1oizd57DU/uG+d2EV9PL
         WH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681168422;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYCRP+KrlDlbA1Ibo/A0cTBAFRfyjiKjYzNUeLYUHNM=;
        b=kahri+ETMwPpeY760dKjAIh2vDueVIvBtLiU9M3U2Q3HJdVSsmLRHNId5S/+5og1Ro
         4wp41sOTWbuVvuYnXW00Y2+nLqfjrLTjWzOxlhXsCsmY8RAUhcMhM7mjq/xD2BKZ9bOY
         eTULRfyJOnd3Ss0VZ7oenHpFBm3auTpTj6YW9z26uV4XySpmLCFXwqEv4hyKmM5wZZ30
         tfvkReeyFhacdDK/jJOb2EtqnOr4ekF4C8NfHrTMRKP9laheityNzpECLxQ1GQbU5v5E
         c8lzhnv6ENxP/v4P0PuGcXpIQSbsonewgmsj6qDuZDkc1yA5gQAk3sNBmyVqpNxdQTiu
         RLEQ==
X-Gm-Message-State: AAQBX9engY2CWFVrrBlhSslD1dnTNxoHDLI9chllFfi25v6UxBqeO0mZ
	v1D8nIGOlZ+xZUxWA9UveWmRfWjySLDVYlocrOs=
X-Google-Smtp-Source: AKy350ZSOn5vAFET2Urc7I8f2l8+gbmJ4gCwaITbvhLfKwc+0P9A260bj1k0r/tHrE5oGSFnAdT0hp3ato9ui9VMDok=
X-Received: by 2002:a17:907:6f07:b0:878:4a24:1a5c with SMTP id
 sy7-20020a1709076f0700b008784a241a5cmr3599198ejc.6.1681168421730; Mon, 10 Apr
 2023 16:13:41 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 01:13:30 +0200
Message-ID: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
Subject: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_161343_947136_62027A1B 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hello Ulf,

today I found that upstream commit 4bc31edebde5 ("mmc: core: Set HS
clock speed before sending HS CMD13") breaks eMMC support on my
Odroid-C1.
(yes, I know that I am very late to the party...)

The .dts for this board is upstream using
arch/arm/boot/dts/meson8b-odroidc1.dts (&sdhc node)
The MMC host driver used is drivers/mmc/host/meson-mx-sdhc*.

The problem I'm seeing is that the eMMC module is simply not detected.
There are no errors in the kernel log (note that mmc1 is the eMMC
while mmc0 is the SD card which is attached to another controller on
that SoC):
# dmesg | grep mmc
[    2.742136] meson-mx-sdhc c1108e00.mmc: allocated mmc-pwrseq
[    4.315905] platform c1108c20.mmc:slot@1: Got CD GPIO
[    4.450921] mmc0: new high speed SDHC card at address 0001
[    4.456985] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
[    4.466108]  mmcblk0: p1

In this state I get:
# cat /sys/kernel/debug/mmc1/ios
clock:          52000000 Hz
actual clock:   51000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    9 (mmc HS200)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)

After reverting the mentioned commit I get:
# dmesg | grep mmc
[    2.744226] meson-mx-sdhc c1108e00.mmc: allocated mmc-pwrseq
[    2.970944] mmc1: new HS200 MMC card at address 0001
[    2.974492] mmcblk1: mmc1:0001 8GND3R 7.28 GiB
[    2.985126]  mmcblk1: p1
[    2.987810] mmcblk1boot0: mmc1:0001 8GND3R 4.00 MiB
[    3.003007] mmcblk1boot1: mmc1:0001 8GND3R 4.00 MiB
[    4.311754] platform c1108c20.mmc:slot@1: Got CD GPIO
[    4.374732] mmc0: new high speed SDHC card at address 0001
[    4.377228] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
[    4.399152]  mmcblk0: p1
# cat /sys/kernel/debug/mmc1/ios
clock:          100000000 Hz
actual clock:   94444445 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    9 (mmc HS200)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)

Please let me know which additional information would be helpful for
debugging this further.
Also I'd like to highlight that I'm not blaming the above commit
(unless I know better). It's entirely possible that the meson-mx-sdhc
driver (which I wrote) can be at fault and that I was previously just
lucky.

My git bisect log is:
$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [f443e374ae131c168a065ea1748feac6b2e76613] Linux 5.17
git bisect good f443e374ae131c168a065ea1748feac6b2e76613
# status: waiting for bad commit, 1 good commit known
# bad: [4b0986a3613c92f4ec1bdc7f60ec66fea135991f] Linux 5.18
git bisect bad 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
# good: [25fd2d41b505d0640bdfe67aa77c549de2d3c18a] selftests:
kselftest framework: provide "finished" helper
git bisect good 25fd2d41b505d0640bdfe67aa77c549de2d3c18a
# good: [02e2af20f4f9f2aa0c84e9a30a35c02f0fbb7daa] Merge tag
'char-misc-5.18-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 02e2af20f4f9f2aa0c84e9a30a35c02f0fbb7daa
# good: [887f75cfd0da44c19dda93b2ff9e70ca8792cdc1] drm/amdgpu: Ensure
HDA function is suspended before ASIC reset
git bisect good 887f75cfd0da44c19dda93b2ff9e70ca8792cdc1
# good: [cf424ef014ac30b0da27125dd1fbdf10b0d3a520] Merge tag
'for-5.18/fbdev-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
git bisect good cf424ef014ac30b0da27125dd1fbdf10b0d3a520
# good: [4e707344e18525b4edf5c2bc2e3eb60692e8c92e] MAINTAINERS: add
missing files for bonding definition
git bisect good 4e707344e18525b4edf5c2bc2e3eb60692e8c92e
# bad: [680b892685ea7043addb5819ddec9147d4263195] Merge branch
'100GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
git bisect bad 680b892685ea7043addb5819ddec9147d4263195
# bad: [e3de3a1cda5fdc3ac42cb0d45321fb254500595f] Merge tag
'powerpc-5.18-4' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad e3de3a1cda5fdc3ac42cb0d45321fb254500595f
# bad: [4b97bac0756a81cda5afd45417a99b5bccdcff67] Merge tag
'for-5.18-rc5-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect bad 4b97bac0756a81cda5afd45417a99b5bccdcff67
# bad: [64267926e01b06f43e26232722fb3dc3f4819823] Merge tag
'mmc-v5.18-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
git bisect bad 64267926e01b06f43e26232722fb3dc3f4819823
# good: [fe27d189e3f42e31d3c8223d5daed7285e334c5e] Merge tag
'folio-5.18f' of git://git.infradead.org/users/willy/pagecache
git bisect good fe27d189e3f42e31d3c8223d5daed7285e334c5e
# good: [ca5e2f4d6b677efa3f43a6790777e46dcf806e4d] Merge tag
'drm-misc-fixes-2022-05-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
git bisect good ca5e2f4d6b677efa3f43a6790777e46dcf806e4d
# bad: [3e5a8e8494a8122fe4eb3f167662f406cab753b9] mmc: sdhci-msm:
Reset GCC_SDCC_BCR register for SDHC
git bisect bad 3e5a8e8494a8122fe4eb3f167662f406cab753b9
# bad: [e9f3fb523dbf476dc86beea23f5b5ca8f9687c93] mmc: sunxi-mmc: Fix
DMA descriptors allocated above 32 bits
git bisect bad e9f3fb523dbf476dc86beea23f5b5ca8f9687c93
# bad: [4bc31edebde51fcf8ad0794763b8679a7ecb5ec0] mmc: core: Set HS
clock speed before sending HS CMD13
git bisect bad 4bc31edebde51fcf8ad0794763b8679a7ecb5ec0
# first bad commit: [4bc31edebde51fcf8ad0794763b8679a7ecb5ec0] mmc:
core: Set HS clock speed before sending HS CMD13


Thank you and best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
