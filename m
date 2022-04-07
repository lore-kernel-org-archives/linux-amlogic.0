Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BDBC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JwlOfJjv0aP8WQmpNOtMN4Utg/dZ9wQZ1q+53IKsQg=; b=DLZACEJUfPg/Pr
	7lhlPjTXwC7pVAgWWm8wkx6NPEohsVm5D2I1YpD2n1cgMfuTHDQ4pVoB+RNpP4VfQPDx3invMoPqq
	hsbGZgrnhvXHOWhpDHhzSaPlVLRZBVbmmAE4iJhjR5+kQEI83aPFRRbu29Vt37lK67ohz5jMjSj4M
	YmZw07Z44eof3sswhpbr8Ul1SvZR9x0DPaK+KovWaR+JopZS/PIvYwKCuKiG1/jdynimdRDp96rls
	Y1Tl6203wkIyoAe7/whpLAAvhYsUAGs9tUmEKHaJU6UCY28C6y1LIaGxTx03psH61l9bwQ693qV/U
	EAFLfLRSfIqNxE+1/fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncP1j-00B7Y2-Gh; Thu, 07 Apr 2022 10:06:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncP1I-00B7N9-GQ
 for linux-amlogic@lists.infradead.org; Thu, 07 Apr 2022 10:05:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncP1C-0001nx-Fo; Thu, 07 Apr 2022 12:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncP17-001aOp-Fq; Thu, 07 Apr 2022 12:05:28 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncP14-0004Zo-RV; Thu, 07 Apr 2022 12:05:26 +0200
Message-ID: <bf62ecb64b6c2667ee22d0ecbf11c53802caa7a1.camel@pengutronix.de>
Subject: Re: [PATCH] clk: meson: meson8b: fix a memory leak in
 meson8b_clkc_init_common()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: xkernel.wang@foxmail.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 07 Apr 2022 12:05:26 +0200
In-Reply-To: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
References: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_030540_587864_52C8F1F3 
X-CRM114-Status: UNSURE (   7.61  )
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

On Do, 2022-04-07 at 17:28 +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> `rstc` is allocated by kzalloc() for resetting the controller register,
> however, if reset_controller_register() fails, `rstc` is not properly
> released before returning, which can lead to memory leak.
> Therefore, this patch adds kfree(rstc) on the above error path.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
