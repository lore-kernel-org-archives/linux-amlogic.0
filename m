Return-Path: <SRS0=KUqV=M5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7709C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Aug 2021 20:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7796761179
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Aug 2021 20:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7796761179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQt3LffTu0FqVlQCZc6yLYyg62rY3nVXhcmUxkS+7Ks=; b=UfPImzSXcLLZi2
	XFR05HzmDZDpofvaFvfWQTaNyrothu++4epOfJDMUuJlql+dLvDnsj9qyMUHpNWsiiIOJE5QNRUdo
	FJfQ0HGxFWF09TGWw3hdSk4RlyScyK/HYuFUzvK+qljfljizUI7F3wlntv18oq0Ql96ET71QF7HLa
	dTeE0cSENhMUnPTkYqdwmgUwv+N47ETjyYySKU/VUEglGXVd1KGvpaMparhurSXyIrIlAvOKrSrfZ
	VWw2BkutdKtRmzkj/esEsU+FRlphcX2TYYx8mFAvh9XtNuWSg6bko55laP+1KxPxoHeI/1kDllx6a
	c0R2KZcA2nNhqjz942Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC63i-00DPgt-H9; Fri, 06 Aug 2021 20:03:10 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC63a-00DPcW-LF; Fri, 06 Aug 2021 20:03:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3727F60003;
 Fri,  6 Aug 2021 20:02:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jason Wang <wangborong@cdjrlc.com>,
	miquel.raynal@bootlin.com
Cc: liang.yang@amlogic.com, vigneshr@ti.com, narmstrong@baylibre.com,
 khilman@baylibre.com, richard@nod.at, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: remove never changed ret variable
Date: Fri,  6 Aug 2021 22:02:57 +0200
Message-Id: <20210806200257.393527-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210803113300.24230-1-wangborong@cdjrlc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'74a021a632b07dd990e85e815b8757921b23db4b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_130302_896002_BC908BF6 
X-CRM114-Status: UNSURE (   6.54  )
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

On Tue, 2021-08-03 at 11:33:00 UTC, Jason Wang wrote:
> The ret variable used for returning value in the function
> `meson_nfc_rw_cmd_prepare_and_execute` is never change after initialising.
> Therefore, we can remove it safely and return 0 at the end of the function.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
