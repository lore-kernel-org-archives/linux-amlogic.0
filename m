Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF78C2F3A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 13:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D149620861
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 13:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCSVzr3H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCqnMUG4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D149620861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiPEH33G1tAxID9tJ7nxJWoUX26AB4Yk3YTC1Aepw9I=; b=kCSVzr3HqSJqWt
	k9Wxd6dFr72B7AZ2rWaJD4HEkco6SxZp/o9fJI606YmumfS2BMijSE2Ah3xnciNCeuVChN2sMpktm
	ws04QBVwLerPPfkxnZUvp4JFuescirhsaU2VsJdS3ThkzpXMAZZz86BuSRrehq/wpCJeZwCSAFRuq
	UI9l+u62YTucVyBQ9hn5Kb1IeLUW1n/PjS8qpYnFuz1nqUpXeVQ0XP4Gl8Ty0N+bUZganKK1Nwatc
	0ze9Wmxjk6Wt7ZnIJFabLcZDzgVQ0OCeRNOy05WOLrd19mdiNFUPRUt6Zl9cwEYAMj1jh9MyG44wA
	W1ai2SSifF7+3XXeNO5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gla1R-0003TX-OY; Mon, 21 Jan 2019 13:53:53 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gla1P-0003TA-4I
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 13:53:52 +0000
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so17598712lja.5
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uvwMtOBefKiecEgPN1K7+ULAO0f6k62sCRvhuaU6xuM=;
 b=DCqnMUG4+mbnEDH0/k1Z6kvK1k4vJqR+bOsS49uTMViKUyoDwi0ImRcd6gSttUECOz
 +sM81lipbfjY96pbhqwImnHK3OtbqtRueVpGkJ6+lTF2fFsuCbAe+NxcKFoNYtpKOO+S
 YhjUH3GhZVXrOLMoRusrUnEzBp6YPGVFGipy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uvwMtOBefKiecEgPN1K7+ULAO0f6k62sCRvhuaU6xuM=;
 b=Id6nZsUWaAqixkxLfMAo1Y4xYMfxYbogg4t+0l6cOp1CdOKQqNbGPgmPAotjObnZ6U
 AuaCPl/vqCYVRcB2A7o1PrpyJ2F7UXgt2awAMCyrRDu7pTymewPXGdNd05UI/b2XOHii
 taWdLXlQMWywN3aA94oqWOTCO0CJGf5UYxZaNXgZGTBgK1I4/g4vt/oiF/LjUE4lyvXS
 hYcf3lR41I7lR2n9w0JL+HPvfVq4H2YGcMSIm2J4sSMqdwu5Wwi084fb8FiZcAuYO51d
 5p2p8BvK/zXWxFeUjDbaWmljYmcw5+uZoO1mZnKzmBo3I16agKWM09D6HhZzN3fqy20J
 JN6Q==
X-Gm-Message-State: AJcUukd3tD/DQQlQWx10gdD5oSF5QWXGPnJmvfkT6O87ReOxGAjhg6cX
 ZuyGl6V2SlbbnUGIjQVBgU6BGMBBUvGYYA5MjP2Eeg==
X-Google-Smtp-Source: ALg8bN6b3YwuAKS/hc20afqCPVNjhr7x2aAiaervwjhERUz4wesjKyMNmb5iyooHGBwtMC5W+kYqfh6gsHkZIiC9pds=
X-Received: by 2002:a2e:9e16:: with SMTP id
 e22-v6mr17858162ljk.4.1548078829175; 
 Mon, 21 Jan 2019 05:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20190117102315.1833-1-jbrunet@baylibre.com>
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Jan 2019 14:53:36 +0100
Message-ID: <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_055351_175817_E43F02FD 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset fixes the initial pinctrl support added for th g12a SoC
> family, which is mainly around the register regions claimed by the
> driver.
>
> Linus, would it possible for you to provide a tag with these changes to
> Kevin ?

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes

> ATM, we can only use the devices for which the pinmux is already set by
> the bootloader. Enabling the broken pinctrl driver could cause regressions
> in kernelCI. Having a tag, would allow us to start using pinctrl on this
> SoC in this cycle, w/o regression. It would be nice :)

When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
or next (v5.1) with these patches?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
