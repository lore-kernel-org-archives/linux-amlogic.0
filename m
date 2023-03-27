Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98981C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OBzkfSjHY6dkM1Rl+0VdVqGT19d5BOwoU48NwbNvfY=; b=x7VqMVQNp8Xgab
	S3HAgZhHSDoRBeLP0YqLriIeTIYpnpyR+0YxTKiQesWBumiWepi+OmMQy9tQ2Khm0VaZXckD2bzAd
	TMyk2h1RuwDBKFCA7lQSYRG0TeoNa8s10vUQTJL2I18ts8o0nNqwxbtE/TkPpfMSKjskURtIj3HbI
	xTL6slh4xNi720sRiIPXIDVEfpo/bTjal6L3THghfJ6skBxCAbKvBBCOEHXDmy2N0UYK7jk+ip/xt
	Bgv/hcCMl8Ehl729HpKr9jqdF/Y66dJFrPQpP6Zu7efX1DKKsvJsme4ND+76xFhhHR76fXcrvhV7d
	EDmiB9tjj/NeCpEQsPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgou3-00BYoT-1J;
	Mon, 27 Mar 2023 15:36:59 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgotz-00BYmq-1j;
	Mon, 27 Mar 2023 15:36:57 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 57C992003E0;
	Mon, 27 Mar 2023 17:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679931413;
	bh=RMEFEX0OFAeFt1oM4F8N0xkWmgbW+E8C7zS8N9Ig0yA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=cejLpn2nm9zwUAe6r2XMqzTYZt0suHqnoknsD0F2XGUrTTGnJjpu7lAcUIUuOK5MB
	 aWXS6v7AXwPrL24qBk1hsovGd8u5/TO31YgBrp72Lsyg5Eg26ZsaK6JFe6Zemwh/d8
	 y/CACbCq1PFz8YMhSwpxsvYoevwhm4hdL69MIUkSxcHMrdptgNrVOusRMfDFUjFY30
	 yM6aGRoAdGGzM4OBziMXQ1awJBeaHSm5uhIFpPvMWIOIVc3PJyzwB8ZbuaDDg8JXHz
	 DSqPTptyQxMDhYaEStcvEGyu/WqmSyRE9K/p4oGu6ML35UP91C14KBAAZSKWMS10v/
	 /dupOVbQ9Ee4A==
Message-ID: <688713c0-c855-030e-50d4-d4ac4f1c5104@free.fr>
Date: Mon, 27 Mar 2023 17:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] Fix G12 PMU conflict
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <e2026259-3372-d1ee-d0aa-1376361a71cb@free.fr>
In-Reply-To: <e2026259-3372-d1ee-d0aa-1376361a71cb@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_083655_716198_F9876EA8 
X-CRM114-Status: UNSURE (   6.60  )
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

On 27/03/2023 17:25, Marc Gonzalez wrote:

> Hmmm... the perf driver doesn't like my setup... :(
> 
> # perf record -a -F 1009 --call-graph fp -B curl -o /dev/null http://192.168.1.254:8095/fixed/1G
>   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
>                                  Dload  Upload   Total   Spent    Left  Speed
>   0 1024M    0 8342k    0     0  7564k      0  0:02:18  0:00:01  0:02:17 7563k
> 
> [ 1036.936099] SError Interrupt on CPU1, code 0x00000000bf000000 -- SError
> [ 1036.936116] CPU: 1 PID: 61 Comm: kworker/u9:0 Not tainted 6.2.0 #449
> [ 1036.936122] Hardware name: SEI Robotics SEI510 (DT)
> [ 1036.936126] Workqueue: brcmf_wq/mmc2:0001:1 brcmf_sdio_dataworker
> [ 1036.936144] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 1036.936150] pc : brcmf_sdiod_skbuff_read+0x28/0xa0
> [ 1036.936159] lr : brcmf_sdiod_recv_chain+0xe4/0x160
> [ 1036.936166] sp : ffff80000a18bc00
> [ 1036.936169] x29: ffff80000a18bc00 x28: ffff8000087d31a0 x27: ffff8000087d2e60
> [ 1036.936177] x26: ffff000004990b00 x25: 0000000000000009 x24: ffff8000087d31a0
> [ 1036.936184] x23: ffff000004998500 x22: 0000000000008000 x21: ffff000000873278
> [ 1036.936192] x20: 000000000000c100 x19: ffff000000872800 x18: 0000000000000000
> [ 1036.936199] x17: ffff80005df77000 x16: ffff80000800c000 x15: 0000000000000000
> [ 1036.936205] x14: 0000000000000002 x13: 0000000000077f7a x12: 0000000000000068
> [ 1036.936213] x11: 00000000000000c0 x10: 0000000000000068 x9 : fffffc0000150800
> [ 1036.936220] x8 : fffffc0000150801 x7 : ffff80005df77000 x6 : ffff000004998500
> [ 1036.936227] x5 : ffff0000008bc000 x4 : 000000000000c103 x3 : ffff000004998500
> [ 1036.936233] x2 : 0000000000008000 x1 : 0000000000000002 x0 : ffff000000872800
> [ 1036.936243] Kernel panic - not syncing: Asynchronous SError Interrupt
> [ 1036.936247] CPU: 1 PID: 61 Comm: kworker/u9:0 Not tainted 6.2.0 #449
> [ 1036.936252] Hardware name: SEI Robotics SEI510 (DT)
> [ 1036.936255] Workqueue: brcmf_wq/mmc2:0001:1 brcmf_sdio_dataworker
> [ 1036.936262] Call trace:
> [ 1036.936264]  dump_backtrace.part.0+0xe0/0xf0
> [ 1036.936273]  show_stack+0x18/0x30
> [ 1036.936280]  dump_stack_lvl+0x68/0x84
> [ 1036.936288]  dump_stack+0x18/0x34
> [ 1036.936294]  panic+0x184/0x344
> [ 1036.936301]  nmi_panic+0xac/0xb0
> [ 1036.936308]  arm64_serror_panic+0x6c/0x80
> [ 1036.936314]  do_serror+0x58/0x60
> [ 1036.936318]  el1h_64_error_handler+0x30/0x50
> [ 1036.936324]  el1h_64_error+0x64/0x68
> [ 1036.936330]  brcmf_sdiod_skbuff_read+0x28/0xa0
> [ 1036.936336]  brcmf_sdiod_recv_chain+0xe4/0x160
> [ 1036.936343]  brcmf_sdio_dataworker+0x898/0x23d0
> [ 1036.936348]  process_one_work+0x1cc/0x320
> [ 1036.936354]  worker_thread+0x14c/0x450
> [ 1036.936359]  kthread+0xfc/0x100
> [ 1036.936364]  ret_from_fork+0x10/0x20
> [ 1036.936371] SMP: stopping secondary CPUs
> [ 1036.936378] Kernel Offset: disabled
> [ 1036.936379] CPU features: 0x00000,01000100,0000420b
> [ 1036.936384] Memory Limit: none
> [ 1037.149180] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---


