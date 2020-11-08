Return-Path: <SRS0=B07/=EO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A04CC388F9
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BFD206ED
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2s3uJi2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4LVcidP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BFD206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v88pZtlVIiLA5HrZNzG43L38XOuw6sjIYTKR8hnExJ0=; b=T2s3uJi2KoOJ01ElwCBHcWl2S
	gLKwuRJsaFq4XEPa9w4tLU3kEvl195fXSwYx3TRd8xxyCsrFTDscBwsKnTeky8z1blXCqYg3Zsjhc
	EYrCwrw11C1HcC+BlgICwYqqTMUfOUtq9LoMuX0pakZ6/wqqfIcoJvbaUGL5O7CGwq8fuIYn5xfiu
	SNtXKJVt5joLXbfTOISCbvAR5hSHeL69x0tz0w/Voci14kz0gzTCtx1LS24UlvjHTvS71dCFomh1T
	KhzRmTY53ltgadpMQdYXaXpg7lnbBByy+RoKZRupOdcW+3qAQLOG40PHmJGy1VgsUt07vRuccF027
	+KPnxWsnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbkdX-0007QC-Bc; Sun, 08 Nov 2020 13:21:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbkdU-0007PV-Oj; Sun, 08 Nov 2020 13:21:37 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71619206E3;
 Sun,  8 Nov 2020 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604841695;
 bh=SkSaZbbxbQKlOyOPpNzaJmiIA3JNvn8dwgGWjfjN+QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B4LVcidPH89nRcLhaaOqQuqZ//Xwx4z/bwAId7RogC4qHijueLwYDdlMOGsBajKnw
 ixHHmNnGau6nQGSI7eZSMZg+vvZeoN5wJIbx9j+OSjsobsDFy5NY2O/cM0kM0NRKJe
 UDvCl7vF/UFzDXD/gth7CDHwo3hiY2AO9NNQvFgE=
Date: Sun, 8 Nov 2020 08:21:34 -0500
From: Sasha Levin <sashal@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH AUTOSEL 5.4 05/24] arm64: dts: amlogic: meson-g12: use
 the G12A specific dwmac compatible
Message-ID: <20201108132134.GQ2092@sasha-vm>
References: <20201103012007.183429-1-sashal@kernel.org>
 <20201103012007.183429-5-sashal@kernel.org>
 <CAFBinCCZiO9Xe1WKT8MZ-90c7m1u_m1Mt-OXf=Pyuo0vukQQ5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCZiO9Xe1WKT8MZ-90c7m1u_m1Mt-OXf=Pyuo0vukQQ5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_082136_911762_59CB8351 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 06:53:17AM +0100, Martin Blumenstingl wrote:
>Hi Sasha,
>
>On Tue, Nov 3, 2020 at 2:20 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> [ Upstream commit 1fdc97ae450ede2b4911d6737a57e6fca63b5f4a ]
>>
>> We have a dedicated "amlogic,meson-g12a-dwmac" compatible string for the
>> Ethernet controller since commit 3efdb92426bf4 ("dt-bindings: net:
>> dwmac-meson: Add a compatible string for G12A onwards").
>> Using the AXG compatible string worked fine so far because the
>> dwmac-meson8b driver doesn't handle the newly introduced register bits
>> for G12A. However, once that changes the driver must be probed with the
>> correct compatible string to manage these new register bits.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> Link: https://lore.kernel.org/r/20200925211743.537496-1-martin.blumenstingl@googlemail.com
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>if this patch will be included in 5.4-stable then please also backport
>the following two commits:
>- 3efdb92426bf4 ("dt-bindings: net: dwmac-meson: Add a compatible
>string for G12A onwards")
>- a4f63342d03d2d ("net: stmmac: dwmac-meson8b: add a compatible string
>for G12A SoCs")
>
>Without these above two commits we'll lose Ethernet connectivity
>because there's no G12A compatible string in 5.4 yet
>
>The quick solution would be to not backport this patch because the
>driver in question doesn't do anything with the new compatible string
>yet.

I'll drop it from older branches that don't have those commits, thanks!

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
