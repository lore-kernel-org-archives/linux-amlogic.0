Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA2C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGjc0VE7BbDDGqHOGfR6jJ4kaBE1ynyhu11g/yfLeWU=; b=VE9Sdjso/eQOL9
	AjLrxidyARbcdmZrTwpdCYdtWd6DHRvJVVlLcKmWs1eWhoIGQpIDxOTH/d3YYgXyp7E/lEs26fe2Q
	eoqIjrYxiD+8x3XtxcUmkTcokNNhYtS3xDfl3SSIxA52k/NNmAWEjZYbLuYKMhSpXersxyyeXWC20
	3O1wvYPSqtLovR1NEDixg69ShcTvxo0IwJMPaybvDQYSX/Y2FVKSu4arVn+XQ9hRsMT+YNs6CP8m7
	CrfjoW+9l7Su54VEiRoufBXPpw/pZNyDeDI3CUXDpgAoov1Lm4Z0/cFF0wbaeMbnOvOe/x00se1ss
	bE+JQHHWWqQazuoCpCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkGW-0000000EsLM-3yub;
	Mon, 08 Apr 2024 08:22:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkGT-0000000EsIS-2gNW
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 08:22:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rtkGC-0005va-HW; Mon, 08 Apr 2024 10:21:48 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rtkGB-00B4mH-Hy; Mon, 08 Apr 2024 10:21:47 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rtkGB-0003Lx-1e;
	Mon, 08 Apr 2024 10:21:47 +0200
Message-ID: <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>, Jan Dakinevich
	 <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Mon, 08 Apr 2024 10:21:47 +0200
In-Reply-To: <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
	 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
	 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
	 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_012205_723205_318F5BC8 
X-CRM114-Status: GOOD (  24.30  )
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

On So, 2024-04-07 at 19:39 -0700, Stephen Boyd wrote:
> Quoting Jerome Brunet (2024-04-02 07:52:38)
> > 
> > On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> > 
> > > This code will by reused by A1 SoC.
> > 
> > Could expand a bit please ?
> > 
> > > 
> > > Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> > 
> > In general, I like the idea.
> > 
> > We do have a couple a reset registers lost in middle of clocks and this
> > change makes it possible to re-use the code instead duplicating it.
> > 
> > The exported function would be used by audio clock controllers, but the
> > module created would be purely about reset.
> > 
> > One may wonder how it ended up in the clock tree, especially since the
> > kernel as a reset tree too.
> > 
> > I'm not sure if this should move to the reset framework or if it would
> > be an unnecessary churn. Stephen, Philipp, do you have an opinion on
> > this ?
> > 
> 
> I'd prefer it be made into an auxiliary device and the driver put in
> drivers/reset/ so we can keep reset code in the reset directory.

Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
starfive-jh7110 drivers are examples of this.

> The auxiliary device creation function can also be in the
> drivers/reset/ directory so that the clk driver calls some function
> to create and register the device.

I'm undecided about this, do you think mpfs_reset_controller_register()
and jh7110_reset_controller_register() should rather live with the
reset aux drivers in drivers/reset/ ?

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
