Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BA5C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 17:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B3EE60F92
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 17:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B3EE60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kw2iPRiLpdyWdzMeSpkRcpIUfcmgyt70rogiZmoLM2w=; b=H2K11uh9cS45dM
	ukEh01il6Q7RPdF0J4MglMQFcYAr06qilC5b1tFuMPoLU5Xrqyw5+dX+7RwisxyuvArhQjCLDQWev
	kecIi/TfSbJMgOoOq5MXYtC2Fazlp8SvVtJtWgL2wA/xs+SnzfN+FrU0LphoabnqJC/PlgJB34OOe
	SFFBFuPxBx4TN4mQCgl0Ibl6NGVDrC1YffIUuz1pHLH6IzX8KIYmVkRSR6UNVpwiyabdhVv35e6Ce
	hc0L1KGvmoQBse0kDZjN6EYL+OmjLo5OrXC9U4lLPCtWkzeaGAPTIYbnt9TP/+EiFsWYGLmNVmH7i
	M7NKeOKMjacQ1LbKicEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUuiR-003fJn-FZ; Mon, 27 Sep 2021 17:46:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUuiK-003fIZ-Oi; Mon, 27 Sep 2021 17:46:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3BA660F9B;
 Mon, 27 Sep 2021 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764812;
 bh=y7MVEonZhyoAS103sBSwF6KBKvSkyh11DLljvMwjBlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VaHB85phjyfNSC/aTep5QKSmJCgisA3HoVaGEVR967RXmAxbKNjoXBGmA7Fp6kjRy
 txjHIhJYIIiJApigLTlI5wgGFqdzYSxq6BB9YRtNbf6R6mRwAQrUGK9TaxCpAq6isZ
 9Pu1PrOyLKyJA4DvhPIiCaRQIZ41gaeTeA5mppFd63+WYYkhgSYxabUlI3IS0UAxG/
 AVYIDbIk/ASDTmwiGF00fwI8W2PLrhBC7sM/BcSkA/ba85KW3d8H3XlUrYE/3uTJUx
 GPF+h6a3Cz11mNnKh02/utgO/tB88qy739mtQl2Ug1r4zgn4XmKZPehJmQ07t3ku1+
 vwC13SpnCdZEw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCHv4] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
Date: Mon, 27 Sep 2021 18:45:21 +0100
Message-Id: <163276457918.18909.6526280333093875082.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210925173413.1019-1-linux.amoon@gmail.com>
References: <20210925173413.1019-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_104652_848424_D94C4742 
X-CRM114-Status: GOOD (  10.63  )
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

On Sat, 25 Sep 2021 17:34:12 +0000, Anand Moon wrote:
> devm_pwm_get() can return -EPROBE_DEFER if the pwm regulator is not
> ready yet. Use dev_err_probe() for pwm regulator resources
> to indicate the deferral reason when waiting for the
> resource to come up.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pwm-regulator: Make use of the helper function dev_err_probe()
      commit: e458d3f39d917770cef2ed78891349362ecd3e15

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
