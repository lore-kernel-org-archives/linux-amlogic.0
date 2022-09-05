Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6459EC6FA86
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwasHJzDNAEv9L/tP8cMmDO0gXZG4jOUxTHNyw7s0Hs=; b=hR0eISfUCYFvY1
	WKMQnViqgxAuNBnRlt0nUjtejqFOesgFAYJkSWfgJdNHQC2OkJxwJqCFb3BHKiiD9DM+DAAHZfSYN
	mUYd/2nyqzN/07SGerm/eFSJm4sZzEdUlrdo8pwt07t0QgLaXxY2yfwCDOOVxq8xnuHTuQ+hNIgOE
	wPb9O8Wk6UybMa2AVcc10lR2GHZ0y4loJf7KjemksuxfZIF/vQFhomYG8tFZA9eSZDEzldQj1JDBh
	WwpCfn+ZLK6o+tdw54k5ZDdJR0xKpAZT33xXhvHJfdK2lFaZtuga1l42Qs3mcRvbPpmGjQezQryj7
	rEJKbJEMZvWZ82v9IEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7GZ-00EKOX-Ee; Mon, 05 Sep 2022 08:15:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6T2-00DEkp-BR
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 07:24:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id w5so10044270wrn.12
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7n8buRdXzg6o1F/GdFT9dcj3YEYGFr3xfD32vkhGCKY=;
        b=uA5d/Gcp1XPhcEKWgweRLcq7OH5DneF6aYvlFMYgYMlPR34omqDxaIbx98blkne+Tp
         pLwQd1erSIv5QkauZ0kDpTLwI+wkhVCpaUkdkge32NqRyitNEp/cIwsBxMidl77Ed+qr
         wz0cJOAp1RkeXU8Om2W09fb0hGWbF6f8qQiY9XH9fu1grY3gZMOp+JzAjz3r1Rx4qv/S
         sCqiUqfMWvKY14R/zJa8DzO7KUoIltS8AeFhK4795r0b3XAw2ziDa9HWJqPdYlNc4gSx
         MK5/N2koQE1Oav6fkfYHprTOZkWkDRred+M82AjrFHi4ANhMLRRAzWmozMdzO0zmrsTT
         /pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7n8buRdXzg6o1F/GdFT9dcj3YEYGFr3xfD32vkhGCKY=;
        b=iXa9Jkl7LBDK3W/3DjLlB6kf9GBpbOATTO1ipr62G6bzT7/YYbHxn3ee4sPXIgPjhQ
         6XO+q3zl+kxL3nO6q9ct9ThO0Vvy5sznBzPQw2ZOtg6jPnpaE7r3berzs3wNKHFmsCZr
         KOTnJfXG6McQmOWiM2V8IloUk7TFJ6CYPZ0S8oz9qm7ake/1bZuj8QeSJlDHZmX7Ol0q
         L8c9bKwmm3Wy3ZhVDWjcmTadESQjp4Wh71NxWUjQZtU/IC5YVF3gvoa1OW2qwlEoMsEK
         WKPIkvQ/OTTHn6Etq8EakW5O91XZ/AxAOR0PGfLlz9QGVdKuAqUBGUbqevaSKC0AObwY
         lmxg==
X-Gm-Message-State: ACgBeo2GYSJE5pcmorXmYPxt1NDOlXWfnsk/0oJHfa+Y1XcG7Ys5fkfG
	eCvau8UoXo/GwoCbi8kC1RbSTw==
X-Google-Smtp-Source: AA6agR7SozvYVinAQgkBaKXdXChxUQhWhQEelxU/En7HR3DkBqR7ehCWgFcIfgGhJ8XOyKEj37qIOQ==
X-Received: by 2002:a5d:404f:0:b0:228:6316:a42e with SMTP id w15-20020a5d404f000000b002286316a42emr3826842wrp.667.1662362662875;
        Mon, 05 Sep 2022 00:24:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003a5c7a942edsm17435366wmc.28.2022.09.05.00.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 00:24:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: martin.blumenstingl@googlemail.com,
	p.zabel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	Liang He <windhl@126.com>,
	linux-arm-kernel@lists.infradead.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()
Date: Mon,  5 Sep 2022 09:24:20 +0200
Message-Id: <166236265679.637710.16688274608933957329.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726073841.1320509-1-windhl@126.com>
References: <20220726073841.1320509-1-windhl@126.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_002424_466529_44F6E713 
X-CRM114-Status: GOOD (  10.76  )
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

Hi,

On Tue, 26 Jul 2022 15:38:41 +0800, Liang He wrote:
> We should hold the reference returned by of_get_parent() and use
> it to call of_node_put() for refcount balance.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.1/drivers)

[1/1] soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()
      https://git.kernel.org/amlogic/c/9491cff16a4996aee578adf9f41acfb1bc483df9

These changes has been applied on the intermediate git tree [1].

The v6.1/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
