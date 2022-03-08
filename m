Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE7BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5A65V9Byl2w4Gntj1JFQF8VmUZb+ymDTP+YTzExgiOE=; b=LW54Z0SJvefHBg
	MNSoi9zefDY3Us83nRMw68f6b3t62dRnZNWNk5mgbYE/kj43Zjd89ySkFvRHceXBDfOZOYaaDOVrw
	b1U01T/XNm3+sntim1OoR6pncrWtXNd5fZmZyh6UliuyA0cmBLNc1ulehpy+h8cSN2TyIJHMTM3sK
	5x6qdQAAQUrQv36nY2i4ouRcmKC76FYMmm6zYtEmjY4IKnGG6EG38u4Soe+jDMQR9DVri9hQq4ySt
	O8BdR4+YHY3twWvOoQa2QIoyDBrQ5i256l/+lcn/EYn5cYu+7Ud1G+v9RQ2BjaNmNt5Isem+x/oUe
	FOPjtpaf1lAMekdkBy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdQE-005SNu-FZ; Tue, 08 Mar 2022 17:14:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRd6o-005Ls6-Ri; Tue, 08 Mar 2022 16:54:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E33BB81B76;
 Tue,  8 Mar 2022 16:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499FEC340F7;
 Tue,  8 Mar 2022 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646758488;
 bh=K19vK6nxKS/hDQqLtDMhTlpl+t9TWom4w9EL0lGm1lc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gd9Ur+AGARhDbfnuEqchXCL38pF2SgSphuxbNwbxfrHwtrGU4iyoyDjzyaZtOF3rZ
 lb7fn5ZPuRXDB/DRTb32WA7U6mvLO3Lbfx9yqPF/Sjypl1bWzHTQQWRvJI+QBA3ARL
 46HUdFzKqPevqn23ucMGeF0/pxO5UMb4TUZHeFwSD/L5jHK3avnx3jlkC/Q1w6X+3Z
 xgNWm++hCYQodcCy3UW32StYgC73GaJsnuGoACsVKZ2qmscGuJ3cgErpV6GiGPMN0e
 kwaZprXpVDwiKv7RmhYFcQONcbnXD/yck42qJaYqMqrVVJjN+OXo5gQP9b1+nNZzdO
 3ovEW9K0khUbA==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "arm@kernel.org" <arm@kernel.org>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.18
Date: Tue,  8 Mar 2022 17:54:02 +0100
Message-Id: <164675831463.4164581.7406288447524287868.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
References: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_085451_117664_3F1006EF 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 09:45:36 +0100, Neil Armstrong wrote:
> Please find for v5.18 support for Amlogic S4 SoC in secure power domain driver.
> 
> Neil
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c76edea0e52d5522835534de90c893ca50b04402

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
