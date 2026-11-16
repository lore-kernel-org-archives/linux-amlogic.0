Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B53606A332
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4lR2cJX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7nzFOja
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QkaOUH4ODkzyl6lJruvafh/KOg03VxfnkbNEY7Wly10=; b=o4lR2cJXJtTDAZ4+a4tKZhWjaj
	hPByEkvkl34WoAONFaogn+w7IhfowHVcxqgEiM2Ryq9rP4qwvm6vdCRMyGHKo2IWXLHVZ2z6ri8Qj
	arK1WlMlywW9Q6Jk4XC48OzxVqzdEzZPVXk8YXPQP9tpTd40oes3SyDpI+iDxHgN8FKNem3qgjCng
	QZd36Tgt6djsp+Ex6YQyFPof+Ya1j9rWjWJ8eJKY2VRCzLwiIu9bF+Bwjh4fSMMgn3ivqRGSAHimQ
	rhOltdpI9I5R4XVO4c9u7juD64bqCcQXYHTWjW9dm2KHXCTQbE8Ky/9vUjgIwt1lcb9EjN2orc7wj
	7wWBiFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyiU-000000035hP-3Wdm;
	Mon, 16 Nov 2026 15:33:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyiU-000000035gy-1fbu
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 15:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 87A1B62222;
	Mon, 16 Nov 2026 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9DE271F000C4;
	Mon, 16 Nov 2026 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843237;
	bh=txiBc1fIIjRnduaYGvsAlilBrNnqO5uznZYol0hR9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7nzFOjar1/kHRWJinkN0E8SfgvFUbj92nx4bS11snDTHcT34SvS6HlhEbfpepyjB
	 cr3f0SeOdWKxQ9erxAdMv8iIZpy1XaYmpmNEl9CgmlWWAUadQWPgyHIiKnyu03iT6t
	 7rUa78zVA/XDdgKquOsEJeD2CCFZyeJVEHzR5n2R9E/HsdDCcBKcGibo83B3LfIM0m
	 qVT5lfiq3uv0/TC2HI+3iMtV//QOxqOuLuUK5ggaAT0LgF9lRhw3MAjr8wT+QcawCD
	 +lUke44ZbaDzzPdNLONpqqj/FsWRKZAgnDNh+YFwYim9vs7W3QB2X+v5GkQjtwYL+p
	 Fy4tWGAUSm1bw==
Date: Mon, 16 Nov 2026 16:33:45 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on
 ODROID-HC4 fail with -EPERM
Message-ID: <ydbkylktoh57blvvgjphclostsp6jiedpbema7d6ejxqb5iwjf@h2hcyu5re4f5>
References: <20261115-hc4-gpio-shared-od-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115-hc4-gpio-shared-od-1@iav.lv>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 04:55:00AM +0200, Igor Velkov wrote:
> Since f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
> platforms"), two of the three fixed regulators sharing GPIOH_8
> (GPIO_OPEN_DRAIN) on ODROID-HC4 fail on every boot:
> 
>   reg-fixed-voltage regulator-p12v-0: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-p12v-0: error -EPERM: can't get GPIO
> 
> The first user (vcc_5v) sets the line to output high in
> gpiod_configure_flags(). Its enable then goes through
> gpio_set_open_drain_value_commit(), which emulates high by calling
> direction_input on the proxy, and the proxy switches the shared line to
> input. The next users hit "Shared GPIO's direction already set to input,
> refusing to change" in gpio_shared_proxy_direction_output(). Stack from
> trace_trigger=gpio_direction.stacktrace:
> 
>   gpiod_direction_input <- gpio_shared_proxy_direction_input
>   <- gpio_set_open_drain_value_commit <- gpiod_set_value_cansleep
>   <- _regulator_do_enable <- set_machine_constraints <- regulator_register
> 
> Armbian v7.4-rc2 (its patches don't touch gpiolib or these nodes); same
> with the five shared-proxy fixes from the v7.4-rc3 pull. The winner
> depends on probe order: without the fixes vcc_5v lost in 2 of 4 boots,
> leaving the SD card unpowered and no rootfs.
>

Thanks for the report, I'll send a fix proposal for you to test
tomorrow.

Bartosz

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
