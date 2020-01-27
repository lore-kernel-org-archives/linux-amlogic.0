Return-Path: <SRS0=nI98=3Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C5DC2D0DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C746C20716
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nl3sl+BH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lgaard.dk header.i=@lgaard.dk header.b="z8C7gIvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C746C20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lgaard.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:
	Message-ID:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7zjgQftRgHl8T2+zbU3kzrCgm0KaxUM5q66RV6kASRU=; b=Nl3
	sl+BH+hxT/UzFsK9L2C2Gp+tU3/w/8fXhU2a2qjZoH5iO5Tl0vrWFBte9hgtXOUkW3nBubR98dAhZ
	70RYq4PwPiha091OdHNl827DuAPdCOkQOon4gdQVOcehj2pnTSxcAu0gOkRE+A6V7tU0b4w7a1WLQ
	oDGX9lPb0aooKoVUXMuSrOYz7pI1y1OSyIde1QY7VR6O5bl/qWN+UeoCZfXmtHuYrKg5rVfTEqoz9
	+r+YnGxctOhwNKuozcLvq8N8SuhK+m76hDq4KTQ79M+UsGnYIz6ZtW+Mbcn4v1eUFTQqH2BKrgGvB
	wzYmlXCzbogJf1ap5C/mLnq5I3ROYfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw5KN-0008UT-8u; Mon, 27 Jan 2020 14:25:23 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050::465:201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw5KL-0008Tt-1D
 for linux-amlogic@lists.infradead.org; Mon, 27 Jan 2020 14:25:22 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 485sTk4cLrzQl8v
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Jan 2020 15:25:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lgaard.dk; s=MBO0001; 
 t=1580135112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=nWIUavyho64Fx3ggoQU8SBxS1dou5HpW66alJPKRsnQ=;
 b=z8C7gIvKMKRVs8Xf1GjuCDOySSPf9sG9nyAW6J9sMpg8R/lTVp2kkMUKN8RBQpPl1p4upL
 O5x+7yLB15rhuEGS0kRpx6PNnX6XQVsjt0+FxtM5iNEQgi8V2B0yBRElWED3u5bfsT/oAR
 brhpriLqMIXZ5/OT27ahiXiErnGfjL0vZgI9k0wq6CzfQOTtOl+4ow3jryISAFlXXU/787
 JYaGE1v5TgAyFBidpaXUDE4dzByGiJEsZw47efAuKkrzGx8q8Iaigxiv4M9Sw3DvCMAg0S
 PUojwlW5V85whoJizRPXR3lI/z/+XsHfPEpeWJ/6mPxKe1wpb+ztQhRRCLzJxQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id wfaFBeG9oRAC for <linux-amlogic@lists.infradead.org>;
 Mon, 27 Jan 2020 15:25:08 +0100 (CET)
Date: Mon, 27 Jan 2020 15:25:08 +0100 (CET)
From: Ole Dalgaard <ole.d@lgaard.dk>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Message-ID: <747987906.18397.1580135108294@office.mailbox.org>
Subject: Panic on Khadas VIM3 Pro
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_062521_225773_EDEBC5AB 
X-CRM114-Status: UNSURE (   3.01  )
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
Reply-To: Ole Dalgaard <ole.d@lgaard.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi 
I see this panic often soon after boot. 
https://pastebin.com/70DmfFxj 
BR 
Ole

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
