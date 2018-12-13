Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB6C65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 09:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F094720870
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 09:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLbC6ngo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlHpiuU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F094720870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:References:To:
	Subject:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zBVOPXzqNbyHb5JD8Xj4kR574XuTp8pwrVlE1Viaas=; b=KLbC6ngom8RktW
	4jJDEszNt0bX7wKxqo/XdHH7hq6zNEC+icG5V47i4BhUkd9/LPMyUdeoTEE9gJ7Yuo6Vtvt6hWjl4
	K8qiSOTWpKFHoU0sdq+xi+zC2kBAlgk40aGuLQZv1hSVezmXcpq/CNL7DmlE+QJvz0luPHTR38lwi
	NVuc4wA0a8Mi1zYctUXfbDGCyBeo2g35D8IHH1luCuTC2Z+UHWO0K0l6CnsSs1SmcO6vxXgrm3qSg
	S4M4UvNVjR2x7bXzR2NQrGxgzcZUljyhS0Yub9nphd1l5rxTTkLA7wtjTNp9FNZt0R636nx5XpK/Q
	SXKQp3l78A8A9vDv8geA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXMyC-0003he-5W; Thu, 13 Dec 2018 09:07:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXMy6-0003LO-DJ
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 09:07:46 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0935A20870;
 Thu, 13 Dec 2018 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544692052;
 bh=2b0LqR8wlggG5+pPiegUxKbxNgPJpexEUA0T9vWR0VE=;
 h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
 b=PlHpiuU4opnOErcZ1QOqzx4lz1eTtRObdcZOLth4Zqw56z4s/9Lg+1Rs87Is1FwoR
 uudP4iU410ziTiu0W8pj+Q2s3lyIcIMEuVECDqThKf1W4hWkhdVUFILc50hGdCBbil
 nje7NXtJ4Iu1FgKfEoYJo3D2Z9JUNV1vnJDTPEjU=
MIME-Version: 1.0
In-Reply-To: <4506cbc6-4997-8332-3d34-fe753f480b69@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v4.21, round 2
To: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
References: <4506cbc6-4997-8332-3d34-fe753f480b69@baylibre.com>
Message-ID: <154469205120.19322.6141642003515686792@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Date: Thu, 13 Dec 2018 01:07:31 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_010745_622105_BCD4ABB7 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2018-12-11 07:15:09)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks, round 2.
> 
> It covers essentially Meson8/Meson8b video clocks, a fix for previous round
> and helper addition to simplify clock driver input management.
> 
> Thanks,
> Neil
> 
> The following changes since commit a7d19b05ce817d60ae672c4c112e77892978dc3c:
> 
>   clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 15:11:58 +0100)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-2
> 
> for you to fetch changes up to f03566d0aa79f9e09a288936980741c479a22fdb:
> 
>   clk: meson: axg-audio: use the clk input helper function (2018-12-11 16:07:03 +0100)
> 

Thanks. Pulled into clk-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
