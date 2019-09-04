Return-Path: <SRS0=DSrP=W7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20691C3A5A8
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 18:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8CB22CEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 18:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAHhyjUf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtZenjjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8CB22CEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isHsVH+44Ge0GiAjLzgI1wh+ZuXqpA995C9IoRYFqG0=; b=PAHhyjUf3/I6kI
	zqrlE62vMLJZg8wPRa0OJ/QOu9LgBBKtZhuqttzSxhom/1qh7q6L2SCuleBkJNkfBgqA7miZw/3dL
	UNI5hX0g0o9PabBHQ8S+j4AZuizBKqWShAVEwZsPMxixkQjV0dhK5+TTueqJGUuSUts+q0uwSmTr/
	/f/Uwh+Dx6HwbmA6/eb6+eQo+5Q7V6BVCRPkKFV6x2IG+/JHKG37uIGH6J/7qvC4c2nnCnnqWkqst
	2K0tSZiKF7YYloHgKM89lWqOGq2v4l8uAxeDPSv0JC8ZBGMslT5N3SAMF257YpewO9/NjYG10jm2P
	zyjDBwa0pwHYbtOOnnlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5ZZU-0003C4-4E; Wed, 04 Sep 2019 17:59:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5ZZR-0003BN-4y
 for linux-amlogic@lists.infradead.org; Wed, 04 Sep 2019 17:59:54 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 743DF22CEA;
 Wed,  4 Sep 2019 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567619992;
 bh=B2bXI6eXgFsDNSmO81chznZP1whYX5IyKLZi4UfA7ek=;
 h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
 b=EtZenjjLlZ3DAnLkRCqez2j2Trg9Z1uF2ol5DoH4SFwbYtZiLldm6ntyaGkzlj4jd
 uYIPZRcv9c2HZbh92jeUS8TwfdPUJxgA1DrYUVMiPoD2QNtdMoGpnmZfN7YOOLNy2G
 2GN2gY/d/RTx7kyy0TT7ZXQAOjHLSk/5kd6TdYis=
MIME-Version: 1.0
In-Reply-To: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
References: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: 2nd round of updates for 5.4
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Wed, 04 Sep 2019 10:59:51 -0700
Message-Id: <20190904175952.743DF22CEA@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_105953_214950_E5D74889 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-08-26 04:54:49)
> 
> Dear clock maintainers,
> 
> Below is a request to pull another batch of Amlogic clock updates for
> v5.4. It brings reset support in the for the g12a audio controller and
> sm1 support in the main clock controller.
> 
> Cheers
> Jerome
> 
> The following changes since commit 1d97657a4794ab23b47bd9921978ddd82569fcf4:
> 
>   Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2
> 
> for you to fetch changes up to da3ceae4ec9f581a50dc0763710078f22d3bc72a:
> 
>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks (2019-08-26 11:04:54 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
