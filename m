Return-Path: <SRS0=uPkF=4X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35BEC10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2020 21:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB75206E6
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2020 21:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/AUwbgc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hh5N9Jye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB75206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ49woUV3igDYTtFEXKY7rnWHEgbsRf0MXjWKxCwO1w=; b=A/AUwbgc5pTMUJ
	DSmcydf/Rf549Qrf+3CPNrbS6pXKMTl269zkYDMpddK4p/2unNmLeznLDvh/vHcXbEPhy4riXaWyd
	ISg+LAdWUMX4dS1sK9+WhASAh2E85HDtewDnt4/I7OhYBS+FxPyTQMqGEU0mvlJ0fu1ue0fIi1yEv
	fz/DYPj+yYLyGqscMPkVk13MQTdZDZ8X4zLQo7aqIJ4QMIz0YiL8mLcP2vLloAndwvDqEHDsdXaMs
	YtbUyZqytpFBnM75DjgRCrl7ySKP+vzhwnHO3Inz8NuADI2iH1oDfxH3c/Blp5VlfOlFEcTdJ/3hh
	fDzOKaqrIA1LLR7JlJuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAKHq-0005Lz-Ls; Fri, 06 Mar 2020 21:13:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAKHo-0005Lg-2Q
 for linux-amlogic@lists.infradead.org; Fri, 06 Mar 2020 21:13:37 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4E88206E6;
 Fri,  6 Mar 2020 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583529215;
 bh=nAOwzMK7Rru/ZHSGuIHjl7DylWINIp/B+M/RfrJNnm0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Hh5N9JyeKTS6yWhSqxXXeYVyRIcYvJtkyU/C/xodZ2KQERtD2rCc7UAXr3sV+9+q7
 wVI6bknyhchAGHrsvAuu9i6um7sAUkFB3YpkymgGsMfo//vyn0Q2I+4yvxFfgTjq1F
 ZyUFvRsGL6L6kEc3lySLTWmo2wwe2H3mOWGMZ0v4=
MIME-Version: 1.0
In-Reply-To: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
References: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] Amlogic clock updates for v5.7
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 06 Mar 2020 13:13:34 -0800
Message-ID: <158352921495.174340.8705011338899519608@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_131336_134592_80070909 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-03-05 01:47:53)
> Hi Stephen
> 
> Here are the amlogic clock updates for this cycle. 
> 
> Cheers
> Jerome
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.7-1
> 
> for you to fetch changes up to 71202c412478d6553281726a6772d0d5510c42fb:
> 
>   clk: meson: meson8b: set audio output clock hierarchy (2020-02-21 11:44:41 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
