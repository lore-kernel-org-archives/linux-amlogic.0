Return-Path: <SRS0=kgfN=4U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E5DC3F2C6
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:12:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150E820838
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HX70OuP1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdYyZGSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150E820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xh+Ak7Sqy02F5qVnY6fcget4qegW6iSYeE7J+pQzQaU=; b=HX70OuP1Tr5gP4
	1Xv8tKYj73dBJ+sbuk6A1/0VbqRH/HNaJcMzByUDuFoyd88zDEkqvMl3EVHCdcnXPj3gMsPUIDifn
	S6QY97EuxsfRJPPETZl6/RvsjKdi7VpMX7gnjUxTjKh7K3U8I2VnvJczxwuNSggnvjN7HC9iKU7kW
	jCcB5fH8VXnjoS5fi1O57zgH1/WVRO3Pey+2QhuyKZ9hnMFeCnrU92osG0It6EqIptC4HK43pFYdm
	wLlvf6q87VnmdWYtg7fqvjIoKVmwYQ7ZLTegi2zA+J9f9e2QK/NOFmIkvBLpvq9FkaDUbwV0uVzAc
	YtmFz5iTB50NvEObp3ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98HL-0002tC-SD; Tue, 03 Mar 2020 14:12:11 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98HE-0002lc-4I; Tue, 03 Mar 2020 14:12:05 +0000
Received: by mail-il1-x143.google.com with SMTP id n11so2893586ild.1;
 Tue, 03 Mar 2020 06:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9oLRc0nmTu5IkCd4vNNk7O1hyfZenptlFlSFbqIq9b0=;
 b=VdYyZGScoutk3pxfC0VoVaIu9BuHy1HCBXNmZUt+8WqM74tgN4AlUhmurTANElQaPQ
 yWkKVfparLXbkK9wP5rpSE/sQq3Hss3OvRIaujGhkC+OwuuoV4rfzH72UR1mXvCcu75N
 bVSc7fJbKr0Eo1gxqzECfP0flYFKurnkaLqmoH+pjauXp45yOZg3Aw8hLFJnKTJo8bCp
 33yx0V33Hr/GIxiiX0vKrYuVXwa/w9fY4M5yVf4jjaZVg0Uc/zUhTtih+ggCCqJkcKRZ
 8cLtv8b5Z6j4Zhi7drt4vRJ3k3qYTGPfNOh6qltZmGnkwCouqVyQCtX/5bTgPeh81ejZ
 F39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9oLRc0nmTu5IkCd4vNNk7O1hyfZenptlFlSFbqIq9b0=;
 b=MQRewIehLI1Hzwex2+D7t5mGUyS3L5O0fZsbOfVYvnaviOTCAjQpr3xNUTUMF1ffpz
 fNGjwKkaLUteuLkG+175gSMVYodXrBAc9FKqI1qkkSKM8HiZGivgwFHkgNIbP4zR81iu
 vt6hyhZSd0HQwLoe+Mxpz3DmZMBNZ0WDh9e6blDM3I1P4KY+X+lWgVlSA+QCYM9OkMsw
 DaGMC9qF/Jw2YJmor6w9kfuraxDlTJnDulhl2M0XlIgv2Mv2uMqbCRqLMHitg78acevN
 rRCeLX7+ep0bNWGcvipWGUK4j+gW9q9BKUGBtFEL5vrDoTucxwfTwtUDOEBX3xzCJ2EX
 HNLA==
X-Gm-Message-State: ANhLgQ3xHB8VR1KOocklfOQm0D0R0x/zdSQEkOSIsSqHvWGBn5GiNnYY
 q6LEx+dn0LaKLbT3lE9BAzIwW6V+aB5E8ERTLgg=
X-Google-Smtp-Source: ADFU+vurE9ThOeaOHx0MHGxMnPxoGfO/3ZZeZtvaaomjQ7bHlMWt7ERjyJ02dTTMc6V00/ur6J0Ef8fA5gobdIyxzN8=
X-Received: by 2002:a92:3a55:: with SMTP id h82mr4919098ila.75.1583244722519; 
 Tue, 03 Mar 2020 06:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20200302125310.742-1-linux.amoon@gmail.com>
 <20200302125310.742-2-linux.amoon@gmail.com>
 <7hfteqr7za.fsf@baylibre.com>
In-Reply-To: <7hfteqr7za.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 3 Mar 2020 19:41:51 +0530
Message-ID: <CANAwSgS_9uterktdPqSchyRDjfytEQFU1eci+a4oDmG-K1izuw@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] arm64: dts: meson: Add missing regulator linked to
 VDDAO_3V3 regulator to FLASH_VDD
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_061204_197500_959EB26E 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Mon, 2 Mar 2020 at 22:48, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
> > regulator.
>
> Could you please add a link to the specific schematics you used to find
> this usseu?
>
> > Also add TFLASH_VDD_EN signal name to gpio pin.
>
> Your patch does not do this part.
>
> Similarily to the other patch, can you explain in more detail (including
> kernel boot logs) how the SD card is not working?
>
> I just tested with latest mainline, and the MMC driver is detecting both
> the eMMC and the SD card.
>
> Kevin

Ok lets discard this changes, I have tried many dts changes
but I do not know where is the problem or where I am going wrong.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
