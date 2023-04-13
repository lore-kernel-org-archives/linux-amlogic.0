Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B53BC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFse7SyHCLDDhQGyin1B5Sc/ISfcqbdDVZ71vg6sGCw=; b=2PgN1MBboVJvxJ
	F96WlV9vdm3HWSTt/uc65NJs9MCrNhvXBlLuw7GENuZ8rPuZYaFBFXJ6gx5+O+gvdZg0McPzkeh0M
	p0uP8gL0AeNRQqkzHJUxTNuwEz/jXuSUfhAAfweQo/ynDZEfNAHeU5bkU6Ts7AXOSOmAZFe7swZ/V
	Kqd/xpujCHFK9RbiJDfTXF9IaBKe6F2qWLzyV5EexGSeuEH9os9NKUXfyKMraskampPDTgiMNzU/6
	JH3RTkKHO+eMMTR47EI09fIeBoKynlt1dw+LY0QBTG5aGC0MuUQCBzZHtAgKsQzQzXgyWrfPtV7rI
	+aBEeMBSmHJRwpJnanGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxVc-006Kq4-1K;
	Thu, 13 Apr 2023 14:01:08 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxVY-006Knh-0U
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Apr 2023 14:01:06 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pmxVR-0000jX-MA; Thu, 13 Apr 2023 16:00:57 +0200
Message-ID: <2e4521c5-b291-e228-c926-525e9a50a023@leemhuis.info>
Date: Thu, 13 Apr 2023 16:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
Content-Language: en-US, de-DE
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681394464;10230900;
X-HE-SMSGID: 1pmxVR-0000jX-MA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_070104_349990_DE7CC572 
X-CRM114-Status: GOOD (  23.80  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 11.04.23 01:13, Martin Blumenstingl wrote:
> 
> today I found that upstream commit 4bc31edebde5 ("mmc: core: Set HS
> clock speed before sending HS CMD13") breaks eMMC support on my
> Odroid-C1.
> (yes, I know that I am very late to the party...)
> 
> The .dts for this board is upstream using
> arch/arm/boot/dts/meson8b-odroidc1.dts (&sdhc node)
> The MMC host driver used is drivers/mmc/host/meson-mx-sdhc*.
> 
> The problem I'm seeing is that the eMMC module is simply not detected.
> There are no errors in the kernel log (note that mmc1 is the eMMC
> while mmc0 is the SD card which is attached to another controller on
> that SoC):
> # dmesg | grep mmc
> [    2.742136] meson-mx-sdhc c1108e00.mmc: allocated mmc-pwrseq
> [    4.315905] platform c1108c20.mmc:slot@1: Got CD GPIO
> [    4.450921] mmc0: new high speed SDHC card at address 0001
> [    4.456985] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
> [    4.466108]  mmcblk0: p1
> 
> In this state I get:
> # cat /sys/kernel/debug/mmc1/ios
> clock:          52000000 Hz
> actual clock:   51000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    9 (mmc HS200)
> signal voltage: 1 (1.80 V)
> driver type:    0 (driver type B)
> 
> After reverting the mentioned commit I get:
> # dmesg | grep mmc
> [    2.744226] meson-mx-sdhc c1108e00.mmc: allocated mmc-pwrseq
> [    2.970944] mmc1: new HS200 MMC card at address 0001
> [    2.974492] mmcblk1: mmc1:0001 8GND3R 7.28 GiB
> [    2.985126]  mmcblk1: p1
> [    2.987810] mmcblk1boot0: mmc1:0001 8GND3R 4.00 MiB
> [    3.003007] mmcblk1boot1: mmc1:0001 8GND3R 4.00 MiB
> [    4.311754] platform c1108c20.mmc:slot@1: Got CD GPIO
> [    4.374732] mmc0: new high speed SDHC card at address 0001
> [    4.377228] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
> [    4.399152]  mmcblk0: p1
> # cat /sys/kernel/debug/mmc1/ios
> clock:          100000000 Hz
> actual clock:   94444445 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    9 (mmc HS200)
> signal voltage: 1 (1.80 V)
> driver type:    0 (driver type B)
> 
> Please let me know which additional information would be helpful for
> debugging this further.
> Also I'd like to highlight that I'm not blaming the above commit
> (unless I know better). It's entirely possible that the meson-mx-sdhc
> driver (which I wrote) can be at fault and that I was previously just
> lucky.
> 
> [...]
> # first bad commit: [4bc31edebde51fcf8ad0794763b8679a7ecb5ec0] mmc:
> core: Set HS clock speed before sending HS CMD13

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 4bc31edebde51fcf8ad079
#regzbot title mmc: core: eMMC support broken on Odroid-C1
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
