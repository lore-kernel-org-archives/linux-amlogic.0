Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C3C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbIVSSQlK//B4B6J+ked6e2sexbh48XrCXugilMzqew=; b=GxwAwgqvI0UDTX
	MwUfH+waJoS5Zyi8wHnTseFRn6VC0d0dnW79Rbsgy2Ci6RGar7rCq4Ircv61z9BTDuGJ4DECUobf/
	7MOGehL4ENkUS8LuutX7jKI+mMd97w5SUbkrDeq/9qFZOxHNrCi+QA9K0PUhcV7jElX1sg/A8qmU2
	9cEEWqyzwjPV871ieHbgJSLgmkRf+OT35YXYoHocjAhvs7FSS7ANTAY/onM91wVX6XNQCweeaUOiJ
	dpet/YN1uhee/E04fl49bpqYxr2EeuMHJBcQqjsWL3ucyMGw67GFWpQxCP7XdQ6bO+f50Vmpr2GVl
	snlzIrDuhfPQHLVSLYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlgC-0000000FAMW-06Kz;
	Mon, 08 Apr 2024 09:52:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlg8-0000000FALV-2h1Q;
	Mon, 08 Apr 2024 09:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A36D660F0E;
	Mon,  8 Apr 2024 09:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33413C43399;
	Mon,  8 Apr 2024 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712569959;
	bh=GuJ9Gj+u419IyvxtgxIuYGQxug7EYXq4Dcg2jFi9tQo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nikrOt6lchAeiXTOY7KStWdF/H5VAt7Vkss+si1WV89KtJr71O/CYJckUdGrB/yHT
	 v7NPaqT2H1iLrrY3CHB3mEyEEPIisGJUA2/EkfBi1aJEw1pJmr1CUiQLeywbW4wBpQ
	 OGnS+ucMK6o2npixP5tOKTPZr0Jp5BkLXPfXbdBnONsgKDuttG2E2EHFmx8Gxlc6Tv
	 0nwCHWc2JvBIAMikAVuv4a2lCTcKuxo+BIwjOyVHVA3oqkQi+U7rqyUnoalbTc1twm
	 o7k8onZI5TJ+U553u1P9oboP8b0hv9I0Q0Huzj3u0t6DhJ9cJmauMuLNGIIaryXNPS
	 El7J/j/5xgDAg==
Message-ID: <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com> <20240328010831.884487-2-jan.dakinevich@salutedevices.com> <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com> <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org> <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code to separate module
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 08 Apr 2024 02:52:37 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_025240_791044_D4EC369E 
X-CRM114-Status: GOOD (  30.54  )
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

Quoting Philipp Zabel (2024-04-08 01:21:47)
> On So, 2024-04-07 at 19:39 -0700, Stephen Boyd wrote:
> > Quoting Jerome Brunet (2024-04-02 07:52:38)
> > > 
> > > On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> > > 
> > > > This code will by reused by A1 SoC.
> > > 
> > > Could expand a bit please ?
> > > 
> > > > 
> > > > Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> > > 
> > > In general, I like the idea.
> > > 
> > > We do have a couple a reset registers lost in middle of clocks and this
> > > change makes it possible to re-use the code instead duplicating it.
> > > 
> > > The exported function would be used by audio clock controllers, but the
> > > module created would be purely about reset.
> > > 
> > > One may wonder how it ended up in the clock tree, especially since the
> > > kernel as a reset tree too.
> > > 
> > > I'm not sure if this should move to the reset framework or if it would
> > > be an unnecessary churn. Stephen, Philipp, do you have an opinion on
> > > this ?
> > > 
> > 
> > I'd prefer it be made into an auxiliary device and the driver put in
> > drivers/reset/ so we can keep reset code in the reset directory.
> 
> Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
> starfive-jh7110 drivers are examples of this.
> 
> > The auxiliary device creation function can also be in the
> > drivers/reset/ directory so that the clk driver calls some function
> > to create and register the device.
> 
> I'm undecided about this, do you think mpfs_reset_controller_register()
> and jh7110_reset_controller_register() should rather live with the
> reset aux drivers in drivers/reset/ ?

Yes, and also mpfs_reset_read() and friends. We should pass the base
iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
then move all that code into drivers/reset with some header file
exported function to call. That way the clk driver hands over the data
without having to implement half the implementation.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
