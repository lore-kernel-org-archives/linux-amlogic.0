Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA96C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o71Wyne5fUZNGJ/tl1VkpgAJS7cJH9n0G+6gv+qVBz0=; b=yk4rVHlBphdPLN
	KDe+An06h4+RJSF45Wd16cxygD8P4Iw5X6h9kFTvFq/fKH8iTZBxLXiZMEd2h2oSznGj9MIFJg159
	s8E4bUzybyCPPtPCZ/2LKcdNjOpndy4Cx+pqze6gGRuX4q1PYwUlHq9cw1eu8HKjNajfcyaFdp9vl
	f40X1Qs/eyhl0zSgcGwz7gob6sUJeGcviH1WPYq1CvbqaUFgetXMDYdXyfxWbQxBbLYJZFin6Am8W
	x4/xaefNZaQlSrg6ecQDtlX/CSZjLlla6N7UMJI027Ea40Dqf8E3yWV3hcOpvARs2RX3WzdPpgi8T
	y1ZurOUOQY1gM4YwkMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgoMC-00BQ7X-0G;
	Mon, 27 Mar 2023 15:02:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgoLl-00BPyW-18;
	Mon, 27 Mar 2023 15:01:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6FC86130D;
	Mon, 27 Mar 2023 15:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CD1C4339C;
	Mon, 27 Mar 2023 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679929292;
	bh=G8madpQxPQL6Eo1F+NjodE/hhZA5rOulWNSgejw8wqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VApLAVL5yJRqoj98fZbgd+z+dVYm1dTeWN/verYuX77iDMgxKdaB+ZK3meuwsSFfA
	 F6WoSNXlKQ8WFEY6Pp/9g5aOO1+02Oykke0RS7eGN/Z6mECa9aKtWiQ6HQjRU1hpHV
	 HMgOem39ebh01TmjG8EJc/dAXqdp7D9oYaDu8U5awWs9jxwMEscq3cMhgNC6RwUhmx
	 /zNFrDJxOCiGMprtMDDziTOY7y3IlYZJU/e91jU9PdSfSuFERtSxC+1HE0eV+daVv5
	 vUqYS+7NI7J5r3WFpWGmZDmq5EyFguFM2vSXgVqNNS5aDYa/X9zE5oo+0fiPaft9g4
	 fZo+XS0C/WXWA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <cphealy@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Chris Healy <healych@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] perf/amlogic: Fix config1/config2 parsing issue
Date: Mon, 27 Mar 2023 16:01:14 +0100
Message-Id: <167992632671.3835408.8265372943884338081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_080133_423968_33FB1F30 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, 9 Feb 2023 19:54:01 +0800, Jiucheng Xu wrote:
> The 3th argument of for_each_set_bit is incorrect, fix them.
> 
> 

Applied first patch only to will (for-next/perf), thanks!

[1/3] perf/amlogic: Fix config1/config2 parsing issue
      https://git.kernel.org/will/c/c61e5720f232

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
