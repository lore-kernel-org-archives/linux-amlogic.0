Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65338606A334
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbORUSHU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4/yXbzr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K4ykSl+nWTzjujfocIuH7prG6taifVSwcyJbn0eHl1c=; b=wbORUSHUENVvhgaPcUqJCWyhAj
	64+jGHMXC40KRC6P/D7L37PJaOEnKFIDQJOlGLHQN7+ngBU9a/XPxGXpJpeTD4O37LPr1NQPxTm+r
	db++nlUlER0QDlniVOxkp9fFosmGgiXSLtci1KDvt02ofYuWQ2XzkEajw6k0iAJg70sk67Y8AYJL+
	iTJ9mk4meHXtjQ9ESZovtlKEilgtfS0QMR5oXXWoxsObjVpKrgLrdkB0linoAm5Jl2kAIVG71PT0f
	ghpOIp7BiAvyn4qfwNxOUGcYBcXQQHrNTlZq49Z9k0w85kmOzdS/ip3Q8bnlUYwdCXjA+noBZR9o6
	yDgm2deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ij-0000000F2A0-1UYx;
	Thu, 22 Oct 2026 21:53:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ii-0000000F29K-27n9;
	Thu, 22 Oct 2026 21:53:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3467B40470;
	Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705988;
	b=z7Z//7QdWHsDdqUdKc5/u31Mz4r25lP7ioz+YKfG96HIxOBqXJ3gelyX5s8RnuSqIOYj
	 iUc0esk5cqmAV3kvnbFHlQnlyl5+oq5C9OGvdm/2FpOBZkTIqKDgQnUGbNtF+a0yl0Ajb
	 34RvbfrEa25VUkoREllVHiTyx+jzWo7S1APDm/1scth/y5Y2Jmb2YxKl3JNxIIrjBhzmO
	 iAIbhLS6WmUqIGCH/ffirD5I4/z2+mOexqBgWGYgaXH0o9nTxyIXVI09pdKBHz1AvsO9w
	 Lyauvgp2S7ZGkYKd07/T6IMdPtZmwn1jytXPyF60EpnTwEdev+7yov7//7kBkIR2l5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705988;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DTvpZdrzMHo58dnlhxU+/GyKaasgGpS/FpMT1oMFqiI=;
	b=sLKRrcySykTV//pYdOYcbDHjQ+diZ5LeD51uo2F/d0gwN3mBkitaBbxyiwHba8l+oN3A
	 c37e0eKNK9P7B4cS3Y5rlmyBVP6CzW8prvu8Z+fEApeG+no7D13HdhKE44bHyvFys59Nb
	 oEkScPcORCvseHa73XDIffhYVbBzgmIpreuXkzHsieGsV4uaaWZnLV8Mb8bkC1ZAYYIun
	 ycX7ltYd3+uW1aZqVoirOzt9vQZYD1jT0TobCIu9520I/8PoutlrQ1vrEW+ZU3Z0U9o1H
	 3jkfiKGMLrJI6B9b0fVrWcqri6vFheiMY38TnfvmKA+SmzrGyULzccqkTDPxXlA/9nw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5697B1F031E2;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705988;
	bh=DTvpZdrzMHo58dnlhxU+/GyKaasgGpS/FpMT1oMFqiI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f4/yXbzr1ZMRrJh5UUs7hh5nnH8UtpBaEdES9VlIghAJJ7vwKrwQRlsF6wlh86WCb
	 1h6G/Nk7Oy97FYle2xwvPM1ufWIJXpXnTEjF/oyH2XJX5BJTYiqSKv7KWVsLsnKejm
	 sL0TVrskW8OHEW6K/URmPqkMwI+lucpu2yhPVESAV04MWekNfE3+bcr5CdDvPvY/b+
	 vSHTap7tjRlVG0ioMepQU7Howyn5Hy4CJcEWkUQBb7zsbAgrWZ2zHP4XX4F0S/UP0V
	 8C2JoYnZGft3IAQ0FFpp41Nznas+3+AGW2mznmOE5qyB0hW1CGjsJnujUYTjY1SLUg
	 AiRiOkJe/jbbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A623541F91;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 0/4] clk: meson: g12a: fix a few clock definition errors
Date: Thu, 22 Oct 2026 23:52:38 +0200
Message-Id: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKaF2moC/x2MQQqAIBAAvxJ7bqFd0ENfiQ5qqy2FhUIE0d+Tj
 sMw80CVolJh7B4ocmnVIzegvoOwupwEdWkMPLClgRmj3piIHYZ9Q4resCcTorPQkrNI8/9umt/
 3A4rwOaZeAAAA
X-Change-ID: 20261022-fix-g12a-clk-1fb52b15cfa6
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kv186d9Cog+H5dWdzKf8ASTTBRJiUw79UW7YCNc2//0=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1g0fNi+Rc9qleitm8/LAgJbJb64ef8cW2GcvknOKZ
 /fEWwmzO0pZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJhAszMsz1K2F8yr0t446h
 x9GHfwyWR+xf4H37+sWODWyJ9z9KnyplZOgUU0n/x2kvfKPZ+nnanfNNDBYVebaTKoJCPe6GX4h
 ZzQUA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While reviewing the G12A clock controller, I noticed two unrelated
mistakes in the clock definitions:

 - fclk_div2p5 uses mult = 1 instead of 2, so it runs at fclk / 5
   instead of fclk / 2.5.
 - CLKID_VID_PLL and CLKID_VID_PLL_DIV are swapped in the hw_onecell_data
   tables.

The first one is a single fix. The second one is split per SoC (g12a,
g12b, sm1) since each table was introduced by a different commit so
I provide different Fixes: tag.

I do not see any consumer today, so nobody should be affected.
I don't think there is any values in backporting them btw.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (4):
      clk: meson: g12a: fix fclk_div2p5 multiplier
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1

 drivers/clk/meson/g12a.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261022-fix-g12a-clk-1fb52b15cfa6

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
