Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79776C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A3820828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5L6ozan";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kLp8KxAq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A3820828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXMtX0AwVuOFAR1VOkiLpLm2+6R6A3z28VTbhqu4YO4=; b=Q5L6ozan9tDuaF
	bGvCpn9Y/oAnystroH/Y1hyvw+Lwp+pv4Nw7y7i2ZOB75v83xfBZljIgl9ApesRgzXe6LdriA0wDk
	SWTwtsbhpRPyO8PCzSWnDX5nBl8XBuRMUo4Zu21LS7LS9UW1bAugttY6QkUmyu6z34RJ/x5jmcywW
	mmMpqN7zzNvqfffOO3Y/jbUW2q53700GKrukKCihWb6K+3Z+33SJ/0qd/owD3WKVMupjSylBqEPwo
	M19BI9KVdITw8Wx1jAPrGMIps1H9xkcq3dmJ3xJHXRe14RNAKE0RTnnrRCpvpB5sxEWarp5DGRyxs
	0ahve/tnr6tCBM5MupsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5y7P-00056J-2R; Mon, 18 Mar 2019 19:40:19 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5y7M-00055a-8p; Mon, 18 Mar 2019 19:40:17 +0000
Received: by mail-ot1-x343.google.com with SMTP id o74so2673314ota.3;
 Mon, 18 Mar 2019 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8hj4bj40boJqs14HMvyewd4IxHw+UYjCmIjnYphp68=;
 b=kLp8KxAqOHuve7Rfx0qQKCwS3CbQ3tpJ0EyJsKTwUAGnm6dSsxtJCUmTbm3HX0wf9p
 UTyTbiVc2ZIoHakxEWhnAAiLBFZuNSTTc0AUtV1aLXThEl9rMiE9pelA5egG6zjvDzoP
 jnfndxctSamqdrNJ8hSggOC8eDVM//HWhO8kjcNq7ZiQKBnAxFsPGyy3EDlHFVdqnmPN
 6S8YGfzkdamhG4OqG7YboLFvwM5DXlYaYLZwkbOrzdIkoe+WEebPscB7WkHvMRP+etwh
 4RBUctr80F06H26xJmmaJZAv/rCUfBbOLZDIkPMjGsBfdv4J3jgfuJinWtlRM4WDXzit
 soiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8hj4bj40boJqs14HMvyewd4IxHw+UYjCmIjnYphp68=;
 b=AuSIzc4eiiip2lm0c1x3bN+NMVmnza8+7FqajHuDp9IZTKxQIcrR01h8SFqoD9xGY6
 FuUtGg3vCzbohgdorNJA7xR4PUKel9cSzTdhgXLYfQgC8rnMWAX0RnWC3BbKVnf7QCAN
 bXw9TJlp2+Dw60VBYSsp0A2llRiX+9KEXFxhjcDUdO+eHbpT4Yqu4YFPPrza6UWhE2eG
 ozi47endPgiiYIjKSabI2pjG4YuAUDHMPHlfnY2JUU2iLuwU2Axcpe44zG+TbC15dddz
 krl3KUKSf7W9W+EwT4/Xdb+BB36f/wFwd2thDc2Qz16iC39MXaGTMk885fBMQgXoxPtO
 H9PA==
X-Gm-Message-State: APjAAAUBCEkcWw+pbsbdssxBo4pq1kdmWgiDQucNbjSoXqJJLrdrkQSo
 G1zjxqJ2IQ4a0GMD1FgOiWkAcjlAOXWxXNkrgr4=
X-Google-Smtp-Source: APXvYqxSAGO82C4Ly8hXwsZ6CqbqlACNkc4W8O0yDurHNW/09H9fL6VSiz++oUrW7UUXe+OEoKo7M+QHAcf6Tqk5X34=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr11960181oth.308.1552938014643; 
 Mon, 18 Mar 2019 12:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <20190318095851.4062-8-narmstrong@baylibre.com>
In-Reply-To: <20190318095851.4062-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 20:40:03 +0100
Message-ID: <CAFBinCBiTJ6Z_9Y_58LdiebUSXAhAYE8xn5FvUdDd2MstpfrWQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: meson: g12a: Add G12A USB nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_124016_312966_3BA33F74 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:00 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the nodes for the USB Complex found in the Amlogic
> G12A SoC.
>
> It includes the :
> - 2 USB2 PHYs
> - 1 USB3 + PCIE Combo PHY
> - the USB Glue with it's DWC2 and DWC3 sub-nodes
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