Different crash signature:

# ./wifi.sh 
Successfully initialized wpa_supplicant
[   40.127823] ieee80211 phy0: brcmf_dongle_roam: WLC_SET_ROAM_TRIGGER error (-52)
udhcpc: started, v1.35.0
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting select for 192.168.1.67, server 192.168.1.254
udhcpc: lease of 192.168.1.67 obtained from 192.168.1.254, lease time 43200
deleting routers
adding dns 192.168.1.254
# 
# perf record -a -F 1009 --call-graph fp -B curl -o /dev/null http://192.168.1.254:8095/fixed/1G
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
 15 1024M   15  156M    0     0  8079k      0  0:02:09  0:00:19  0:01:50 8051k

[  132.334655] SError Interrupt on CPU2, code 0x00000000bf000000 -- SError
[  132.334678] CPU: 2 PID: 158 Comm: perf Not tainted 6.2.0 #449
[  132.334686] Hardware name: SEI Robotics SEI510 (DT)
[  132.334690] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  132.334697] pc : __arch_copy_from_user+0x1c8/0x230
[  132.334714] lr : copy_page_from_iter_atomic+0x1d4/0x5d0
[  132.334723] sp : ffff80000a42bb50
[  132.334725] x29: ffff80000a42bb50 x28: 0000000000000000 x27: 0000000000000800
[  132.334737] x26: ffff80000877da80 x25: ffff000000eb3a00 x24: 0000000000016498
[  132.334745] x23: ffff000000000000 x22: 0000040000000000 x21: ffff80000a42bd50
[  132.334752] x20: ffff000005400000 x19: 0000000000000800 x18: 0000000000000000
[  132.334759] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff84a73ff0
[  132.334766] x14: 0000000000000007 x13: 00000000000f1f68 x12: 0000000000000001
[  132.334774] x11: 0000001ecf0a934d x10: 0000000000000000 x9 : ffff80000875c020
[  132.334781] x8 : ffff800008753188 x7 : ffffffffffffff80 x6 : ffff0000054001a0
[  132.334788] x5 : ffff000005400800 x4 : 0000000000000000 x3 : 0000000000000800
[  132.334796] x2 : 0000000000000600 x1 : 0000ffff84a741c0 x0 : ffff000005400000
[  132.334807] Kernel panic - not syncing: Asynchronous SError Interrupt
[  132.334811] CPU: 2 PID: 158 Comm: perf Not tainted 6.2.0 #449
[  132.334817] Hardware name: SEI Robotics SEI510 (DT)
[  132.334822] Call trace:
[  132.334824]  dump_backtrace.part.0+0xe0/0xf0
[  132.334836]  show_stack+0x18/0x30
[  132.334843]  dump_stack_lvl+0x68/0x84
[  132.334851]  dump_stack+0x18/0x34
[  132.334857]  panic+0x184/0x344
[  132.334865]  nmi_panic+0xac/0xb0
[  132.334870]  arm64_serror_panic+0x6c/0x80
[  132.334875]  do_serror+0x58/0x60
[  132.334879]  el1h_64_error_handler+0x30/0x50
[  132.334885]  el1h_64_error+0x64/0x68
[  132.334891]  __arch_copy_from_user+0x1c8/0x230
[  132.334897]  generic_perform_write+0xe8/0x1e0
[  132.334905]  __generic_file_write_iter+0x11c/0x1b0
[  132.334911]  generic_file_write_iter+0x78/0x110
[  132.334915]  vfs_write+0x2b0/0x390
[  132.334923]  ksys_write+0x68/0x100
[  132.334928]  __arm64_sys_write+0x1c/0x30
[  132.334934]  invoke_syscall+0x48/0x120
[  132.334943]  el0_svc_common.constprop.0+0x44/0xf0
[  132.334950]  do_el0_svc+0x38/0xc0
[  132.334956]  el0_svc+0x2c/0x90
[  132.334960]  el0t_64_sync_handler+0xb8/0xc0
[  132.334964]  el0t_64_sync+0x190/0x194
[  132.334970] SMP: stopping secondary CPUs
[  132.334977] Kernel Offset: disabled
[  132.334978] CPU features: 0x00000,01000100,0000420b
[  132.334982] Memory Limit: none


Will check this patch:
https://lore.kernel.org/all/20230209115403.521868-1-jiucheng.xu@amlogic.com/



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
