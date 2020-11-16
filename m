Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3058FC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 07:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AD722265
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 07:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTKqJTHG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="udI4quK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AD722265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9cE3n4AxzY3EHvEDAxoDh/GM6L3Ma2rbOgUS3wXBZWY=; b=rTKqJTHG+OaJ/7/aRqiKL8vws
	hFjLQxkRdVq8JcrZ9+riMjP81AM4s76Lu9BuP6R3GLAJ+5kj2zyL/SOeuW0BZtTUXVLV3q+gBS1VA
	Y63U8vnJ4FhQHw/8Lb0tWhrZ8JgjZ9MxbgA4njG3s6bbSGUsf0W5IyvArfd7HWF7ue1x+gUD/NIo2
	9SgLbjMnHQFF1nJ+w9sKAs9QZ36fPtTSx/PWEtbq4oPsFWYdKv8EfFjc60ZFKt4Y/tCnQkuj53ce2
	jdp94yusCG+T3oj8bL6WOH8D7ju7Y6aylxnDiOsOW/wN+cjrhXY7wFDvxu6aLze6KN2mY52LkcVCt
	y7f1eUE0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYry-0002nK-B8; Mon, 16 Nov 2020 07:24:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYrw-0002mm-4I; Mon, 16 Nov 2020 07:24:08 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35A7B2224F;
 Mon, 16 Nov 2020 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605511446;
 bh=ByHT9+UJJp/kgiPNG9XUcHm8nJKa853R/14JRHtTB2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udI4quK0a+CvExSFr/yBdF9HnI0RfdGMtbCQT9do8mPnzLjHUOJh8cCQzgeJjg0UQ
 IQig2N/qYYOFADmvT+3G9Rj8FPvElc5peF8juD80l2qtYXVC9Tz0mB9xUQE0zISpie
 DfpJBs2gtj7VZen1YFPY9h8Unh8GApEEH+JWb2Xg=
Date: Mon, 16 Nov 2020 12:54:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yejune Deng <yejune.deng@gmail.com>
Subject: Re: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
Message-ID: <20201116072401.GG7499@vkoul-mobl>
References: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_022408_255508_843062E3 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, repk@triplefau.lt,
 p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03-11-20, 12:37, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
