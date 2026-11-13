Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD22606A323
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soSbuxZw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DPI583uF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwnLTPfd+B7JvtTKeXQR1HB5tQbBsG/rsCJgBQkCGQ4=; b=soSbuxZwW53RnIfoP2d8mXs/VI
	VXU+yDM9dF0V4uEFdu5/rzYi8ObGw0V1xiWMvPqCroPiC0sJ/5bymlBFG5ykHuNaaN5AnGf1GaqWK
	x/mh9H7gpJe6wUqQiGIwvjAnAGuYn9RWDPJwEAToPkonBX38eRTp4JMiWW045NY9gTopf9JGQVIuV
	VIgGqtL1yg/bXI+u/LV5shF5baGRqZGkWD3r7+Mo8pnqZ6rVavhYJG6wBPiCHlNHPfHUihm6tZF5N
	JegTfLKI8CLQ/l+PYgi3Roe68Q8w9XMTpuVGE48zYrud9CRQEmjjTAlrs1AmiWHpb2FiNKwLDegxG
	SUOcZadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRstB-0000000DJXC-2fq7;
	Fri, 13 Nov 2026 15:08:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRst8-0000000DJW7-3ys8
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 15:08:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15757535e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 07:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582505; x=1795187305; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=DPI583uF8duq/UbAZKRs7OnnI7mtr8V/fU15EnPZMgYq14fEKz6TbgZRVc9FclI9tN
         yc2PyJHa3wUyatUnWDFoFgqDkQb4cxHYY7gThRONW7MjrxRFgkpcd2QzvplhWt5fFzLy
         p2aKvdWbhR1Qx1mFKO5XrSjv9Jamp8Hr3nXTOREbhxzgfeE+hLiPZId5EQkzVtzJCnSg
         gaIG6uUI8RpIgB/KF3x1DznryYk0B4cpNf/nH3vSl+YRrDV7voJdFRPVSZqm6Ul4a1Eh
         z/8qVCmozXBeO8yuOulyd3rlMMSQtrpKxU33KcsaUgCgx1CUb5qDUJFbyyJl8H2LnTK/
         B51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582505; x=1795187305;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=icfw39vS4jJq5SVr9kx82+e78n6u0PPWqChL24uLNedgoNM0OSNn3XS5e8A/DgKuyv
         KJ8REsgy47JCU4N2OqjF3s22eOUaDBSIukeEoTrPug+zMnFKrubHB2xVE0h3fbp2Qmwg
         vj9JOLvaSLymHYrMwzhGTNNYvYuXdxiQ2hN0K0r3cmNnV3FKqPhjTKU4MHlv+PG6yBv5
         zzxSyzIRPDvOuo2K7Mv+nHVo+jjoHEzNupZ2BGvpcy33mkhIGOyliGX8FFXhJB9TY0ZM
         3ihYEg2SMKUDvtMoKjAzYNtTodK+aG6hShx9qW9ylOx5+Lhgin+EM3i5adfCnXe3UM5K
         7dfg==
X-Forwarded-Encrypted: i=1; AL+hErHksQw+qoHDLzpwSYZoHEwUpXvCx9oBdqvgeYUYbh3IzEEICBpB4y9vzeqdy2gmVnPirDazbfAp07aQ57n5@lists.infradead.org
X-Gm-Message-State: APuU4Z8ERSVm8UivVgg0sdXijN2o4dRd8IahqyMABeDlx0ldjY9qzSlA
	Uio+zbMcLWMj5Mhwt645TM+UIMnEb/2mIq8GO6GNGuOsuTXqig2rU8SGmYPDtMLx3GE=
