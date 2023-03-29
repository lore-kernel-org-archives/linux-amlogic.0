Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606BC76196
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 00:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dw4VyPwaCOnSUpjy0/YciegisG2kJu1xiQ665kW4Atc=; b=E2Gm4IhY36RaMO
	8oH1XqGLmMMVaJTv6hvwde0/Etg87NUolhpwEjOpTFRCwKP5g2BGTrufiHIJj/qopnl0gbliWblca
	z5owWLNhG2f0YMGcQZQrf7jXPVMRXAHPT6rTSCSzO1wWEsN2TEIrt7eITzPWxnftKMl71eKuZW+NY
	Io5AF8hl4yZxpzV5c9QAaSYFAFJqCQIW8gBs2URwKgGvTIqWFXvZTTplO1iW4XXJIzUPUOnPd+WZC
	1W9x2micHqjKIvONAp9an0hihvt2zkyytLiQ3vSOrtcAr2lwBNxFm79nHfrKWd23nDEVO9P0WwTXr
	yPkjelNJmDWLROnwJe5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phJGc-00GA6P-1c;
	Wed, 29 Mar 2023 00:02:18 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phJGX-00GA5l-1J;
	Wed, 29 Mar 2023 00:02:15 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:1cb6:d5a2:ed09:fe0] (unknown [IPv6:2a02:8428:2a4:1a01:1cb6:d5a2:ed09:fe0])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8BEE5B00535;
	Wed, 29 Mar 2023 02:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680048125;
	bh=aL9XW4v+i70P7lA+4pHvbHUNaYGD++77fI1LtGZKh8k=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=DzJpPNalz58SxP3dNhjMz2D6/qY4az8MFABQyfE1aaSUFBROW1G/UXRUSbb/hcxyf
	 +iew0egIuIWjprRM7bQpu4sSwn5s9ytm/zr48Yr6Kxaze00ZImCtUIAD1weSeYwzPo
	 74Daz3U3QVyzDNw1KpeS2XVuG0iitTg4hGekum0qoTC+oTPmWQFxkzDq6S7+9WKXNg
	 jiUTthWPhb3PGDiEbyc/jGVF/gbphrZuv3wNz40bAx+DhF+7d+yjdwDPgwvlqqhOvQ
	 G/4qTDpO2Eq1JK6fdUm09GuoUug0bQkYkbx/1qhIu2Y4dlIuwsTvoYppfrr4bIZW8S
	 PR31fuOm7bNiw==
Message-ID: <5ddbd21e-e880-1a58-a3e5-459376ccd4b3@free.fr>
Date: Wed, 29 Mar 2023 02:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] Fix G12 PMU conflict
Content-Language: fr, en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Will Deacon <will@kernel.org>
Cc: Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <e2026259-3372-d1ee-d0aa-1376361a71cb@free.fr>
 <688713c0-c855-030e-50d4-d4ac4f1c5104@free.fr>
 <529600f6-ea25-c507-5758-56658c137306@free.fr>
In-Reply-To: <529600f6-ea25-c507-5758-56658c137306@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_170213_883470_0FF41A19 
X-CRM114-Status: UNSURE (   6.11  )
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

On 27/03/2023 17:52, Marc Gonzalez wrote:

> [  222.699138] SError Interrupt on CPU2, code 0x00000000bf000000 -- SError
> [  222.699155] CPU: 2 PID: 159 Comm: perf Not tainted 6.2.0 #451
> [  222.699162] Hardware name: SEI Robotics SEI510 (DT)
> [  222.699165] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  222.699170] pc : __arch_copy_from_user+0x1c8/0x230
> [  222.699184] lr : copy_page_from_iter_atomic+0x1d4/0x5d0
> [  222.699192] sp : ffff80000a313b50
> [  222.699195] x29: ffff80000a313b50 x28: 0000000000000000 x27: 0000000000001000
> [  222.699205] x26: ffff80000877da80 x25: ffff000000b27d00 x24: 0000000000001f90
> [  222.699213] x23: ffff000000000000 x22: 0000040000000000 x21: ffff80000a313d50
> [  222.699220] x20: ffff000005400000 x19: 0000000000001000 x18: 0000000000000000
> [  222.699227] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffa4b73f28
> [  222.699234] x14: 0000000000000000 x13: ffff80000875f3ac x12: ffff800008025714
> [  222.699241] x11: ffff800008085888 x10: ffff8000080855f4 x9 : ffff800008753188
> [  222.699247] x8 : 000000000000000f x7 : 0080000100000009 x6 : ffff0000054001a8
> [  222.699253] x5 : ffff000005401000 x4 : 0000000000000008 x3 : ffffffffffffff80
> [  222.699260] x2 : 0000000000000df8 x1 : 0000ffffa4b74100 x0 : ffff000005400000
> [  222.699270] Kernel panic - not syncing: Asynchronous SError Interrupt
> [  222.699274] CPU: 2 PID: 159 Comm: perf Not tainted 6.2.0 #451
> [  222.699279] Hardware name: SEI Robotics SEI510 (DT)
> [  222.699284] Call trace:
> [  222.699286]  dump_backtrace.part.0+0xe0/0xf0
> [  222.699298]  show_stack+0x18/0x30
> [  222.699303]  dump_stack_lvl+0x68/0x84
> [  222.699314]  dump_stack+0x18/0x34
> [  222.699319]  panic+0x184/0x344
> [  222.699327]  nmi_panic+0xac/0xb0
> [  222.699334]  arm64_serror_panic+0x6c/0x80
> [  222.699339]  do_serror+0x58/0x60
> [  222.699343]  el1h_64_error_handler+0x30/0x50
> [  222.699347]  el1h_64_error+0x64/0x68
> [  222.699351]  __arch_copy_from_user+0x1c8/0x230
> [  222.699357]  generic_perform_write+0xe8/0x1e0
> [  222.699366]  __generic_file_write_iter+0x11c/0x1b0
> [  222.699374]  generic_file_write_iter+0x78/0x110
> [  222.699380]  vfs_write+0x2b0/0x390
> [  222.699388]  ksys_write+0x68/0x100
> [  222.699394]  __arm64_sys_write+0x1c/0x30
> [  222.699400]  invoke_syscall+0x48/0x120
> [  222.699408]  el0_svc_common.constprop.0+0x44/0xf0
> [  222.699414]  do_el0_svc+0x38/0xc0
> [  222.699420]  el0_svc+0x2c/0x90
> [  222.699425]  el0t_64_sync_handler+0xb8/0xc0
> [  222.699430]  el0t_64_sync+0x190/0x194

In my (limited) experience, these types of panics are Linux
getting nuked from a more privileged context (trustzone).

And indeed, there was a typo in my device tree that disabled
one reserved-memory area. Doh!

After fixing the DT, I can run memtest=17 sucessfully, and
the perf run completes without a hitch.

Sorry for the noise.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
