Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AC4F30297
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLqj9a+uVPhnzucZYKwqwU/XXm62BucTxJ0rDCYl0Qo=; b=zbCbYuNsDM6zYV
	aTcrZTUA0n8KvHFSvCtn+aK2xc0OaD8bosZ3PYxZLUStqMHdBU+PHa7Rn6sd6IIK4HLhMaNSuQGDC
	V6gkSKfL9TO/F1fZvcAmPfPf4wJQlDr3zUGD41JQnSg6Y8r/o/Zlzm1DvBHTZVy73UEkP4A5rh8mo
	Abzp5fiOkMhdgD2TwVSW/DooyQLZ997Jxduv4NRAJiAbHq0SmnlEK6NzU28FE+/oQrWxnuy/hpVES
	iSap+tEfFfs3QULAwlYTSQgIbjQ6v6YOXp9FjZsgv7uydoyVbjiMj20YpMvcEOC6R3nIYc/WO0KEu
	voeFsXURRBs8RIgeTtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuM-000000036Vj-0sq1;
	Mon, 16 Mar 2026 01:38:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuB-000000036Ik-23zJ
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28ED943279;
	Mon, 16 Mar 2026 01:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D990C2BCB6;
	Mon, 16 Mar 2026 01:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625083;
	bh=ZtzQFmnCAD6t2ycuWdAVnZ+vHyzhsgiuLsjiGiqGaPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AZZWERnPCexOjD3/N6/LKCPNZ+r/wZCMKFiip7tIBYKzCPg5/90oTiTEoPfS1Epjj
	 zbjSBgrE/D6O9iJCHNrZjdqSbFTTG2xMXXVbpb22Ny9jSA6/ifUzIdG8EVZ9xTrJhN
	 8qyaShZNnfocDF0Bat+iuE3fozRIFtZ9sCZwAqYKtXHMNFsvu09lG0u6+L4kBaH0m5
	 cEnJRlmffzupXReYUo8dlwZUuxQPjtNbx6hrYl8LC4jRIF9KpD+Pgmaf2zuT9IxtCL
	 PbddZt02bi/Glt9Obs5L6Ek/BEoojrRz34kvOtEJQ3JA5dqjjc4aIR6WswHpI76tE2
	 1i7u8uZRGvFTg==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spisg-v1-1-2cace5cafc24@gmail.com>
References: <20260308-spisg-v1-1-2cace5cafc24@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: Fix memory leak in
 aml_spisg_probe()
Message-Id: <177361914653.162791.17263190036268237449.b4-ty@kernel.org>
Date: Sun, 15 Mar 2026 23:59:06 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZtzQFmnCAD6t2ycuWdAVnZ+vHyzhsgiuLsjiGiqGaPE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt174v79gvROVz2tFRcLX3taQ8ONQQkzfXz74y
 IWMhyBceCeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabde+AAKCRAk1otyXVSH
 0PoyB/0bPz2aVcxdIpmRoDC6AR6uEe836PhOqcJEbi9qY7B/INxG8LY5j5bKH+XLa0jwoRKtzN8
 xYmG8PRC+lQGDUri950SghPEYj+BJ0Zx6MmysJPYKMc9h32fy+w5uT5IpDVclDik79uTrVwDruN
 zFKDXTWCMy3PHPwLgdYOQVA67kmO6ifVFZGpemO3jWqQLmeIy26RYYkOgFSVlhnRee9BVg4fL3Y
 nK9qWpOibESY62qrNhqvPxhdztyuoXErMNv1ZwyAwyMraJl8xm13piHdfCmS3Uw+U64gu/v2g58
 cia+QLXowSJSuNe3dngtrxWI4MpyXqNVhqkLQSHgYE7K/gMp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183803_693547_75BBFA0A 
X-CRM114-Status: UNSURE (   7.78  )
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

On Sun, 08 Mar 2026 14:49:21 +0800, Felix Gu wrote:
> spi: amlogic-spisg: Fix memory leak in aml_spisg_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: amlogic-spisg: Fix memory leak in aml_spisg_probe()
      https://git.kernel.org/broonie/spi/c/b8db95529979

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