X-Gm-Gg: AYBFou1CL1YEBUo1tmwBGLVCkLB3+gyT/Fyg4n5ch+/o6no+F2ng0DaNTh//cqB5r9f
	mZ8Cgcml8jQNCCz18TFFjwqI0wRYqg+31qb7f4Vgc4jDsanY+kNw18rnd2YoqyPL447fxKNbGvY
	jypffc+ja9Ek945Khjt4fwU1iTpvS1QbD+ZxrAFC2Xf4B6IOOyGFGeS8QSHGNQiaMLW/4Dx9NiA
	qUzZ1Ec+/5MRdv3QR8o13ffjYEoT5B9gkdC80QA+xwRwLpQg62hLh172CbT+CXMdkJCJdvKaGiR
	W4qOgZW1QhszkdrB+YXXFTpSgPRDhEt7/u1tdgH+npu4IEeCRdytfUUfhPhDtPRAbPR/aQlh4Yv
	tGiuC0vmLohzambsOoug+hSG94torRwxJR7UOFMhKDoeBCNiiNx1i7NJzDZ+P2oWPKUIWBApxZr
	BHhvXWhYZeAASX9G1hDxycYiPU34TUdorID0tyAnowUXptRwrtLI1qQ5SuCSkWtlmnpx1cBrxpz
	sPgYTXzpV4g+yozYbGnDJico5kwuI3m7TfMMJDLb7Bt0T3jv3ErEeTC8g1rVDPmw5/N2OoPTQMW
	OAYRA3M/u0or20/LElw8pGvf2Kp+2vqE+xXWLaS+GIS0xXeb
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr41192715e9.23.1794582505212;
        Fri, 13 Nov 2026 07:08:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm20860945e9.12.2026.11.13.07.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Christian Hewitt
 <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when
 spinlock is held
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
Date: Fri, 13 Nov 2026 16:08:23 +0100
Message-ID: <1j33t422hk.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_070827_015392_B5BA121D 
X-CRM114-Status: GOOD (  13.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ven. 13 nov. 2026 at 14:56, Valerio Setti <vsetti@baylibre.com> wrote:

> dai_links in the gx-card are atomic which means that the DAI trigger
> callback is called with the spinlock held. This means that usage of
> potentially sleeping functions (e.g. mutexes) is not allowed here.
>
> 'snd_soc_component_write'/'snd_soc_component_read' take the component's
> io_mutex on entry.
>
> Replace usage of these functions in:
> - 'aiu_fifo_i2s_trigger'
> - 'fifo_spdif_trigger'
> - 'aiu_fifo_pointer'
>
> This is meant to resolve the following runtime bug found while starting I2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
>   [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
>   [   21.086145] Call trace:
>   [   21.086149]  show_stack+0x20/0x40 (C)
>   [   21.086160]  dump_stack_lvl+0x6c/0x98
>   [   21.086171]  dump_stack+0x18/0x24
>   [   21.086179]  __might_resched+0x160/0x230
>   [   21.086189]  __might_sleep+0x50/0x90
>   [   21.086197]  __mutex_lock+0x64/0x8a0
>   [   21.086206]  mutex_lock_nested+0x2c/0x40
>   [   21.086215]  snd_soc_component_write+0x38/0x80
>   [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
>   [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
>   [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
>   [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
>   [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
>   [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
>   [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
>   [   21.086296]  snd_pcm_do_start+0x4c/0x80
>   [   21.086307]  snd_pcm_action_single+0x50/0xc0
>   [   21.086316]  snd_pcm_action+0x88/0xb0
>   [   21.086325]  snd_pcm_start+0x2c/0x40
>   [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
>   [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
>   [   21.086356]  snd_pcm_ioctl+0x3c/0x60
>   [   21.086366]  __arm64_sys_ioctl+0xac/0x110
>   [   21.086376]  invoke_syscall+0x5c/0x120
>   [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
>   [   21.086395]  do_el0_svc+0x24/0x40
>   [   21.086404]  el0_svc+0x54/0x3b0
>   [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
>   [   21.086424]  el0t_64_sync+0x198/0x1a0
>
> Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
> intentionally ignored. Regmap is MMIO here and read failures shouldn't
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
