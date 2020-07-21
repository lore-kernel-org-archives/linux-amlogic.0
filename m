Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849B5C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508D120709
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5vsSkCA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2P05u34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 508D120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qZJMVfHv70SKZTPYdzc4EzLrPfSaokcd+hfp/eYmyk4=; b=M5vsSkCAnpO0OK5hP23LAUSEJ
	OvUS7jpMGEyqZSA/XijgEkHNsEJUgvR+/GJxmbVV3Zpk6cpVmdWROj5gmaAlMAcCl4Hx0+Prkb8SP
	bYfe7awQ5gTpDTuR4D48UBb1UBlfeJXsAYQgEil/nQz+Mur4S/QP8VkS7zqtZFO8m2Zl5Ayj96Hwh
	zhlqIcb5CMyhzBLeewJb9GdPbO0/g8uRFaSCO2wuM8BTtwJbittIRWoqJuNecwpNqaAZAaqZkQua4
	rphLC24VRi58sWYUfl5mO5Go6JJKNH5j3QuPeXll/KIjPHEq5l+GDKQR2MzpBPoqohXJms8TTNjhk
	ncJCOixMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnDY-00075B-TX; Tue, 21 Jul 2020 08:01:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnDW-000747-Sy
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:01:39 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE5FA20709;
 Tue, 21 Jul 2020 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595318498;
 bh=jSPRnH7eEP1x8Pe4KIb515ID/InrBkcmbzx8jgqPjO8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=e2P05u34HIAGFQWkicYhQ3GLDJlHwDZU3AJ03gInVljv+qlvVGcl7IfDRUzfyYEbX
 kNcRw1jCgFUPgeMh9bc8qwaQFXlxX91NBlMOaDyjC99ZRselsouLmE44Gq5SNr941u
 aPulq7zIZK+ZIbRP2IU3LZlK6hPV+6+O6L/My6a4=
MIME-Version: 1.0
In-Reply-To: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
References: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.9
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 21 Jul 2020 01:01:37 -0700
Message-ID: <159531849724.3847286.18132175454334945320@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_040139_019905_7A346493 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-07-17 02:55:51)
> Hi Stephen,
> 
> Here are the amlogic clock changes for v5.9
> Business as usual - Please pull.
> 
> Cheers
> Jerome
> 
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
> 
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.9-1
> 
> for you to fetch changes up to 2568528f55356a2f20f80a18244d3e235cbd2cab:
> 
>   clk: meson: meson8b: add the vclk2_en gate clock (2020-07-09 11:37:44 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
