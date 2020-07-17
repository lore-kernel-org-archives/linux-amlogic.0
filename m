Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED1EC433EB
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 15:40:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F18A208C7
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 15:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UExEPAko";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wCWypbZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F18A208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq0Wjh40onpbvhJGkDhCWrO0RDIlnPgL6ypf22sysvU=; b=UExEPAkos7wsDUWGoeUTbZR7uj
	zp7g3zxNXWy06pQ4+Hw9CxkEu/R08Sg0/YJMPW74CIKRzw6ElZBl1pjlbU/hZXdChokpwBoGT5naZ
	2wfNYmG08ma+mHvJjKXv+0/srWIFBx9iyJ3SM6DKfZK/I4LqRd65abcThpXbH64yzlYgkF2H8k+Jz
	9bzFaj2cCSB58Psw48nNaHejzDr6ucWqG8gWB6bTt5BJA1Wr+Fbq6WDfSydC0NQUicVMiLZYLyiSB
	EAIG5rk94dA1u9TcypGD8TOIMiU6pmiNm/tbq/Z6EcNLFZg70J8eprrh9R1FmmCx3D5YF9Zc059Qm
	rbjVoVTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwST3-00049v-0x; Fri, 17 Jul 2020 15:40:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwST0-000492-WB; Fri, 17 Jul 2020 15:40:07 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3F3207DD;
 Fri, 17 Jul 2020 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595000406;
 bh=zZZXKkoo6jRo9cnEc915dxdlDYp+1O3LpZF62jp+s98=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wCWypbZZF7PLbOUbetRlsgfqG3+u73IGwbKUGEPdUuXOLMwHzN+f+DZ+/7TKvV0JI
 osW7ch72As13d4Dc9d38g2D99ZnGpzLIsPL0QCWJMziadUCdX5I3S76a6fPKQjTSl/
 JB/IN903+jeKxLY/cxvXNV2tPW6jZ9+shlCQ+rTo=
Date: Fri, 17 Jul 2020 16:39:55 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, perex@perex.cz,
 khilman@baylibre.com, jbrunet@baylibre.com
In-Reply-To: <20200717082242.130627-1-jingxiangfeng@huawei.com>
References: <20200717082242.130627-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH v2] ASoC: meson: fixes the missed kfree() for
 axg_card_add_tdm_loopback
Message-Id: <159500037996.27597.11571662104348843402.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_114007_124178_7CB365FB 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jul 2020 16:22:42 +0800, Jing Xiangfeng wrote:
> axg_card_add_tdm_loopback() misses to call kfree() in an error path. We
> can use devm_kasprintf() to fix the issue, also improve maintainability.
> So use it instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback
      commit: bd054ece7d9cdd88e900df6625e951a01d9f655e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
