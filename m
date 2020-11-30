Return-Path: <SRS0=GnnG=FE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C92C64E7B
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:03:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BDB2084C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9pqDq2r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmCxKGIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BDB2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CcZCh/6H7mtq1/3YYpbXvOdjTMU7QsltoHUCFJw22LQ=; b=k9pqDq2rejoZL137C5aBNBjI8
	FCVdsGLYe06WX4uKekg0nRnHjxDkFBRJ0asP4kW+lVynYkjbWDYbv3ycGsJZ8pbMy1jwQd8maOyQo
	kO9jA8+Zm40Sf+WPRoHAwd+oqUZaJbiAkc4NEohzesW8gGDmcfAg9aM4K5TBsDmco/f/2CUT+Tegb
	4JuCbrtmDG4SAo5sEWs+ttHYxIlrHe8ELmANZmGB7hQ/DGqCD5QeJOciDWNKbCLCBygF8RoPfnkc3
	BQGawmkyPnhCXqeUJq5leB3yaoUfPc8ul6TtdodekzerS2xO1xzhTvHtrxDQI0GVsSozazhg1BiKs
	HVd0SVNrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgxZ-0000Gw-8R; Mon, 30 Nov 2020 11:03:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgxW-0000Fu-Nv; Mon, 30 Nov 2020 11:03:07 +0000
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84683207F7;
 Mon, 30 Nov 2020 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606734185;
 bh=hjIcZHlqjoAO8SFOaLc53+G8xg4yeUu0vni/0Fqn0Bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmCxKGIwQI+T2Mo2rkjWWy4eQRdp4boF9WE2CHq6fg3sGfLZBof9qpQFMJJ1YqMi+
 yYGfyTHmJT/Deiw0WdiTFmTCgpxH7s7H314Q1YT/7t0x8B2LSbEwe/Ix4ewBolpAbB
 vTmnjqsmU1QuaWoTpBOpi9gnD0ChEfwZogdISwWE=
Date: Mon, 30 Nov 2020 16:32:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yejune Deng <yejune.deng@gmail.com>
Subject: Re: [PATCH] phy: amlogic: replace devm_reset_control_array_get()
Message-ID: <20201130110251.GS8403@vkoul-mobl>
References: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_060306_906526_E46737AA 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: lorenzo.pieralisi@arm.com, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, repk@triplefau.lt,
 p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18-11-20, 10:36, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
