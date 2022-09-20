Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77144C54EE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Sep 2022 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km92hSM7HYJNS+UYJRTC4W/MdkfsLk9YzNaSzDfgvlU=; b=cna/pAmKwNGy+D
	5bzFAqhs116NTzeiZOcVlnfdmggZhgNP53D0/WGOUhUjF7uHKeg7V0FFT3VDmDWPNiPlrhx1oaEdc
	LOe623rZhF5qZq1RAqYlCxU26+gd6e+4JnCZjTMQHY6TpGLkjw3yGxUk0zYqACtIs7/vyEkKvfdim
	yVblKlpNA8hlPbeOiXK6pCM/3j44fmf6EClFhy8mfjL42bAEQNHArs/vnDqO0/yR9sy7J8OZE9CH4
	ZRlhSGhT4+LszLI6EeqzuJ0uPo1vyZbEF9BiIZpmIDmisUnH1SW1kAQxIrCnp7x7HCFcH2/uYJWyl
	FOMtD8cINujMWl5VkG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLf-001dbN-Kw; Tue, 20 Sep 2022 08:11:19 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLT-001dS9-77; Tue, 20 Sep 2022 08:11:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6D761C0010;
	Tue, 20 Sep 2022 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZqxS1EvzHcciFqs++tYbF63gvbeqlta9q1Lwv7duqo=;
	b=oj2qJiKojDbd1YvWqFDW4tgIC+KCp329ZGG4jO7JnbKXv2i0CuNFDSDVDOYGtsw0UuTZz+
	GSkmlFe1h27/l2YyO3vRnE2d7xoM0c7AaL3fHKFNGlaDPQqWjFziwikojJstEtLpxy3RqU
	3MZIfYseP0f86jgTmb5NPbm2PzE0iC/AyLgp/yc+1c/l7TV1FRSo2+kSARHN0hQN/Er5bT
	hTyzKbg7D7CoZorHMSusBVJs1rR1bUCpYCRd94UDswsGbZYmaoWTNe9eMwOiRjx1XTolEh
	bU7xvsWPBdRVJbEuqTRXMxNZdMMd9DA7iNG3j13i5cAFmh3uWfU7H/iJ2tjilQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
	Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>,
	linux-mtd@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
Date: Tue, 20 Sep 2022 10:10:58 +0200
Message-Id: <20220920081058.597332-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <YuI2zF1hP65+LE7r@kili>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'768e08b34f5733d538f9fb6029a650332ac143dd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011107_454940_58FA4B06 
X-CRM114-Status: UNSURE (   6.91  )
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

On Thu, 2022-07-28 at 07:12:12 UTC, Dan Carpenter wrote:
> The meson_nfc_ecc_correct() function accidentally does a right shift
> instead of a left shift so it only works for BIT(0).  Also use
> BIT_ULL() because "correct_bitmap" is a u64 and we want to avoid
> shift wrapping bugs.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
