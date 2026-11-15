Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A17606A323
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHNjMM8d;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ScY0RC3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mfn7frH95HAjU/0Y+0E7OOYCRglA0Rse3IbVcOdc4E8=; b=xHNjMM8dysPHfK9kwPOWOTXUt2
	CVCQb9p3Vjz7dFDi57p/dRHoxLGyQp6IZgfFoHmBik7Su5MrLss4KumSgxeoJRbLhPqdNZ6DXc/HX
	y4J0sg0MZS/Jfl1e4HSJR1TQV6gD5kxvKce3VcmiAS/yGseKd94VLdvUqSQJ56G+ahDtlMGroDVoq
	diHhTl88YhYbsEC00unyvUV8M0TdfV0ifaA3CsAo1h0qsPFkkndbE2hpNObosngY/u3qSfcMYibZf
	XLY+vzFMC96ebH/tLvnB3EWl0/ZCtjyvrilYCQv6Z6oGAVyRwjcYpLXxS/994YlIdpA5u7a1U8Zab
	IBdDRNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSQI5-0000000H1Ey-0JJB;
	Sun, 15 Nov 2026 02:48:25 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSQI1-0000000H1EY-3coL
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 02:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794710890; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=LVrE22cZhBk3ivFqRSVvvHabRDpGaP404VVFyRqKHcPmnVnTtgECkS9qDZp7AJ2yqjsyYdB2zSJnQTq8jRQKeK/k1qtGZ1UIpB3FyzZPxn1bDubqp7/f8NxMM0Pcb01F1I2sGlvTgVULhjvS8ev1CFAAm1lGpuXAEbT9OSA5eG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794710890; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2umo0JJCXvLyvEoZSPmOUtOWPTh4QvDBiX7/qSnHTbg=; 
	b=kEkSugXzXkgqwKXcv70Y5PQ+6TyWxM6Adv/BJY+w8evoDiebkXKmkJgreLcG7jDlC2OKKdBIoUVp7ud4IenBWx22bLFBa2WsUutLuA86XUNBINzNC3cX4pZMas4h31JttfoGVdGl19hcg7xlfiFjM6n7Rfgx1EGkv3hKuiNHsIE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ScY0RC3NAjThsYJrvp3gIYxyyiS6+P2JdBb9J7UdAcQkKgEU2F8JnUl0cfxw0vN64KjESt3iLcXcC2bwUcFo0HI5O4b9IYWV7jfI3+QhS2PMYCAHycfC3h0qkqm9KzFOAnlEiF7EQOYLH9mOyy/3+5faKzTS8M8JbU0hxMjQ4e8=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=2umo0JJCXvLyvEoZSPmOUtOWPTh4QvDBiX7/qSnHTbg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794710888931829.3476602075157;
	Sun, 15 Nov 2026 03:48:08 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 regressions@lists.linux.dev
Subject: [REGRESSION] gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
Message-ID: <20261115-hc4-gpio-shared-od-1@iav.lv>
Date: Sun, 15 Nov 2026 04:55:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_184822_302342_22B91779 
X-CRM114-Status: UNSURE (   3.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms"), two of the three fixed regulators sharing GPIOH_8
(GPIO_OPEN_DRAIN) on ODROID-HC4 fail on every boot:

  reg-fixed-voltage regulator-p12v-0: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-p12v-0: error -EPERM: can't get GPIO

The first user (vcc_5v) sets the line to output high in
gpiod_configure_flags(). Its enable then goes through
gpio_set_open_drain_value_commit(), which emulates high by calling
direction_input on the proxy, and the proxy switches the shared line to
input. The next users hit "Shared GPIO's direction already set to input,
refusing to change" in gpio_shared_proxy_direction_output(). Stack from
trace_trigger=gpio_direction.stacktrace:

  gpiod_direction_input <- gpio_shared_proxy_direction_input
  <- gpio_set_open_drain_value_commit <- gpiod_set_value_cansleep
  <- _regulator_do_enable <- set_machine_constraints <- regulator_register

Armbian v7.4-rc2 (its patches don't touch gpiolib or these nodes); same
with the five shared-proxy fixes from the v7.4-rc3 pull. The winner
depends on probe order: without the fixes vcc_5v lost in 2 of 4 boots,
leaving the SD card unpowered and no rootfs.

#regzbot introduced: f918e3804498

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
