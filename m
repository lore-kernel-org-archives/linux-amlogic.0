Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F89CD128A
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 02:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFm2fEmFrK/Lnl4sszxdgYOC21PzbkoQ9fWSLoS7Qng=; b=AUmpVgF/wnKBoG
	xKOWq+HkyvU2e+8rM538ozkyRTrE7Uag1JKy2gvmrJa3dmAsYZ8FV9XrVNiE5TJjHpMh7HsIgSfyo
	9OK4yzohkd/mcdexElTMpwhqR9HDqXAp9BZR2LMg8j9GdJ47dZOaovFANo/svvGKnFE19fMI1X4mX
	3dQkCIEKtk9cBJjJas/3InFS1Y8gHZK8bG/jIvYn672fdR982iaSwxAdfdo9W9MPFDA77jcuXzBi4
	Awd5iA06s5U/tNse7IeEMVuAhC+ugWAISe8/h7VDsOOme9Kjier29FqmAXcHPA5csQHepLOuAcipb
	AxP3i6cDTAkRvyO5Xk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtev6-0000000E4Di-18Zx;
	Mon, 08 Apr 2024 02:39:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtev3-0000000E4C8-0Y6s;
	Mon, 08 Apr 2024 02:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53401CE0B7C;
	Mon,  8 Apr 2024 02:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A329C433C7;
	Mon,  8 Apr 2024 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712543972;
	bh=WiV1uZ4O5oZWV8uovYZMAUBP4HUdX6mv+zU4qJDlZYg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sqUV259xrrRSDDv2FEoC8m5pPA8WfITE82/FYzxSYFNJ22TTpgk+XFvCk2G9GWiGJ
	 mh3XIJN0rXm+ipKR9nKjUIKStbuIqnONgdlV13Ezyv+vFY0983Tj6b27Eka0BICoy3
	 ojwB1b+5EJwWbx7uWMcGCcYgaLy/QEK2m3R97xzxhyV8FdKRnTfXPWdxtKSa6eDOEM
	 y+oHMDOHE5nJv/Wv3y/4hCx+kuGPZ6MlocIlTUN1L+d491n3e+Cg7gemxhBa5wogjy
	 5SXG649had+fGF/8tSK06CaasyXBD/gBaKEfsrXd0G10/KDxs/vHJ9yyuYk8sgwP1e
	 vqg0Y/AuLp3aw==
Message-ID: <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com> <20240328010831.884487-2-jan.dakinevich@salutedevices.com> <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code to separate module
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Sun, 07 Apr 2024 19:39:30 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_193937_379147_88555101 
X-CRM114-Status: GOOD (  19.43  )
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

Quoting Jerome Brunet (2024-04-02 07:52:38)
> 
> On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
> > This code will by reused by A1 SoC.
> 
> Could expand a bit please ?
> 
> >
> > Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> 
> In general, I like the idea.
> 
> We do have a couple a reset registers lost in middle of clocks and this
> change makes it possible to re-use the code instead duplicating it.
> 
> The exported function would be used by audio clock controllers, but the
> module created would be purely about reset.
> 
> One may wonder how it ended up in the clock tree, especially since the
> kernel as a reset tree too.
> 
> I'm not sure if this should move to the reset framework or if it would
> be an unnecessary churn. Stephen, Philipp, do you have an opinion on
> this ?
> 

I'd prefer it be made into an auxiliary device and the driver put in
drivers/reset/ so we can keep reset code in the reset directory. The
auxiliary device creation function can also be in the drivers/reset/
directory so that the clk driver calls some function to create and
register the device.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
