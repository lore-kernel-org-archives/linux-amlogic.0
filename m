Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D2C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+u1RNq07PwWBcmNSHnMtzxJ5Wfblr8wJ09nFp9K500=; b=pZ+q9CtmZi0CLJ
	cANkDssrryVqCASb7C0AAG/xBS7JQpjusljZoyQXxuA8s3yv69YduOnLsfrtbts4IxOMoKX48tSfG
	Kv4K6sAGH1K55BD46I0LHcUU2OUhBe0cL/+W6ddM0LD6r1pjK2AF2LRLMhoridhtMrsWC8zQzyJ8y
	c5eQWkDGBAtU6lb/PWb2Iesx3Qns8zcJ7wXJJ7JqZ7HqEyiT7xjh1yDFh4L+rBv1wVP+p3MEYfk3D
	I/hf/QS+1PCiID4PAMSe2/q50eVYpBBl/DU0TmOhpSjR4HnbNVzjyzF80hBMsqbgJ3ylWnm/bke2y
	vp4ngiUPa4KjjU8igudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgojS-00BVeI-3C;
	Mon, 27 Mar 2023 15:26:02 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgojP-00BVda-1v;
	Mon, 27 Mar 2023 15:26:01 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id D1770200411;
	Mon, 27 Mar 2023 17:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679930755;
	bh=ml7MTkvaVQgzSJ/9XDbPNAPuc2weAexJmM6aiEjseuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SaFvy44bQa8wZMXtl2fGIVBpzmeV+1MbuIPQ+D0kBcRM/zn/+BMvwmsBzDzRvqJn3
	 TrLgdludVX0ty77b4kEfaThXJYw+Q2JycFZUmdkxH7/KTkvfgLFvk5dJoMRVXHYlR8
	 Z1esiDGiFqgKmNYdsOqn8yDWUft4rTMNFXF3tqJasiM/PAQaQrTOyRcbFC+ZKqA9Pt
	 WjBOmTH7qAMtoaF1nn1hdRmErwdaIpP7ENmrRGWCaOB7VyBcAM7D4qMKMIN6AQxeNb
	 cbv9jgznXt85Ca73kpRakOB+vUJTLw+gXqQpdILWMH9PZq+o+Jt1yqSZndjrZuQjd7
	 aaQT0ndiENjQg==
Message-ID: <e2026259-3372-d1ee-d0aa-1376361a71cb@free.fr>
Date: Mon, 27 Mar 2023 17:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] Fix G12 PMU conflict
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_082559_774060_0BA33662 
X-CRM114-Status: UNSURE (   6.04  )
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

On 27/03/2023 14:09, Marc Gonzalez wrote:

> Move the PMU DT node & adjust the register offsets.
> 
> Marc Gonzalez (3):
>   arm64: dts: meson-g12-common: specify full DMC range
>   perf/amlogic: resolve conflict between canvas & pmu
>   perf/amlogic: adjust register offsets

Hmmm... the perf driver doesn't like my setup... :(

# perf record -a -F 1009 --call-graph fp -B curl -o /dev/null http://192.168.1.254:8095/fixed/1G
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0 1024M    0 8342k    0     0  7564k      0  0:02:18  0:00:01  0:02:17 7563k

[ 1036.936099] SError Interrupt on CPU1, code 0x00000000bf000000 -- SError
[ 1036.936116] CPU: 1 PID: 61 Comm: kworker/u9:0 Not tainted 6.2.0 #449
[ 1036.936122] Hardware name: SEI Robotics SEI510 (DT)
[ 1036.936126] Workqueue: brcmf_wq/mmc2:0001:1 brcmf_sdio_dataworker
[ 1036.936144] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 1036.936150] pc : brcmf_sdiod_skbuff_read+0x28/0xa0
[ 1036.936159] lr : brcmf_sdiod_recv_chain+0xe4/0x160
[ 1036.936166] sp : ffff80000a18bc00
[ 1036.936169] x29: ffff80000a18bc00 x28: ffff8000087d31a0 x27: ffff8000087d2e60
[ 1036.936177] x26: ffff000004990b00 x25: 0000000000000009 x24: ffff8000087d31a0
[ 1036.936184] x23: ffff000004998500 x22: 0000000000008000 x21: ffff000000873278
[ 1036.936192] x20: 000000000000c100 x19: ffff000000872800 x18: 0000000000000000
[ 1036.936199] x17: ffff80005df77000 x16: ffff80000800c000 x15: 0000000000000000
[ 1036.936205] x14: 0000000000000002 x13: 0000000000077f7a x12: 0000000000000068
[ 1036.936213] x11: 00000000000000c0 x10: 0000000000000068 x9 : fffffc0000150800
[ 1036.936220] x8 : fffffc0000150801 x7 : ffff80005df77000 x6 : ffff000004998500
[ 1036.936227] x5 : ffff0000008bc000 x4 : 000000000000c103 x3 : ffff000004998500
[ 1036.936233] x2 : 0000000000008000 x1 : 0000000000000002 x0 : ffff000000872800
[ 1036.936243] Kernel panic - not syncing: Asynchronous SError Interrupt
[ 1036.936247] CPU: 1 PID: 61 Comm: kworker/u9:0 Not tainted 6.2.0 #449
[ 1036.936252] Hardware name: SEI Robotics SEI510 (DT)
[ 1036.936255] Workqueue: brcmf_wq/mmc2:0001:1 brcmf_sdio_dataworker
[ 1036.936262] Call trace:
[ 1036.936264]  dump_backtrace.part.0+0xe0/0xf0
[ 1036.936273]  show_stack+0x18/0x30
[ 1036.936280]  dump_stack_lvl+0x68/0x84
[ 1036.936288]  dump_stack+0x18/0x34
[ 1036.936294]  panic+0x184/0x344
[ 1036.936301]  nmi_panic+0xac/0xb0
[ 1036.936308]  arm64_serror_panic+0x6c/0x80
[ 1036.936314]  do_serror+0x58/0x60
[ 1036.936318]  el1h_64_error_handler+0x30/0x50
[ 1036.936324]  el1h_64_error+0x64/0x68
[ 1036.936330]  brcmf_sdiod_skbuff_read+0x28/0xa0
[ 1036.936336]  brcmf_sdiod_recv_chain+0xe4/0x160
[ 1036.936343]  brcmf_sdio_dataworker+0x898/0x23d0
[ 1036.936348]  process_one_work+0x1cc/0x320
[ 1036.936354]  worker_thread+0x14c/0x450
[ 1036.936359]  kthread+0xfc/0x100
[ 1036.936364]  ret_from_fork+0x10/0x20
[ 1036.936371] SMP: stopping secondary CPUs
[ 1036.936378] Kernel Offset: disabled
[ 1036.936379] CPU features: 0x00000,01000100,0000420b
[ 1036.936384] Memory Limit: none
[ 1037.149180] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
