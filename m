Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F222CAC5B9
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Sep 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UhsgOS1xmpne0B7lKAv3acH2kJt4OFrkIewgDBjO4kk=; b=WwN/5OShNAm0ho
	cXnCu0hhlauwhF60sJbOuMcZ18voAp+Ew8MDb8abJ6J8TfzeFApi6Utu4ADs/woycxyJa2cF/Kcw/
	lRdcYZMbliSTCDXbUm+ROaMJp2ao7JCS1SEPXP/0PT6YF41KxZbBNmAbUKd8Kkrf/TeAffkIUP/bC
	e6JX/ZkKD0JEbAaeMuEeoo058bbUPzWFkepyPkvBdvdXLgRjJh9dGs3rAsD75a8f/r7x7pEK1VQn/
	gHeryMENPTQHcX4G6HZvsLFrq2AZ/q5p0K766e0rWzDqclo4RiUQlKibNK4D+jOlRZ2frU7u5Xtf3
	LwEcJgYVp22ysxKdb5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Nm-00000001xtn-3vn3;
	Fri, 26 Sep 2025 14:25:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Nl-00000001xs9-3Mki
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Sep 2025 14:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 385B261DF5;
	Fri, 26 Sep 2025 14:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE44C4CEF7;
	Fri, 26 Sep 2025 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758896708;
	bh=+8QEVlKLacGF6oQWMvQ8+O1ZZ5z5veVkKt6Pa234fzA=;
	h=From:To:Cc:Subject:Date:From;
	b=mPL49AmfZMwEDDyD1POZVGKu1cioeOc7ZfVGpVZXdZ0s6aPqAJsnW530JVLYEvrrf
	 wGUsJwzuER0YvDxVg5jvDJjgrsI0s8qOGm0uI+mUBfDjk3UE5vcaUr4+WTEkCXaZ7c
	 x6o0a6sXoK6CgsamwZabpBzhEhOXSuioACvEuYXrj4KEtqldmC7g7ILiGPS1PY0/Hl
	 cwZuM3kwEOA95P00qzOPdEuU+u0gcMu7iJ/Ynmc4zZ06sUCViVMI5t5iqeNfPtTDcF
	 6E9koTltmMTPGSz/eFUXO/PzogXwjOC/QGSbcFcOWZGUXqsg8TbWf+mX+0G/gK0Bz0
	 /MTvJmMXiSpkw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Nd-000000001Y2-2rmy;
	Fri, 26 Sep 2025 16:25:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] soc: amlogic: canvas: fix device leak on lookup
Date: Fri, 26 Sep 2025 16:24:52 +0200
Message-ID: <20250926142454.5929-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
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

This series fixes a device leak in the canvas lookup helper and
simplifies the lookup error handling somewhat.

Johan


Johan Hovold (2):
  soc: amlogic: canvas: fix device leak on lookup
  soc: amlogic: canvas: simplify lookup error handling

 drivers/soc/amlogic/meson-canvas.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.49.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
