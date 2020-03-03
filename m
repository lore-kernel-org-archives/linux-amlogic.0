Return-Path: <SRS0=kgfN=4U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA94C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 12:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509892073B
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 12:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBg0B18Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwKCTO1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509892073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCInwheSoNTUO7LsEo+hAxV2cqyJx60eFMPO60rFM0Y=; b=JBg0B18QgcHKZs
	Yhqzx0l114cXT3li+61z7ygzWRBCJQAoWHLByYFxj+aP1re5Pk6XHQi8ucvupmHWCDTixPC0PL4xo
	Vi/UWMZvgQ7l7bZ4eabI6jkfPxLS1jSSeGe7LwiVNwG0SdmxutVBZTtnlRbktHiDaQBzaVE0Gz0DC
	DCtFJEI5f33kUgvrjyhqlOM2N2vJ90Hlbcu/ueahdZjdVoixcw3rzSHemnaPIn1a/Pcdm0yhqdtBw
	LHeN/OTmLwXjwTQX4f5F52gHKXzwiH2A8kAflAusp/Ko/oTLFo/BconDss4q7dvmzBiu1mHrrhqyt
	RJVn6qB9laGG4MhtT0Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j96qe-0005qQ-Ge; Tue, 03 Mar 2020 12:40:32 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j96qW-0005j1-Hs
 for linux-amlogic@lists.infradead.org; Tue, 03 Mar 2020 12:40:25 +0000
Received: by mail-lj1-x244.google.com with SMTP id a12so3377536ljj.2
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Mar 2020 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zN8pyMGel5CV8Q9nKyqGu12Vu+yCXPWrrYbbRn/lVPU=;
 b=HwKCTO1rlByKTsfERL1oZ8pKPr5JopkC3uXIMLMJIlq5BKoyM0rhAXFSdGParUncGI
 gV7KLS2Ud8c3rgLcmIKl/JwbANUHsWH7ieo6Hf8lgu6sYMT4Gtij+ZyzjmfVPH9msRvu
 1zn/Nma3BCSgTDOXXliErlBP4mJgVTqAknqNjZoddALJjuSsgq804W9iLhlz0YdeWtii
 y7FT0h7C76rVSI7Dy4lvwije9Pbu2idIGncUJmoiAtlVd07EvvtevxoMQZjmz9W36fce
 5GUVEc3hD5Ne8dCmXdKLJ8T4cdJjcLyedUo91UsS6oNA3xb3pDYu1DG3MhVV8CW4PlPq
 1Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zN8pyMGel5CV8Q9nKyqGu12Vu+yCXPWrrYbbRn/lVPU=;
 b=Q59TM5N3UEvP9x44E4ZTubgbpvjZgNrbYYj8VXh0g29p5IEwzB6gGmcNyySBJaFaJA
 aOvgvCVvN67SF+3UJ0Xis3SgXRjC3rgtmGmwPgC/6oCm9GzIVqeVsm9rJPwn0qrdmDay
 LKboE2g3kxm6PG4y1ZieldmJifnDXDchO/SGoKl68risTbnGXN4PgODHwfI2T/MYfFTV
 wA68p6zuLyHJNa5SN8yigKDqDnN+cs/gLNtuc9kbKWP2tPrxihrajkRVXGrQ8XYTeE8/
 CJ0gLzuOyHiDobrkc9e86sTPpIUd7tLYcIUcEB4p7dLbjYvaqbvDTL1asKbLIUaCMVD1
 XIrQ==
X-Gm-Message-State: ANhLgQ3q64gHwsMgMWk5XdyY1iMv64GtOHrGbw5QuxcGoHwCyYwPLUYn
 AxwM0GXOzEgUSq8kYgof5sNgptqYL7SVHzmCFPPTvA==
X-Google-Smtp-Source: ADFU+vvSSKGCj604RxzVxw0FhFpXHGXXjroDOMjzjjm8qVvTi5OQFjHlZtkT1au8AJ7UHhJzsPJpENZWs84jZE3Hfxk=
X-Received: by 2002:a05:651c:39b:: with SMTP id
 e27mr2176389ljp.99.1583239222137; 
 Tue, 03 Mar 2020 04:40:22 -0800 (PST)
MIME-Version: 1.0
References: <1583124056-94785-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1583124056-94785-1-git-send-email-christianshewitt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Mar 2020 13:40:11 +0100
Message-ID: <CACRpkdZ4+-26Q01nx9iFJLUSCfM0Cuh6U8=gdtP=63xMd+2jqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
To: Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_044024_625450_C200D16B 
X-CRM114-Status: UNSURE (   6.92  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Igor Vavro <afl2001@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 2, 2020 at 5:41 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:

> From: Igor Vavro <afl2001@gmail.com>
>
> Add the tsin pinctrl definitions needed for integrated DVB hardware
> support on Meson GXBB/GXL/GXM boards.
>
> Signed-off-by: Igor Vavro <afl2001@gmail.com>
> [updated commit message]
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Can I get Martin and/or Neil to review this?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
