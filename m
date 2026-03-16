Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B21F30296
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGhkrxkYxTLr8E2xPo9JwKXjqzBLLmW3bIVuOEWjxVs=; b=Y2H6xeihrCKjR4
	fqAhm+zmJpEud7hinzoQGViRxQ8nvK5NbOLPaWOB7Jy/vgBIbRknBEeJDx2McqHc4Auey7TneImkF
	30qbuH5XoaUNYEveEopmTIHQ8o4dF+lSsr2cB0xyGUpz3zKxHDjB2h/FF2SQNTgjgS9Whb2w2FM6m
	9Q89Jg7ENWmOlO/D2W2tWarVayiGACIo5xNpMnWw/EvL5xoeiQ+z/hhcPOqSA2cjtuKXh2FZbSWOX
	q9/cmnEqzjkzoLYGzU5WftvF8bUOLyaOxQcsHf8ls7oKSl2K0qbIzvQUsWil0CVMU7MLpC1BowhkY
	cV6h+FKL7dx3ZETubcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wus-000000036xx-3UEu;
	Mon, 16 Mar 2026 01:38:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuS-000000036cj-03Mf
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F97F444AB;
	Mon, 16 Mar 2026 01:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7220C19425;
	Mon, 16 Mar 2026 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625099;
	bh=ESNF40KoNoWSjpvWZpNCqLbrkWb/WsgA17BJHw+YV/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RAXedXBmClcpvNdl5F90co+yMH+sLTUWdZWIx0Vf0iIAD2i7QFd4NLrm1DdJAZOfO
	 fne4mSOeuH/JIY2prc3urG3A2N35vz5EvOCJmEjMGvi2jGN+251UD5Qy0Nu/1uMGI3
	 Ia5ik3usOGEnvpgAQsB5c6qu41rMhFnz3Gaz4663ig7riDVopRD8BhvLw/W8VpCLLc
	 CixWq5GxFoudQCs+iVPif03Les5NiObK0+sc8M6jubTlF+n63zymBmVZqC+QD2zAYO
	 civE/9D/hHLe9Sm6rszkJeuvqiEI+2CXqucjsGBAREM8H/BvdK7GYYjYOSXL10PWFQ
	 LJ2O91hFPchOQ==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spifc-a4-1-v1-1-77e286c26832@gmail.com>
References: <20260308-spifc-a4-1-v1-1-77e286c26832@gmail.com>
Subject: Re: [PATCH] spi: amlogic: spifc-a4: Remove redundant clock cleanup
Message-Id: <177362386770.208027.17731827267836968110.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:17:47 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ESNF40KoNoWSjpvWZpNCqLbrkWb/WsgA17BJHw+YV/4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18IjHcXjzKooaL0t2Sy0QWIpV+vpwmgY+t0W
 qE9UDQ+4KyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfCAAKCRAk1otyXVSH
 0P+EB/908b4EwSZA70lzcRpGpQ0wvqMxuC6eiG+4KDOupMf7m81SUOIxI4RU+ISHzmbS29Ta62Y
 47Dtr3WknaBbXqnoM91AUlW5ZLoCSIaItECiAFk2Gz81WbiFY1vZs70kW9qm2HhMPVwgXPlc1ko
 dur0fRQiCs+VYUL4+Zv7zMRH/ydU/aSEX1zJz4oMtpK+lC/oEVU4MepV9geztQ1DK8ZXSgy6yG0
 YhAtIuIOdpShRPponGmSo8LKq8YzO60SYN7NBFVkNqJiCGVyXSIg3pLq3S630MwkbmWygsC6T5X
 B8D8w+QpZtS+KgNF8wBS3vnDQn9xlTimOlhKGIsCPyK0oS0q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183824_062205_C9EFA449 
X-CRM114-Status: UNSURE (   7.17  )
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

On Sun, 08 Mar 2026 21:34:55 +0800, Felix Gu wrote:
> spi: amlogic: spifc-a4: Remove redundant clock cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: amlogic: spifc-a4: Remove redundant clock cleanup
      https://git.kernel.org/broonie/spi/c/a00da54d06f4

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
