Return-Path: <SRS0=m30L=PQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADB2C43387
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 22:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068D02146F
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 22:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eVSuE9qp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="os1Wossw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068D02146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgJwhiG/M9bV9QV/dbJ4oCd/wbHWVOEcJAaRczglI4E=; b=eVSuE9qpmwK8MQ
	Id9NzqJLULczGu2Cu1QHhabubC7mJfMaGGxU+hRQw0u705/MAdqS3bPCfA20J6GnTyUJ6nEiyJIoj
	fxLKt2Ptqn9hCS7aTp4FKgyS58TSttsL6DL5mpZ5i4oFW621Gh6OzqyUHoVPwWyWfZVW9CrCPklBx
	cggROWQv71f7/nhocSss+weAVUUp8wIF2ojk4dkBIB7gM6k2Tw4iL8dyZMxucB8lZz9DUo8DDm2sw
	MjRgtulmTQu3IpV//voGwPKAQLedM0/c07CTr+HvM1HufuEmTwPsE16BMYvOiDGwjygaQ+Cx9MuOA
	Lbq9vwiKOXQFQ7A7KTcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggzQE-0007vU-M5; Tue, 08 Jan 2019 22:00:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggzQB-0007v0-1s
 for linux-amlogic@lists.infradead.org; Tue, 08 Jan 2019 22:00:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id r62so4681557oie.1
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jan 2019 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CSM1cwp7TQGD2Ez8ZUa/lIlRA7NNaBCN962+NJRpDIQ=;
 b=os1WosswGnfSgzxpCybyH4jeEeaJ7zkwfBSe19K1866ogYyrR0t3G0+/H0uZoD0fz9
 lyF7cI+8AemFRgrXpjmAVGo7TUne6qZWpob2kjRmmgz9NHSDMj/P6SPO6wQkBJHTDz3+
 Fhp726E+JKKfCLXARImhcmxF/kFsfro+1CsrI1CIAffdNa2aQTNihEiGfhbraGh3tH6s
 q1cJvczVTDi01+OP6dXi81w8HVLBsrAmhKrZzXQMmUKSHEcjJUzD0kKhCcTK9HVMSOXu
 Fi3V1PyFgrX+mhiQA9MP5ATAy/xwmkigPDf1A7xIXBrRChz1tn2hVhYZEVBCqYS16Fvs
 LZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CSM1cwp7TQGD2Ez8ZUa/lIlRA7NNaBCN962+NJRpDIQ=;
 b=g3yhwrhlDmduhmt7ZkLCcWKF9s1uZyxEmXNkXz4WKNux4s+dZKkDzf1NozR2vlil3h
 dj7C8qyBZleXJwVP9CY4u5Hb61LDtuDt6xK1YwHF5oqysxceg4BY+0Fw/ZzIvWa9Xji4
 X4di+I8OKZazdPhEq2oVT9Bw71VWFqA48Acd9HePCyN8nXwmSwfLxqpj0gi8yods8Q2y
 ql/aqWBcoBHPUvNbtNy5N5L6PMT5Hjl8+jGYmT0nHt5tOSsRpmRagphE8shQe3m2xF7x
 6HGlf3r811IXHjEDbO52W6XNXdW6H948WdGFucQmrJh3O40NkzwOHCVz01Vl/Nr4C2dj
 B4YQ==
X-Gm-Message-State: AJcUukcm2oG5OP1qsdYqglJyKg++FIZ+4zfWyGnOZMpuwd5TgexJamqR
 XsF0A2sftVuXrkpi7J7NQfunO0B8jqOchSL6Il8=
X-Google-Smtp-Source: ALg8bN5KDa0Y94mBHqZOJ9i7Y3iibLrR0XlWmjwyqNALjZcRGKKRhavV9CvPA95n3zgcaFnnPUSI5wfrFdNQZx1uTiw=
X-Received: by 2002:aca:e884:: with SMTP id f126mr2315643oih.181.1546984825046; 
 Tue, 08 Jan 2019 14:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20181206151828.24417-1-jbrunet@baylibre.com>
 <CAFBinCCUO6ihxNWDup5ZVKWBc8+oiW_-j8OUxRhb+tjpGsUBkg@mail.gmail.com>
 <db2580c8740ca202d02f37ef567be0e273eca6d7.camel@baylibre.com>
