Return-Path: <SRS0=wHyG=NH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A38CC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 20:47:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A34604D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 20:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4A34604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXv/CpVbXvG3c9QJmwLlmV5j9YfKAh1ZL9+FtcCMtU0=; b=aCXKw8UILVgRYO
	f1rvw4xypYPBLTeejAQwo7PbToACG5g9t4x5cta9IN8i1hZuzsXbFS0Nl9JqXIOZ1hpq89jv5bXS7
	iqkOcJTXbvgVh6IL86sZSiFdxAr5OKz9TV/QKteWr8xSQdv+F+mIp2fCIXqhaA2NtsmIidZ7wKMrN
	1wISjpeM5zB5EwCGwlLuLbeNA3lJ6nOU7+HvhKoytZFq5gTAuDr0hjXnk3CpBhQkIcHPqH6BildDy
	RDH0DDbERECSnuz6jO3eImXKLb1X/WpiN7foLieXFvKF7kDM1HJ8xd+wxseeNt1P6nuAjzh9B3bzM
	xWcQaJuly6qviYydK3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjVn-000Ggd-IN; Mon, 16 Aug 2021 20:47:11 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjVh-000Gfp-6q; Mon, 16 Aug 2021 20:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=wM7NLhhRKCLXOkWiW3ssYsySfg/tolxoL+fTJnsYsLY=; b=PAGyO4xvb/aGG1Id4V6YzW2DPE
 i5NFgO9AZHheDLl8HosrJyIrImmF4yDbWK6MmnhpED3MHgUSbTm+FBEx7NDDDaYhunpSN6CSvLcH+
 MSkeeD2SJ/eoBtCO/6fim73b+vpnPcJSZEbN98RclZazMqaRuwSTBRNfunZpnBeU2YMA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mFjVU-000R9t-6C; Mon, 16 Aug 2021 22:46:52 +0200
Date: Mon, 16 Aug 2021 22:46:52 +0200
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
Message-ID: <YRrOvJBLp3WreEUf@lunn.ch>
References: <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_134705_296173_D8BB5474 
X-CRM114-Status: UNSURE (   8.67  )
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

> Not that I'm aware of. Andrew added a "Reviewed-by" to all 3 of my
> proper fix patches. I didn't think I needed to send any newer patches.
> Is there some reason you that I needed to?
> https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t

https://patchwork.kernel.org/project/netdevbpf/list/?series=&submitter=&state=*&q=net%3A+mdio-mux%3A+Delete+unnecessary+devm_kfree&archive=both&delegate=

State Changes Requested. I guess because you got the subject wrong.

With netdev, if it has not been merged within three days, you probably
need to resubmit.

     Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
