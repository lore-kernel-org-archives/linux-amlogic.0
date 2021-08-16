Return-Path: <SRS0=wHyG=NH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1447BC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 21:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEA560F41
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 21:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FEA560F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNxXwatvWBKyD2OdEd8+Zls/Z6ggSGaqH/QzbDbsacA=; b=YuM05x97h4MGL1
	nP+bCtthOFlNbOPYJjEaFn3UKphF9t9OGtsZLkoTKRN51eRB78JtwfRF0K0cebZvv6D7dCrZYOZC5
	9VLkp43/t3nlyYpDyXR/MUt4E8LeQn/AiyjH8WLlswqGYihvfg+/bG5vbSBDOaXj/o7V2ZS41K1KI
	HJN4Zj2fLjZ6eqD+6U69A449hZsO/uES5972hXRm2Oh0SMfwFa7+rm8IlSbPlhGxESye+MQyqXAK3
	80zRiFfnHL0rpCBbJ1Vv1uGUSMyeqy7bcMQBou6DhupWHMzL6tCNr2AemQ2IVvF4BQ73W6fAbRQdN
	EoNSSJyx0tR4KD6flntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjzm-000JfD-Tk; Mon, 16 Aug 2021 21:18:10 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjzh-000Jdr-PB; Mon, 16 Aug 2021 21:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kMWO17uroZoWE99yM+teIahXpEmXjbr7uxr0ADzSYXE=; b=D3CQoKEZpkE+iWTOSXDF/Wa3Dg
 FkFlm1lBg5bE2FfnmT524cwap7V9GWmojVuwAQ4qWZ2m5W9diaI+gAivl4A49HAtMJHPaLFzXrjRE
 FaGbLlKVlWAuL//0lxWBujKNc8hPOuV4rBHpU8k3d7djWUHQd18gEIan0lcQQMt0PCOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mFjzc-000RQB-72; Mon, 16 Aug 2021 23:18:00 +0200
Date: Mon, 16 Aug 2021 23:18:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Saravana Kannan <saravanak@google.com>
Cc: Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
Message-ID: <YRrWCC1E1nKDsx4N@lunn.ch>
References: <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
 <YRrOvJBLp3WreEUf@lunn.ch>
 <CAGETcx_Q2-7B5RpHSfDu1KB0n+pT8nkCwGsthN20QBvgePcUtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx_Q2-7B5RpHSfDu1KB0n+pT8nkCwGsthN20QBvgePcUtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_141805_860613_7B63E4D6 
X-CRM114-Status: GOOD (  15.23  )
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

On Mon, Aug 16, 2021 at 02:02:12PM -0700, Saravana Kannan wrote:
> On Mon, Aug 16, 2021 at 1:46 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Not that I'm aware of. Andrew added a "Reviewed-by" to all 3 of my
> > > proper fix patches. I didn't think I needed to send any newer patches.
> > > Is there some reason you that I needed to?
> > > https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t
> >
> > https://patchwork.kernel.org/project/netdevbpf/list/?series=&submitter=&state=*&q=net%3A+mdio-mux%3A+Delete+unnecessary+devm_kfree&archive=both&delegate=
> >
> > State Changes Requested. I guess because you got the subject wrong.
> 
> I'm assuming the prefix is wrong? What should it be? I went by looking
> at the latest commit in:
> $ git log --oneline  drivers/net/mdio/
> ac53c26433b5 net: mdiobus: withdraw fwnode_mdbiobus_register
> 
> What prefix do I need to use to be considered correct?
> net: mdio:?

https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html

and in particular:

https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html#how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
