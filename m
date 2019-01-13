Return-Path: <SRS0=Cs6g=PV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF7C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 10:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1002064C
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 10:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFJx6BUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1002064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lip6.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AY8/rTRorfXYI6a0PyrLJctMfz7944sUaO9D6KcYhq4=; b=fFJ
	x6BUSoWMgYULq1UtZNQIK3ySh5G2ynpVj43JLmYKDJO9LHai/deEBeGx2b9xhinGT6IZA8saNS1nx
	dTPitKYgDIa8+sZk3lDwKaHYOTnjXKcJHsdmfFOslvwG6rtCi1iR4k/oFkOKfRCZ7WTDxEUy5tfez
	+/N6fRxc8tnaxll7+V4lS+4og8ARVu7XF4FykZUbUEez4dF9Y0flqX7cb5fUiAjmtvR0QqAmvi4a7
	nEhffw9lLFtUVge5jF0mTelrrqXyJAN3Qw/KWcanWE2jS0NlQKKPeVKn7CoZ04p5+6kx136sRNCWL
	8pZY2NLn10O6n8M4ZK+XhddZvmyES7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gictz-00065y-37; Sun, 13 Jan 2019 10:21:59 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gictw-00065Q-KO; Sun, 13 Jan 2019 10:21:58 +0000
X-IronPort-AV: E=Sophos;i="5.56,473,1539640800"; d="scan'208";a="291728762"
Received: from palace.lip6.fr ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 13 Jan 2019 11:21:54 +0100
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: devicetree@vger.kernel.org
Subject: [PATCH 0/3] add missing of_node_put
Date: Sun, 13 Jan 2019 10:44:48 +0100
Message-Id: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190113_022156_975391_8997E8AE 
X-CRM114-Status: UNSURE (   5.83  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The result of of_graph_get_remote_port_parent needs an of_node_put,
even if it is not available.

---

 drivers/gpu/drm/meson/meson_drv.c     |    9 +++++++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c |    1 +
 drivers/of/property.c                 |    1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
