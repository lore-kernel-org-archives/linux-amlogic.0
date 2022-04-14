Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B9C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aGiy7zSMU/h1T/Zijr53ki9pnI4VtUTtgCbhV3jgbz8=; b=yEQX0WaBmKI1hc
	1aDsU1Qulw2FH6auT2yPNWvX1xMj+wT8jhWdWcj55VvSHoay+QzxTOkj1z1k+eEXsYp+hPoDF4Mjp
	m0vHKbRbbAJaBjlyxliFPSFdNwIt/GV4Sj5QacWUgHLbBSp0++zPEzvct53MeoGdIzdNaahfp3vZP
	3IIhcxuuHynixvhTSV8VYZg5fxKNfleZ+/6wGF+ZrtUTx+KsmoSXydhEjIhzt72S8x+78xBmnj0pn
	l36HBtRN6XkQW8bbiaAcTmXIGhbp1tJQwrOY4XPHNI2gB/N1erm2Skp/leic6OrCwHbPpUm8JeZCT
	5e8ZW9xAGCWv4eZ4H2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nezqf-005sL9-Lc; Thu, 14 Apr 2022 13:49:25 +0000
Received: from sender4-of-o58.zoho.com ([136.143.188.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nezqd-005sJ4-2t
 for linux-amlogic@lists.infradead.org; Thu, 14 Apr 2022 13:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649944159; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ac9pIi1EM6rozrp4sj1tmIXE0ikL+gMjMxUC1HXK75sRz//T2og8SN1tdsDtE97AnWVdA7viDt5kvFtfor0wMsZj7+pdmwMnMjv2liNKeh657Uv9zKsHpQfqcFHGu/QqnHJoqRGXQcK3SRQEDHATN8l3qFHllRIICmuSBzcdfFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649944159;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=Om9iVIyN+brj7ODCQkEYUTaqxUp9t/PdBW1/4arEDxI=; 
 b=k7oISmcOBuv66VnsLkPJcY4dJzPDNmK3KqMCpZ+ed/BGLlotj3nq/Q5gkWtbKUNTalYpyzqgNi9qfJJpOJkZSR7INveCSDITxbV7FuStmjmBH4HzlgMfOEC8lXYOvlgD/cvK9O0HQruhG27HQ4fd2oWjXTG82rjI9vLrTKtbxXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=fkardame.com;
 spf=pass  smtp.mailfrom=furkan@fkardame.com;
 dmarc=pass header.from=<furkan@fkardame.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649944159; 
 s=fktech; d=fkardame.com; i=furkan@fkardame.com;
 h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=Om9iVIyN+brj7ODCQkEYUTaqxUp9t/PdBW1/4arEDxI=;
 b=NlHzopulGdOQ4GPA8/JfcHLkjUASIqOnU4hXm+qJmKiyD5ubNfG4Nm+EfaAeBpwT
 vlzOunactbjZbKpiSCrTk/0wLo8gm2gfc+XsGrgKmsFux8mdK5iL4fxnyn/ZSDSoJkY
 WNutKKrW3ah6Ok5WCpyeEV0F93DZ/hKiSd5fgv4A=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1649944157714936.090972217281;
 Thu, 14 Apr 2022 06:49:17 -0700 (PDT)
Date: Thu, 14 Apr 2022 16:49:17 +0300
From: Furkan Salman <furkan@fkardame.com>
To: "linux-amlogic" <linux-amlogic@lists.infradead.org>
Message-ID: <1802855ddf7.b865db636934.4739943741619136272@fkardame.com>
Subject: Amlogic A311D2 Support
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_064923_248515_A529DDE7 
X-CRM114-Status: UNSURE (   4.62  )
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

Hello Devs,

Is anyone looking into A311D2 support ?

If so then I will be happy to help with testing the work. I have just received development board for testing.

Kind regards,
Furkan Kardame.
Manjaro ARM.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
