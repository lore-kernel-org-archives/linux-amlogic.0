Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA76C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 19:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E6A60720
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 19:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E6A60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqOMLpvGjTVjn9HMM3ykmcxRqMrBuQq5LX47BC4LLI8=; b=f1lT2bIbsg0O/e
	3Eal9ELJP5LVrY9kvsd/sgQXjtqvxty4gzI14+L8mxyfCefpKm/5lbekoW+JGPBTCJaOHxK+nQpw9
	wr7BBvBFBv5Y/ewvd0efg1hFtYh6py0qM73R4Cv2Nzr8PjehR4/oeFnPj688RrJVtNtvD9bVzyoYM
	+GX5E1McC/GTcSWgIWcFJiYq9jjuVfAqdh83pY2KiR+iE8b+ghU5rQUw6GSKyDf+5a3uVULXDZ65n
	NmZ6kbSvvzQOZXZ7yo7NO0ytgd9NQ1cWcFUquh5XyWYtEEBW/RX4BB41B+0UL/pdqhxJ08iZBYlze
	VVueSQrAt76WrcRSt7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfSPk-002wt7-V5; Tue, 26 Oct 2021 19:47:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfSPi-002wso-Am
 for linux-amlogic@lists.infradead.org; Tue, 26 Oct 2021 19:47:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 354A060E05;
 Tue, 26 Oct 2021 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635277633;
 bh=s9JwoJB+89wiNPp7epyOTYCtetr5xaa/iZIr/NZYSvw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QUP/Uu8jL5eesQpVr33GRTQqS2HZtr4d0gSSduXC9UCGM9LqwBr9bpikB1GKt48M8
 g1xV5qBVQsFagpTLGwdALJbAyX+pmVvPGzT5ZETC8V3BqpVhleD9MtcVB8KS0ah4VS
 FrFKYm+ypLvlxmEhr3EBixKfie7lk+3mKqUzpotwzhG82tOMjzR/rdaJ9+O/XP2mjS
 3ks+V4oPb2qQff+1iFty/eLdDTHgebxNa1CG/uI0lRsaTI750hFCJ9TblKlO4vlAga
 1rlE5ImJrbybQjeXzI4NS4C+5woi/93meWgctEFUFwQ2/nhkdpm6VS60rCxMHtCuNB
 OuHfoSVV2cBhg==
MIME-Version: 1.0
In-Reply-To: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
References: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 26 Oct 2021 12:47:11 -0700
Message-ID: <163527763187.15791.2918685677021849338@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_124714_436521_4E34FA67 
X-CRM114-Status: UNSURE (   6.66  )
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

Quoting Jerome Brunet (2021-10-18 04:44:22)
> 
> Hi Stephen,
> 
> Here are the updates of the amlogic clocks for v5.16. Nothing out the
> ordinary. Please pull.
> 
> Thx.
> Cheers
> 
> Jerome
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.16-1
> 
> for you to fetch changes up to 7bcf9ef6b9c50e87bcb1dee5ced50ccfa2b21470:
> 
>   clk: meson: meson8b: Make the video clock trees mutable (2021-09-23 11:46:38 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
