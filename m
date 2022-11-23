Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7FC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 01:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMSXbd5OiEBDgfUiPqhGHws5eNsOVhz/xzMx9WhtGd0=; b=W+2p4BcyDE4mCy
	qqMm0UjWA6KkzKpgZ1XL1ykPQ/4gyg0RH711SZMx+jvz8X1sjcD6pZnVG3Kkofz2ZFl5zmpY8/d9Q
	iX9okUa+dYfj8b4yWq6aiRkWJww63svk7oGWrgcek9fo8FyQToTP9k1i46Mg/8BW+84le59A2h3lf
	7ozZnGf3xyvh+QiOowhhwRSe7OYMo+sEdj/Gw/1Y5NHNGBqRjRPWNXD7JXWOhDjp89qEfZLL7+FiU
	fCOXFYV/zYqR5dou5KdcluAo9ZnZcDzn3boy4dD6ZhkYl4WQN/dkjR/cHgveRpCK+SaH3n/w4o4SE
	nj81qFibEJUQItCGxeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxew9-00CmYs-ET; Wed, 23 Nov 2022 01:52:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxew7-00CmWk-DY; Wed, 23 Nov 2022 01:52:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDED1B81DDD;
	Wed, 23 Nov 2022 01:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F839C433D6;
	Wed, 23 Nov 2022 01:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669168344;
	bh=dTA0Ua0yEjDRaEG6ZxMKIqle9mnBNl2ZpQuwd5Bx88g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mCyRDXCG9YB364voD4uLV7TbJ1zVps9MntGPHH4g0extA883uE4AEEcybirjSVbMD
	 WxKOMzbtow5+8oSIO/ek7EPyZjf/9r9NembrNDsSWiOoHrfUNfvGmdWpFw8Yy30Jbg
	 3iF1aVcThk3r6Lme3oVP+nzDpckIsLhEUdYt6YiMlwK8pKz+D59lax2WamQ4+6QSFB
	 rL2FgQlgO9RcoYJ1drnyvlab7ra0sEDuijwS67m8SY0I+U9S02CW4PixRzg8ruY3sO
	 uT3pXTqEzjaN0dQSEge6Is3l0T/ebPNORfo7KPMqSbs9KFmM8llwBLdPCo8YlQvxkH
	 WpW1nwnRJj45g==
MIME-Version: 1.0
In-Reply-To: <12dd5cb49efa7714f8e0389e4c7b3bc829e8a90e.1668289299.git.christophe.jaillet@wanadoo.fr>
References: <12dd5cb49efa7714f8e0389e4c7b3bc829e8a90e.1668289299.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: Remove a useless include
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Heiko Stuebner <heiko@sntech.de>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 22 Nov 2022 17:52:22 -0800
User-Agent: alot/0.10
Message-Id: <20221123015224.6F839C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_175227_655233_71C38707 
X-CRM114-Status: UNSURE (   6.81  )
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

Quoting Christophe JAILLET (2022-11-12 13:43:03)
> <linux/rational.h> is not needed for these drivers. Remove the
> corresponding #include.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
