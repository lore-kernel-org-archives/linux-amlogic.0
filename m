Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB362C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Dec 2021 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzmc2Kc3E61J0cGogc6JD1Z8Bbb4Vtt6/Rv2+amzvYE=; b=Ma7J361WqWle0h
	iKIHpnBceJ0/kCfeQ+mzeDJJvmWW7RUzcM+BcvI9dRoDmAkpwbJ0Zts3gturp2sAyp30AjyHthHYp
	Red1cyMn4YWzm8InuYGo8Yv/dFgRkuzVRV+v3OBJ+MnYKVOB8c8JwdzJjPheoVkN/i8CJGLHsLoIh
	pq7E8IyTEO150slWndZKRTxQWSHK9Z8mFMY4MlDET+zrTZmV4YHgnzNoOtM1OYLMtXg3OwCmuf4WQ
	FJAMMYWr6jgW2c0BbNp1jzRhAamSYwjYFZXREnL8Oq/VhzCVi9cYHgFls0e9PO9m/lgEoZRac3LFA
	EZxzpFHBLin2Ls8t8PYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ReL-002Hgn-C2; Wed, 29 Dec 2021 05:37:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ReH-002Hec-Lx
 for linux-amlogic@lists.infradead.org; Wed, 29 Dec 2021 05:37:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD763B81258;
 Wed, 29 Dec 2021 05:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93379C36AEA;
 Wed, 29 Dec 2021 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640756234;
 bh=u7HeXVQ7X6/ggTFYD04OE8L886f8vPPm3iyEK/btKOk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qySJByNF6NoGa74uHesJ8nFYeVw4WpkckfEyPAVF2U+xvLCQqudw29h9g39626Ya8
 jwpCKqIYAki851dSXZzd1EG206cYld33zcjfaNGSVRLluklDEkIa118mAIxuY6NIJb
 tDt+mAebrBLhWMnim9W1JJPTP77hVTfIrISeepDea/ktq7aAvqlgb7O+0qBLCdlLwU
 iM9CfSSXoHDSc4mwZ334Klwnjq9Vef5P6CU9zMOfmfOlo7902RylCvcSCP2pF3XRmz
 GA/fXlXy70t7bv0Syimyy58Lpn46ahWRdBXODj3uNKXj/vZs/+VWkembMUYtkAl+F1
 eLvL4KGkdFJzQ==
MIME-Version: 1.0
In-Reply-To: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
References: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic update for v5.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 28 Dec 2021 21:37:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20211229053714.93379C36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_213717_881084_7046184C 
X-CRM114-Status: UNSURE (   9.47  )
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

Quoting Jerome Brunet (2021-12-24 06:27:48)
> 
> Hi Stephen,
> 
> Here is the amlogic clock update for v5.17. Just a single fix this time
> Please pull
> 
> Happy Holidays
> Cheers
> 
> Jerome
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.17-1
> 
> for you to fetch changes up to ff54938dd190d85f740b9bf9dde59b550936b621:
> 
>   clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB (2021-11-30 10:28:52 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
