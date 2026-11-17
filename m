Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B39606A334
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F6V33KNN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMYUJUxw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CO0iv90FoBVqJMqj9vf5QZG6yWNnbcnOk/jOrrQx/YE=; b=F6V33KNNZ6gXeeXrbOUa/bp2X8
	0vUUsAn8M1yJgFzm3aBlTpN0Qt3HYkEhcwinHP3uz+lqIvvr7ltqko6GkVzpUJnHAl9pbrVAyrKCu
	Yu3/FaOtyu1Sw19t3rcEp3yl8eWi3tzoUvPmrNBfhPN4KfbWnQZCjN4W0n7yd8s78nGu2YBczFpMP
	ZQz2YfGRZGFtElKbUkKUjjDvnbdROclgXZfwWlLbuFWmbWZnp/SUDn/aT06hpJNv+D9Cv7m6L+hq/
	Mh+v/W8mQ4Z194mGJVEfl81/1HZBC01ryIH++Z1RKZkM3JFTfn3Bij4wjyw6icbknFsgkp4bCO5he
	7xcRKZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJL4-00000005xYe-0CO3;
	Tue, 17 Nov 2026 13:35:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJL2-00000005xYU-3Bcw
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 13:35:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4626B43BA8;
	Tue, 17 Nov 2026 13:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6C2D91F000C5;
	Tue, 17 Nov 2026 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922508;
	bh=ioA43pJHcDJQL8W7VvWm4+CiwKJ1zY7tj7ZN6Wqk5cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMYUJUxwV3D3h7O6WftIBGjTr+39NhtyC9CFwIximBe8cUa2/9uJe/qc/n5Rk8Ze+
	 maEFKoZ6vfLi6KHduZDmxqIk/j4OqtlebeG3zquyHhgR82OPzXHVwk7UbK+WoD+v+L
	 m61h+VgjWkU0IS03f1wbbCRReTD0YQyeGXS8fmqMF9FEAjfJn8HkE0whcU51ZTWzGu
	 jYAbvI5xz6QmfX18oN/PdFlluZ8U/w7JQG2Hna7vkaye5SzcLO0IEfW+/lCfPC3APH
	 5aMLQa/sEY09iCzj4ob1EXD8r/6bR5nFWn0Io5z0wO6aLSC4sVyKqEg1dDYj/nJZzj
	 IQWQDrA+EnYVQ==
Date: Tue, 17 Nov 2026 14:35:03 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on
 ODROID-HC4 fail with -EPERM
Message-ID: <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
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

I was wondering why does the second user even arrive in
gpio_shared_proxy_direction_output() at all when it should take the
emulation path. I think the issue is with the proxy driver not
propagating the -ENOTSUPP error code in set_config(). While I did author
that code, I have no idea why I did it and if I even had any reason at
all. Could you try the following diff?

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index cb593192076f..8197ebb5f9a2 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -186,7 +186,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 	}

 	ret = gpiod_set_config(desc, cfg);
-	if (ret && ret != -ENOTSUPP)
+	if (ret)
 		return ret;

 	shared_desc->cfg = cfg;

With it, both users should take the simulation route.

Thanks,
Bartosz

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
