Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB3DC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 16:11:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4539F611BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 16:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4539F611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SwUtuwls+rTWn4xLvbREQ23D7Gk4GAcxdB6vE46gvu4=; b=ePqJKt0f3MbvT50FD52C9BDDD
	F9cAstdo2QA7xhvbu+Hh2C37e63vSgaIUoj55qE73+5VwFi062wYtnTpvKxVGhXdgM34FHg8gTia+
	mJn57v2AFIvjm+WGRK7R4J1LAciNWK0VxEp08hJq0iuLnrsNrDE14BwDtLh7xET8zE0Nd9Qfjo9qZ
	d9PQzwKaR7J6hNlsYVvNt1QDfnQmcoTx2btMDLi9bsO8NW7ToiJzTBr7m8ZFRGOdPAwq8qJtLwBxt
	fjjwfwHYXK7gdVTUQFfp1dfWDYXd6annEISLVZ1e5PkELxXY4Gej3h8t+1hJ8vtGUtiO/q61e0Tif
	LO5wil+MA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOnG-004TWp-OZ; Wed, 19 May 2021 16:11:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOnA-004TVn-NL; Wed, 19 May 2021 16:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=pr6vp+ieR0+0KJUyRY7LwUcSbWt/c8bCWXeOjmMdjwQ=; b=AdPbM2hCmuEDdoHAgwxtu3ihfF
 77UdsycE7D7fRMB5Eq7vG+giEo/A7T+goBk81XN0FFxVlTOyjLDZ/e0i6vIXZuU2ocLVJPW8nrfjy
 YhXoKN3gRLz9vq/8yMemOmbB7mLdHVO1HGHi/on9OF5QoTrFIIIqL/CEnSbz8ouyRa+rZgv7TrPfB
 /+pWazfjFwbLzByI9PtMV2dccINsFOqUJf698dHZ7j/KpLltAjPWu7VcXzgiqSz/PH80S9ylcwOyL
 edQsM8R8u7Hc5xRE5DFSkhTyYBznGb2KTgWz4myCkCNr8s5VZLDsCXLtgrxlSc0H8mRiX72E6ya5N
 ImBmcwTg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOn7-00Fc8P-2O; Wed, 19 May 2021 16:11:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B06DB6124C;
 Wed, 19 May 2021 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621440684;
 bh=na6FALQoNuy8u03ZG29zB+aTDGjiYRhmATrXpQWBCAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M8qK9qlv1xTdKbAIltgvg+rJeQrfD6rWZ3qGsvDwCpkySLGOY7w0PLI5svRkIbHoh
 RLhl5ybGt7z1ZSI3GzedvHOtWdotKfkJQV9AmmLoRdX+1Foun3bUCvhBsDCKcqx6L3
 Z+MpvafZ95wCw35PONHCbVpL2f2+TYLMLlhjVbMRPEL5fuKcNzCOhIhmDpWi++i3vG
 y+IY7va2TV4EMoRbuTBPDt0Gk/4A70DiSyitS2AAkLjdolxeNiQRKLgqcQIVCuaH6m
 9VQIHm10JySYHd/RpBCkdu8ukCjHg1KWBKgW06XPO8lbggU8qLK+2GL5P0rVLStKyc
 OMF/RJXyoy0Rg==
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ASoC: meson: g12a-toacodec: add support for SM1
Date: Wed, 19 May 2021 17:10:18 +0100
Message-Id: <162144027324.37060.1996054206902696511.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511074829.4110036-1-narmstrong@baylibre.com>
References: <20210511074829.4110036-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_091125_157117_3A0637E8 
X-CRM114-Status: GOOD (  13.98  )
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

On Tue, 11 May 2021 09:48:27 +0200, Neil Armstrong wrote:
> This patchset adds Amlogic SM1 support on the TOACODEC driver, first by switching
> to regmap fields for some bit fields to avoid code duplication, and then by adding
> the corresponding bits & struct for the SM1 changed bits.
> 
> Changes since v2 at [2]:
> - use raw values instead of defines in REG_FIELD() for g12a_toacodec_match_data
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
      commit: 172dd9216d2b8a3fa162039d89c4361ef35c85ae
[2/2] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
      commit: 7487238c5f530b418745ce134d1b0a7fba3a0d8d

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
