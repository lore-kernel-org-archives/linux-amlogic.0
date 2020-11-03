Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9922C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 08:58:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5827C2074B
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 08:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzouOgQ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5827C2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9mc8C/ruT++j3vj+SnFFa+OuNTqRgq0jACBet3aJ9Nc=; b=NzouOgQ8tF9XIqro3wUf8KJJf
	o5UJjUTwkwblYTdZ2GwFG6WoaGXLBf8YWcNmMFg3SO+9doexVqkZTjUQhSJWUSuQDlSEAMKrCY2lE
	UWVZ3S3SGYCkY37yFn/TOg6jMNRHpTd1iZkruoqCBt2mqnN/cJupzjgVv0mF/IWlBTQbVCbYSAHl9
	Mhres7ni6ROpV7w9lYEcnyZjaeo/kwQi7T7ySOVRFNvWNuda3S10jAv/3D5hr9mQYU4iciXzxtGU9
	ysY7In+uWq6Je9rjlpkGrlwf8zn5juyUlLdlHwTvCMlEuj4fntfJ6ABpIsRmy8UiMtDaK6ksE2RWS
	Kpz51+YZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZs8u-0008EM-90; Tue, 03 Nov 2020 08:58:16 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZs8q-0008B9-Nx; Tue, 03 Nov 2020 08:58:14 +0000
Received: from localhost (unknown [82.66.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C4A0820000C;
 Tue,  3 Nov 2020 08:58:04 +0000 (UTC)
Date: Tue, 3 Nov 2020 10:04:12 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Yejune Deng <yejune.deng@gmail.com>
Subject: Re: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
Message-ID: <20201103090412.GC15700@pilgrim>
References: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_035813_093809_1AE38EA7 
X-CRM114-Status: UNSURE (   6.82  )
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
 linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
 p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi

On Tue, Nov 03, 2020 at 12:37:54PM +0800, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable
> 
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>

Reviewed-by: Remi Pommarel <repk@triplefau.lt> for phy-meson-axg-pcie

Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
