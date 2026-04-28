Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E6BFF8867
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2026 03:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZG6kHJz+HX66qyo3B+B9716msWBkmCSgKUjS7NyfPc=; b=SxqMa7/S7CoPh+
	0Is5CbTrRnDb1wWLY4jmeAqoviRbmP2a+GigsfyhG4pwQPQ9bsrB0jHCIuSJZLBN54exiWDCUahPI
	gxPhQljEZxpQ8ulA73FLb/solMdCb1hd5f4Mj1KauPZurdKtq/q6RvFdZamvr0rrQOSVJEBHSrQnA
	qZjYPZ+JMfr6QdWISYGZ964/jgTcndKz3MxKqlUacFzuDf8ETMdQ9emGzwd0JbN6rubI1Tg8gdFlz
	TrgqpfaDl+ElG951omvJ9a7Bjpv8acsM5jovmSaYBsfCH0sJTW/ztkRX45Wg/c4QagiGSBYC0itox
	SWu/zyXkOhkUabURmXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZGS-00000000VQn-3N5j;
	Tue, 28 Apr 2026 03:37:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZGR-00000000VQf-02td
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Apr 2026 03:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E21260121;
	Tue, 28 Apr 2026 03:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF11C2BCAF;
	Tue, 28 Apr 2026 03:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347453;
	bh=5T1Y+3ixBP4MWH0kDoYr/M9lHLniulXzZSW89qNFyCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c44JFtfr6aWnbrcsCiw4Nr7FwtC65zZXIYAQ4STp89PfMQIId9RwdJuvdQ1gHyhib
	 poVBA4imyZeunKXNnuKcw9XWSWUiEm5H5KFKXR+FzdgCcwCEELzzlBl8dckkmbKrcI
	 rnUGmuUukw+cKEyy6kfJnAyQpyA+GzjOnbg81Hmc0zDm6d3mPPBINcdRIGjCRkp75G
	 xUWZtZO2v9QAdRtw7zRT0YMD5FkLpKPN/sp6qgxusTiTXVfzNi7C5to5fOLoDPtblt
	 2nWQdFf1noH7NNG9FHLq7Odj4waR05mMsFEy8mut2ToqiM7G9HK8RGYEmM4n6+W56e
	 tycw0NRTe7HMw==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428-amlogic-spisg-v1-1-8eecc3b446d6@gmail.com>
References: <20260428-amlogic-spisg-v1-1-8eecc3b446d6@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: initialize completion before
 requesting IRQ
Message-Id: <177733784146.324244.3020070967543229096.b4-ty@b4>
Date: Tue, 28 Apr 2026 09:57:21 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5T1Y+3ixBP4MWH0kDoYr/M9lHLniulXzZSW89qNFyCc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Ct7Y00fBSSxGtMIo2f6hSBpox9AkbyHBmpEf
 lNMp+TJH4qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafArewAKCRAk1otyXVSH
 0OPBB/97cab0SZgYSGSRAZqFAqPrBZG/DX0QTLPjd4shAFlkHIVdJyCGCrSgQwe62NJQgTUPzkH
 nziaEWkix8gTQna+f9gmoBOxDgs2WU5kQjdkyatlitcJcw59nsa3lfmqY+bEC0iekgYodBIYpQc
 KxXS8cuprYo1AiPE0OKfnQI/VGhaYBHH/KtkMYTmiXts2BZOWTvEsv48cOnHFjoy7SI2xjSNCXH
 wZnXqhjGqDtLdkHdROXTrt3AwI1XDRsjXD2oQ/AnIw7TcZUbALNgav2p64I8+0rQ4qeSQ9I86G4
 kpMQx0N7RWnnpWI/scbMthpBlBYDAGHmJe9kzGIMl4PWc81D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 28 Apr 2026 01:42:00 +0800, Felix Gu wrote:
> spi: amlogic-spisg: initialize completion before requesting IRQ

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: amlogic-spisg: initialize completion before requesting IRQ
      https://git.kernel.org/broonie/spi/c/8d0189c1ea98

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