In-Reply-To: <db2580c8740ca202d02f37ef567be0e273eca6d7.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Jan 2019 23:00:13 +0100
Message-ID: <CAFBinCApEio05u+Us9XUK4UMpGi8bGa5j6psz21-3ry10PV6pg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_140027_136839_3C351C32 
X-CRM114-Status: GOOD (  30.26  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Wed, Jan 2, 2019 at 1:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2018-12-22 at 18:28 +0100, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Thu, Dec 6, 2018 at 4:18 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > The goal of the patchset was mainly to address the following warning:
> > >
> > > WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-
> > > mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> > > Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> > > CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> > > Hardware name: Some A113 Board (DT)
> > > pstate: 40000085 (nZcv daIf -PAN -UAO)
> > > pc : meson_mmc_irq+0xc0/0x1e0
> > > lr : __handle_irq_event_percpu+0x70/0x180
> > > sp : ffff000008003980
> > > x29: ffff000008003980 x28: 0000000000000000
> > > [...]
> > > x1 : ffff80001a71bd40 x0 : 0000000000000000
> > > Call trace:
> > >  meson_mmc_irq+0xc0/0x1e0
> > >  __handle_irq_event_percpu+0x70/0x180
> > >  handle_irq_event_percpu+0x34/0x88
> > >  handle_irq_event+0x48/0x78
> > >  handle_fasteoi_irq+0xa0/0x180
> > >  generic_handle_irq+0x24/0x38
> > >  __handle_domain_irq+0x5c/0xb8
> > >  gic_handle_irq+0x58/0xa8
> > >
> > > This happens when using the chained descriptor mode. If there is an
> > > error, we call mmc_request_done(), loosing any reference to the cmd. It
> > > turns out that the chained descriptor does really stops when we do so, at
> > > least not completly. Most of the time, it can be seen with this harmless
> > > warning because the descriptor will raise another unexpected IRQ. On rare
> > > occasion, it will completly break the MMC.
> > >
> > > This is mostly adressed by patch #1.
> > > With this fixed, I took (yet) another look at the ultra-high speed modes
> > > and the tuning.
> > >
> > > I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> > > sdcard and sdio on the following platforms:
> > >  * gxbb p200
> > >  * gxl p230, libretech (eMMC only), kvim.
> > >  * axg s400
> > >
> > > So far, these new settings seems to be working great but I think it
> > > would be nice if others could test this and provide their feedback.
> > > This why  patch 3 and 4 are RFT tagged.
> > >
> > > Jerome Brunet (4):
> > >   mmc: meson-gx: make sure the descriptor is stopped on errors
> > >   mmc: meson-gx: remove useless lock
> > >   mmc: meson-gx: align default phase on soc vendor tree
> > >   mmc: meson-gx: add signal resampling
> > I gave all four patches a go on my Khadas VIM2 Basic (16GB eMMC).
> > regardless of whether I have your patch applied or not: eMMC
> > sporadically fails tuning (if I reboot the board a few times it starts
> > to work)
> > [    4.172686] mmc1: tuning execution failed: -5
> > [    4.182535] mmc1: error -5 whilst initialising MMC card
>
> Damn ...
>
> This particular device is set to use hs400 ATM. Could you try with hs200 only
> ? (removing mmc-hs400-1_8v from meson-gxm-khadas-vim2.dts)
I put that on my TODO-list to re-try it
last year that "fixed" it for me, see [0]

> I might be wrong but I think tuning is supposed to be done with hs200, before
> activating DDR mode to switch to hs400. In theory, removing hs400 should not
> change anything (so I expect the tuning to still fail) but it is worth
> checking.
>
> >
> > I'm not sure if this issue is specific to my Khadas VIM2 so this is
> > *not* a nack for your patches.
>
> I'll check if I can get my hands on this device.
>
> When cooking this series, I tried another trick which was cycling on the
> resampling delays (see ADJUST_ADJ_DELAY_MASK). At the time, I could not see
> any significant improvement while doing it, so I dropped it.
>
> If possible. could you check if any particular value in this field, between 0
> and 5, makes things any better ?
>
> Alternatively, if you find another combination of phase for the mmc_clk and
> tx_clk that works better for this device, feel free to let me know. Maybe we
> can work something out.
I booted whatever Android / Linux is on the eMMC of my Khadas VIM2:
kvim2:/ $ dmesg | grep -i emmc
[    2.605927@2] aml_sd_emmc_probe: line 3608
[    2.609368@2] mmc driver version: 1.07, 2017-4-26: Support new emmc
host controller for version 3
[    2.618678@2] aml_sd_emmc_reg_init 1152
[    2.647411@2] get property:                  pinname, str:emmc
[    2.669798@2] emmc:pdata->caps = c0000d47
[    2.673712@2] emmc:pdata->caps2 = 18060
[    2.677509@2] emmc:pdata->pm_caps = 0
[    2.725316@2] [aml_sd_emmc_probe] aml_sd_emmc_probe() success!
[    2.725543@2] aml_sd_emmc_probe: line 3608
[    2.729971@2] aml_sd_emmc_reg_init 1152
[    2.845635@2] [aml_sd_emmc_probe] aml_sd_emmc_probe() success!
[    2.845871@2] aml_sd_emmc_probe: line 3608
[    2.850305@2] aml_sd_emmc_reg_init 1152
[    2.890367@0] emmc: BKOPS_EN bit is not set
[    2.896816@0] emmc: trying cali 0-th time(s)
[    2.903969@0] emmc: delay[0]= 1000 padding= 4, bidx=1
[    2.903971@0] emmc: delay[1]= 1000 padding= 4, bidx=1
[    2.903973@0] emmc: delay[2]=  750 padding= 1, bidx=0
[    2.903975@0] emmc: delay[3]= 1250 padding= 3, bidx=1
[    2.903977@0] emmc: delay[4]= 1250 padding= 3, bidx=1
[    2.903979@0] emmc: delay[5]= 1250 padding= 3, bidx=1
[    2.903981@0] emmc: delay[6]= 1000 padding= 4, bidx=1
[    2.903983@0] emmc: delay[7]= 1250 padding= 3, bidx=1
[    2.903985@0] emmc: calibration result @ 0: max(1250), min(750)
[    2.903988@0] emmc: line_delay =0x1000211, max_cal_result =1250
[    2.903990@0] emmc: base_index_max 1, base_index_min 0
[    2.903996@0] emmc: clk 100000000 SDR mode tuning start
[    2.904428@0] emmc: rx_tuning_result[1] = 10
[    2.904795@0] emmc: rx_tuning_result[2] = 10
[    2.905159@0] emmc: rx_tuning_result[3] = 10
[    2.905530@0] emmc: rx_tuning_result[4] = 10
[    2.905896@0] emmc: rx_tuning_result[5] = 10
[    2.906260@0] emmc: rx_tuning_result[6] = 10
[    2.906626@0] emmc: rx_tuning_result[7] = 10
[    2.906991@0] emmc: rx_tuning_result[8] = 10
[    2.907357@0] emmc: rx_tuning_result[9] = 10
[    2.907360@0] emmc: best_win_start =1, best_win_size =9
[    2.907362@0] emmc:
sd_emmc_regs->gclock=0x100024a,sd_emmc_regs->gadjust=0x52000
[    2.907365@0] emmc: gclock =0x100024a, gdelay=0x1000211, gadjust=0x52000
[    2.907506@0] emmc: support driver strength type 1
[    2.907575@0] emmc: try set sd/emmc to DDR mode
[    2.907579@0] emmc: try set sd/emmc to DDR mode
[    2.907710@0] emmc: new HS400 MMC card at address 0001
[    2.908238@1] emmc: clock 100000000, 8-bit-bus-width
[    2.908239@1] mmcblk0: emmc:0001 AJNB4R 14.5 GiB
[    2.908375@1] mmcblk0boot0: emmc:0001 AJNB4R partition 1 4.00 MiB
[    2.908504@1] mmcblk0boot1: emmc:0001 AJNB4R partition 2 4.00 MiB
[    2.908631@1] mmcblk0rpmb: emmc:0001 AJNB4R partition 3 4.00 MiB
[    2.909793@0] [aml_sd_emmc_irq] emmc: warning... response
crc,vstat:0xa1ff2400,virqc:3fff
[    2.909801@0] [aml_host_bus_fsm_show] emmc: err: wait for irq
service, bus_fsm:0x8
[    2.909801@0] [mmc_cmd_LBA_show] emmc: cmd 18, arg 0x12000,
operation is in [reserved] disk!
[    2.909819@6] aml_sd_emmc_data_thread 2642 emmc: cmd:18
[    2.909824@6] [aml_sd_emmc_data_thread] aml_sd_emmc_data_thread()
2658: set 1st retry!
[    2.909827@6] [aml_sd_emmc_data_thread] retry cmd 18 the 10-th time(s)
[    2.909829@6] [aml_sd_emmc_data_thread] cmd_delay change to 2
[    2.909840@0] [aml_sd_emmc_irq] emmc:
resp_timeout,vstat:0xa1ff2800,virqc:3fff
[    2.909858@6] aml_sd_emmc_data_thread : 2589
[    2.910078@1] add_emmc_partition
[    2.911868@0] emmc_key_init:527 emmc key lba_start:0x12020,lba_end:0x12220
[    2.911870@0] emmc key: emmc_key_init:552 ok.
[    2.916963@1] Exit aml_emmc_partition_ops OK.
[    2.919073@1] clear_emmc_wait_flag
[    3.355313@2] [aml_sd_emmc_probe] aml_sd_emmc_probe() success!
[    9.546113@4] emmc_key_read:428, read ok
[   19.016202@0] [aml_sd_emmc_irq] sdio:
resp_timeout,vstat:0xa3ff2800,virqc:3fff
[   19.028652@6] aml_sd_emmc_data_thread 2642 sdio: cmd:52
[   19.035022@0] [aml_sd_emmc_irq] sdio:
resp_timeout,vstat:0xa3ff2800,virqc:3fff
[   19.048492@6] aml_sd_emmc_data_thread 2642 sdio: cmd:52
[   19.058504@0] [aml_sd_emmc_irq] sdio:
resp_timeout,vstat:0xa3ff2800,virqc:3fff
[   19.068332@6] aml_sd_emmc_data_thread 2642 sdio: cmd:8
[   19.251397@1] sdio:
sd_emmc_regs->gclock=0x1000245,sd_emmc_regs->gadjust=0x32000
[   20.509105@4] sdio:
sd_emmc_regs->gclock=0x1000245,sd_emmc_regs->gadjust=0x32000
[   21.970494@4] sdio:
sd_emmc_regs->gclock=0x1000245,sd_emmc_regs->gadjust=0x32000

the register values of the clock, delay and adjust registers are
printed by Amlogic's 3.14 kernel - in case that helps you


Regards
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006251.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
